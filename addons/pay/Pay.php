<?php

namespace addons\pay;

use addons\pay\model\Order;
use app\common\library\Menu;
use think\Addons;
use think\exception\PDOException;

/**
 * 个人收款插件
 */
class Pay extends Addons
{

    /**
     * 插件安装方法
     * @return bool
     */
    public function install()
    {
        $menu = [
            [
                'name'    => 'pay',
                'title'   => '个人收款管理',
                "icon"    => "fa fa-rmb",
                "ismenu"  => 1,
                'sublist' => [
                    [
                        "name"    => "pay/order",
                        "title"   => "订单管理",
                        "icon"    => "fa fa-first-order",
                        "ismenu"  => 1,
                        "remark"  => "未支付或过期的订单可以手动设为已收款，已支付的订单可以再次补发通知。",
                        "sublist" => [
                            [
                                "name"  => "pay/order/index",
                                "title" => "查看"
                            ],
                            [
                                "name"  => "pay/order/add",
                                "title" => "添加"
                            ],
                            [
                                "name"  => "pay/order/edit",
                                "title" => "编辑"
                            ],
                            [
                                "name"  => "pay/order/notifyinfo",
                                "title" => "回调信息"
                            ],
                            [
                                "name"  => "pay/order/notify",
                                "title" => "重发通知"
                            ],
                            [
                                "name"  => "pay/order/del",
                                "title" => "删除"
                            ],
                            [
                                "name"  => "pay/order/multi",
                                "title" => "批量更新"
                            ]
                        ]
                    ],
                    [
                        "name"    => "pay/qrcode",
                        "title"   => "二维码管理",
                        "icon"    => "fa fa-qrcode",
                        "ismenu"  => 1,
                        "remark"  => "可以管理所有上传的二维码，第1,2条记录为系统匹配无固定金额的二维码，请勿删除",
                        "sublist" => [
                            [
                                "name"  => "pay/qrcode/index",
                                "title" => "查看"
                            ],
                            [
                                "name"  => "pay/qrcode/add",
                                "title" => "添加"
                            ],
                            [
                                "name"  => "pay/qrcode/edit",
                                "title" => "编辑"
                            ],
                            [
                                "name"  => "pay/qrcode/del",
                                "title" => "删除"
                            ],
                            [
                                "name"  => "pay/qrcode/multi",
                                "title" => "批量更新"
                            ]
                        ]
                    ],
                    [
                        "name"    => "pay/product",
                        "title"   => "产品管理",
                        "icon"    => "fa fa-product-hunt",
                        "ismenu"  => 1,
                        "remark"  => "每个产品的微信二维码和支付宝二维码都可以多个，如果你的产品价格是50元，最好支付宝和微信都分别上传49.90~50这个区间共11个二维码，当然上传的关联二维码越多，越不容易出现让用户手动输入金额的情况。",
                        "sublist" => [
                            [
                                "name"  => "pay/product/index",
                                "title" => "查看"
                            ],
                            [
                                "name"  => "pay/product/add",
                                "title" => "添加"
                            ],
                            [
                                "name"  => "pay/product/edit",
                                "title" => "编辑"
                            ],
                            [
                                "name"  => "pay/product/del",
                                "title" => "删除"
                            ],
                            [
                                "name"  => "pay/product/multi",
                                "title" => "批量更新"
                            ]
                        ]
                    ],
                    [
                        "name"    => "pay/statistics",
                        "title"   => "统计管理",
                        "icon"    => "fa fa-bar-chart",
                        "ismenu"  => 1,
                        "sublist" => [
                            [
                                "name"  => "pay/statistics/index",
                                "title" => "查看"
                            ]
                        ]
                    ],
                    [
                        "name"    => "pay/missing",
                        "title"   => "漏单管理",
                        "icon"    => "fa fa-filter",
                        "ismenu"  => 1,
                        "remark"  => "如果有未匹配上订单的金额会在此显示，你可以手动补发漏单的记录",
                        "sublist" => [
                            [
                                "name"  => "pay/missing/index",
                                "title" => "查看"
                            ],
                            [
                                "name"  => "pay/missing/add",
                                "title" => "添加"
                            ],
                            [
                                "name"  => "pay/missing/edit",
                                "title" => "编辑"
                            ],
                            [
                                "name"  => "pay/missing/del",
                                "title" => "删除"
                            ],
                            [
                                "name"  => "pay/missing/multi",
                                "title" => "批量更新"
                            ]
                        ]
                    ]
                ],
            ]
        ];
        Menu::create($menu);
        return true;
    }

    /**
     * 插件卸载方法
     * @return bool
     */
    public function uninstall()
    {
        Menu::delete("pay");
        return true;
    }

    /**
     * 插件启用方法
     * @return bool
     */
    public function enable()
    {
        Menu::enable("pay");
        return true;
    }

    /**
     * 插件禁用方法
     * @return bool
     */
    public function disable()
    {
        Menu::disable("pay");
        return true;
    }

    /**
     * 当状态变更成paid时执行的事件
     * @return mixed
     */
    public function addonsPayPaid($params)
    {
        return true;
    }

    /**
     * 支付成功回调的实现方法
     * 如果未传递notifyurl值的情况下才会调用
     *
     * @param Order $params 订单信息
     * @return bool
     */
    public function addonsPayNotify($params)
    {
        //如果不采用notifyurl回调的形式,可以采用此方式处理订单逻辑,注意处理成功后需要return true;

        //处理订单的逻辑,下面的写法仅供参考,请根据自己的需求进行修改,比如修改会员余额,处理订单状态等
        //比如修改会员的积分,price是原始金额,realprice是实付金额
        //\app\common\model\User::where('id', $params['extend'])->setInc('score', $params['realprice']);
        \app\common\model\RechargeLog::rechargeCallBack($params['out_order_id']);
        return true;
    }

}
