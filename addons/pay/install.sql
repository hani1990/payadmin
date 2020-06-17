SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `__PREFIX__pay_missing`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `__PREFIX__pay_missing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('wechat','alipay') NOT NULL DEFAULT 'wechat' COMMENT '付款类型',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '关联订单号',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('settled','unsettled') DEFAULT 'unsettled' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='漏单表';

-- ----------------------------
--  Table structure for `__PREFIX__pay_order`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `__PREFIX__pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `qrcode_id` int(10) DEFAULT NULL COMMENT '二维码ID',
  `type` varchar(30) DEFAULT NULL COMMENT '支付方式',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '订单价格',
  `realprice` decimal(10,2) unsigned DEFAULT NULL COMMENT '真实价格',
  `title` varchar(100) DEFAULT NULL COMMENT '订单标题',
  `paytime` int(10) DEFAULT NULL COMMENT '支付时间',
  `out_order_id` varchar(100) DEFAULT NULL COMMENT '外部订单号',
  `extend` varchar(100) DEFAULT NULL COMMENT '扩展数据',
  `notifyurl` varchar(255) DEFAULT NULL COMMENT '通知URL',
  `returnurl` varchar(255) DEFAULT NULL COMMENT '返回URL',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  `status` enum('inprogress','expired','paid','unsettled','settled') DEFAULT 'inprogress' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`,`qrcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
--  Table structure for `__PREFIX__pay_product`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `__PREFIX__pay_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `image` varchar(255) DEFAULT NULL COMMENT '产品图片',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='产品表';

-- ----------------------------
--  Records of `__PREFIX__pay_product`
-- ----------------------------
BEGIN;
INSERT INTO `__PREFIX__pay_product` VALUES ('1', '自动匹配价格的商品(需用户手动输入金额)', '', '0.00', '1500000000', '1500000000', 'normal'), ('2', '9.9', '', '9.90', '1500000000', '1525578599', 'normal');
COMMIT;

-- ----------------------------
--  Table structure for `__PREFIX__pay_qrcode`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `__PREFIX__pay_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL COMMENT '产品ID',
  `type` enum('alipay','wechat') NOT NULL DEFAULT 'wechat',
  `url` varchar(255) DEFAULT NULL COMMENT '支付URL',
  `image` varchar(255) DEFAULT NULL COMMENT '二维码图片',
  `realprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='二维码表';

-- ----------------------------
--  Records of `__PREFIX__pay_qrcode`
-- ----------------------------
BEGIN;
INSERT INTO `__PREFIX__pay_qrcode` VALUES ('1', '1', 'alipay', 'HTTPS://QR.ALIPAY.COM/FKX00352XGUF8UFMGPKID5', '', '0.00', '1500000000', '1525581043', 'normal'), ('2', '1', 'wechat', 'wxp://f2f0EJVKVtFqKjfRaYEXnsu52wA5eYgtdIBj', '', '0.00', '1500000000', '1525581011', 'normal');
COMMIT;

CREATE TABLE `__PREFIX__pay_notify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '请求URL',
  `params` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `response` text COMMENT '返回结果',
  `createtime` int(10) DEFAULT NULL COMMENT '请求时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('created','success','failure') DEFAULT NULL COMMENT '结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='通知记录表';

SET FOREIGN_KEY_CHECKS = 1;
