<?php

namespace addons\pay\model;

use think\Model;

class Product extends Model
{

    protected $name = 'pay_product';
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

    public static function getProductQrcodeIds($product_id)
    {
        return Qrcode::where('product_id', $product_id)->where('status', 'normal')->column('id');
    }

}
