<?php

namespace app\admin\controller\pay;

use addons\pay\library\Service;
use addons\pay\model\Notify;
use app\admin\model\PayOrder;
use app\common\controller\Backend;
use think\Db;

/**
 * 订单管理
 *
 * @icon fa fa-first-order
 * @remark 未支付或过期的订单可以手动设为已收款，已支付的订单可以再次补发通知。
 */
class Order extends Backend
{

    /**
     * PayOrder模型对象
     * @var \app\admin\model\PayOrder
     */
    protected $model = null;

    protected $searchFields = 'id,out_order_id,extend,title,realprice';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('PayOrder');
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查看
     */
    public function index()
    {
        //查找过期状态,置为过期
        $expired = PayOrder::where('status', 'inprogress')->where('expiretime', '<', time())->find();
        if ($expired) {
            PayOrder::where('status', 'inprogress')->where('expiretime', '<', time())->update(['status' => 'expired']);
        }
        return parent::index();
    }

    /**
     * 重发通知
     * @param null $ids
     */
    public function notify($ids = null)
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
        if ($this->request->isPost()) {
            $result = Service::notify($row);
            if ($result) {
                $this->success('重发通知成功');
            } else {
                $this->error('重发通知失败');
            }
        }
        return;
    }

    /**
     * 回调信息
     * @param null $ids
     */
    public function notifyinfo($ids = null)
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
        if ($this->request->isPost()) {
            $result = Notify::where('order_id', $row['id'])->order('id', 'desc')->find();
            if ($result) {
                $notify = $result->toArray();
                $notify['createtime_text'] = datetime($notify['createtime']);
                $notify['updatetime_text'] = datetime($notify['updatetime']);
                $this->success('', null, ['notify' => $notify]);
            } else {
                $this->error('');
            }
        }
        return;
    }

    /**
     * 重发通知
     * @param null $ids
     */
    public function paid($ids = null)
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
        if ($this->request->isPost()) {
            $result = Service::handleOrder(0, $row['type'], $row['id']);
            if ($result) {
                $this->success('收款成功');
            } else {
                $this->error('收款失败');
            }
            return;
        }
        return;
    }

}
