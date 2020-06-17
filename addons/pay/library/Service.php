<?php

namespace addons\pay\library;

use addons\pay\library\aip\AipOcr;
use addons\pay\model\Missing;
use addons\pay\model\Notify;
use addons\pay\model\Order;
use addons\pay\model\Product;
use addons\pay\model\Qrcode;
use fast\Http;
use think\exception\HttpResponseException;
use think\Hook;
use think\Loader;

/**
 * 订单服务类
 *
 * @package addons\pay\library
 */
class Service
{

    /**
     * 提交订单并跳转到支付页
     *
     * @param float $price 金额,单位元,请保留两位小数
     * @param string $out_order_id 订单号,订单模块的唯一订单号
     * @param string $type 类型,可使用wechat或alipay,默认为wechat
     * @param int $product_id 商品ID,为空将根据金额自动匹配
     * @param string $notifyurl 回调URL,为空将触发addons_pay_notify事件
     * @param string $returnurl 支付成功返回URL,支付成功后返回的页面,为空将不会返回
     * @param string $extend 扩展数据,在notifyurl中将会原样返回
     */
    public static function submitOrder($price, $out_order_id, $type = 'wechat', $product_id = 0, $notifyurl = '', $returnurl = '', $extend = '')
    {
        $config = get_addon_config('pay');
        $params = [
            'price'        => $price,
            'out_order_id' => $out_order_id,
            'type'         => $type,
            'product_id'   => $product_id,
            'notifyurl'    => $notifyurl,
            'returnurl'    => $returnurl,
            'extend'       => $extend,
        ];
        $params = array_filter($params);
        $params['sign'] = md5(md5(implode('', $params)) . $config['secretkey']);
        $params['format'] = 'html';
        throw new HttpResponseException(redirect(addon_url("pay/api/create", $params)));
    }

    public static function submitOrderUrl($price, $out_order_id, $type = 'wechat', $product_id = 0, $notifyurl = '', $returnurl = '', $extend = '')
    {
        $config = get_addon_config('pay');
        $params = [
            'price'        => $price,
            'out_order_id' => $out_order_id,
            'type'         => $type,
            'product_id'   => $product_id,
            'notifyurl'    => $notifyurl,
            'returnurl'    => $returnurl,
            'extend'       => $extend,
        ];
        $params = array_filter($params);
        $params['sign'] = md5(md5(implode('', $params)) . $config['secretkey']);
        $params['format'] = 'html';
        return addon_url("pay/api/create", $params);
    }

    /**
     * 创建订单并获取订单信息，可在自定义二维码展示时使用
     *
     * @param float $price 金额,单位元,请保留两位小数
     * @param string $out_order_id 订单号,订单模块的唯一订单号
     * @param string $type 类型,可使用wechat或alipay,默认为wechat
     * @param int $product_id 商品ID,为空将根据金额自动匹配
     * @param string $notifyurl 回调URL,为空将不进行通知
     * @param string $returnurl 支付成功返回URL,支付成功后返回的页面,为空将不会返回
     * @param string $extend 扩展数据,在notifyurl中将会原样返回
     *
     * @return array|false|null|\PDOStatement|string|\think\Model|static
     * @throws OrderException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createOrder($price, $out_order_id, $type = 'wechat', $product_id = 0, $notifyurl = '', $returnurl = '', $extend = '')
    {
        $config = get_addon_config('pay');
        //如果未传递则从默认配置中获取
        $notifyurl = $notifyurl ? $notifyurl : $config['notifyurl'];
        $returnurl = $returnurl ? $returnurl : $config['returnurl'];

        //是否为递增模式
        $increment = $config['buildmoney_type'] == 'increase' ? true : false;

        //支付方式
        $type = $type ? $type : 'wechat';
        $qrcodeInfo = [];
        $productInfo = [];
        $existRealPriceArr = [];

        $price = sprintf("%.2f", $price);
        $paidOrder = Order::where('status', 'not in', ['inprogress', 'expired'])->where('out_order_id', $out_order_id)->find();
        if ($paidOrder) {
            throw new OrderException("订单已支付成功,请勿重复支付");
        }

        $order = Order::where('out_order_id', $out_order_id)->where('type', $type)->where('expiretime', '>', time())->where('status', 'inprogress')->find();
        if ($order) {
            return $order;
        }
        if ($product_id) {
            $productInfo = Product::where('id', $product_id)->where('status', 'normal')->find();
        }
        if (!$productInfo) {
            $productInfo = Product::where('price', $price)->where('status', 'normal')->find();
        }
        if (!$productInfo) {
            //先取出临时二维码
            $qrcodeTempInfo = Qrcode::where('realprice', $price)->where('type', $type)->where('status', 'normal')->find();
            if ($qrcodeTempInfo) {
                //判断二维码所属的产品
                $productInfo = Product::where('id', $qrcodeTempInfo['product_id'])->where('status', 'normal')->find();
                if ($productInfo) {
                    //判断此二维码是否已使用
                    $order = Order::where('realprice', $price)
                        ->where('expiretime', '>', time())
                        ->where('type', $type)
                        ->where('status', 'inprogress')
                        ->find();
                    if (!$order) {
                        //如果订单中没有此金额的订单信息,说明此二维码可用
                        $qrcodeInfo = $qrcodeTempInfo;
                    } else {
                        //这种情况应该很少出现,不过还是加上判断
                        $existQrcodeIds = Order::where('product_id', $productInfo['id'])
                            ->where('expiretime', '>', time())
                            ->where('type', $type)
                            ->where('status', 'inprogress')
                            ->column('qrcode_id');
                        //先从小于(大于)的金额开始找
                        $qrcodeInfo = Qrcode::where('realprice', $increment ? '>=' : '<=', $price)
                            ->where('product_id', $productInfo['id'])
                            ->where('type', $type)
                            ->where('status', 'normal')
                            ->where('id', 'not in', $existQrcodeIds)
                            ->order('realprice', $increment ? 'asc' : 'desc')
                            ->find();
                        //再从大于(小于)的金额开始找
                        if (!$qrcodeInfo) {
                            $qrcodeInfo = Qrcode::where('realprice', $increment ? '<=' : '>=', $price)
                                ->where('product_id', $productInfo['id'])
                                ->where('type', $type)
                                ->where('status', 'normal')
                                ->where('id', 'not in', $existQrcodeIds)
                                ->order('realprice', $increment ? 'desc' : 'asc')
                                ->find();
                        }
                    }
                }
            }
        }

        //如果已经有匹配的二维码
        if (!$qrcodeInfo) {
            $existQrcodeIds = [1, 2];
            //先统一找出所有进行中的订单和价格
            $orderList = Order::where('expiretime', '>', time())
                ->where('type', $type)
                ->where('status', 'inprogress')
                ->field('id,out_order_id,realprice,qrcode_id')
                ->select();
            foreach ($orderList as $index => $item) {
                //如果传递的订单还有效，直接返回
                if ($item['out_order_id'] == $out_order_id) {
                    return Order::get($item['id']);
                    break;
                }
                $existQrcodeIds[] = $item['qrcode_id'];
                $existRealPriceArr[] = $item['realprice'];
            }
            if ($productInfo) {
                //优先从商品中找固定二维码
                if ($existQrcodeIds) {
                    //从候选二维码中选出一个
                    $qrcodeInfo = Qrcode::where('id', 'not in', $existQrcodeIds)
                        ->where('type', $type)
                        ->where('product_id', $productInfo['id'])
                        ->where('status', 'normal')
                        ->order('realprice', $increment ? 'asc' : 'desc')
                        ->find();
                }
            }
        }
        //如果有找到商品的二维码
        if ($qrcodeInfo) {
            $realprice = $qrcodeInfo['realprice'];
        } else {
            //未找到产品信息
            $realPriceArr = [$price];
            for ($i = 0; $i < $config['limitcents']; $i++) {
                if ($increment) {
                    $realPriceArr[] = bcadd($price, 0.01 * ($i + 1), 2);
                } else {
                    $realPriceArr[] = bcsub($price, 0.01 * ($i + 1), 2);
                }
            }
            $realPriceArr = array_diff($realPriceArr, $existRealPriceArr);
            $realprice = reset($realPriceArr);
            //找不到可匹配的金额
            if (!$realprice || $realprice <= 0) {
                throw new OrderException("创建订单失败,请稍后重试!");
            }
        }
        $data = [
            'out_order_id' => $out_order_id,
            'price'        => $price,
            'realprice'    => $realprice,
            'notifyurl'    => $notifyurl,
            'returnurl'    => $returnurl,
            'qrcode_id'    => $qrcodeInfo ? $qrcodeInfo['id'] : ($type == 'alipay' ? 1 : 2),
            'product_id'   => $productInfo ? $productInfo['id'] : 0,
            'type'         => $type,
            'title'        => $productInfo ? $productInfo['name'] : '支付',
            'expiretime'   => time() + $config['expireseconds'],
            'extend'       => $extend
        ];
        $model = Order::create($data);
        $order = Order::get($model->id);
        //注册一个行为
        Hook::listen('addons_pay_created', $order);
        return $order;
    }

    /**
     * 处理订单
     *
     * @param float $price 金额
     * @param string $type 支付类型
     * @param int $order_id 订单号,可选
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function handleOrder($price, $type = 'wechat', $order_id = null, $third_order_no = '')
    {
        if ($order_id) {
            $order = Order::get($order_id);
        } else {
            $order = Order::where('realprice', $price)
                ->where('type', $type)
                ->where('status', '=', 'inprogress')
                ->where('expiretime', '>', time())
                ->order('id', 'DESC')
                ->find();
            if (!$order) {
                //不存在的情况可能是已经超时支付,此时判断下最后一笔订单状态是否是过期
                $lastOrder = Order::where('realprice', $price)
                    ->where('type', $type)
                    ->order('id', 'DESC')
                    ->find();
                //刚好最后一笔订单在过期10分钟内,则进行处理
                if ($lastOrder && $lastOrder['expiretime'] <= time() && time() - $lastOrder['expiretime'] < 600) {
                    $order = $lastOrder;
                } else {
                    //没有的情况下则进行记录
                    //创建一笔漏单
                    Missing::create(['price' => $price, 'type' => $type]);
                    return false;
                }
            }
        }
        if ($order) {
            //如果状态是未支付或过期才修改
            if ($order->status == 'inprogress' || $order->status == 'expired') {
                $order->paytime = time();
                $order->status = 'paid';
                if($third_order_no && !empty($third_order_no)){
                    $order->third_order_no = $third_order_no;
                }

                $order->save();
                Hook::listen('addons_pay_paid', $order);
            }
            //下发订单通知
            return self::notify($order);
        }
        return false;

    }

    /**
     * 订单通知
     *
     * @param $order
     * @return bool
     */
    public static function notify($order)
    {
        if (is_numeric($order)) {
            $order = Order::get($order);
            if (!$order) {
                return false;
            }
        }
        $config = get_addon_config('pay');
        //如果有传递notifyurl则优先根据notifyurl的返回结果进行判断
        if ($order['notifyurl']) {
            $params = [
                'order_id'     => $order['id'],
                'out_order_id' => $order['out_order_id'],
                'price'        => $order['price'],
                'realprice'    => $order['realprice'],
                'type'         => $order['type'],
                'paytime'      => $order['paytime'],
                'extend'       => $order['extend'],
            ];
            $params['sign'] = md5(md5(implode('', $params)) . $config['secretkey']);
            $status = 'unsettled';

            $notify = Notify::create(['order_id' => $order['id'], 'url' => $order['notifyurl'], 'params' => http_build_query($params), 'status' => 'created']);
            //通过http发送回调通知
            $result = http::sendRequest($order['notifyurl'], $params, 'POST');
            if ($result['ret'] && $result['msg'] == 'success') {
                $status = 'settled';
                $notify->status = 'success';
            } else {
                $notify->status = 'failure';
            }
            $notify->response = $result['msg'];
            $notify->save();
        } else {
            $result = Hook::listen('addons_pay_notify', $order);
            $status = $result ? 'settled' : 'unsettled';
        }
        $order->status = $status;
        $order->save();

        return $status == 'settled' ? true : false;
    }

    /**
     * 获取二维码的信息
     *
     * @param $url
     * @return array
     */
    public static function getQrcodeData($url)
    {
        $origin = $url;
        $config = get_addon_config('pay');
        $client = new AipOcr($config['ocr_appid'], $config['ocr_apikey'], $config['ocr_secretkey']);
       // var_dump($config);exit();
        //如果为远程模式或网络图片
        if ($config['ocr_type'] == 'remote' || preg_match("/^(http|https)(.*)/", $url)) {
            // 调用通用文字识别, 图片参数为远程url图片
            $url = cdnurl($url, true);
            $result = Http::get($url);
            if ($result) {
                $image = $result;
            } else {
                return [];
            }
        } else {
            $file = ROOT_PATH . 'public' . $url;
            if (is_file($file)) {
                $image = file_get_contents($file);
            } else {
                return [];
            }
        }

        $type = 'wechat';
        $price = 0;
        $text = '';
        $result = $client->basicGeneral($image);

        if (isset($result['words_result_num']) && isset($result['words_result'])) {
            foreach ($result['words_result'] as $index => $item) {
                if (isset($item['words'])) {
                    if (stripos($item['words'], "支付宝") !== false || stripos($item['words'], "alipay") !== false) {
                        $type = 'alipay';
                    }
                    if (stripos($item['words'], "微信") !== false || stripos($item['words'], "wechat") !== false) {
                        $type = 'wechat';
                    }

                    if (stripos($item['words'], "￥") !== false) {
                        $price = str_replace('￥', '', $item['words']);
                        if (stripos($price, '.') === false && strlen($price) >= 3) {
                            $price = substr_replace($price, "." . substr($price, -2), -2);
                        }
                    }
                }
            }
        }
        //var_dump($price);exit();
        if ($config['qrcode_type'] == 'local') {
            require_once ADDON_PATH . 'pay' . DS . 'library' . DS . 'qrdecode' . DS . 'Common' . DS . "customFunctions.php";
            Loader::addNamespace('Zxing', ADDON_PATH . 'pay' . DS . 'library' . DS . 'qrdecode');

            $qrcode = new \Zxing\QrReader($image, \Zxing\QrReader::SOURCE_TYPE_BLOB);
            $text = $qrcode->text();
        } else if ($config['qrcode_type'] == 'oschina') {
            $multipart = [
                [
                    'name'     => 'upload_ctn',
                    'contents' => 'on'
                ],
                [
                    'name'     => 'url',
                    'contents' => '',
                ],
                [
                    'name'     => 'qrcode',
                    'contents' => $image,
                    'filename' => 'qrcode',
                ]
            ];
            try {
                $client = new \GuzzleHttp\Client();
                $res = $client->request('POST', "http://tool.oschina.net/action/qrcode/decode", [
                    'multipart' => $multipart,
                    'headers'   => ['Accept-Encoding' => 'gzip'],
                ]);
                $content = $res->getBody();
                $ret = json_decode($content, true);
                $text = isset($ret[0]['text']) ? $ret[0]['text'] : $text;
            } catch (\GuzzleHttp\Exception\ClientException $e) {

            }
        } else if ($config['qrcode_type'] == 'caoliao') {
            $url = cdnurl($url, true);
            $result = Http::post("https://cli.im/Api/Browser/deqr", ['data' => $url]);
            if ($result) {
                $json = json_decode($result, TRUE);
                if (isset($json['status']) && $json['status'] == 1 && isset($json['data']['RawData'])) {
                    $text = $json['data']['RawData'];
                }
            }
        }

        return ['type' => $type, 'realprice' => $price, 'image' => $origin, 'url' => $text];

    }

}