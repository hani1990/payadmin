<?php

namespace app\admin\controller\pay;

use app\admin\model\PayOrder;
use app\common\controller\Backend;

/**
 * 漏单管理
 *
 * @icon fa fa-filter
 * @remark 如果有未匹配上订单的金额会在此显示，你可以手动补发漏单的记录
 */
class Missing extends Backend
{

    /**
     * PayMissing模型对象
     */
    protected $model = null;

    protected $searchFields = 'id,price';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('PayMissing');
        $this->view->assign("typeList", $this->model->getTypeList());
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 选择订单
     * @param null $ids
     */
    public function selectorder($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        $orderList = PayOrder::where('realprice', $row['price'])
            ->field('id,title,out_order_id,extend,createtime,paytime,status')
            ->where('type', $row['type'])
            ->where('status', 'in', ['inprogress', 'expired'])
            ->where('createtime', 'between', [$row['createtime'] - 10 * 60, $row['createtime'] + 10 * 60])
            ->limit(50)
            ->select();
        if (!$orderList) {
            $orderList = PayOrder::where('realprice', $row['price'])
                ->field('id,title,out_order_id,extend,createtime,paytime,status')
                ->where('type', $row['type'])
                ->where('status', 'in', ['inprogress', 'expired'])
                ->where('createtime', 'not between', [$row['createtime'] - 10 * 60, $row['createtime'] + 10 * 60])
                ->limit(50)
                ->select();
        }
        foreach ($orderList as $index => $item) {
            $item->createtime_text = $item->createtime_text;
        }
        $this->success('', null, ['orderList' => $orderList]);
    }
}
