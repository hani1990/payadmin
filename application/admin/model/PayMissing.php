<?php

namespace app\admin\model;

use think\Model;

class PayMissing extends Model
{
    // 表名
    protected $name = 'pay_missing';

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

    public static function init()
    {
        self::afterUpdate(function ($row) {
            $changed = $row->getChangedData();
            if (isset($changed['status']) && $changed['status'] == 'settled' && $row['order_id']) {
                //执行下发动作
                \addons\pay\library\Service::notify($row['order_id']);
            }
        });
    }


    public function getTypeList()
    {
        return ['wechat' => __('Wechat'), 'alipay' => __('Alipay')];
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusList()
    {
        return ['settled' => __('Settled'), 'unsettled' => __('Unsettled')];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

}
