<?php

return array (
  0 => 
  array (
    'name' => 'secretkey',
    'title' => '密钥(secretkey)',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '123456',
    'rule' => 'required',
    'msg' => '',
    'tip' => '用于客户端和API通信加密',
    'ok' => '',
    'extend' => '',
  ),
  1 => 
  array (
    'name' => 'ocr_appid',
    'title' => '百度文字识别AppID',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '16822092',
    'rule' => 'required',
    'msg' => '',
    'tip' => '从百度文字识别应用列表中获取',
    'ok' => '',
    'extend' => '',
  ),
  2 => 
  array (
    'name' => 'ocr_apikey',
    'title' => '百度文字识别ApiKey',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '39KRheDTtHHb0AUQqSbrzEnA',
    'rule' => 'required',
    'msg' => '',
    'tip' => '从百度文字识别应用列表中获取',
    'ok' => '',
    'extend' => '',
  ),
  3 => 
  array (
    'name' => 'ocr_secretkey',
    'title' => '百度文字识别SecretKey',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '7oLH2youuIqE13zYK8hPAgkQacYuvGN4',
    'rule' => 'required',
    'msg' => '',
    'tip' => '从百度文字识别应用列表中获取',
    'ok' => '',
    'extend' => '',
  ),
  4 => 
  array (
    'name' => 'ocr_type',
    'title' => '识别图片方式',
    'type' => 'radio',
    'content' => 
    array (
      'local' => '本地',
      'remote' => '远程',
    ),
    'value' => 'local',
    'rule' => 'required',
    'msg' => '',
    'tip' => '如果启用了第三方云存储,请使用远程方式',
    'ok' => '',
    'extend' => '',
  ),
  5 => 
  array (
    'name' => 'qrcode_type',
    'title' => '二维码解码方式',
    'type' => 'radio',
    'content' => 
    array (
      'caoliao' => '使用草料API(不支持本地)',
    ),
    'value' => 'caoliao',
    'rule' => 'required',
    'msg' => '',
    'tip' => '解析二维码的方式，默认使用码云的API接口进行解析',
    'ok' => '',
    'extend' => '',
  ),
  6 => 
  array (
    'name' => 'expireseconds',
    'title' => '订单有效时长(秒)',
    'type' => 'number',
    'content' => 
    array (
    ),
    'value' => '300',
    'rule' => 'required',
    'msg' => '',
    'tip' => '支付页面显示的倒计时时长',
    'ok' => '',
    'extend' => '',
  ),
  7 => 
  array (
    'name' => 'limitcents',
    'title' => '订单误差金额值(分)',
    'type' => 'number',
    'content' => 
    array (
    ),
    'value' => '10',
    'rule' => 'required',
    'msg' => '',
    'tip' => '找不到固定二维码时,允许的误差金额<br>超过将创建订单失败',
    'ok' => '',
    'extend' => '',
  ),
  8 => 
  array (
    'name' => 'buildmoney_type',
    'title' => '无固定二维码金额生成方式',
    'type' => 'radio',
    'content' => 
    array (
      'increase' => '金额递增',
      'decrease' => '金额递减',
    ),
    'value' => 'decrease',
    'rule' => 'required',
    'msg' => '',
    'tip' => '当未找到固定金额二维码时生成金额的方式',
    'ok' => '',
    'extend' => '',
  ),
  9 => 
  array (
    'name' => 'notifyurl',
    'title' => '默认回调地址',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '',
    'rule' => '',
    'msg' => '',
    'tip' => '默认为空<br>如果请求的参数中有设置则以请求的为准',
    'ok' => '',
    'extend' => '',
  ),
  10 => 
  array (
    'name' => 'returnurl',
    'title' => '默认支付成功返回地址',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '',
    'rule' => '',
    'msg' => '',
    'tip' => '默认为空<br>如果请求的参数中有设置则以请求的为准',
    'ok' => '',
    'extend' => '',
  ),

  11 =>
  array (
    'name' => 'poweredby',
    'title' => '底部链接',
    'type' => 'radio',
    'content' => 
    array (
      1 => '显示',
      0 => '不显示',
    ),
    'value' => '0',
    'rule' => 'required',
    'msg' => '',
    'tip' => '是否显示底部Powered by FastAdmin文字',
    'ok' => '',
    'extend' => '',
  ),
  12 =>
  array (
    'name' => 'successtips',
    'title' => '成功提示',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '支付成功!请关闭当前窗口以便于继续操作!',
    'rule' => 'required',
    'msg' => '',
    'tip' => '支付成功后的文字提示<br>仅限于未传递returnurl时',
    'ok' => '',
    'extend' => '',
  ),
  13 =>
  array (
    'name' => 'expiretips',
    'title' => '超时提示',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '二维码已过期,请点击这里刷新后重新尝试支付!',
    'rule' => 'required',
    'msg' => '',
    'tip' => '支付超时后的文字提示',
    'ok' => '',
    'extend' => '',
  ),
  14 =>
  array (
    'name' => 'jumptips',
    'title' => '跳转提示',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '支付成功!2秒后将自动跳转!',
    'rule' => 'required',
    'msg' => '',
    'tip' => '支付成功后跳转的提示文字',
    'ok' => '',
    'extend' => '',
  ),
  15 =>
  array (
    'name' => 'contacttips',
    'title' => '联系我们提示文字',
    'type' => 'text',
    'content' => 
    array (
    ),
    'value' => '支付即时到账，未到账请与我们联系<br />订单号：{out_order_id}',
    'rule' => 'required',
    'msg' => '',
    'tip' => '联系我们提示文字,可使用变量<br>{out_order_id}:外部订单号<br>{order_id}:插件内部订单号<br>{price}:金额<br>{realprice}:实付金额<br>{type}:支付类型<br>',
    'ok' => '',
    'extend' => '',
  ),
  16 =>
  array (
    'name' => 'alipay_cookie',
    'title' => '支付宝cookie',
    'type' => 'text',
    'content' => 
    array (
    ),
    'value' => 'xxx',
    'rule' => 'required',
    'msg' => '',
    'tip' => '填写支付宝cookie https://github.com/ChenSee/ChenPay#%E8%8E%B7%E5%8F%96%E6%94%AF%E4%BB%98%E5%AE%9Dcookie',
    'ok' => '',
    'extend' => '',
  ),
  17 =>
  array (
    'name' => 'wechatpay_cookie',
    'title' => '微信支付cookie',
    'type' => 'text',
    'content' => 
    array (
    ),
    'value' => 'ss',
    'rule' => 'required',
    'msg' => '',
    'tip' => '填写微信支付cookie https://github.com/ChenSee/ChenPay#%E8%8E%B7%E5%8F%96%E5%BE%AE%E4%BF%A1cookie',
    'ok' => '',
    'extend' => '',
  ),
);
