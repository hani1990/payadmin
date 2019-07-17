<?php

namespace app\admin\controller\pay;

use addons\pay\library\Service;
use app\admin\model\PayProduct;
use app\admin\model\PayQrcode;
use app\common\controller\Backend;

/**
 * 二维码管理
 *
 * @icon fa fa-qrcode
 * @remark 可以管理所有上传的二维码，第1,2条记录为系统匹配无固定金额的二维码，请勿删除
 */
class Qrcode extends Backend
{

    /**
     * PayQrcode模型对象
     */
    protected $model = null;

    protected $searchFields = 'id,realprice';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('PayQrcode');
        $this->view->assign("typeList", $this->model->getTypeList());
        $this->view->assign("statusList", $this->model->getStatusList());

    }

    /**
     * 查看
     */
    public function index()
    {
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with('product')
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with('product')
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 添加二维码
     */
    public function add()
    {
        $addon = get_addon_config('pay');
        if (!$addon['ocr_appid'] || !$addon['ocr_apikey'] || !$addon['ocr_secretkey']) {
            $this->error("请在插件管理中配置个人收款百度OCR参数后再操作");
        }
        if ($this->request->isPost()) {
            $image = $this->request->post('image');
            if ($image) {
                $data = Service::getQrcodeData($image);
                if (!$data) {
                    $this->error("请上传正确的微信或支付宝二维码图片");
                }
                $this->success("", null, $data);
            } else {
                $product_id = $this->request->post('product_id');
                $qrcode = $this->request->post('qrcode/a');
                if ($product_id <= 1) {
                    $this->error("自动匹配价格的商品请勿在此上传");
                }
                if (!$product_id || !$qrcode) {
                    $this->error("产品或二维码不能为空");
                }
                foreach ($qrcode as $index => &$item) {
                    $item['product_id'] = $product_id;
                }
                $this->model->saveAll($qrcode);
                $this->success("添加成功");
            }

        }
        $product_id = $this->request->request('product_id');
        if (!$product_id) {
            $this->error("请从产品管理处添加上传二维码");
        }

        $product = PayProduct::get($product_id);
        if (!$product) {
            $this->error("请选择对应产品");
        }
        $wechatPriceArr = PayQrcode::where('product_id', $product_id)->where('type', 'wechat')->column('realprice');
        $wechatAdvicePrice = [];
        $index = 0;
        for ($i = $product['price']; $i > 0; $i = bcsub($i, 0.01, 2)) {
            if ($index > 10) {
                break;
            }
            $index++;
            $wechatAdvicePrice[] = $i;

        }
        $alipayPriceArr = PayQrcode::where('product_id', $product_id)->where('type', 'alipay')->column('realprice');
        $alipayAdvicePrice = [];
        $index = 0;
        for ($i = $product['price']; $i > 0; $i = bcsub($i, 0.01, 2)) {
            if ($index > 10) {
                break;
            }
            $index++;
            $alipayAdvicePrice[] = $i;
        }

        $wechatAdvicePrice = array_diff($wechatAdvicePrice, $wechatPriceArr);
        $alipayAdvicePrice = array_diff($alipayAdvicePrice, $alipayPriceArr);
        $this->view->assign('wechatAdvicePrice', $wechatAdvicePrice);
        $this->view->assign('alipayAdvicePrice', $alipayAdvicePrice);
        return $this->view->fetch();
    }

    /**
     * 编辑
     * @param null $ids
     * @return string
     * @throws \think\Exception
     */
    public function edit($ids = NULL)
    {
        $addon = get_addon_config('pay');
        if (!$addon['ocr_appid'] || !$addon['ocr_apikey'] || !$addon['ocr_secretkey']) {
            $this->error("请在插件管理中配置个人收款百度OCR参数后再操作");
        }
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
            $params = $this->request->post("row/a");
            if ($params) {
                if ($row['id'] <= 2) {
                    //第1、2条记录URL不能为空，金额必须为0
                    if (isset($params['url']) && !$params['url']) {
                        $this->error('自动匹配价格的商品二维码不能为空');
                    }
                    if (isset($params['realprice']) && $params['realprice'] && floatval($params['realprice']) > 0) {
                        $this->error('你上传的是固定金额的二维码,请上传普通收款二维码');
                    }
                    $params['realprice'] = 0;
                } else {
                    if (isset($params['product_id']) && $params['product_id'] == 1) {
                        $this->error('请勿选择自动匹配价格的商品');
                    }
                    if (isset($params['url']) && !$params['url']) {
                        $this->error('商品二维码不能为空');
                    }
                    if (!isset($params['realprice']) || !$params['realprice'] || floatval($params['realprice']) <= 0) {
                        $this->error('二维码金额不能为0');
                    }
                }
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);
                    if ($result !== false) {
                        $this->success();
                    } else {
                        $this->error($row->getError());
                    }
                } catch (\think\exception\PDOException $e) {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

}
