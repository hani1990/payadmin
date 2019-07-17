<?php

namespace app\admin\model;

use think\Model;

class PayOrder extends Model
{
    // 表名
    protected $name = 'pay_order';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 追加属性
    protected $append = [
        'paytime_text',
        'status_text'
    ];


    public function getStatusList()
    {
        return ['inprogress' => __('Inprogress'), 'expired' => __('Expired'), 'paid' => __('Paid'), 'settled' => __('Settled'), 'unsettled' => __('Unsettled')];
    }


    public function getCreatetimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['createtime'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getPaytimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['paytime'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    protected function setPaytimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : ($value ? $value : null);
    }


}
