<?php

namespace app\admin\controller\pay;

use app\common\controller\Backend;

/**
 * 产品管理
 *
 * @icon fa fa-product-hunt
 * @remark 每个产品的微信二维码和支付宝二维码都可以多个，如果你的产品价格是50元，最好支付宝和微信都分别上传49.90~50这个区间共11个二维码，当然上传的关联二维码越多，越不容易出现让用户手动输入金额的情况。
 */
class Product extends Backend
{

    /**
     * PayProduct模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('PayProduct');
        $this->view->assign("statusList", $this->model->getStatusList());
    }
}
