<?php

namespace app\index\controller;

use addons\pay\model\Order;
use addons\pay\model\PayConfig;
use app\common\controller\Frontend;
use think\addons\Service;

class Index extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';

    public function index()
    {
        $orders = Order::where('createtime' ,'>', time() - 15 * 6000)
            ->where('status', 'unsettled')
            ->select();
        var_dump($orders[0]['id']);
        exit();
        return $this->view->fetch();
    }

    public function news()
    {
        $newslist = [];
        return jsonp(['newslist' => $newslist, 'new' => count($newslist), 'url' => 'https://www.fastadmin.net?ref=news']);
    }

}
