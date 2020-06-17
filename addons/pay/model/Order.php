<?php

namespace addons\pay\model;

use think\Model;

class Order extends Model
{

    protected $name = 'pay_order';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 定义字段类型
    protected $type = [
    ];
    // 追加属性
    protected $append = [
    ];

    /**
     * 获取支付的链接地址
     * @param $value
     * @param $data
     * @return string
     */
    public function getPayurlAttr($value, $data)
    {
        $payurl = '';
        $config = get_addon_config('pay');
        $params = [
            'price'        => $data['price'],
            'out_order_id' => $data['out_order_id'],
            'type'         => $data['type'],
            'product_id'   => $data['product_id'],
            'notifyurl'    => $data['notifyurl'],
            'returnurl'    => isset($data['returnurl']) ? $data['returnurl'] : '',
            'extend'       => $data['price'],
        ];
        $params = array_filter($params);
        $params['sign'] = md5(md5(implode('', $params)) . $config['secretkey']);
        $params['format'] = 'html';
        $payurl = addon_url("pay/api/create", $params, false, true);
        return $payurl;
    }

    /**
     * 获取返回URL链接
     * @param $value
     * @param $data
     * @return string
     */
    public function getReturnurlAttr($value, $data)
    {
        $config = get_addon_config('pay');
        $returnurl = $data['returnurl'] ? $data['returnurl'] . '?' . http_build_query([
                'order_id'     => $data['id'],
                'out_order_id' => $data['out_order_id'],
                'sign'         => md5(md5($data['id'] . $data['out_order_id']) . $config['secretkey'])
            ]) : '';
        return $returnurl;
    }

    /**
     * 获取查询URL链接
     * @param $value
     * @param $data
     * @return string
     */
    public function getQueryurlAttr($value, $data)
    {
        $config = get_addon_config('pay');
        $params = [
            'out_order_id' => $data['out_order_id'],
            'sign'         => md5(md5($data['out_order_id']) . $config['secretkey'])
        ];
        $queryurl = addon_url("pay/api/query", $params, false, true);
        return $queryurl;
    }

    /**
     * 获取输出订单的信息
     * @param Order $order
     * @return array
     */
    public static function getOutputOrderData($order)
    {
        $config = get_addon_config('pay');
        $data = [
            'order_id'      => $order['id'],
            'out_order_id'  => $order['out_order_id'],
            'price'         => $order['price'],
            'realprice'     => $order['realprice'],
            'discountprice' => bcsub($order['price'], $order['realprice'], 2),
            'extend'        => $order['extend'],
            'type'          => $order['type'],
            'remainseconds' => max(0, $order['expiretime'] - time()),
            'status'        => $order['status']
        ];
        //如果订单已经过期
        if ($data['remainseconds'] == 0 && $data['status'] == 'inprogress') {
            $order->status = 'expired';
            $order->save();
            $data['status'] = 'expired';
        }
        $data['manual'] = $order->qrcode_id > 2 ? false : true;
        $data['returnurl'] = $order->returnurl;;
        $data['payurl'] = $order->payurl;
        $data['queryurl'] = $order->queryurl;
        $data['qrcodeurl'] = $order->qrcode->url;
        return $data;
    }

    public function qrcode()
    {
        return $this->belongsTo("\addons\pay\model\Qrcode", "qrcode_id", "id", [], "LEFT")->setEagerlyType(0);
    }
}
