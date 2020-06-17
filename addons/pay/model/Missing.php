<?php

namespace addons\pay\model;

use think\Model;

class Missing extends Model
{

    protected $name = 'pay_missing';
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

    public function qrcode()
    {
        return $this->belongsTo("\addons\pay\model\Qrcode", "qrcode_id", "id", [], "LEFT")->setEagerlyType(0);
    }
}
