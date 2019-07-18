<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019-07-18
 * Time: 17:32
 */

namespace app\index\controller;


use app\common\controller\Frontend;

class Pay extends Frontend
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';

    public function test()
    {

        $price = '0.01'; # 获取充值金额
        $out_order_id = rand(1111, 9999);       # 自己创建的本地订单号
        $type = $this->request->get('pay_type', 'alipay');    # 付款方式
        $product_id = $this->request->input('product_id', 1); //产品id
        $host = $this->request->host();
        $scheme = $this->request->scheme();
        $host = $scheme . "://".$host;
        $notifyurl = $host.'/index/pay/notify_url';   # 回调通知地址
        $returnurl = $host.'/index/pay/returnurl';   # 支付成功页面跳转地址
        $extend = 'test';
        $config = get_addon_config('pay');
        $secret = $config['secretkey'];     # app secret, 在个人中心配置页面查看
        $api_url = $host.'/addons/pay/api/create';   # 付款请求接口，在个人中心配置页面查看
        $format = 'html';


        $sign = sign(array($price, $out_order_id, $type, $product_id, $notifyurl, $returnurl, $extend) , $secret);

        echo '<html>
      <head><title>redirect...</title></head>
      <body>
          <form id="post_data" action="'.$api_url.'" method="post">
              <input type="hidden" name="price" value="'.$price.'"/>
              <input type="hidden" name="out_order_id" value="'.$out_order_id.'"/>
              <input type="hidden" name="product_id" value="'.$product_id.'"/>
              <input type="hidden" name="type" value="'.$type.'"/>
              <input type="hidden" name="notifyurl" value="'.$notifyurl.'"/>
              <input type="hidden" name="returnurl" value="'.$returnurl.'"/>
              <input type="hidden" name="extend" value="'.$extend.'"/>
              <input type="hidden" name="sign" value="'.$sign.'"/>
              <input type="hidden" name="format" value="'.$format.'"/>
          </form>
          <script>document.getElementById("post_data").submit();</script>
      </body>
      </html>';
    }

    public function returnurl()
    {
        echo "支付成功跳转页面 ...";
    }


    public function notifyurl()
    {

        $config = get_addon_config('pay');
        $secret = $config['secretkey'];
        $sign = sign(array(
            $_POST['order_id'], $_POST['out_order_id'], $_POST['price'],
            $_POST['realprice'], $_POST['type'], $_POST['paytime'], $_POST['extend']),
            $secret
        );

        # 对比签名
        if($sign == $_POST['sign']) {
            # do something update database
            echo 'success';
        } else {
            header("HTTP/1.0 405 Method Not Allowed");
            exit();
        };
    }
}