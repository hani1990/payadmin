<?php

namespace addons\pay\controller;

use addons\pay\library\OrderException;
use addons\pay\library\Service;
use addons\pay\model\Missing;
use addons\pay\model\Order;
use think\addons\Controller;
use think\Config;
use think\Exception;

/**
 * API接口控制器
 *
 * 请勿修改此文件,订单的处理逻辑可以在addons/pay/Pay.php中处理或在你自定义的notifyurl中处理
 *
 * @package addons\pay\controller
 */
class Api extends Controller
{

    protected $config = [];

    public function _initialize()
    {
        parent::_initialize();
        $this->config = get_addon_config('pay');
        $format = $this->request->request("format", 'json');
        Config::set('default_return_type', $format);
    }

    /**
     * 默认方法
     */
    public function index()
    {
        $this->error();
    }

    /**
     * 安卓客户端支付通知
     */
    public function notify()
    {
        $price = $this->request->request("price");
        $type = $this->request->request("type");
        $sign = $this->request->request("sign");

        //验证签名
        if ($sign != md5(md5($price . $type) . $this->config['secretkey'])) {
            $this->error("签名不正确");
        }

        //订单处理
        $result = Service::handleOrder($price, $type);

        //你无需在此编写代码,只需要在addons/pay/Pay.php中的addonsPayNotify方法添加你的即可订单处理逻辑即可
        if ($result) {
            $this->success(($type == 'wechat' ? '微信支付' : '支付宝') . "收款处理成功");
        } else {
            $this->success(($type == 'wechat' ? '微信支付' : '支付宝') . "收款待处理金额:{$price}元");
        }
    }

    /**
     * 创建订单
     */
    public function create()
    {
        $price = $this->request->request("price").'';
        $out_order_id = $this->request->request("out_order_id").'';
        $type = $this->request->request("type", '');
        $product_id = $this->request->request("product_id", '').'';
        $notifyurl = $this->request->request("notifyurl", '');
        $returnurl = $this->request->request("returnurl", '');
        $extend = $this->request->request("extend", '').'';
        $format = $this->request->request("format", 'json');
        $sign = $this->request->request("sign", '');
        //验证签名
        if ($sign != md5(md5($price . $out_order_id . $type . $product_id . $notifyurl . $returnurl . $extend) . $this->config['secretkey'])) {
            $this->error("签名不正确");
        }

        //创建订单
        try {
            $order = Service::createOrder($price, $out_order_id, $type, $product_id, $notifyurl, $returnurl, $extend);
        } catch (OrderException $e) {
            $this->error($e->getMessage());
        } catch (Exception $e) {
            $this->error("创建订单失败,请重试!");
        }

        //根据format进行响应
        $order = Order::getOutputOrderData($order);
        if ($format != 'html') {
            $this->success('创建订单成功', '', $order);
        } else {
            $search = array_keys($order);
            $search = array_map(function ($data) {
                return '{' . $data . '}';
            }, $search);
            $replace = array_values($order);
            $addon = get_addon_config('pay');
            $replaceArr = ['contacttips', 'contacturl', 'jumptips', 'expiretips', 'successtips', 'notifyurl', 'returnurl'];
            foreach ($addon as $index => $item) {
                if (in_array($index, $replaceArr)) {
                    $addon[$index] = str_replace($search, $replace, $item);
                }
            }
            $this->view->assign("isWechat", stripos($this->request->server('HTTP_USER_AGENT'), 'MicroMessenger') !== false);
            $this->view->assign("isMobile", $this->request->isMobile());
            $this->view->assign("payAppName", $order['type'] == 'alipay' ? '支付宝' : '微信');
            $this->view->assign("queryUrl", $order['queryurl']);
            //$this->view->assign("qrcodeUrl", str_replace('{url}', urlencode($order['qrcodeurl']), $addon['qrcodeurl']));
            $this->view->assign("qrcodeUrl", $order['qrcodeurl']);

            $this->view->assign("addon", $addon);
            $this->view->assign("order", $order);
            return $this->view->fetch();
        }
    }

    /**
     * 查询订单
     */
    public function query()
    {
        $out_order_id = $this->request->request("out_order_id");
        $sign = $this->request->request("sign");

        //验证签名
        if ($sign != md5(md5($out_order_id) . $this->config['secretkey'])) {
            $this->error("签名不正确");
        }

        try {
            $order = Order::where('out_order_id', $out_order_id)->order('id', 'desc')->find();
        } catch (Exception $e) {
            $this->error("查询失败,请重试!");
        }
        if (!$order) {
            $this->error('订单未找到!');
        }
        $this->success('查询成功', '', Order::getOutputOrderData($order));
    }

    /**
     * 取消订单
     */
    public function cancel()
    {
        $order_id = $this->request->request("order_id");
        $sign = $this->request->request("sign");

        //验证签名
        if ($sign != md5(md5($order_id) . $this->config['secretkey'])) {
            $this->error("签名密钥不正确");
        }
        //订单未找到
        $order = Order::get($order_id);
        if (!$order) {
            $this->error('订单未找到');
        }
        //订单已支付或已过期
        if ($order['status'] != 'inprogress' || $order['expiretime'] < time()) {
            $this->error("订单已不能取消");
        }
        //将订单设置为已过期
        $order->save(['status' => 'expired', 'title' => $order['title'] . '(已取消)']);

        $this->success("取消成功", "");
    }

    /**
     * 客户端配置
     */
    public function setting()
    {
        $apiurl = $this->request->request("apiurl");
        $sign = $this->request->request("sign");

        //验证签名
        if ($sign != md5(md5($apiurl) . $this->config['secretkey'])) {
            $this->error("签名密钥不正确");
        }
        $this->success("配置成功", "");
    }

}
