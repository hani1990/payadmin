<?php

namespace addons\pay\controller;

use addons\pay\library\Service;
use think\addons\Controller;

/**
 * 个人支付插件首页
 *
 * 此控制器仅用于开发展示说明和体验，建议自行添加一个新的控制器进行处理返回和回调事件，同时删除此控制器文件
 *
 * Class Index
 * @package addons\pay\controller
 */
class Index extends Controller
{

    protected $layout = 'default';

    protected $config = [];

    public function _initialize()
    {
        parent::_initialize();
        $this->config = get_addon_config('pay');
    }

    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 体验(仅供开发测试体验)
     * 实际开发中建议你自己发起Service::submitOrder或Service::createOrder请求
     */
    public function experience()
    {
        $price = $this->request->request('price');
        $type = $this->request->request('type');
        $uuid = $this->request->request('uuid');

        if (!$price || $price > 1) {
            //$this->error("体验支付金额必须小于1且大于0");
        }

        if (!$type || !$uuid) {
            $this->error("参数不能为空");
        }

        //订单号,请换成你自己的订单系统的唯一订单号
        $out_order_id = \fast\Random::uuid();

        //这里配置两个回调地址,一个回调URL，一个支付完成返回URL
        $notifyurl = addon_url("pay/index/notifyit", [], true, true);
        $returnurl = addon_url("pay/index/returnit", [], true, true);

        //自定义附加传递的信息,例如可以用来传递会员ID、会员账号、商品ID等等
        $extend = 'custom';

        //发起支付，并跳转到支付页面
        Service::submitOrder($price, $out_order_id, $type, 0, $notifyurl, $returnurl, $extend);
    }

    /**
     * 通知回调(仅供开发测试体验)
     */
    public function notifyit()
    {
        $order_id = $this->request->request('order_id', '');
        $out_order_id = $this->request->request('out_order_id', '');
        $price = $this->request->request('price', '');
        $realprice = $this->request->request('realprice', '');
        $type = $this->request->request('type', '');
        $paytime = $this->request->request('paytime', '');
        $extend = $this->request->request('extend', '');
        $sign = $this->request->request('sign', '');
        if ($sign != md5(md5($order_id . $out_order_id . $price . $realprice . $type . $paytime . $extend) . $this->config['secretkey'])) {
            $this->error('签名错误');
        }
        //你可以在这里你的业务处理逻辑,比如处理你的订单状态、给会员加余额等等功能
        //注意只能输出一个success

        echo "success";
        return;
    }

    /**
     * 支付成功的返回(仅供开发测试体验)
     */
    public function returnit()
    {
        $order_id = $this->request->request('order_id', '');
        $out_order_id = $this->request->request('out_order_id', '');
        $sign = $this->request->request('sign', '');
        if ($sign != md5(md5($order_id . $out_order_id) . $this->config['secretkey'])) {
            $this->error('签名错误');
        }

        //你可以在这里定义你的提示信息,但切记不可在此编写逻辑
        $this->success("恭喜你！支付成功!", addon_url("pay/index/index"));

        return;
    }

}
