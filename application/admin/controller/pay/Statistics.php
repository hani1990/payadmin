<?php

namespace app\admin\controller\pay;

use app\admin\model\PayOrder;
use app\admin\model\PayMissing;
use app\common\controller\Backend;

/**
 * 统计管理
 *
 * @icon fa fa-bar-chart
 * @remark 可以查看订单相关统计信息
 */
class Statistics extends Backend
{

    /**
     * 模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('PayOrder');
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查询统计
     */
    public function index()
    {
        $date = $this->request->post('date', '');
        $data = $this->getOrderStatisticsData($date);
        $statistics = ['columns' => array_keys($data), 'data' => array_values($data), 'amount' => sprintf("%.2f", array_sum(array_values($data)))];
        if ($this->request->isPost()) {
            $this->success('', '', $statistics);
        }
        $statistics['todayincome'] = floatval(PayOrder::whereTime('paytime', 'today')->sum('realprice'));
        $statistics['totalincome'] = floatval(PayOrder::where('paytime', '>', 0)->sum('realprice'));
        $statistics['todayorders'] = intval(PayOrder::whereTime('paytime', 'today')->count());
        $statistics['totalorders'] = intval(PayOrder::where('paytime', '>', 0)->count());
        $statistics['todaymissing'] = intval(PayMissing::whereTime('createtime', 'today')->count());
        $statistics['totalmissing'] = intval(PayOrder::where('status', '=', 'paid')->count());
        $statistics['todayunsettled'] = intval(PayOrder::whereTime('createtime', 'today')->where('status', '=', 'unsettled')->count());
        $statistics['totalunsettled'] = intval(PayOrder::where('status', '=', 'unsettled')->count());
        $this->view->assign('statistics', $statistics);
        $this->assignconfig('statistics', $statistics);
        return $this->view->fetch();
    }

    /**
     * 获取订单统计数据
     * @param string $date
     * @return array
     */
    protected function getOrderStatisticsData($date = '')
    {
        if ($date) {
            list($start, $end) = explode(' - ', $date);

            $starttime = strtotime($start);
            $endtime = strtotime($end);
        } else {
            $starttime = \fast\Date::unixtime('day', 0, 'begin');
            $endtime = \fast\Date::unixtime('day', 0, 'end');
        }
        $totalseconds = $endtime - $starttime;

        $format = '%Y-%m-%d';
        if ($totalseconds > 86400 * 30 * 2) {
            $format = '%Y-%m';
        } else if ($totalseconds > 86400) {
            $format = '%Y-%m-%d';
        } else {
            $format = '%H:00';
        }
        $orderlist = PayOrder::where('paytime', 'between time', [$starttime, $endtime])
            ->field('paytime, status, COUNT(*) AS nums, SUM(realprice) AS amount, MIN(paytime) AS min_paytime, MAX(paytime) AS max_paytime, 
            DATE_FORMAT(FROM_UNIXTIME(paytime), "' . $format . '") AS order_date')
            ->group('order_date')
            ->select();

        if ($totalseconds > 84600 * 30 * 2) {
            $starttime = strtotime('last month', $starttime);
            while (($starttime = strtotime('next month', $starttime)) <= $endtime) {
                $column[] = date('Y-m', $starttime);
            }
        } else if ($totalseconds > 86400) {
            for ($time = $starttime; $time <= $endtime;) {
                $column[] = date("Y-m-d", $time);
                $time += 86400;
            }
        } else {
            for ($time = $starttime; $time <= $endtime;) {
                $column[] = date("H:00", $time);
                $time += 3600;
            }
        }
        $list = array_fill_keys($column, 0);
        $orderlist = collection($orderlist)->toArray();
        foreach ($orderlist as $k => $v) {
            $list[$v['order_date']] = $v['amount'];
        }
        return $list;

    }


}
