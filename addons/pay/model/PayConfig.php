<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019-07-17
 * Time: 10:24
 */

namespace addons\pay\model;


use think\Model;

class PayConfig extends Model
{
    protected $name = 'pay_config';
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

    public static function getMetaValue($meta_key = false, $value = null)
    {
        if(!$meta_key){
            return false;
        }
        $ret =  PayConfig::where('meta_key', $meta_key)->column('meta_value');
        if(empty($ret)){

           PayConfig::create(['meta_key' => $meta_key, 'meta_value' => $value]);
           return $value;
        }else{
            return $ret[0];
        }

    }

    public static function setMetaValue($meta_key, $meta_value)
    {
        $ret = PayConfig::where('meta_key', $meta_key)->column('meta_value');
        if (empty($ret)) {
            PayConfig::create(['meta_key' => $meta_key, 'meta_value' => $meta_value]);
        } else {
            PayConfig::update(['meta_value' => $meta_value],['meta_key' => $meta_key]);
        }
    }
}