<?php

#注意: 使用之前先到  后台上传微信、支付宝App生成的收款二维码

$price = '0.01'; # 获取充值金额
$out_order_id = '1211109';       # 自己创建的本地订单号
$type = 'alipay';    # 付款方式
$product_id = '3'; //产品id
$notifyurl = 'http://payadmin.test/notify_url.php';   # 回调通知地址
$returnurl = 'http://payadmin.test/return_url.php';   # 支付成功页面跳转地址
$extend = 'abc';
$secret = '123456';     # app secret, 在个人中心配置页面查看
$api_url = 'http://payadmin.test/addons/pay/api/create';   # 付款请求接口，在个人中心配置页面查看

function sign($data_arr, $secret) {
    return md5(md5(join('',$data_arr)) . $secret);
};

$sign = sign(array($price, $out_order_id, $type, $product_id, $notifyurl, $returnurl, $extend) , $secret);
//$sign = md5(md5($price . $out_order_id . $type . $product_id . $notifyurl . $returnurl . $extend) . $secret);
//var_dump($sign);exit();
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
          </form>
          <script>document.getElementById("post_data").submit();</script>
      </body>
      </html>';
?>