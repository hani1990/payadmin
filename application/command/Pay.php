<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019-07-17
 * Time: 09:38
 */

namespace app\command;


use addons\pay\library\Service;
use addons\pay\model\Order;
use addons\pay\model\PayConfig;
use ChenPay\AliPay;
use ChenPay\WxPay;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class Pay extends Command
{
    protected function configure()
    {
        $this->setName('pay')->setDescription('个人微信+支付宝轮询(cookie版) ');
    }

    protected function execute(Input $input, Output $output)
    {
        $output->writeln("start listen:");
        $config = get_addon_config('pay');
        //var_dump($config);
        //去最近 15分钟的订单
        $orders = Order::where('createtime' ,'>', time() - 15 * 60)
            ->where('status', 'inprogress')
            ->select();
        foreach ($orders as $data){
            // time 现在时间此为订单生成时间 默认3分钟有效时间
            //$data = [['fee' => 0.01, 'time' => time() + 3 * 60, 'type' => 'wechat']];
            if($data['type'] == 'wechat'){
                $this->wechatpayListen($data['realprice'], $data['createtime']);
            }elseif ($data['type'] == 'alipay'){

                $this->alipayListen($data['realprice'], $data['createtime']);
            }

        }


    }

    public function alipayListen($price, $time)
    {
        $config = get_addon_config('pay');
        $aliCookie = $config['alipay_cookie'];
        $aliSum = PayConfig::getMetaValue('aliSum', 1);
        $aliType = 1; //PayConfig::getMetaValue('aliType', 1); // 支付宝接口切换
        $aliStatus = PayConfig::getMetaValue('aliStatus', time()); // 暂停 有订单情况下才是10秒一次的频率 杜绝支付宝风控
        // time 现在时间此为订单生成时间 默认3分钟有效时间
       // $data = [['fee' => 0.01, 'time' => time() + 3 * 60, 'type' => 'wechat']];

        if ($aliStatus > time() && empty($price)) return;
        try {
            $run = (new AliPay($aliCookie))->getData($aliType)->DataHandle();
            $remarks = false; //如果需要判断备注
            $order = $run->DataContrast($price, $time, 5);

            if ($order){
                echo "{$order}订单有效！备注：{$remarks}\n";
                //订单处理
                $result = Service::handleOrder($price, 'alipay');
                //你无需在此编写代码,只需要在addons/pay/Pay.php中的addonsPayNotify方法添加你的即可订单处理逻辑即可
            }
            unset($order, $item);// 摧毁变量防止内存溢出
            echo $aliSum . "次运行\n";
            $aliSum = $aliSum + 1;
            $aliType = $aliType ? 0 : 1;
            PayConfig::setMetaValue('aliType', $aliType);
            PayConfig::setMetaValue('aliSum', $aliSum) ;
            PayConfig::setMetaValue('aliStatus',   time() + 2 * 60);
        } catch (\ChenPay\PayException\PayException $e) {
            echo $e->getMessage() . "\n";
            unset($e);// 摧毁变量防止内存溢出
        }
    }


    public function wechatpayListen($price, $time)
    {
        $config = get_addon_config('pay');
        $wxCookie = $config['wechatpay_cookie'];
        // time 现在时间此为订单生成时间 默认3分钟有效时间
        // $data = [['fee' => 0.01, 'time' => time() + 3 * 60, 'type' => 'wechat']];
        $wxSum = PayConfig::getMetaValue('wxSum', 1);
        $syncKey = PayConfig::getMetaValue('syncKey', 0);

        try {
            $run = (new WxPay($wxCookie))->getData('wx.qq.com', $syncKey)->DataHandle();
            $remarks = false; //如果需要判断备注
            $order = $run->DataContrast($price, $time, 5, $remarks);
            if ($order){
                echo "{$order}订单有效！备注：{$remarks}\n";
                //订单处理
                $result = Service::handleOrder($price, 'wechat');
                //你无需在此编写代码,只需要在addons/pay/Pay.php中的addonsPayNotify方法添加你的即可订单处理逻辑即可
            }
            unset($order, $item);// 摧毁变量防止内存溢出

            echo $wxSum . "次运行\n";
            $wxSum = $wxSum + 1;
            $syncKey = $run->syncKey ? 1 : 0;
            PayConfig::setMetaValue('syncKey', $syncKey);
            PayConfig::setMetaValue('wxSum', $wxSum);
        } catch (\ChenPay\PayException\PayException $e) {
            echo $e->getMessage() . "\n";
            unset($e);// 摧毁变量防止内存溢出
        }
    }

}