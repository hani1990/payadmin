-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2019 at 10:01 PM
-- Server version: 5.7.23
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `fa_admin`
--

CREATE TABLE `fa_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_admin`
--

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', 0, 1563368925, 1492186163, 1563368925, '9adb8c3b-0de3-48fa-b97f-47943c414127', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_admin_log`
--

CREATE TABLE `fa_admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日志表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_admin_log`
--

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"99531d1687b6f1d135ffdc378b69e687\",\"username\":\"admin\",\"captcha\":\"mbxf\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289574),
(2, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.5.zip\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289854),
(3, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"database\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289855),
(4, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289855),
(5, 1, 'admin', '/admin/general.database/query', '常规管理 数据库管理 查询', '{\"do_action\":\"viewinfo\",\"tablename\":[\"fa_admin\"],\"submit1\":\"\\u67e5\\u770b\\u8868\\u7ed3\\u6784\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289916),
(6, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.4.zip\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289951),
(7, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"epay\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289951),
(8, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559289952),
(10, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cms\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559290951),
(11, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559290952),
(12, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293489),
(13, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293503),
(14, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"aa\",\"name\":\"row[name]\",\"value\":\"aa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293513),
(15, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"aa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293517),
(16, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"aa\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"aa\",\"outlink\":\"\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293517),
(17, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293533),
(18, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293536),
(19, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293591),
(20, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"aaa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293607),
(21, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"aaa\",\"name\":\"row[name]\",\"value\":\"aaa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293611),
(22, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"aaa\",\"image\":\"\",\"keywords\":\"aaa\",\"description\":\"\",\"diyname\":\"aaa\",\"outlink\":\"\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293612),
(23, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293711),
(24, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293711),
(25, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293711),
(26, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"\\u65b0\\u95fb\\u5217\\u8868\",\"name\":\"row[name]\",\"value\":\"\\u65b0\\u95fb\\u5217\\u8868\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293723),
(27, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"\\u65b0\\u95fb\\u5217\\u8868\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293730),
(28, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"2\",\"name\":\"\\u65b0\\u95fb\\u5217\\u8868\",\"image\":\"\",\"keywords\":\"\\u65b0\\u95fb\\u5217\\u8868\",\"description\":\"\\u65b0\\u95fb\\u5217\\u8868\",\"diyname\":\"\\u65b0\\u95fb\\u5217\\u8868\",\"outlink\":\"\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293730),
(29, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293739),
(30, 1, 'admin', '/admin/cms/archives/add?dialog=1', 'CMS管理 内容管理 添加', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"3\",\"user_id\":\"\",\"title\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"keywords\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"description\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"price\":\"10\",\"author\":\"liu han\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"status\":\"normal\",\"publishtime\":\"2019-05-31 17:08:57\",\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293763),
(31, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\",\"archives_id\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293770),
(32, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293770),
(33, 1, 'admin', '/admin/cms/archives/index', 'CMS管理 内容管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293884),
(34, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293884),
(35, 1, 'admin', '/admin/cms/order/edit/ids/1?dialog=1', 'CMS管理 订单管理 修改', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"0\",\"archives_id\":\"1\",\"title\":\"\\u4ed8\\u8d39\\u9605\\u8bfb\",\"amount\":\"10\",\"payamount\":\"0\",\"paytype\":\"wechat\",\"paytime\":\"1970-01-01 08:00:00\",\"ip\":\"0.0.0.0\",\"useragent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/74.0.3729.169 Safari\\/537.36\",\"memo\":\"\",\"status\":\"paid\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293890),
(36, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"diyform.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"diyform.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293917),
(37, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"diyform\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559293993),
(38, 1, 'admin', '/admin/addon/config?name=cms&dialog=1', '插件管理 配置', '{\"name\":\"cms\",\"dialog\":\"1\",\"row\":{\"sitename\":\"\\u6211\\u7684CMS\\u7f51\\u7ad9\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\",\"theme\":\"default\",\"qrcode\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"wxapp\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"donateimage\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"default_archives_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_channel_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_block_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_page_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"domain\":\"\",\"rewrite\":\"{\\\"index\\/index\\\":\\\"\\/$\\\",\\\"archives\\/index\\\":\\\"\\/cms\\/a\\/[:diyname]\\\",\\\"tags\\/index\\\":\\\"\\/cms\\/t\\/[:name]\\\",\\\"page\\/index\\\":\\\"\\/cms\\/p\\/[:diyname]\\\",\\\"search\\/index\\\":\\\"\\/cms\\/s\\\",\\\"channel\\/index\\\":\\\"\\/cms\\/c\\/[:diyname]\\\",\\\"diyform\\/index\\\":\\\"\\/cms\\/d\\/[:diyname]\\\"}\",\"wxappid\":\"\\u5c0f\\u7a0b\\u5e8fappid\",\"wxappsecret\":\"\\u5c0f\\u7a0b\\u5e8fsecret\",\"apikey\":\"\",\"archiveseditmode\":\"dialog\",\"channelallocate\":\"0\",\"conactqq\":\"\",\"autolinks\":\"{\\\"\\\\u670d\\\\u52a1\\\\u5668\\\":\\\"https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun\\\",\\\"\\\\u963f\\\\u91cc\\\\u4e91\\\":\\\"https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun\\\"}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559294249),
(39, 1, 'admin', '/admin/cms/archives/edit/ids/1?dialog=1', 'CMS管理 内容管理 修改', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"3\",\"user_id\":\"0\",\"title\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"keywords\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"description\":\"\\u8bda\\u62db\\u4ee3\\u7406\",\"price\":\"0\",\"author\":\"liu han\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"publishtime\":\"2019-05-31 17:08:57\",\"flag\":[\"\"]},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559294456),
(40, 1, 'admin', '/admin/cms/order/del/ids/1', 'CMS管理 订单管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559294471),
(41, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1559294769),
(42, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"d2c61922467ac780bd2b2506e1bbc0ed\",\"username\":\"hani\",\"captcha\":\"wtav\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155495),
(43, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"c752bb174fb51e38a8e8afa9f4763c57\",\"username\":\"admin\",\"captcha\":\"wtav\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155503),
(44, 1, 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"00af0da07652b2e8e917fd9145eb59a1\",\"username\":\"admin\",\"captcha\":\"lx2n\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155508),
(45, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155876),
(46, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155876),
(47, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155876),
(48, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155895),
(49, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155917),
(50, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155936),
(51, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155952),
(52, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"down\",\"name\":\"row[name]\",\"value\":\"down\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155965),
(53, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"down\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155969),
(54, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"3\",\"parent_id\":\"0\",\"name\":\"down\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"down\",\"outlink\":\"\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155969),
(55, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563155975),
(56, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156008),
(57, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156030),
(58, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"downa\",\"name\":\"row[name]\",\"value\":\"downa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156042),
(59, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"downa\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156043),
(60, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"3\",\"parent_id\":\"4\",\"name\":\"downa\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"downa\",\"outlink\":\"\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156044),
(61, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156054),
(62, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156102),
(63, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156167),
(64, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156167),
(65, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156177),
(66, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156355),
(67, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563156485),
(68, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157130),
(69, 1, 'admin', '/admin/cms/channel/del/ids/4', 'CMS管理 栏目管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157167),
(70, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157174),
(71, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157183),
(72, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157356),
(73, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"down\",\"name\":\"row[name]\",\"value\":\"down\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157367),
(74, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"down\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157368),
(75, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"3\",\"parent_id\":\"0\",\"name\":\"down\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"down\",\"outlink\":\"\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157368),
(76, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157374),
(77, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157388),
(78, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157395),
(79, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"down-1\",\"name\":\"row[name]\",\"value\":\"down-1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157414),
(80, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"down-1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157417),
(81, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"3\",\"parent_id\":\"6\",\"name\":\"down-1\",\"image\":\"\",\"keywords\":\"\",\"description\":\"down-1\",\"diyname\":\"down-1\",\"outlink\":\"\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"list_download.html\",\"showtpl\":\"show_download.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157417),
(82, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157485),
(83, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157488),
(84, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157489),
(85, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157507),
(86, 1, 'admin', '/admin/cms/archives/add?dialog=1', 'CMS管理 内容管理 添加', '{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"7\",\"user_id\":\"\",\"title\":\"aaa\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"aaaa\",\"keywords\":\"\",\"description\":\"\",\"downloads\":\"0\",\"price\":\"1\",\"screenshots\":\"\",\"downloadurl\":{\"field\":{\"baidu\":\"baidu\"},\"value\":{\"baidu\":\"\\u767e\\u5ea6\\u7f51\\u76d8\\u5730\\u5740\"}},\"filesize\":\"\",\"version\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"status\":\"normal\",\"publishtime\":\"2019-07-15 10:24:44\",\"language\":[\"\"],\"os\":[\"\"],\"flag\":[\"\"]}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157519),
(87, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157606),
(88, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157617),
(89, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157617),
(90, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563157617),
(91, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cms\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563158883),
(92, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563158885),
(93, 1, 'admin', '/admin/addon/upgrade', '', '{\"name\":\"cms\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.1.8\",\"faversion\":\"1.0.0.20190705_beta\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563158891),
(94, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.1.8.zip\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563158926),
(95, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"cms\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563158935),
(97, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cms\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159255),
(98, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159259),
(99, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159446),
(100, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159446),
(101, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159446),
(102, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159492),
(103, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159881),
(104, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159881),
(105, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563159881),
(106, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Faddtabs%3D1', '登录', '{\"url\":\"\\/admin\\/dashboard?addtabs=1\",\"__token__\":\"2c6bafc99caf91e4ad45a6239743310e\",\"username\":\"hani\",\"captcha\":\"eda6\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166101),
(107, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Faddtabs%3D1', '', '{\"url\":\"\\/admin\\/dashboard?addtabs=1\",\"__token__\":\"650c9fb6ba002481d33e5a19196f4e8b\",\"username\":\"admin\",\"captcha\":\"7qbv\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166109),
(108, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Faddtabs%3D1', '登录', '{\"url\":\"\\/admin\\/dashboard?addtabs=1\",\"__token__\":\"a610ddd98bbc3ad3a8d2953ff822fe3b\",\"username\":\"admin\",\"captcha\":\"aykf\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166115),
(109, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166178),
(110, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166180),
(111, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166194),
(112, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"list\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166201),
(113, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"show\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166206),
(114, 1, 'admin', '/admin/cms/modelx/add?dialog=1', 'CMS管理 模型管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"downoffice\",\"table\":\"cms_addondownoffice\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"list_download.html\",\"showtpl\":\"show_download.html\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166211),
(115, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166219),
(116, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166219),
(117, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166219),
(118, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"4\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166343),
(119, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166406),
(120, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166547),
(121, 1, 'admin', '/admin/cms/modelx/del/ids/4', 'CMS管理 模型管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166560),
(122, 1, 'admin', '/admin/cms/modelx/duplicate/ids/3', '', '{\"table\":\"cms_addondownoffice\",\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166579),
(123, 1, 'admin', '/admin/cms/modelx/duplicate/ids/3', '', '{\"table\":\"cms_addondownoffice\",\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166719),
(124, 1, 'admin', '/admin/cms/modelx/del/ids/5', 'CMS管理 模型管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166729),
(125, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166734),
(126, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166734),
(127, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_download.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_download.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166734),
(128, 1, 'admin', '/admin/cms/fields/multi/model_id/6/ids/23', 'CMS管理 模型管理 字段管理 批量更新', '{\"action\":\"\",\"ids\":\"23\",\"params\":\"isfilter=1\",\"model_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563166782),
(129, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167282),
(130, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167287),
(131, 1, 'admin', '/admin/cms/fields/add/model_id/6?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"6\",\"diyform_id\":\"0\",\"name\":\"type\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u7c7b\\u578b\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"255\",\"isfilter\":\"0\",\"iscontribute\":\"0\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167301),
(132, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167518);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(133, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167528),
(134, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167552),
(135, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167573),
(136, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167651),
(137, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167672),
(138, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"ppt\\u4e0b\\u8f7d\",\"name\":\"row[name]\",\"value\":\"ppt\\u4e0b\\u8f7d\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167692),
(139, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"ppt\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167696),
(140, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"channel\",\"model_id\":\"6\",\"parent_id\":\"0\",\"name\":\"ppt\\u4e0b\\u8f7d\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"ppt\",\"outlink\":\"\",\"channeltpl\":\"channel_download.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167696),
(141, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel_news.html\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167700),
(142, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"name\":\"row[diyname]\",\"value\":\"ppt-down\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167713),
(143, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"pptdown\",\"name\":\"row[name]\",\"value\":\"pptdown\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167723),
(144, 1, 'admin', '/admin/cms/channel/add?dialog=1', 'CMS管理 栏目管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"6\",\"parent_id\":\"8\",\"name\":\"pptdown\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"ppt-down\",\"outlink\":\"\",\"channeltpl\":\"channel_news.html\",\"listtpl\":\"list_download.html\",\"showtpl\":\"show_download.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167723),
(145, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167751),
(146, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167753),
(147, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"title\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167759),
(148, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563167956),
(149, 1, 'admin', '/admin/cms/fields/edit/model_id/6/ids/25?dialog=1', 'CMS管理 模型管理 字段管理 修改', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"6\",\"diyform_id\":\"0\",\"oldname\":\"type\",\"name\":\"type\",\"type\":\"checkbox\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u7c7b\\u578b\",\"content\":\"jihuazongjie|\\u8ba1\\u5212\\u603b\\u7ed3\\r\\ngongzuohuibao|\\u5de5\\u4f5c\\u6c47\\u62a5\\r\\nshangwu|\\u5546\\u52a1\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"255\",\"isfilter\":\"0\",\"iscontribute\":\"0\",\"extend\":\"\",\"weigh\":\"25\",\"status\":\"normal\"},\"model_id\":\"6\",\"ids\":\"25\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563168079),
(150, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563168085),
(151, 1, 'admin', '/admin/cms/fields/multi/model_id/6/ids/25', 'CMS管理 模型管理 字段管理 批量更新', '{\"action\":\"\",\"ids\":\"25\",\"params\":\"isfilter=1\",\"model_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563168163),
(152, 1, 'admin', '/admin/cms/fields/del/model_id/6/ids/17', 'CMS管理 模型管理 字段管理 删除', '{\"action\":\"del\",\"ids\":\"17\",\"params\":\"\",\"model_id\":\"6\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563169273),
(153, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"14745\",\"token\":\"1aefc4a5-5a29-471b-8d60-40e9820f1e38\",\"version\":\"1.0.3\",\"faversion\":\"1.0.0.20190705_beta\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171026),
(154, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171030),
(155, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171043),
(156, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171043),
(157, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171044),
(158, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171110),
(159, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171110),
(160, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171110),
(161, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"c3f468f56896585ced84e12a3124dec9\",\"username\":\"admin\",\"captcha\":\"irnh\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171205),
(162, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171217),
(163, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171218),
(164, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171218),
(165, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171232),
(166, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171293),
(167, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171293),
(168, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171294),
(169, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fcms%2Farchives%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/cms\\/archives?ref=addtabs\",\"__token__\":\"e8d107fdf2f274ea0e1266135f1b7a50\",\"username\":\"admin\",\"captcha\":\"p3cp\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171378),
(170, 1, 'admin', '/admin/cms/special/index', 'CMS管理 专题管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"title\",\"ASC\"]],\"showField\":\"title\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"title\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171386),
(171, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171386),
(172, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563171386),
(173, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"pay\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270056),
(174, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270059),
(175, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"pay\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270060),
(176, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270063),
(177, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"pay\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270067),
(178, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270070),
(179, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"pay\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270075),
(180, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270078),
(181, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"pay.zip\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270120),
(182, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"b992bf77a21bb83a60c012cfb87a451a\",\"username\":\"admin\",\"captcha\":\"sn4e\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270535),
(183, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"pay\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270554),
(184, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270557),
(185, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"pay\",\"action\":\"enable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270565),
(186, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563270570),
(187, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"27cfb6001ff3c050761084735f03e0ce\",\"username\":\"admin\",\"captcha\":\"n8ra\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563271567),
(188, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"pay\",\"title\":\"\\u4e2a\\u4eba\\u6536\\u6b3e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282142),
(189, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282146),
(190, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"238\",\"name\":\"pay\\/order\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\\t\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282166),
(191, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282170),
(192, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"238\",\"name\":\"pay\\/qrcode\",\"title\":\"\\u4e8c\\u7ef4\\u7801\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282183),
(193, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282189),
(194, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"pay\\/product\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282201),
(195, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282206),
(196, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"238\",\"name\":\"pay\\/statistics\",\"title\":\"\\u7edf\\u8ba1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282224),
(197, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282228),
(198, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"238\",\"name\":\"pay\\/missing\",\"title\":\"\\u6f0f\\u5355\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282242),
(199, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282247),
(200, 1, 'admin', '/admin/auth/rule/edit/ids/241?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"238\",\"name\":\"pay\\/product\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"241\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282278),
(201, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563282281),
(202, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563283774),
(203, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"431548232669_.pic.jpg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563283783),
(204, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563283920),
(205, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"431548232669_.pic.jpg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563283925),
(206, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"431548232669_.pic.jpg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563284081),
(207, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"WechatIMG50.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563284130),
(208, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"11164714\",\"ocr_apikey\":\"exMrjniVXaDoAqdeXFWgdmMu\",\"ocr_secretkey\":\"7cSicGt41FeRusVObPXy8gdplbRQNMvq\",\"ocr_type\":\"remote\",\"qrcode_type\":\"caoliao\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285195),
(209, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"remote\",\"qrcode_type\":\"caoliao\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285846),
(210, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285856),
(211, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285860),
(212, 1, 'admin', '/admin/pay/qrcode/add', '', '{\"image\":\"\\/uploads\\/20190716\\/71a391a8f41bf2c7062c929f598b079c.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285865),
(213, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285925),
(214, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285957),
(215, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563285999),
(216, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286005),
(217, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286040),
(218, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286111),
(219, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286146),
(220, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"oschina\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286283),
(221, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286289),
(222, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286420),
(223, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286434),
(224, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286452),
(225, 1, 'admin', '/admin/pay/qrcode/add', '', '{\"image\":\"\\/uploads\\/20190716\\/71a391a8f41bf2c7062c929f598b079c.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286454),
(226, 1, 'admin', '/admin/pay/qrcode/add?product_id=2&dialog=1', '', '{\"product_id\":\"2\",\"dialog\":\"1\",\"product_id_text\":\"9.9\",\"qrcode\":[{\"image\":\"\\/uploads\\/20190716\\/71a391a8f41bf2c7062c929f598b079c.jpeg\",\"url\":\"test\",\"type\":\"wechat\",\"realprice\":\"9.90\"}]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563286459),
(227, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288143),
(228, 1, 'admin', '/admin/pay/qrcode/edit/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"product_id\":\"2\",\"type\":\"wechat\",\"image\":\"\\/uploads\\/20190716\\/71a391a8f41bf2c7062c929f598b079c.jpeg\",\"url\":\"wxp:\\/\\/f2f1s-Ty2SRUuX-zgAbDWU55RM8HMVJqN0SJ\",\"realprice\":\"9.90\",\"status\":\"normal\"},\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288148),
(229, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288374),
(230, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288434),
(231, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288494),
(232, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288554),
(233, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288615),
(234, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288675),
(235, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288735),
(236, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288795),
(237, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288855),
(238, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288915),
(239, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563288975),
(240, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289036),
(241, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289094),
(242, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289155),
(243, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289214),
(244, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289274),
(245, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289334),
(246, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289395),
(247, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289455),
(248, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289515),
(249, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289574),
(250, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289634),
(251, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289695),
(252, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289754),
(253, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289817),
(254, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289875),
(255, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289935),
(256, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563289995),
(257, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290055),
(258, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290115),
(259, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290175),
(260, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290235),
(261, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290295),
(262, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290355),
(263, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290415),
(264, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290475),
(265, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290535),
(266, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290963),
(267, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"9.9.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563290975),
(268, 1, 'admin', '/admin/pay/order/paid/ids/2', '', '{\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563324095),
(269, 1, 'admin', '/admin/pay/order/paid/ids/2', '', '{\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563324133),
(270, 1, 'admin', '/admin/pay/order/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"product_id\":\"1\",\"qrcode_id\":\"2\",\"price\":\"9.90\",\"realprice\":\"9.90\",\"title\":\"\\u81ea\\u52a8\\u5339\\u914d\\u4ef7\\u683c\\u7684\\u5546\\u54c1(\\u9700\\u7528\\u6237\\u624b\\u52a8\\u8f93\\u5165\\u91d1\\u989d)\",\"type\":\"wechat\",\"paytime\":\"1970-01-01 08:00:00\",\"status\":\"paid\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563324694),
(271, 1, 'admin', '/admin/pay/order/notify/ids/1', '', '{\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563324703),
(272, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Faddon%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/addon?ref=addtabs\",\"__token__\":\"29ff4507bfcad780a21d6fd7ecc53c0f\",\"username\":\"admin\",\"captcha\":\"zrec\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563339781),
(273, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"caoliao\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\",\"alipay_cookie\":\"JSESSIONID=RZ24llL6m3HJKs7L8X9338XkaZJyKGunitradeprodRZ11; cna=XKisFJVvBiUCAUWhw2pqNFXq; mobileSendTime=-1; credibleMobileSendTime=-1; ctuMobileSendTime=-1; riskMobileBankSendTime=-1; riskMobileAccoutSendTime=-1; riskMobileCreditSendTime=-1; riskCredibleMobileSendTime=-1; riskOriginalAccountMobileSendTime=-1; isg=BMnJJD748QaKe40pGSTqN3G02PPjvrwux7jsaWs-RbDvsunEs2bNGLfg9Fah8VWA; 3FV_lastvisit=593%091552557794%09%2Fread.php%3Ftid%3D7931%26fid%3D59; session.cookieNameId=ALIPAYJSESSIONID; awid=RZ12MUk7UpVu7qwWBrWhhhAJXhVw7amobileclientgwRZ12; EXC_ANT_KEY=\\\"excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc,excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc\\\"; JSESSIONID=40043DE03EA258536AEFB76626DFEA3A; spanner=r8PeEWAFR5WVb+bxqDov5ZJKujUraKsUXt2T4qEYgj0=; UM_distinctid=16bf9e9118b29f-0e8542f02e6242-37677e02-fa000-16bf9e9118c5e2; CNZZDATA1253107971=1438830916-1563263446-https%253A%252F%252Fauthem14.alipay.com%252F%7C1563263446; ALIPAYBUMNGJSESSIONID=GZ00IhLzzElcgKgRZPhrx4dAoDJohHmobilecodecGZ00; csrfToken=hJ1uVcrOoG2rHBivwmP5nroU; ctoken=0WQ-yQkR7VH6oWqT; LoginForm=alipay_login_auth; alipay=\\\"K1iSL1z3BxZGVOeVirKAyn87Pi1zpiBmWHTuDo\\/L8g==\\\"; CLUB_ALIPAY_COM=2088532245440702; iw.userid=\\\"K1iSL1z3BxZGVOeVirKAyg==\\\"; ali_apache_tracktmp=\\\"uid=2088532245440702\\\"; zone=GZ00C; ALIPAYJSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; NEW_ALIPAY_TIP=1; rtk=C3BVmIVsyTn+mkB6M3ixqdds8J6tjulDx9iAOe+D\\/wlf6SH9OYf\",\"wechatpay_cookie\":\"ss\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340336),
(274, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"logo.png\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340406);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(275, 1, 'admin', '/admin/pay/product/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9080\\u8bf7\\u7801\",\"image\":\"\\/uploads\\/20190717\\/5db902b7f4d63e16a89ff719bc553885.png\",\"price\":\"0.01\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340412),
(276, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340415),
(277, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\",\"alipay_cookie\":\"JSESSIONID=RZ24llL6m3HJKs7L8X9338XkaZJyKGunitradeprodRZ11; cna=XKisFJVvBiUCAUWhw2pqNFXq; mobileSendTime=-1; credibleMobileSendTime=-1; ctuMobileSendTime=-1; riskMobileBankSendTime=-1; riskMobileAccoutSendTime=-1; riskMobileCreditSendTime=-1; riskCredibleMobileSendTime=-1; riskOriginalAccountMobileSendTime=-1; isg=BMnJJD748QaKe40pGSTqN3G02PPjvrwux7jsaWs-RbDvsunEs2bNGLfg9Fah8VWA; 3FV_lastvisit=593%091552557794%09%2Fread.php%3Ftid%3D7931%26fid%3D59; session.cookieNameId=ALIPAYJSESSIONID; awid=RZ12MUk7UpVu7qwWBrWhhhAJXhVw7amobileclientgwRZ12; EXC_ANT_KEY=\\\"excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc,excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc\\\"; JSESSIONID=40043DE03EA258536AEFB76626DFEA3A; spanner=r8PeEWAFR5WVb+bxqDov5ZJKujUraKsUXt2T4qEYgj0=; UM_distinctid=16bf9e9118b29f-0e8542f02e6242-37677e02-fa000-16bf9e9118c5e2; CNZZDATA1253107971=1438830916-1563263446-https%253A%252F%252Fauthem14.alipay.com%252F%7C1563263446; ALIPAYBUMNGJSESSIONID=GZ00IhLzzElcgKgRZPhrx4dAoDJohHmobilecodecGZ00; csrfToken=hJ1uVcrOoG2rHBivwmP5nroU; ctoken=0WQ-yQkR7VH6oWqT; LoginForm=alipay_login_auth; alipay=\\\"K1iSL1z3BxZGVOeVirKAyn87Pi1zpiBmWHTuDo\\/L8g==\\\"; CLUB_ALIPAY_COM=2088532245440702; iw.userid=\\\"K1iSL1z3BxZGVOeVirKAyg==\\\"; ali_apache_tracktmp=\\\"uid=2088532245440702\\\"; zone=GZ00C; ALIPAYJSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; NEW_ALIPAY_TIP=1; rtk=C3BVmIVsyTn+mkB6M3ixqdds8J6tjulDx9iAOe+D\\/wlf6SH9OYf\",\"wechatpay_cookie\":\"ss\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340523),
(278, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"WechatIMG180.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340532),
(279, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"WechatIMG180.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340558),
(280, 1, 'admin', '/admin/pay/qrcode/add', '', '{\"image\":\"\\/uploads\\/20190717\\/2826b2fa0c3b1f319d490a4d0ab7966a.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340559),
(281, 1, 'admin', '/admin/pay/qrcode/add?product_id=3&dialog=1', '', '{\"product_id\":\"3\",\"dialog\":\"1\",\"product_id_text\":\"\\u9080\\u8bf7\\u7801\",\"qrcode\":[{\"image\":\"\\/uploads\\/20190717\\/2826b2fa0c3b1f319d490a4d0ab7966a.jpeg\",\"url\":\"test\",\"type\":\"alipay\",\"realprice\":\"0.01\"}]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340565),
(282, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340674),
(283, 1, 'admin', '/admin/pay/qrcode/edit/ids/4?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"product_id\":\"3\",\"type\":\"alipay\",\"image\":\"\\/uploads\\/20190717\\/2826b2fa0c3b1f319d490a4d0ab7966a.jpeg\",\"url\":\"https:\\/\\/qr.alipay.com\\/fkx008956jpvcwsclnbac30\",\"realprice\":\"0.01\",\"status\":\"normal\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563340678),
(284, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\",\"alipay_cookie\":\"JSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; cna=XKisFJVvBiUCAUWhw2pqNFXq; mobileSendTime=-1; credibleMobileSendTime=-1; ctuMobileSendTime=-1; riskMobileBankSendTime=-1; riskMobileAccoutSendTime=-1; riskMobileCreditSendTime=-1; riskCredibleMobileSendTime=-1; riskOriginalAccountMobileSendTime=-1; isg=BMnJJD748QaKe40pGSTqN3G02PPjvrwux7jsaWs-RbDvsunEs2bNGLfg9Fah8VWA; 3FV_lastvisit=593%091552557794%09%2Fread.php%3Ftid%3D7931%26fid%3D59; session.cookieNameId=ALIPAYJSESSIONID; awid=RZ12MUk7UpVu7qwWBrWhhhAJXhVw7amobileclientgwRZ12; EXC_ANT_KEY=\\\"excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc,excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc\\\"; spanner=r8PeEWAFR5WVb+bxqDov5ZJKujUraKsUXt2T4qEYgj0=; UM_distinctid=16bf9e9118b29f-0e8542f02e6242-37677e02-fa000-16bf9e9118c5e2; csrfToken=hJ1uVcrOoG2rHBivwmP5nroU; LoginForm=alipay_login_auth; alipay=\\\"K1iSL1z3BxZGVOeVirKAyn87Pi1zpiBmWHTuDo\\/L8g==\\\"; CLUB_ALIPAY_COM=2088532245440702; iw.userid=\\\"K1iSL1z3BxZGVOeVirKAyg==\\\"; ali_apache_tracktmp=\\\"uid=2088532245440702\\\"; zone=GZ00C; ALIPAYJSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; NEW_ALIPAY_TIP=1; JSESSIONID=8538910244C8ED3EB2B5C4DB78710047; rtk=P2+1061p9Z0B04+IF2vHdqqpKOI5IghNHyvR\\/TBNTYzXIgj4JwX; CNZZDATA1253107971=1438830916-1563263446-https%253A%252F%252Fauthem14.alipay.com%252F%7C1563339052; ALIPAYBUMNGJSESSIONID=GZ001PS7Qje1gDfJdAIleulqVMJY3pmobilecodecGZ00; ctoken=ByhWnZE3f1_Vl6s2\",\"wechatpay_cookie\":\"ss\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563341831),
(285, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\",\"alipay_cookie\":\"JSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; cna=XKisFJVvBiUCAUWhw2pqNFXq; mobileSendTime=-1; credibleMobileSendTime=-1; ctuMobileSendTime=-1; riskMobileBankSendTime=-1; riskMobileAccoutSendTime=-1; riskMobileCreditSendTime=-1; riskCredibleMobileSendTime=-1; riskOriginalAccountMobileSendTime=-1; isg=BMnJJD748QaKe40pGSTqN3G02PPjvrwux7jsaWs-RbDvsunEs2bNGLfg9Fah8VWA; 3FV_lastvisit=593%091552557794%09%2Fread.php%3Ftid%3D7931%26fid%3D59; session.cookieNameId=ALIPAYJSESSIONID; awid=RZ12MUk7UpVu7qwWBrWhhhAJXhVw7amobileclientgwRZ12; EXC_ANT_KEY=\\\"excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc,excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc\\\"; spanner=r8PeEWAFR5WVb+bxqDov5ZJKujUraKsUXt2T4qEYgj0=; UM_distinctid=16bf9e9118b29f-0e8542f02e6242-37677e02-fa000-16bf9e9118c5e2; csrfToken=hJ1uVcrOoG2rHBivwmP5nroU; LoginForm=alipay_login_auth; alipay=\\\"K1iSL1z3BxZGVOeVirKAyn87Pi1zpiBmWHTuDo\\/L8g==\\\"; CLUB_ALIPAY_COM=2088532245440702; iw.userid=\\\"K1iSL1z3BxZGVOeVirKAyg==\\\"; ali_apache_tracktmp=\\\"uid=2088532245440702\\\"; NEW_ALIPAY_TIP=1; JSESSIONID=8538910244C8ED3EB2B5C4DB78710047; CNZZDATA1253107971=1438830916-1563263446-https%253A%252F%252Fauthem14.alipay.com%252F%7C1563339052; ALIPAYBUMNGJSESSIONID=GZ001PS7Qje1gDfJdAIleulqVMJY3pmobilecodecGZ00; ctoken=tqamE1amUC833jkc; ALIPAYJSESSIONID=RZ24JizejrFhYotP7vnH1S6ijefoBlauthRZ24GZ00; rtk=\\/4m4GAhYKPf5e2tR84OugSsZ6ruVRd1ZuQOIic5ZCprnRdyQisn; zone=GZ00C\",\"wechatpay_cookie\":\"ss\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563341873),
(286, 1, 'admin', '/admin/pay/qrcode/del/ids/4', '', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344392),
(287, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344426),
(288, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"WechatIMG260.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344432),
(289, 1, 'admin', '/admin/pay/qrcode/add', '', '{\"image\":\"\\/uploads\\/20190717\\/2d7d03eca169ffc30697ec407e171ae7.jpeg\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344433),
(290, 1, 'admin', '/admin/pay/qrcode/add?product_id=3&dialog=1', '', '{\"product_id\":\"3\",\"dialog\":\"1\",\"product_id_text\":\"\\u9080\\u8bf7\\u7801\",\"qrcode\":[{\"image\":\"\\/uploads\\/20190717\\/2d7d03eca169ffc30697ec407e171ae7.jpeg\",\"url\":\"test\",\"type\":\"alipay\",\"realprice\":\"0.01\"}]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344435),
(291, 1, 'admin', '/admin/pay/product/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344476),
(292, 1, 'admin', '/admin/pay/qrcode/edit/ids/5?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"product_id\":\"3\",\"type\":\"alipay\",\"image\":\"\\/uploads\\/20190717\\/2d7d03eca169ffc30697ec407e171ae7.jpeg\",\"url\":\"https:\\/\\/qr.alipay.com\\/fkx01577blnj2gbm28vwj79\",\"realprice\":\"0.01\",\"status\":\"normal\"},\"ids\":\"5\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344481),
(293, 1, 'admin', '/admin/addon/config?name=pay&dialog=1', '插件管理 配置', '{\"name\":\"pay\",\"dialog\":\"1\",\"row\":{\"secretkey\":\"123456\",\"ocr_appid\":\"16822092\",\"ocr_apikey\":\"39KRheDTtHHb0AUQqSbrzEnA\",\"ocr_secretkey\":\"7oLH2youuIqE13zYK8hPAgkQacYuvGN4\",\"ocr_type\":\"local\",\"qrcode_type\":\"local\",\"expireseconds\":\"300\",\"limitcents\":\"10\",\"buildmoney_type\":\"decrease\",\"notifyurl\":\"\",\"returnurl\":\"\",\"qrcodeurl\":\"https:\\/\\/tool.oschina.net\\/action\\/qrcode\\/generate?data={url}&output=image%2Fpng&error=L&type=0&margin=10&size=4\",\"poweredby\":\"0\",\"successtips\":\"\\u652f\\u4ed8\\u6210\\u529f!\\u8bf7\\u5173\\u95ed\\u5f53\\u524d\\u7a97\\u53e3\\u4ee5\\u4fbf\\u4e8e\\u7ee7\\u7eed\\u64cd\\u4f5c!\",\"expiretips\":\"\\u4e8c\\u7ef4\\u7801\\u5df2\\u8fc7\\u671f,\\u8bf7\\u70b9\\u51fb\\u8fd9\\u91cc\\u5237\\u65b0\\u540e\\u91cd\\u65b0\\u5c1d\\u8bd5\\u652f\\u4ed8!\",\"jumptips\":\"\\u652f\\u4ed8\\u6210\\u529f!2\\u79d2\\u540e\\u5c06\\u81ea\\u52a8\\u8df3\\u8f6c!\",\"contacttips\":\"\\u652f\\u4ed8\\u5373\\u65f6\\u5230\\u8d26\\uff0c\\u672a\\u5230\\u8d26\\u8bf7\\u4e0e\\u6211\\u4eec\\u8054\\u7cfb<br \\/>\\u8ba2\\u5355\\u53f7\\uff1a{out_order_id}\",\"alipay_cookie\":\"JSESSIONID=RZ24dxq27yYhp8zN4KXRSjXTtuR3gaauthRZ13GZ00; cna=XKisFJVvBiUCAUWhw2pqNFXq; mobileSendTime=-1; credibleMobileSendTime=-1; ctuMobileSendTime=-1; riskMobileBankSendTime=-1; riskMobileAccoutSendTime=-1; riskMobileCreditSendTime=-1; riskCredibleMobileSendTime=-1; riskOriginalAccountMobileSendTime=-1; isg=BMnJJD748QaKe40pGSTqN3G02PPjvrwux7jsaWs-RbDvsunEs2bNGLfg9Fah8VWA; 3FV_lastvisit=593%091552557794%09%2Fread.php%3Ftid%3D7931%26fid%3D59; session.cookieNameId=ALIPAYJSESSIONID; awid=RZ12MUk7UpVu7qwWBrWhhhAJXhVw7amobileclientgwRZ12; EXC_ANT_KEY=\\\"excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc,excashier_20001_FP_SENIOR_79822f1a-40cb-47c6-954d-e550a3c5edcc\\\"; spanner=r8PeEWAFR5WVb+bxqDov5ZJKujUraKsUXt2T4qEYgj0=; UM_distinctid=16bf9e9118b29f-0e8542f02e6242-37677e02-fa000-16bf9e9118c5e2; csrfToken=hJ1uVcrOoG2rHBivwmP5nroU; NEW_ALIPAY_TIP=1; JSESSIONID=8538910244C8ED3EB2B5C4DB78710047; ALIPAYBUMNGJSESSIONID=GZ001PS7Qje1gDfJdAIleulqVMJY3pmobilecodecGZ00; LoginForm=alipay_login_auth; ctoken=Fz6ktS6Qril9BElv; alipay=\\\"K1iSL1vgJ4qYbtY\\/rmaxHra7EioHvvmRnMFJKRrH3QRrDUS0wg==\\\"; CLUB_ALIPAY_COM=2088202871920850; iw.userid=\\\"K1iSL1vgJ4qYbtY\\/rmaxHg==\\\"; ali_apache_tracktmp=\\\"uid=2088202871920850\\\"; ALIPAYJSESSIONID=RZ24AVHYcbPZSzOQaGVMtFJbaFOaOXauthRZ24GZ00; zone=GZ00C; rtk=xe09LhAEWNdO40Jale5CjZXff\\/AdaD6SCW5V+69S+f+XaNc0+Xw; CNZZDATA1253107971=1438830916-1563263446-https%253A%252F%252Fauthem14.alipay.com%252F%7C1563344452\",\"wechatpay_cookie\":\"ss\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563344595),
(294, 1, 'admin', '/admin/pay/order/notify/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563347869),
(295, 1, 'admin', '/admin/pay/order/notifyinfo/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563347871),
(296, 1, 'admin', '/admin/pay/order/notify/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348299),
(297, 1, 'admin', '/admin/pay/order/notifyinfo/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348309),
(298, 1, 'admin', '/admin/pay/order/notify/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348321),
(299, 1, 'admin', '/admin/pay/order/notifyinfo/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348322),
(300, 1, 'admin', '/admin/pay/order/notify/ids/9', '', '{\"ids\":\"9\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348337),
(301, 1, 'admin', '/admin/pay/order/notify/ids/8', '', '{\"ids\":\"8\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563348909),
(302, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cms\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352140),
(303, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352141),
(304, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"cms\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352144),
(305, 1, 'admin', '/admin/user/user/del/ids/2', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352847),
(306, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"database\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352981),
(307, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352982),
(308, 1, 'admin', '/admin/addon/config?name=database&dialog=1', '插件管理 配置', '{\"name\":\"database\",\"dialog\":\"1\",\"row\":{\"backupDir\":\"..\\/data\\/\",\"backupIgnoreTables\":\"fa_admin_log\"}}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352988),
(309, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"database\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352993),
(310, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352993),
(311, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"epay\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352998),
(312, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563352998),
(313, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"epay\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563353001),
(314, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"summernote\",\"action\":\"disable\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563353080),
(315, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563353081),
(316, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"summernote\",\"force\":\"0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563353083),
(317, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563353083),
(318, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"267e26c72fa69b7c54bae16343bf2626\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563368909),
(319, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"cc511f3b4334ee1175fd38bbf191b7ff\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563368925),
(320, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369142),
(321, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369202),
(322, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369262),
(323, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369322),
(324, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369382),
(325, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369442),
(326, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369502),
(327, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369562),
(328, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369622),
(329, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369682),
(330, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369742),
(331, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369802),
(332, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369862),
(333, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369922),
(334, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563369982),
(335, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370042),
(336, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370102),
(337, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370162),
(338, 1, 'admin', '/admin/auth/rule/edit/ids/1?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"pay\\/statistics\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"143\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370205),
(339, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370222),
(340, 1, 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370239),
(341, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370240),
(342, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"238,1,2,6,7,8,3,5,9,10,11,12,4,66,67,73,79,239,240,241,242,243\",\"changeid\":\"238\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370302),
(343, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370302),
(344, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370395),
(345, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370455),
(346, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370515),
(347, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370576),
(348, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370636),
(349, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370696),
(350, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370756),
(351, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370816),
(352, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370876),
(353, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370936),
(354, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563370996),
(355, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371056),
(356, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371116),
(357, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371176),
(358, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371236),
(359, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371296),
(360, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371356),
(361, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371416),
(362, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371476),
(363, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371536),
(364, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371596),
(365, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371656),
(366, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371716),
(367, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371776),
(368, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371836),
(369, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371896),
(370, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563371956),
(371, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563372016),
(372, 1, 'admin', '/admin/pay/statistics/index', '', '{\"date\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1563372075);

-- --------------------------------------------------------

--
-- Table structure for table `fa_attachment`
--

CREATE TABLE `fa_attachment` (
  `id` int(20) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_attachment`
--

INSERT INTO `fa_attachment` (`id`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6'),
(2, 1, 0, '/uploads/20190716/2c4773fbaf41cfa84fb09f2032b6533f.jpg', '674', '896', 'jpg', 0, 67789, 'image/jpeg', '{\"name\":\"431548232669_.pic.jpg\"}', 1563283783, 1563283783, 1563283783, 'local', 'cfd1be4a399533e31078bb1b90050456f4892123'),
(3, 1, 0, '/uploads/20190716/86397f4b6eb846798132daaaac9a9c92.jpeg', '945', '1470', 'jpeg', 0, 70008, 'image/jpeg', '{\"name\":\"WechatIMG50.jpeg\"}', 1563284130, 1563284130, 1563284130, 'local', '25d84372e8dc2d1171e56beb59ab3cdcd9f89a38'),
(4, 1, 0, '/uploads/20190716/71a391a8f41bf2c7062c929f598b079c.jpeg', '1080', '1481', 'jpeg', 0, 104463, 'image/jpeg', '{\"name\":\"9.9.jpeg\"}', 1563285860, 1563285860, 1563285860, 'local', '586f520fb5e239a19753a1ba718873db97e118c1'),
(5, 1, 0, '/uploads/20190717/5db902b7f4d63e16a89ff719bc553885.png', '136', '136', 'png', 0, 8026, 'image/png', '{\"name\":\"logo.png\"}', 1563340406, 1563340406, 1563340406, 'local', 'a61b829421213092748c1d48bf5529f44e3183ce'),
(6, 1, 0, '/uploads/20190717/2826b2fa0c3b1f319d490a4d0ab7966a.jpeg', '990', '1540', 'jpeg', 0, 108599, 'image/jpeg', '{\"name\":\"WechatIMG180.jpeg\"}', 1563340532, 1563340532, 1563340532, 'local', 'd835770e969e916485b073a1331f4e22f247b7ec'),
(7, 1, 0, '/uploads/20190717/2d7d03eca169ffc30697ec407e171ae7.jpeg', '945', '1470', 'jpeg', 0, 102028, 'image/jpeg', '{\"name\":\"WechatIMG260.jpeg\"}', 1563344432, 1563344432, 1563344432, 'local', '50095d2b8220f914db4b4ea38cf4dbe83e15d8ab');

-- --------------------------------------------------------

--
-- Table structure for table `fa_auth_group`
--

CREATE TABLE `fa_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_auth_group`
--

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_auth_group_access`
--

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_auth_group_access`
--

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fa_auth_rule`
--

CREATE TABLE `fa_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_auth_rule`
--

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 0, 1497429920, 1563370239, 137, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 119, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 1, 1497429920, 1497429920, 99, 'normal'),
(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 0, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal'),
(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(238, 'file', 0, 'pay', '个人收款管理', 'fa fa-circle-o', '', '', 1, 1563282142, 1563282142, 143, 'normal'),
(239, 'file', 238, 'pay/order', '订单管理	', 'fa fa-circle-o', '', '', 1, 1563282166, 1563282166, 0, 'normal'),
(240, 'file', 238, 'pay/qrcode', '二维码管理', 'fa fa-circle-o', '', '', 1, 1563282183, 1563282183, 0, 'normal'),
(241, 'file', 238, 'pay/product', '产品管理', 'fa fa-circle-o', '', '', 1, 1563282201, 1563282278, 0, 'normal'),
(242, 'file', 238, 'pay/statistics', '统计管理', 'fa fa-circle-o', '', '', 1, 1563282224, 1563282224, 0, 'normal'),
(243, 'file', 238, 'pay/missing', '漏单管理', 'fa fa-circle-o', '', '', 1, 1563282242, 1563282242, 0, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_category`
--

CREATE TABLE `fa_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_category`
--

INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal'),
(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal'),
(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal'),
(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal'),
(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal'),
(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal'),
(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal'),
(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal'),
(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal'),
(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal'),
(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal'),
(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal'),
(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_config`
--

CREATE TABLE `fa_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_config`
--

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fa_ems`
--

CREATE TABLE `fa_ems` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱验证码表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_config`
--

CREATE TABLE `fa_pay_config` (
  `id` int(11) NOT NULL,
  `meta_key` varchar(50) NOT NULL DEFAULT '',
  `meta_value` varchar(100) NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa_pay_config`
--

INSERT INTO `fa_pay_config` (`id`, `meta_key`, `meta_value`, `createtime`, `updatetime`) VALUES
(2, 'aliSum', '38', 1563332140, 1563346090),
(4, 'aliStatus', '1563346210', 1563332140, 1563346090),
(8, 'aliType', '0', 1563332462, 1563346090),
(9, 'wxSum', '2', 1563332620, 1563332658),
(10, 'syncKey', '', 1563332620, 1563332657);

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_missing`
--

CREATE TABLE `fa_pay_missing` (
  `id` int(10) NOT NULL,
  `type` enum('wechat','alipay') NOT NULL DEFAULT 'wechat' COMMENT '付款类型',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '关联订单号',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('settled','unsettled') DEFAULT 'unsettled' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='漏单表';

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_notify`
--

CREATE TABLE `fa_pay_notify` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '请求URL',
  `params` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `response` text COMMENT '返回结果',
  `createtime` int(10) DEFAULT NULL COMMENT '请求时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('created','success','failure') DEFAULT NULL COMMENT '结果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知记录表';

--
-- Dumping data for table `fa_pay_notify`
--

INSERT INTO `fa_pay_notify` (`id`, `order_id`, `url`, `params`, `response`, `createtime`, `updatetime`, `status`) VALUES
(1, 2, 'http://www.baidu.com', 'order_id=2&out_order_id=123456&price=9.90&realprice=9.90&type=wechat&paytime=1563324094&extend=9.90&sign=8145284cab4d114b79b68b1190afa99e', '<!DOCTYPE html>\r\n<!--STATUS OK-->\r\n<html>\r\n<head>\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\r\n    <meta content=\"always\" name=\"referrer\">\r\n    <script src=\"https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/nocache/imgdata/seErrorRec.js\"></script>\r\n    <title>页面不存在_百度搜索</title>\r\n    <style data-for=\"result\">\r\n        body {color: #333; background: #fff; padding: 0; margin: 0; position: relative; min-width: 700px; font-family: arial; font-size: 12px }\r\n        p, form, ol, ul, li, dl, dt, dd, h3 {margin: 0; padding: 0; list-style: none }\r\n        input {padding-top: 0; padding-bottom: 0; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box } img {border: none; }\r\n        .logo {width: 117px; height: 38px; cursor: pointer }\r\n         #wrapper {_zoom: 1 }\r\n        #head {padding-left: 35px; margin-bottom: 20px; width: 900px }\r\n        .fm {clear: both; position: relative; z-index: 297 }\r\n        .btn, #more {font-size: 14px } \r\n        .s_btn {width: 95px; height: 32px; padding-top: 2px\\9; font-size: 14px; padding: 0; background-color: #ddd; background-position: 0 -48px; border: 0; cursor: pointer }\r\n        .s_btn_h {background-position: -240px -48px }\r\n        .s_btn_wr {width: 97px; height: 34px; display: inline-block; background-position: -120px -48px; *position: relative; z-index: 0; vertical-align: top }\r\n        #foot {}\r\n        #foot span {color: #666 }\r\n        .s_ipt_wr {height: 32px }\r\n        .s_form:after, .s_tab:after {content: \".\"; display: block; height: 0; clear: both; visibility: hidden }\r\n        .s_form {zoom: 1; height: 55px; padding: 0 0 0 10px }\r\n        #result_logo {float: left; margin: 7px 0 0 }\r\n        #result_logo img {width: 101px }\r\n        #head {padding: 0; margin: 0; width: 100%; position: absolute; z-index: 301; min-width: 1000px; background: #fff; border-bottom: 1px solid #ebebeb; position: fixed; _position: absolute; -webkit-transform: translateZ(0) }\r\n        #head .head_wrapper {_width: 1000px }\r\n        #head.s_down {box-shadow: 0 0 5px #888 }\r\n        .fm {clear: none; float: left; margin: 11px 0 0 10px }\r\n        #s_tab {background: #f8f8f8; line-height: 36px; height: 38px; padding: 55px 0 0 121px; float: none; zoom: 1 }\r\n        #s_tab a, #s_tab b {width: 54px; display: inline-block; text-decoration: none; text-align: center; color: #666; font-size: 14px }\r\n        #s_tab b {border-bottom: 2px solid #38f; font-weight: bold; color: #323232 }\r\n        #s_tab a:hover {color: #323232 }\r\n        #content_left {width: 540px; padding-left: 121px; padding-top: 5px }\r\n        .to_tieba, .to_zhidao_bottom {margin: 10px 0 0 121px }\r\n        #help {background: #f5f6f5; zoom: 1; padding: 0 0 0 50px; float: right }\r\n        #help a {color: #777; padding: 0 15px; text-decoration: none }\r\n        #help a:hover {color: #333 }\r\n        #foot {position: fixed; bottom:0; width: 100%; background: #f5f6f5; border-top: 1px solid #ebebeb; text-align: left; height: 42px; line-height: 42px; margin-top: 40px; *margin-top: 0; _position:absolute; _bottom:auto; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); }\r\n\r\n        .content_none {padding: 45px 0 25px 121px } .s_ipt_wr.bg,\r\n        .s_btn_wr.bg, #su.bg {background-image: none }\r\n        .s_ipt_wr.bg {background: 0 }\r\n        .s_btn_wr {width: auto; height: auto; border-bottom: 1px solid transparent; *border-bottom: 0 }\r\n        .s_btn {width: 100px; height: 34px; color: white; letter-spacing: 1px; background: #3385ff; border-bottom: 1px solid #2d78f4; outline: medium; *border-bottom: 0; -webkit-appearance: none; -webkit-border-radius: 0 }\r\n        .s_btn:hover {background: #317ef3; border-bottom: 1px solid #2868c8; *border-bottom: 0; box-shadow: 1px 1px 1px #ccc }\r\n        .s_btn:active {background: #3075dc; box-shadow: inset 1px 1px 3px #2964bb; -webkit-box-shadow: inset 1px 1px 3px #2964bb; -moz-box-shadow: inset 1px 1px 3px #2964bb; -o-box-shadow: inset 1px 1px 3px #2964bb }\r\n        #lg {display: none }\r\n        #head .headBlock {margin: -5px 0 6px 121px }\r\n        #content_left .leftBlock {margin-bottom: 14px; padding-bottom: 5px; border-bottom: 1px solid #f3f3f3 }\r\n        .s_ipt_wr {border: 1px solid #b6b6b6; border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b; background: #fff; display: inline-block; vertical-align: top; width: 539px; margin-right: 0; border-right-width: 0; border-color: #b8b8b8 transparent #ccc #b8b8b8; overflow: hidden }\r\n        .s_ipt_wr.ip_short {width: 439px; }\r\n        .s_ipt_wr:hover, .s_ipt_wr.ipthover {border-color: #999 transparent #b3b3b3 #999 }\r\n        .s_ipt_wr.iptfocus {border-color: #4791ff transparent #4791ff #4791ff }\r\n        .s_ipt_tip {color: #aaa; position: absolute; z-index: -10; font: 16px/22px arial; height: 32px; line-height: 32px; padding-left: 7px; overflow: hidden; width: 526px }\r\n        .s_ipt {width: 526px; height: 22px; font: 16px/18px arial; line-height: 22px\\9; margin: 6px 0 0 7px; padding: 0; background: transparent; border: 0; outline: 0; -webkit-appearance: none }\r\n        #kw {position: relative;display: inline-block;}\r\n        input::-ms-clear {display: none }\r\n        /*Error page css*/\r\n        .norsSuggest {display: inline-block; color: #333; font-family: arial; font-size: 13px; position: relative; } \r\n        .norsTitle {font-size: 22px; font-family: Microsoft Yahei; font-weight: normal; color: #333; margin: 35px 0 25px 0; }\r\n        .norsTitle2 {font-family: arial; font-size: 13px; color: #666; }\r\n        .norsSuggest ol {margin-left: 47px; }\r\n        .norsSuggest li {margin: 13px 0; }\r\n        #content_right {\r\n    border-left: 1px solid #e1e1e1;\r\n    width: 384px;\r\n    margin-top: 25px;\r\n    float: right;\r\n    padding-left: 17px;\r\n}\r\n#wrapper_wrapper {\r\n    width: 1212px;\r\n}\r\n.cr-content {\r\n    width: 351px;\r\n    font-size: 13px;\r\n    line-height: 1.54em;\r\n    color: #333;\r\n    margin-top: 6px;\r\n    margin-bottom: 28px;\r\n    word-wrap: break-word;\r\n    word-break: normal;\r\n}\r\n@media screen and (max-width: 1217px) {\r\n    #wrapper_wrapper {\r\n        width: 1002px;\r\n    }\r\n    #wrapper_wrapper #content_right {\r\n        width: 271px;\r\n    }\r\n    #wrapper_wrapper .cr-content {\r\n        width: 259px;\r\n    }\r\n}\r\n.opr-toplist-title {\r\n    position: relative;\r\n    font-size: 14px;\r\n    line-height: 1.29em;\r\n    font-weight: 700;\r\n    margin-bottom: 10px;\r\n}\r\n.opr-toplist-table {\r\n    width: 100%;\r\n    border-collapse: collapse;\r\n    border-spacing: 0;\r\n    font-size: 13px;\r\n}\r\n.opr-toplist-table th,td {\r\n    line-height: 1.54;\r\n    border-bottom: 1px solid #f3f3f3;\r\n    text-align: left;\r\n}\r\n.opr-toplist-table thead th {\r\n    padding-top: 4px;\r\n    padding-bottom: 4px;\r\n    font-weight: 400;\r\n    color: #666;\r\n    white-space: nowrap;\r\n    background-color: #fafafa;  \r\n}\r\n.opr-toplist-table .opr-toplist-right {\r\n    text-align: right;\r\n    white-space: nowrap;\r\n}\r\n.opr-toplist-table td {\r\n    width: 100%;\r\n    font-size: 13px;\r\n    padding-top: 6.5px;\r\n    padding-bottom: 6.5px;\r\n    vertical-align: top;\r\n}\r\n.opr-toplist-table a:hover {\r\n    text-decoration: underline;\r\n}\r\n.opr-index-item {\r\n    display: inline-block;\r\n    padding:1px 0;\r\n    color: #fff;\r\n    width: 14px;\r\n    line-height: 100%;\r\n    font-size: 12px;\r\n    text-align: center;\r\n    background-color: #8eb9f5;\r\n    margin-right: 5px;\r\n}\r\n.opr-index-hot1 {\r\n    background-color: #f54545;\r\n}\r\n\r\n.opr-index-hot2 {\r\n    background-color: #ff8547;\r\n}\r\n.opr-index-hot3 {\r\n    background-color: #ffac38;\r\n}\r\n.opr-item-text {\r\n    text-decoration: none;  \r\n}\r\n.opr-toplist-info {\r\n    color: #666;\r\n    text-align: right;\r\n    margin-top: 5px;\r\n}\r\n.opr-toplist-info>a {\r\n    color: #666;\r\n}\r\n    </style>\r\n</head>\r\n\r\n<body link=\"#0000cc\">\r\n    <div id=\"wrapper\" class=\"wrapper_l\">\r\n        <div id=\"head\">\r\n            <div class=\"head_wrapper\">\r\n                <div class=\"s_form\">\r\n                    <div class=\"s_form_wrapper\">\r\n                        <a href=\"//www.baidu.com/\" id=\"result_logo\"><img src=\"//www.baidu.com/img/baidu_jgylogo3.gif\" alt=\"到百度首页\" title=\"到百度首页\"></a>\r\n                        <form id=\"form\" name=\"f\" action=\"//www.baidu.com/s\" class=\"fm\">\r\n                            <input type=\"hidden\" name=\"ie\" value=\"utf-8\">\r\n                            <input type=\"hidden\" name=\"f\" value=\"8\">\r\n                            <input type=\"hidden\" name=\"rsv_bp\" value=\"1\">\r\n                            <input type=\"hidden\" name=\"ch\" value=\"\">\r\n                            <input type=\"hidden\" name=\"tn\" value=\"baiduerr\">\r\n                            <input type=\"hidden\" name=\"bar\" value=\"\">\r\n                            <span class=\"bg s_ipt_wr iptfocus\">\r\n                                <input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"255\" autocomplete=\"off\" autofocus>\r\n                            </span><span class=\"bg s_btn_wr\">\r\n                                <input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\">\r\n                            </span>\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"s_tab\" id=\"s_tab\">\r\n        <b>网页</b>\r\n        <a href=\"http://tieba.baidu.com/f?kw=&fr=wwwt\" wdfield=\"kw\">贴吧</a>\r\n        <a href=\"http://zhidao.baidu.com/q?ct=17&pn=0&tn=ikaslist&rn=10&word=&fr=wwwt\" wdfield=\"word\">知道</a>\r\n        <a href=\"http://music.baidu.com/search?fr=ps&ie=utf-8&key=\" wdfield=\"key\">音乐</a>\r\n        <a href=\"http://image.baidu.com/i?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&word=\" wdfield=\"word\">图片</a>\r\n        <a href=\"http://v.baidu.com/v?ct=301989888&rn=20&pn=0&db=0&s=25&ie=utf-8&word=\" wdfield=\"word\">视频</a>\r\n        <a href=\"http://map.baidu.com/m?word=&fr=ps01000\" wdfield=\"word\">地图</a>\r\n        <a href=\"http://wenku.baidu.com/search?word=&lm=0&od=0&ie=utf-8\" wdfield=\"word\">文库</a>\r\n        <a href=\"//www.baidu.com/more/\">更多»</a>\r\n    </div>\r\n    <div id=\"wrapper_wrapper\">\r\n        <div id=\"content_left\">\r\n            <div class=\"nors\">\r\n                <div class=\"norsSuggest\">\r\n                    <h3 class=\"norsTitle\">很抱歉，您要访问的页面不存在！</h3>\r\n                    <p class=\"norsTitle2\">温馨提示：</p>\r\n                    <ol>\r\n                        <li>请检查您访问的网址是否正确</li>\r\n                        <li>如果您不能确认访问的网址，请浏览<a href=\"//www.baidu.com/more/index.html\">百度更多</a>页面查看更多网址。</li>\r\n                        <li>回到顶部重新发起搜索</li>\r\n                        <li>如有任何意见或建议，请及时<a href=\"http://qingting.baidu.com/index\">反馈给我们</a>。</li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div id=\"foot\">\r\n        <span id=\"help\" style=\"float:left;padding-left:121px\">\r\n            <a href=\"http://help.baidu.com/question\" target=\"_blank\">帮助</a>\r\n            <a href=\"http://www.baidu.com/search/jubao.html\" target=\"_blank\">举报</a>\r\n            <a href=\"http://jianyi.baidu.com\" target=\"_blank\">给百度提建议</a>\r\n        </span>\r\n    </div>\r\n</body>\r\n<script>\r\n(function () {\r\n        var LOGURL = \'https://sp1.baidu.com/5b1ZeDe5KgQFm2e88IuM_a/cm.gif\';\r\n        var params = \'type=wwwerror&terminal=www\';\r\n        var img = new Image();\r\n        img.src = LOGURL + \'?\' + params;\r\n    })();\r\n    (function () {\r\n        if(window.recommend && window.recommend.query && window.recommend.query.length > 0) {\r\n            var recommendWrapper = document.createElement(\'div\');\r\n            var recommendHtml = \'<div class=\"cr-content\"><div class=\"opr-toplist-title\">\' + window.recommend.title + \'</div><table class=\"opr-toplist-table\"><thead><tr><th>排名</th></tr></thead>\';\r\n            var queryArray = window.recommend.query;\r\n            var itemUrl = \'\';\r\n            for(var i = 1; i < (queryArray.length+1); i++) {\r\n                itemUrl = \'//www.baidu.com/s?word=\' + encodeURIComponent(queryArray[i-1].word) + \'&sa=\' + queryArray[i-1].sa + \'&tn=\' + queryArray[i-1].tn;\r\n                if (queryArray[i-1].rsv_dl) {\r\n                    itemUrl += \"&rsv_dl=\" + queryArray[i-1].rsv_dl;\r\n                }\r\n                \r\n                if (i < 4) {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-hot\' + i + \' opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                } else {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                }\r\n            }\r\n            recommendHtml += \'</tbody></table><div class=\"opr-toplist-info\"><span>来源：</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=sLR63PtaB7kc3YkTtzDy1k3mbTm1DXDMu-nLcijZx8DmWgOff4lBxqmY-LGDyHqw\">百度风云榜</a><span>&nbsp;-&nbsp;</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=01vNBVXR2eaJxETl9PI3hcrvKCcwaJIKk5FkpO7l5YI_Q_pC24ogIBoZxI0LAu5oYpAdhRH42nzxAqfui0YnHK\">实时热点</a></div></div>\';\r\n            recommendWrapper.setAttribute(\'id\', \'content_right\');\r\n            document.getElementById(\'wrapper_wrapper\').insertBefore(recommendWrapper, document.getElementById(\'content_left\'));\r\n            var recommend = document.getElementById(\'content_right\');\r\n            recommend.innerHTML = recommendHtml;\r\n        }\r\n})();\r\n(function(){\r\n    var bds = {\r\n        util: {}\r\n    };\r\n    var c = document.getElementById(\'kw\').parentNode;\r\n\r\n    bds.util.getWinWidth = function(){\r\n        return window.document.documentElement.clientWidth;\r\n    };\r\n\r\n    bds.util.setFormWidth = function(){\r\n        var width = bds.util.getWinWidth();\r\n        if(width < 1217)    {bds.util.setClass(c, \'ip_short\', \'add\')}\r\n        else                {bds.util.setClass(c, \'ip_short\', \'remove\')};\r\n    };\r\n\r\n    bds.util.setClass = function(obj, class_name, set) {\r\n        var ori_class = obj.className,\r\n            has_class_p = -1,\r\n            ori_class_arr = [],\r\n            new_class = \'\';\r\n\r\n        if(ori_class.length) ori_class_arr = ori_class.split(\' \');\r\n\r\n        for( i in ori_class_arr) {\r\n            if(ori_class_arr[i] == class_name) has_class_p = i;\r\n        }\r\n\r\n        if( set == \'remove\' && has_class_p >= 0) {\r\n            ori_class_arr.splice(has_class_p, 1);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        } else if( set == \'add\' && has_class_p < 0) {\r\n            ori_class_arr.push(class_name);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        }\r\n    }\r\n    bds.util.setFormWidth();\r\n\r\n    if (typeof document.addEventListener != \"undefined\") {\r\n        window.addEventListener(\'resize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').addEventListener(\'focus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').addEventListener(\'blur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } else {\r\n        window.attachEvent(\'onresize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onfocus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onblur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } \r\n\r\n})();\r\n\r\n\r\n</script>\r\n\r\n</html>\r\n', 1563324094, 1563324095, 'failure'),
(2, 2, 'http://www.baidu.com', 'order_id=2&out_order_id=123456&price=9.90&realprice=9.90&type=wechat&paytime=1563324094&extend=9.90&sign=8145284cab4d114b79b68b1190afa99e', '<!DOCTYPE html>\r\n<!--STATUS OK-->\r\n<html>\r\n<head>\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\r\n    <meta content=\"always\" name=\"referrer\">\r\n    <script src=\"https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/nocache/imgdata/seErrorRec.js\"></script>\r\n    <title>页面不存在_百度搜索</title>\r\n    <style data-for=\"result\">\r\n        body {color: #333; background: #fff; padding: 0; margin: 0; position: relative; min-width: 700px; font-family: arial; font-size: 12px }\r\n        p, form, ol, ul, li, dl, dt, dd, h3 {margin: 0; padding: 0; list-style: none }\r\n        input {padding-top: 0; padding-bottom: 0; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box } img {border: none; }\r\n        .logo {width: 117px; height: 38px; cursor: pointer }\r\n         #wrapper {_zoom: 1 }\r\n        #head {padding-left: 35px; margin-bottom: 20px; width: 900px }\r\n        .fm {clear: both; position: relative; z-index: 297 }\r\n        .btn, #more {font-size: 14px } \r\n        .s_btn {width: 95px; height: 32px; padding-top: 2px\\9; font-size: 14px; padding: 0; background-color: #ddd; background-position: 0 -48px; border: 0; cursor: pointer }\r\n        .s_btn_h {background-position: -240px -48px }\r\n        .s_btn_wr {width: 97px; height: 34px; display: inline-block; background-position: -120px -48px; *position: relative; z-index: 0; vertical-align: top }\r\n        #foot {}\r\n        #foot span {color: #666 }\r\n        .s_ipt_wr {height: 32px }\r\n        .s_form:after, .s_tab:after {content: \".\"; display: block; height: 0; clear: both; visibility: hidden }\r\n        .s_form {zoom: 1; height: 55px; padding: 0 0 0 10px }\r\n        #result_logo {float: left; margin: 7px 0 0 }\r\n        #result_logo img {width: 101px }\r\n        #head {padding: 0; margin: 0; width: 100%; position: absolute; z-index: 301; min-width: 1000px; background: #fff; border-bottom: 1px solid #ebebeb; position: fixed; _position: absolute; -webkit-transform: translateZ(0) }\r\n        #head .head_wrapper {_width: 1000px }\r\n        #head.s_down {box-shadow: 0 0 5px #888 }\r\n        .fm {clear: none; float: left; margin: 11px 0 0 10px }\r\n        #s_tab {background: #f8f8f8; line-height: 36px; height: 38px; padding: 55px 0 0 121px; float: none; zoom: 1 }\r\n        #s_tab a, #s_tab b {width: 54px; display: inline-block; text-decoration: none; text-align: center; color: #666; font-size: 14px }\r\n        #s_tab b {border-bottom: 2px solid #38f; font-weight: bold; color: #323232 }\r\n        #s_tab a:hover {color: #323232 }\r\n        #content_left {width: 540px; padding-left: 121px; padding-top: 5px }\r\n        .to_tieba, .to_zhidao_bottom {margin: 10px 0 0 121px }\r\n        #help {background: #f5f6f5; zoom: 1; padding: 0 0 0 50px; float: right }\r\n        #help a {color: #777; padding: 0 15px; text-decoration: none }\r\n        #help a:hover {color: #333 }\r\n        #foot {position: fixed; bottom:0; width: 100%; background: #f5f6f5; border-top: 1px solid #ebebeb; text-align: left; height: 42px; line-height: 42px; margin-top: 40px; *margin-top: 0; _position:absolute; _bottom:auto; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); }\r\n\r\n        .content_none {padding: 45px 0 25px 121px } .s_ipt_wr.bg,\r\n        .s_btn_wr.bg, #su.bg {background-image: none }\r\n        .s_ipt_wr.bg {background: 0 }\r\n        .s_btn_wr {width: auto; height: auto; border-bottom: 1px solid transparent; *border-bottom: 0 }\r\n        .s_btn {width: 100px; height: 34px; color: white; letter-spacing: 1px; background: #3385ff; border-bottom: 1px solid #2d78f4; outline: medium; *border-bottom: 0; -webkit-appearance: none; -webkit-border-radius: 0 }\r\n        .s_btn:hover {background: #317ef3; border-bottom: 1px solid #2868c8; *border-bottom: 0; box-shadow: 1px 1px 1px #ccc }\r\n        .s_btn:active {background: #3075dc; box-shadow: inset 1px 1px 3px #2964bb; -webkit-box-shadow: inset 1px 1px 3px #2964bb; -moz-box-shadow: inset 1px 1px 3px #2964bb; -o-box-shadow: inset 1px 1px 3px #2964bb }\r\n        #lg {display: none }\r\n        #head .headBlock {margin: -5px 0 6px 121px }\r\n        #content_left .leftBlock {margin-bottom: 14px; padding-bottom: 5px; border-bottom: 1px solid #f3f3f3 }\r\n        .s_ipt_wr {border: 1px solid #b6b6b6; border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b; background: #fff; display: inline-block; vertical-align: top; width: 539px; margin-right: 0; border-right-width: 0; border-color: #b8b8b8 transparent #ccc #b8b8b8; overflow: hidden }\r\n        .s_ipt_wr.ip_short {width: 439px; }\r\n        .s_ipt_wr:hover, .s_ipt_wr.ipthover {border-color: #999 transparent #b3b3b3 #999 }\r\n        .s_ipt_wr.iptfocus {border-color: #4791ff transparent #4791ff #4791ff }\r\n        .s_ipt_tip {color: #aaa; position: absolute; z-index: -10; font: 16px/22px arial; height: 32px; line-height: 32px; padding-left: 7px; overflow: hidden; width: 526px }\r\n        .s_ipt {width: 526px; height: 22px; font: 16px/18px arial; line-height: 22px\\9; margin: 6px 0 0 7px; padding: 0; background: transparent; border: 0; outline: 0; -webkit-appearance: none }\r\n        #kw {position: relative;display: inline-block;}\r\n        input::-ms-clear {display: none }\r\n        /*Error page css*/\r\n        .norsSuggest {display: inline-block; color: #333; font-family: arial; font-size: 13px; position: relative; } \r\n        .norsTitle {font-size: 22px; font-family: Microsoft Yahei; font-weight: normal; color: #333; margin: 35px 0 25px 0; }\r\n        .norsTitle2 {font-family: arial; font-size: 13px; color: #666; }\r\n        .norsSuggest ol {margin-left: 47px; }\r\n        .norsSuggest li {margin: 13px 0; }\r\n        #content_right {\r\n    border-left: 1px solid #e1e1e1;\r\n    width: 384px;\r\n    margin-top: 25px;\r\n    float: right;\r\n    padding-left: 17px;\r\n}\r\n#wrapper_wrapper {\r\n    width: 1212px;\r\n}\r\n.cr-content {\r\n    width: 351px;\r\n    font-size: 13px;\r\n    line-height: 1.54em;\r\n    color: #333;\r\n    margin-top: 6px;\r\n    margin-bottom: 28px;\r\n    word-wrap: break-word;\r\n    word-break: normal;\r\n}\r\n@media screen and (max-width: 1217px) {\r\n    #wrapper_wrapper {\r\n        width: 1002px;\r\n    }\r\n    #wrapper_wrapper #content_right {\r\n        width: 271px;\r\n    }\r\n    #wrapper_wrapper .cr-content {\r\n        width: 259px;\r\n    }\r\n}\r\n.opr-toplist-title {\r\n    position: relative;\r\n    font-size: 14px;\r\n    line-height: 1.29em;\r\n    font-weight: 700;\r\n    margin-bottom: 10px;\r\n}\r\n.opr-toplist-table {\r\n    width: 100%;\r\n    border-collapse: collapse;\r\n    border-spacing: 0;\r\n    font-size: 13px;\r\n}\r\n.opr-toplist-table th,td {\r\n    line-height: 1.54;\r\n    border-bottom: 1px solid #f3f3f3;\r\n    text-align: left;\r\n}\r\n.opr-toplist-table thead th {\r\n    padding-top: 4px;\r\n    padding-bottom: 4px;\r\n    font-weight: 400;\r\n    color: #666;\r\n    white-space: nowrap;\r\n    background-color: #fafafa;  \r\n}\r\n.opr-toplist-table .opr-toplist-right {\r\n    text-align: right;\r\n    white-space: nowrap;\r\n}\r\n.opr-toplist-table td {\r\n    width: 100%;\r\n    font-size: 13px;\r\n    padding-top: 6.5px;\r\n    padding-bottom: 6.5px;\r\n    vertical-align: top;\r\n}\r\n.opr-toplist-table a:hover {\r\n    text-decoration: underline;\r\n}\r\n.opr-index-item {\r\n    display: inline-block;\r\n    padding:1px 0;\r\n    color: #fff;\r\n    width: 14px;\r\n    line-height: 100%;\r\n    font-size: 12px;\r\n    text-align: center;\r\n    background-color: #8eb9f5;\r\n    margin-right: 5px;\r\n}\r\n.opr-index-hot1 {\r\n    background-color: #f54545;\r\n}\r\n\r\n.opr-index-hot2 {\r\n    background-color: #ff8547;\r\n}\r\n.opr-index-hot3 {\r\n    background-color: #ffac38;\r\n}\r\n.opr-item-text {\r\n    text-decoration: none;  \r\n}\r\n.opr-toplist-info {\r\n    color: #666;\r\n    text-align: right;\r\n    margin-top: 5px;\r\n}\r\n.opr-toplist-info>a {\r\n    color: #666;\r\n}\r\n    </style>\r\n</head>\r\n\r\n<body link=\"#0000cc\">\r\n    <div id=\"wrapper\" class=\"wrapper_l\">\r\n        <div id=\"head\">\r\n            <div class=\"head_wrapper\">\r\n                <div class=\"s_form\">\r\n                    <div class=\"s_form_wrapper\">\r\n                        <a href=\"//www.baidu.com/\" id=\"result_logo\"><img src=\"//www.baidu.com/img/baidu_jgylogo3.gif\" alt=\"到百度首页\" title=\"到百度首页\"></a>\r\n                        <form id=\"form\" name=\"f\" action=\"//www.baidu.com/s\" class=\"fm\">\r\n                            <input type=\"hidden\" name=\"ie\" value=\"utf-8\">\r\n                            <input type=\"hidden\" name=\"f\" value=\"8\">\r\n                            <input type=\"hidden\" name=\"rsv_bp\" value=\"1\">\r\n                            <input type=\"hidden\" name=\"ch\" value=\"\">\r\n                            <input type=\"hidden\" name=\"tn\" value=\"baiduerr\">\r\n                            <input type=\"hidden\" name=\"bar\" value=\"\">\r\n                            <span class=\"bg s_ipt_wr iptfocus\">\r\n                                <input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"255\" autocomplete=\"off\" autofocus>\r\n                            </span><span class=\"bg s_btn_wr\">\r\n                                <input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\">\r\n                            </span>\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"s_tab\" id=\"s_tab\">\r\n        <b>网页</b>\r\n        <a href=\"http://tieba.baidu.com/f?kw=&fr=wwwt\" wdfield=\"kw\">贴吧</a>\r\n        <a href=\"http://zhidao.baidu.com/q?ct=17&pn=0&tn=ikaslist&rn=10&word=&fr=wwwt\" wdfield=\"word\">知道</a>\r\n        <a href=\"http://music.baidu.com/search?fr=ps&ie=utf-8&key=\" wdfield=\"key\">音乐</a>\r\n        <a href=\"http://image.baidu.com/i?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&word=\" wdfield=\"word\">图片</a>\r\n        <a href=\"http://v.baidu.com/v?ct=301989888&rn=20&pn=0&db=0&s=25&ie=utf-8&word=\" wdfield=\"word\">视频</a>\r\n        <a href=\"http://map.baidu.com/m?word=&fr=ps01000\" wdfield=\"word\">地图</a>\r\n        <a href=\"http://wenku.baidu.com/search?word=&lm=0&od=0&ie=utf-8\" wdfield=\"word\">文库</a>\r\n        <a href=\"//www.baidu.com/more/\">更多»</a>\r\n    </div>\r\n    <div id=\"wrapper_wrapper\">\r\n        <div id=\"content_left\">\r\n            <div class=\"nors\">\r\n                <div class=\"norsSuggest\">\r\n                    <h3 class=\"norsTitle\">很抱歉，您要访问的页面不存在！</h3>\r\n                    <p class=\"norsTitle2\">温馨提示：</p>\r\n                    <ol>\r\n                        <li>请检查您访问的网址是否正确</li>\r\n                        <li>如果您不能确认访问的网址，请浏览<a href=\"//www.baidu.com/more/index.html\">百度更多</a>页面查看更多网址。</li>\r\n                        <li>回到顶部重新发起搜索</li>\r\n                        <li>如有任何意见或建议，请及时<a href=\"http://qingting.baidu.com/index\">反馈给我们</a>。</li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div id=\"foot\">\r\n        <span id=\"help\" style=\"float:left;padding-left:121px\">\r\n            <a href=\"http://help.baidu.com/question\" target=\"_blank\">帮助</a>\r\n            <a href=\"http://www.baidu.com/search/jubao.html\" target=\"_blank\">举报</a>\r\n            <a href=\"http://jianyi.baidu.com\" target=\"_blank\">给百度提建议</a>\r\n        </span>\r\n    </div>\r\n</body>\r\n<script>\r\n(function () {\r\n        var LOGURL = \'https://sp1.baidu.com/5b1ZeDe5KgQFm2e88IuM_a/cm.gif\';\r\n        var params = \'type=wwwerror&terminal=www\';\r\n        var img = new Image();\r\n        img.src = LOGURL + \'?\' + params;\r\n    })();\r\n    (function () {\r\n        if(window.recommend && window.recommend.query && window.recommend.query.length > 0) {\r\n            var recommendWrapper = document.createElement(\'div\');\r\n            var recommendHtml = \'<div class=\"cr-content\"><div class=\"opr-toplist-title\">\' + window.recommend.title + \'</div><table class=\"opr-toplist-table\"><thead><tr><th>排名</th></tr></thead>\';\r\n            var queryArray = window.recommend.query;\r\n            var itemUrl = \'\';\r\n            for(var i = 1; i < (queryArray.length+1); i++) {\r\n                itemUrl = \'//www.baidu.com/s?word=\' + encodeURIComponent(queryArray[i-1].word) + \'&sa=\' + queryArray[i-1].sa + \'&tn=\' + queryArray[i-1].tn;\r\n                if (queryArray[i-1].rsv_dl) {\r\n                    itemUrl += \"&rsv_dl=\" + queryArray[i-1].rsv_dl;\r\n                }\r\n                \r\n                if (i < 4) {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-hot\' + i + \' opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                } else {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                }\r\n            }\r\n            recommendHtml += \'</tbody></table><div class=\"opr-toplist-info\"><span>来源：</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=sLR63PtaB7kc3YkTtzDy1k3mbTm1DXDMu-nLcijZx8DmWgOff4lBxqmY-LGDyHqw\">百度风云榜</a><span>&nbsp;-&nbsp;</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=01vNBVXR2eaJxETl9PI3hcrvKCcwaJIKk5FkpO7l5YI_Q_pC24ogIBoZxI0LAu5oYpAdhRH42nzxAqfui0YnHK\">实时热点</a></div></div>\';\r\n            recommendWrapper.setAttribute(\'id\', \'content_right\');\r\n            document.getElementById(\'wrapper_wrapper\').insertBefore(recommendWrapper, document.getElementById(\'content_left\'));\r\n            var recommend = document.getElementById(\'content_right\');\r\n            recommend.innerHTML = recommendHtml;\r\n        }\r\n})();\r\n(function(){\r\n    var bds = {\r\n        util: {}\r\n    };\r\n    var c = document.getElementById(\'kw\').parentNode;\r\n\r\n    bds.util.getWinWidth = function(){\r\n        return window.document.documentElement.clientWidth;\r\n    };\r\n\r\n    bds.util.setFormWidth = function(){\r\n        var width = bds.util.getWinWidth();\r\n        if(width < 1217)    {bds.util.setClass(c, \'ip_short\', \'add\')}\r\n        else                {bds.util.setClass(c, \'ip_short\', \'remove\')};\r\n    };\r\n\r\n    bds.util.setClass = function(obj, class_name, set) {\r\n        var ori_class = obj.className,\r\n            has_class_p = -1,\r\n            ori_class_arr = [],\r\n            new_class = \'\';\r\n\r\n        if(ori_class.length) ori_class_arr = ori_class.split(\' \');\r\n\r\n        for( i in ori_class_arr) {\r\n            if(ori_class_arr[i] == class_name) has_class_p = i;\r\n        }\r\n\r\n        if( set == \'remove\' && has_class_p >= 0) {\r\n            ori_class_arr.splice(has_class_p, 1);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        } else if( set == \'add\' && has_class_p < 0) {\r\n            ori_class_arr.push(class_name);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        }\r\n    }\r\n    bds.util.setFormWidth();\r\n\r\n    if (typeof document.addEventListener != \"undefined\") {\r\n        window.addEventListener(\'resize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').addEventListener(\'focus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').addEventListener(\'blur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } else {\r\n        window.attachEvent(\'onresize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onfocus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onblur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } \r\n\r\n})();\r\n\r\n\r\n</script>\r\n\r\n</html>\r\n', 1563324133, 1563324133, 'failure');
INSERT INTO `fa_pay_notify` (`id`, `order_id`, `url`, `params`, `response`, `createtime`, `updatetime`, `status`) VALUES
(3, 1, 'http://www.baidu.com', 'order_id=1&out_order_id=123456&price=9.90&realprice=9.90&type=wechat&paytime=0&extend=aaa&sign=c95f07b5cf36fe7712f9ed0ba376e12c', '<!DOCTYPE html>\r\n<!--STATUS OK-->\r\n<html>\r\n<head>\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\r\n    <meta content=\"always\" name=\"referrer\">\r\n    <script src=\"https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/nocache/imgdata/seErrorRec.js\"></script>\r\n    <title>页面不存在_百度搜索</title>\r\n    <style data-for=\"result\">\r\n        body {color: #333; background: #fff; padding: 0; margin: 0; position: relative; min-width: 700px; font-family: arial; font-size: 12px }\r\n        p, form, ol, ul, li, dl, dt, dd, h3 {margin: 0; padding: 0; list-style: none }\r\n        input {padding-top: 0; padding-bottom: 0; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box } img {border: none; }\r\n        .logo {width: 117px; height: 38px; cursor: pointer }\r\n         #wrapper {_zoom: 1 }\r\n        #head {padding-left: 35px; margin-bottom: 20px; width: 900px }\r\n        .fm {clear: both; position: relative; z-index: 297 }\r\n        .btn, #more {font-size: 14px } \r\n        .s_btn {width: 95px; height: 32px; padding-top: 2px\\9; font-size: 14px; padding: 0; background-color: #ddd; background-position: 0 -48px; border: 0; cursor: pointer }\r\n        .s_btn_h {background-position: -240px -48px }\r\n        .s_btn_wr {width: 97px; height: 34px; display: inline-block; background-position: -120px -48px; *position: relative; z-index: 0; vertical-align: top }\r\n        #foot {}\r\n        #foot span {color: #666 }\r\n        .s_ipt_wr {height: 32px }\r\n        .s_form:after, .s_tab:after {content: \".\"; display: block; height: 0; clear: both; visibility: hidden }\r\n        .s_form {zoom: 1; height: 55px; padding: 0 0 0 10px }\r\n        #result_logo {float: left; margin: 7px 0 0 }\r\n        #result_logo img {width: 101px }\r\n        #head {padding: 0; margin: 0; width: 100%; position: absolute; z-index: 301; min-width: 1000px; background: #fff; border-bottom: 1px solid #ebebeb; position: fixed; _position: absolute; -webkit-transform: translateZ(0) }\r\n        #head .head_wrapper {_width: 1000px }\r\n        #head.s_down {box-shadow: 0 0 5px #888 }\r\n        .fm {clear: none; float: left; margin: 11px 0 0 10px }\r\n        #s_tab {background: #f8f8f8; line-height: 36px; height: 38px; padding: 55px 0 0 121px; float: none; zoom: 1 }\r\n        #s_tab a, #s_tab b {width: 54px; display: inline-block; text-decoration: none; text-align: center; color: #666; font-size: 14px }\r\n        #s_tab b {border-bottom: 2px solid #38f; font-weight: bold; color: #323232 }\r\n        #s_tab a:hover {color: #323232 }\r\n        #content_left {width: 540px; padding-left: 121px; padding-top: 5px }\r\n        .to_tieba, .to_zhidao_bottom {margin: 10px 0 0 121px }\r\n        #help {background: #f5f6f5; zoom: 1; padding: 0 0 0 50px; float: right }\r\n        #help a {color: #777; padding: 0 15px; text-decoration: none }\r\n        #help a:hover {color: #333 }\r\n        #foot {position: fixed; bottom:0; width: 100%; background: #f5f6f5; border-top: 1px solid #ebebeb; text-align: left; height: 42px; line-height: 42px; margin-top: 40px; *margin-top: 0; _position:absolute; _bottom:auto; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); }\r\n\r\n        .content_none {padding: 45px 0 25px 121px } .s_ipt_wr.bg,\r\n        .s_btn_wr.bg, #su.bg {background-image: none }\r\n        .s_ipt_wr.bg {background: 0 }\r\n        .s_btn_wr {width: auto; height: auto; border-bottom: 1px solid transparent; *border-bottom: 0 }\r\n        .s_btn {width: 100px; height: 34px; color: white; letter-spacing: 1px; background: #3385ff; border-bottom: 1px solid #2d78f4; outline: medium; *border-bottom: 0; -webkit-appearance: none; -webkit-border-radius: 0 }\r\n        .s_btn:hover {background: #317ef3; border-bottom: 1px solid #2868c8; *border-bottom: 0; box-shadow: 1px 1px 1px #ccc }\r\n        .s_btn:active {background: #3075dc; box-shadow: inset 1px 1px 3px #2964bb; -webkit-box-shadow: inset 1px 1px 3px #2964bb; -moz-box-shadow: inset 1px 1px 3px #2964bb; -o-box-shadow: inset 1px 1px 3px #2964bb }\r\n        #lg {display: none }\r\n        #head .headBlock {margin: -5px 0 6px 121px }\r\n        #content_left .leftBlock {margin-bottom: 14px; padding-bottom: 5px; border-bottom: 1px solid #f3f3f3 }\r\n        .s_ipt_wr {border: 1px solid #b6b6b6; border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b; background: #fff; display: inline-block; vertical-align: top; width: 539px; margin-right: 0; border-right-width: 0; border-color: #b8b8b8 transparent #ccc #b8b8b8; overflow: hidden }\r\n        .s_ipt_wr.ip_short {width: 439px; }\r\n        .s_ipt_wr:hover, .s_ipt_wr.ipthover {border-color: #999 transparent #b3b3b3 #999 }\r\n        .s_ipt_wr.iptfocus {border-color: #4791ff transparent #4791ff #4791ff }\r\n        .s_ipt_tip {color: #aaa; position: absolute; z-index: -10; font: 16px/22px arial; height: 32px; line-height: 32px; padding-left: 7px; overflow: hidden; width: 526px }\r\n        .s_ipt {width: 526px; height: 22px; font: 16px/18px arial; line-height: 22px\\9; margin: 6px 0 0 7px; padding: 0; background: transparent; border: 0; outline: 0; -webkit-appearance: none }\r\n        #kw {position: relative;display: inline-block;}\r\n        input::-ms-clear {display: none }\r\n        /*Error page css*/\r\n        .norsSuggest {display: inline-block; color: #333; font-family: arial; font-size: 13px; position: relative; } \r\n        .norsTitle {font-size: 22px; font-family: Microsoft Yahei; font-weight: normal; color: #333; margin: 35px 0 25px 0; }\r\n        .norsTitle2 {font-family: arial; font-size: 13px; color: #666; }\r\n        .norsSuggest ol {margin-left: 47px; }\r\n        .norsSuggest li {margin: 13px 0; }\r\n        #content_right {\r\n    border-left: 1px solid #e1e1e1;\r\n    width: 384px;\r\n    margin-top: 25px;\r\n    float: right;\r\n    padding-left: 17px;\r\n}\r\n#wrapper_wrapper {\r\n    width: 1212px;\r\n}\r\n.cr-content {\r\n    width: 351px;\r\n    font-size: 13px;\r\n    line-height: 1.54em;\r\n    color: #333;\r\n    margin-top: 6px;\r\n    margin-bottom: 28px;\r\n    word-wrap: break-word;\r\n    word-break: normal;\r\n}\r\n@media screen and (max-width: 1217px) {\r\n    #wrapper_wrapper {\r\n        width: 1002px;\r\n    }\r\n    #wrapper_wrapper #content_right {\r\n        width: 271px;\r\n    }\r\n    #wrapper_wrapper .cr-content {\r\n        width: 259px;\r\n    }\r\n}\r\n.opr-toplist-title {\r\n    position: relative;\r\n    font-size: 14px;\r\n    line-height: 1.29em;\r\n    font-weight: 700;\r\n    margin-bottom: 10px;\r\n}\r\n.opr-toplist-table {\r\n    width: 100%;\r\n    border-collapse: collapse;\r\n    border-spacing: 0;\r\n    font-size: 13px;\r\n}\r\n.opr-toplist-table th,td {\r\n    line-height: 1.54;\r\n    border-bottom: 1px solid #f3f3f3;\r\n    text-align: left;\r\n}\r\n.opr-toplist-table thead th {\r\n    padding-top: 4px;\r\n    padding-bottom: 4px;\r\n    font-weight: 400;\r\n    color: #666;\r\n    white-space: nowrap;\r\n    background-color: #fafafa;  \r\n}\r\n.opr-toplist-table .opr-toplist-right {\r\n    text-align: right;\r\n    white-space: nowrap;\r\n}\r\n.opr-toplist-table td {\r\n    width: 100%;\r\n    font-size: 13px;\r\n    padding-top: 6.5px;\r\n    padding-bottom: 6.5px;\r\n    vertical-align: top;\r\n}\r\n.opr-toplist-table a:hover {\r\n    text-decoration: underline;\r\n}\r\n.opr-index-item {\r\n    display: inline-block;\r\n    padding:1px 0;\r\n    color: #fff;\r\n    width: 14px;\r\n    line-height: 100%;\r\n    font-size: 12px;\r\n    text-align: center;\r\n    background-color: #8eb9f5;\r\n    margin-right: 5px;\r\n}\r\n.opr-index-hot1 {\r\n    background-color: #f54545;\r\n}\r\n\r\n.opr-index-hot2 {\r\n    background-color: #ff8547;\r\n}\r\n.opr-index-hot3 {\r\n    background-color: #ffac38;\r\n}\r\n.opr-item-text {\r\n    text-decoration: none;  \r\n}\r\n.opr-toplist-info {\r\n    color: #666;\r\n    text-align: right;\r\n    margin-top: 5px;\r\n}\r\n.opr-toplist-info>a {\r\n    color: #666;\r\n}\r\n    </style>\r\n</head>\r\n\r\n<body link=\"#0000cc\">\r\n    <div id=\"wrapper\" class=\"wrapper_l\">\r\n        <div id=\"head\">\r\n            <div class=\"head_wrapper\">\r\n                <div class=\"s_form\">\r\n                    <div class=\"s_form_wrapper\">\r\n                        <a href=\"//www.baidu.com/\" id=\"result_logo\"><img src=\"//www.baidu.com/img/baidu_jgylogo3.gif\" alt=\"到百度首页\" title=\"到百度首页\"></a>\r\n                        <form id=\"form\" name=\"f\" action=\"//www.baidu.com/s\" class=\"fm\">\r\n                            <input type=\"hidden\" name=\"ie\" value=\"utf-8\">\r\n                            <input type=\"hidden\" name=\"f\" value=\"8\">\r\n                            <input type=\"hidden\" name=\"rsv_bp\" value=\"1\">\r\n                            <input type=\"hidden\" name=\"ch\" value=\"\">\r\n                            <input type=\"hidden\" name=\"tn\" value=\"baiduerr\">\r\n                            <input type=\"hidden\" name=\"bar\" value=\"\">\r\n                            <span class=\"bg s_ipt_wr iptfocus\">\r\n                                <input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"255\" autocomplete=\"off\" autofocus>\r\n                            </span><span class=\"bg s_btn_wr\">\r\n                                <input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\">\r\n                            </span>\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"s_tab\" id=\"s_tab\">\r\n        <b>网页</b>\r\n        <a href=\"http://tieba.baidu.com/f?kw=&fr=wwwt\" wdfield=\"kw\">贴吧</a>\r\n        <a href=\"http://zhidao.baidu.com/q?ct=17&pn=0&tn=ikaslist&rn=10&word=&fr=wwwt\" wdfield=\"word\">知道</a>\r\n        <a href=\"http://music.baidu.com/search?fr=ps&ie=utf-8&key=\" wdfield=\"key\">音乐</a>\r\n        <a href=\"http://image.baidu.com/i?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&word=\" wdfield=\"word\">图片</a>\r\n        <a href=\"http://v.baidu.com/v?ct=301989888&rn=20&pn=0&db=0&s=25&ie=utf-8&word=\" wdfield=\"word\">视频</a>\r\n        <a href=\"http://map.baidu.com/m?word=&fr=ps01000\" wdfield=\"word\">地图</a>\r\n        <a href=\"http://wenku.baidu.com/search?word=&lm=0&od=0&ie=utf-8\" wdfield=\"word\">文库</a>\r\n        <a href=\"//www.baidu.com/more/\">更多»</a>\r\n    </div>\r\n    <div id=\"wrapper_wrapper\">\r\n        <div id=\"content_left\">\r\n            <div class=\"nors\">\r\n                <div class=\"norsSuggest\">\r\n                    <h3 class=\"norsTitle\">很抱歉，您要访问的页面不存在！</h3>\r\n                    <p class=\"norsTitle2\">温馨提示：</p>\r\n                    <ol>\r\n                        <li>请检查您访问的网址是否正确</li>\r\n                        <li>如果您不能确认访问的网址，请浏览<a href=\"//www.baidu.com/more/index.html\">百度更多</a>页面查看更多网址。</li>\r\n                        <li>回到顶部重新发起搜索</li>\r\n                        <li>如有任何意见或建议，请及时<a href=\"http://qingting.baidu.com/index\">反馈给我们</a>。</li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div id=\"foot\">\r\n        <span id=\"help\" style=\"float:left;padding-left:121px\">\r\n            <a href=\"http://help.baidu.com/question\" target=\"_blank\">帮助</a>\r\n            <a href=\"http://www.baidu.com/search/jubao.html\" target=\"_blank\">举报</a>\r\n            <a href=\"http://jianyi.baidu.com\" target=\"_blank\">给百度提建议</a>\r\n        </span>\r\n    </div>\r\n</body>\r\n<script>\r\n(function () {\r\n        var LOGURL = \'https://sp1.baidu.com/5b1ZeDe5KgQFm2e88IuM_a/cm.gif\';\r\n        var params = \'type=wwwerror&terminal=www\';\r\n        var img = new Image();\r\n        img.src = LOGURL + \'?\' + params;\r\n    })();\r\n    (function () {\r\n        if(window.recommend && window.recommend.query && window.recommend.query.length > 0) {\r\n            var recommendWrapper = document.createElement(\'div\');\r\n            var recommendHtml = \'<div class=\"cr-content\"><div class=\"opr-toplist-title\">\' + window.recommend.title + \'</div><table class=\"opr-toplist-table\"><thead><tr><th>排名</th></tr></thead>\';\r\n            var queryArray = window.recommend.query;\r\n            var itemUrl = \'\';\r\n            for(var i = 1; i < (queryArray.length+1); i++) {\r\n                itemUrl = \'//www.baidu.com/s?word=\' + encodeURIComponent(queryArray[i-1].word) + \'&sa=\' + queryArray[i-1].sa + \'&tn=\' + queryArray[i-1].tn;\r\n                if (queryArray[i-1].rsv_dl) {\r\n                    itemUrl += \"&rsv_dl=\" + queryArray[i-1].rsv_dl;\r\n                }\r\n                \r\n                if (i < 4) {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-hot\' + i + \' opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                } else {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                }\r\n            }\r\n            recommendHtml += \'</tbody></table><div class=\"opr-toplist-info\"><span>来源：</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=sLR63PtaB7kc3YkTtzDy1k3mbTm1DXDMu-nLcijZx8DmWgOff4lBxqmY-LGDyHqw\">百度风云榜</a><span>&nbsp;-&nbsp;</span><a target=\"_blank\" href=\"http://www.baidu.com/link?url=01vNBVXR2eaJxETl9PI3hcrvKCcwaJIKk5FkpO7l5YI_Q_pC24ogIBoZxI0LAu5oYpAdhRH42nzxAqfui0YnHK\">实时热点</a></div></div>\';\r\n            recommendWrapper.setAttribute(\'id\', \'content_right\');\r\n            document.getElementById(\'wrapper_wrapper\').insertBefore(recommendWrapper, document.getElementById(\'content_left\'));\r\n            var recommend = document.getElementById(\'content_right\');\r\n            recommend.innerHTML = recommendHtml;\r\n        }\r\n})();\r\n(function(){\r\n    var bds = {\r\n        util: {}\r\n    };\r\n    var c = document.getElementById(\'kw\').parentNode;\r\n\r\n    bds.util.getWinWidth = function(){\r\n        return window.document.documentElement.clientWidth;\r\n    };\r\n\r\n    bds.util.setFormWidth = function(){\r\n        var width = bds.util.getWinWidth();\r\n        if(width < 1217)    {bds.util.setClass(c, \'ip_short\', \'add\')}\r\n        else                {bds.util.setClass(c, \'ip_short\', \'remove\')};\r\n    };\r\n\r\n    bds.util.setClass = function(obj, class_name, set) {\r\n        var ori_class = obj.className,\r\n            has_class_p = -1,\r\n            ori_class_arr = [],\r\n            new_class = \'\';\r\n\r\n        if(ori_class.length) ori_class_arr = ori_class.split(\' \');\r\n\r\n        for( i in ori_class_arr) {\r\n            if(ori_class_arr[i] == class_name) has_class_p = i;\r\n        }\r\n\r\n        if( set == \'remove\' && has_class_p >= 0) {\r\n            ori_class_arr.splice(has_class_p, 1);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        } else if( set == \'add\' && has_class_p < 0) {\r\n            ori_class_arr.push(class_name);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        }\r\n    }\r\n    bds.util.setFormWidth();\r\n\r\n    if (typeof document.addEventListener != \"undefined\") {\r\n        window.addEventListener(\'resize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').addEventListener(\'focus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').addEventListener(\'blur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } else {\r\n        window.attachEvent(\'onresize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onfocus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onblur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } \r\n\r\n})();\r\n\r\n\r\n</script>\r\n\r\n</html>\r\n', 1563324703, 1563324703, 'failure'),
(4, 8, 'http://fastadmin.test/notify_url.php', 'order_id=8&out_order_id=121118&price=0.01&realprice=0.01&type=alipay&paytime=1563345386&extend=abc&sign=c143f4c498aaf769bb033f02e8481184', '', 1563345386, 1563345386, 'failure'),
(5, 8, 'http://fastadmin.test/notify_url.php', 'order_id=8&out_order_id=121118&price=0.01&realprice=0.01&type=alipay&paytime=1563345464&extend=abc&sign=360aaca47507be2cd8305ced0068d5e1', '', 1563345464, 1563345465, 'failure'),
(6, 9, 'http://fastadmin.test/notify_url.php', 'order_id=9&out_order_id=1211109&price=0.01&realprice=0.01&type=alipay&paytime=1563346089&extend=abc&sign=6324f562f324b46fe7c49854c759cf40', '', 1563346089, 1563346090, 'failure'),
(7, 9, 'http://fastadmin.test/notify_url.php', 'order_id=9&out_order_id=1211109&price=0.01&realprice=0.01&type=alipay&paytime=1563346089&extend=abc&sign=6324f562f324b46fe7c49854c759cf40', '', 1563347869, 1563347869, 'failure'),
(8, 9, 'http://fastadmin.test/notify_url.php', 'order_id=9&out_order_id=1211109&price=0.01&realprice=0.01&type=alipay&paytime=1563346089&extend=abc&sign=6324f562f324b46fe7c49854c759cf40', 'ok', 1563348298, 1563348299, 'failure'),
(9, 9, 'http://fastadmin.test/notify_url.php', 'order_id=9&out_order_id=1211109&price=0.01&realprice=0.01&type=alipay&paytime=1563346089&extend=abc&sign=6324f562f324b46fe7c49854c759cf40', 'dddd', 1563348321, 1563348321, 'failure'),
(10, 9, 'http://fastadmin.test/notify_url.php', 'order_id=9&out_order_id=1211109&price=0.01&realprice=0.01&type=alipay&paytime=1563346089&extend=abc&sign=6324f562f324b46fe7c49854c759cf40', 'success', 1563348337, 1563348337, 'success'),
(11, 8, 'http://fastadmin.test/notify_url.php', 'order_id=8&out_order_id=121118&price=0.01&realprice=0.01&type=alipay&paytime=1563345464&extend=abc&sign=360aaca47507be2cd8305ced0068d5e1', 'success', 1563348909, 1563348909, 'success');

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_order`
--

CREATE TABLE `fa_pay_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '订单号',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `qrcode_id` int(10) DEFAULT NULL COMMENT '二维码ID',
  `type` varchar(30) DEFAULT NULL COMMENT '支付方式',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL COMMENT '订单价格',
  `realprice` decimal(10,2) UNSIGNED DEFAULT NULL COMMENT '真实价格',
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
  `third_order_no` varchar(100) NOT NULL DEFAULT '' COMMENT '第三方(支付宝/微信)订单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

--
-- Dumping data for table `fa_pay_order`
--

INSERT INTO `fa_pay_order` (`id`, `product_id`, `qrcode_id`, `type`, `price`, `realprice`, `title`, `paytime`, `out_order_id`, `extend`, `notifyurl`, `returnurl`, `createtime`, `updatetime`, `expiretime`, `status`, `third_order_no`) VALUES
(1, 1, 2, 'wechat', '9.90', '9.90', '自动匹配价格的商品(需用户手动输入金额)', 0, '123456', 'aaa', 'http://www.baidu.com', 'http://www.baidu.com', 1563289461, 1563324703, 1563289761, 'unsettled', ''),
(2, 1, 2, 'wechat', '9.90', '9.90', '自动匹配价格的商品(需用户手动输入金额)', 1563324094, '123456', '9.90', 'http://www.baidu.com', 'http://www.baidu.com', 1563289960, 1563324095, 1563290260, 'unsettled', ''),
(3, 1, 3, 'wechat', '9.90', '9.90', '自动匹配价格的商品(需用户手动输入金额)', NULL, '123456', '9.90', 'http://www.baidu.com', 'http://www.baidu.com', 1563290360, 1563290360, 1563290660, 'expired', ''),
(4, 1, 2, 'wechat', '9.90', '9.90', '自动匹配价格的商品(需用户手动输入金额)', NULL, '12345622', 'aaa', 'http://www.baidu.com', 'http://www.baidu.com', 1563334869, 1563334869, 1563335169, 'expired', ''),
(5, 3, 4, 'alipay', '0.01', '0.01', '邀请码', NULL, '101', 'abc', 'http://fastadmin.test/notify_url.php', 'http://fastadmin.test/return_url.php', 1563341572, 1563341875, 1563341872, 'expired', ''),
(6, 3, 4, 'alipay', '0.01', '0.01', '邀请码', NULL, '101', 'abc', 'http://fastadmin.test/notify_url.php', 'http://fastadmin.test/return_url.php', 1563341897, 1563341897, 1563342197, 'expired', ''),
(7, 3, 4, 'alipay', '0.01', '0.01', '邀请码', NULL, '121118', 'abc', 'http://fastadmin.test/notify_url.php', 'http://fastadmin.test/return_url.php', 1563342188, 1563342188, 1563342488, 'expired', ''),
(8, 3, 5, 'alipay', '0.01', '0.01', '邀请码', 1563345464, '121118', 'abc', 'http://fastadmin.test/notify_url.php', 'http://fastadmin.test/return_url.php', 1563344615, 1563348909, 1563344915, 'settled', ''),
(9, 3, 5, 'alipay', '0.01', '0.01', '邀请码', 1563346089, '1211109', 'abc', 'http://fastadmin.test/notify_url.php', 'http://fastadmin.test/return_url.php', 1563345951, 1563348337, 1563346251, 'settled', '');

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_product`
--

CREATE TABLE `fa_pay_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `image` varchar(255) DEFAULT NULL COMMENT '产品图片',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品表';

--
-- Dumping data for table `fa_pay_product`
--

INSERT INTO `fa_pay_product` (`id`, `name`, `image`, `price`, `createtime`, `updatetime`, `status`) VALUES
(1, '自动匹配价格的商品(需用户手动输入金额)', '', '0.00', 1500000000, 1500000000, 'normal'),
(2, '9.9', '', '9.90', 1500000000, 1525578599, 'normal'),
(3, '邀请码', '/uploads/20190717/5db902b7f4d63e16a89ff719bc553885.png', '0.01', 1563340412, 1563340412, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_pay_qrcode`
--

CREATE TABLE `fa_pay_qrcode` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) NOT NULL COMMENT '产品ID',
  `type` enum('alipay','wechat') NOT NULL DEFAULT 'wechat',
  `url` varchar(255) DEFAULT NULL COMMENT '支付URL',
  `image` varchar(255) DEFAULT NULL COMMENT '二维码图片',
  `realprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='二维码表';

--
-- Dumping data for table `fa_pay_qrcode`
--

INSERT INTO `fa_pay_qrcode` (`id`, `product_id`, `type`, `url`, `image`, `realprice`, `createtime`, `updatetime`, `status`) VALUES
(1, 1, 'alipay', 'HTTPS://QR.ALIPAY.COM/FKX00352XGUF8UFMGPKID5', '', '0.00', 1500000000, 1525581043, 'normal'),
(2, 1, 'wechat', 'wxp://f2f1s-Ty2SRUuX-zgAbDWU55RM8HMVJqN0SJ', '', '0.00', 1500000000, 1525581011, 'hidden'),
(3, 2, 'wechat', 'wxp://f2f1s-Ty2SRUuX-zgAbDWU55RM8HMVJqN0SJ', '/uploads/20190716/71a391a8f41bf2c7062c929f598b079c.jpeg', '9.90', 1563286459, 1563288148, 'normal'),
(5, 3, 'alipay', 'https://qr.alipay.com/fkx01577blnj2gbm28vwj79', '/uploads/20190717/2d7d03eca169ffc30697ec407e171ae7.jpeg', '0.01', 1563344435, 1563344481, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_sms`
--

CREATE TABLE `fa_sms` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `fa_test`
--

CREATE TABLE `fa_test` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_test`
--

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `json`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, NULL, 0, 1, 'normal', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user`
--

CREATE TABLE `fa_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_user`
--

INSERT INTO `fa_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-15', '', '0.00', 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_group`
--

CREATE TABLE `fa_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_user_group`
--

INSERT INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_money_log`
--

CREATE TABLE `fa_user_money_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员余额变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_rule`
--

CREATE TABLE `fa_user_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员规则表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_user_rule`
--

INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal'),
(2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal'),
(3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal'),
(4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal'),
(5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal'),
(6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal'),
(7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal'),
(8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal'),
(9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal'),
(10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal'),
(11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal'),
(12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_score_log`
--

CREATE TABLE `fa_user_score_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_token`
--

CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_user_token`
--

INSERT INTO `fa_user_token` (`token`, `user_id`, `createtime`, `expiretime`) VALUES
('11d679695b78304c5bda55be6320cfdda31ee677', 2, 1559295323, 1561887323);

-- --------------------------------------------------------

--
-- Table structure for table `fa_version`
--

CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fa_version`
--

INSERT INTO `fa_version` (`id`, `oldversion`, `newversion`, `packagesize`, `content`, `downloadurl`, `enforce`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fa_admin`
--
ALTER TABLE `fa_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- Indexes for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group_access`
--
ALTER TABLE `fa_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `weigh` (`weigh`);

--
-- Indexes for table `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `fa_config`
--
ALTER TABLE `fa_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fa_ems`
--
ALTER TABLE `fa_ems`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fa_pay_config`
--
ALTER TABLE `fa_pay_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_pay_missing`
--
ALTER TABLE `fa_pay_missing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_pay_notify`
--
ALTER TABLE `fa_pay_notify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_pay_order`
--
ALTER TABLE `fa_pay_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`qrcode_id`);

--
-- Indexes for table `fa_pay_product`
--
ALTER TABLE `fa_pay_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_pay_qrcode`
--
ALTER TABLE `fa_pay_qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_sms`
--
ALTER TABLE `fa_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_test`
--
ALTER TABLE `fa_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user`
--
ALTER TABLE `fa_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `fa_user_group`
--
ALTER TABLE `fa_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_token`
--
ALTER TABLE `fa_user_token`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `fa_version`
--
ALTER TABLE `fa_version`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fa_admin`
--
ALTER TABLE `fa_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fa_config`
--
ALTER TABLE `fa_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `fa_ems`
--
ALTER TABLE `fa_ems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `fa_pay_config`
--
ALTER TABLE `fa_pay_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fa_pay_missing`
--
ALTER TABLE `fa_pay_missing`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fa_pay_notify`
--
ALTER TABLE `fa_pay_notify`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fa_pay_order`
--
ALTER TABLE `fa_pay_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单号', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fa_pay_product`
--
ALTER TABLE `fa_pay_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fa_pay_qrcode`
--
ALTER TABLE `fa_pay_qrcode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fa_sms`
--
ALTER TABLE `fa_sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `fa_test`
--
ALTER TABLE `fa_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fa_user`
--
ALTER TABLE `fa_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fa_user_group`
--
ALTER TABLE `fa_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fa_version`
--
ALTER TABLE `fa_version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
