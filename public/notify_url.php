<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019-07-17
 * Time: 13:04
 */

# 签名函数
function sign($data_arr, $secret) {
    return md5(md5(join('',$data_arr)).$secret);
};
$secret = '123456';
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

?>
