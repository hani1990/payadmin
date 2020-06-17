<?php

namespace app\admin\model;

use think\Model;

class PayQrcode extends Model
{
    // 表名
    protected $name = 'pay_qrcode';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 追加属性
    protected $append = [
        'type_text',
        'status_text'
    ];


    public function getTypeList()
    {
        return ['alipay' => __('Alipay'), 'wechat' => __('Wechat')];
    }

    public function getStatusList()
    {
        return ['hidden' => __('Hidden'), 'normal' => __('Normal')];
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['type'];
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function product()
    {
        return $this->belongsTo("PayProduct", "product_id", "id", [], "LEFT")->setEagerlyType(0);
    }

}
