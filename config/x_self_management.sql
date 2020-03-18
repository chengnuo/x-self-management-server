/*
 Navicat Premium Data Transfer

 Source Server         : localhost3306本地密码root
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : x_self_management

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 03/19/2020 04:40:38 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `access`
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `menuname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用，1是 0否',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '名字',
  `nameZhCn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url',
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求方法GET，POST，PUT，DELETE',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `foot`
-- ----------------------------
DROP TABLE IF EXISTS `foot`;
CREATE TABLE `foot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一索引',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(10000) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `foot`
-- ----------------------------
BEGIN;
INSERT INTO `foot` VALUES ('25', '绿茶', '绿茶1', 'http://www.baidu.com', '2020-03-16 09:13:06', '2020-03-19 04:36:04', '0'), ('26', '椰客', '海南椰子鸡，暂无介绍。', 'https://www.sohu.com/a/141830263_694786', '2020-03-16 09:21:30', '2020-03-16 09:21:30', '0'), ('27', '测试', '# 测试\n\n```\n  你好啊，我是莎莉娜\n```\n\n测试\n\n### 你好', 'http://www.baidu.com', '2020-03-17 12:30:02', '2020-03-18 15:54:03', '0');
COMMIT;

-- ----------------------------
--  Table structure for `healthMedicine`
-- ----------------------------
DROP TABLE IF EXISTS `healthMedicine`;
CREATE TABLE `healthMedicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一索引',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(10000) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `healthMedicine`
-- ----------------------------
BEGIN;
INSERT INTO `healthMedicine` VALUES ('25', '绿茶', '### 绿茶112121', 'http://www.baidu.com', '2020-03-16 09:13:06', '2020-03-19 04:39:08', '0');
COMMIT;

-- ----------------------------
--  Table structure for `npmjs`
-- ----------------------------
DROP TABLE IF EXISTS `npmjs`;
CREATE TABLE `npmjs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一索引',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(10000) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `npmjs`
-- ----------------------------
BEGIN;
INSERT INTO `npmjs` VALUES ('1', 'npmjs', 'npm 是 JavaScript 世界的包管理工具,并且是 Node.js 平台的默认包管理工具。通过 npm 可以安装、共享、分发代码,管理项目依赖关系。', 'https://www.npmjs.com/', '2020-03-06 12:17:50', '2020-03-06 12:30:32', '0'), ('2', 'element', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库', 'https://element.eleme.io/', '2020-03-06 13:14:24', '2020-03-06 13:14:24', '0'), ('3', 'ant.design', '企业级产品设计体系，创造高效愉悦的工作体验', 'https://ant.design/index-cn', '2020-03-06 13:15:25', '2020-03-06 13:15:25', '0'), ('4', 'clipboard', '现代化的拷贝文字\n不依赖flash, 不依赖其他框架，gzip压缩后只有3kb大小', 'https://github.com/zenorocha/clipboard.js', '2020-03-06 13:19:44', '2020-03-06 13:19:44', '0'), ('5', 'eggjs', 'Born to build\n\nbetter enterprise frameworks and apps with Node.js & Koa\n为企业级框架和应用而生', 'https://eggjs.org/zh-cn/index.html', '2020-03-06 13:22:01', '2020-03-06 13:22:01', '0'), ('6', 'Sequelize', '而在一些较为复杂的应用中，我们可能会需要一个 ORM 框架来帮助我们管理数据层的代码。而在 Node.js 社区中，sequelize 是一个广泛使用的 ORM 框架，它支持 MySQL、PostgreSQL、SQLite 和 MSSQL 等多个数据源。', 'https://sequelize.org/', '2020-03-06 13:24:21', '2020-03-06 13:24:21', '0'), ('7', 'momentjs', 'JavaScript 日期处理类库', 'http://momentjs.cn/', '2020-03-06 13:26:08', '2020-03-06 13:26:08', '0'), ('8', 'Lodash', 'Lodash\n是一个一致性、模块化、高性能的 JavaScript 实用工具库。', 'https://www.lodashjs.com/', '2020-03-06 13:26:55', '2020-03-06 13:26:55', '0'), ('9', 'dva', 'dva 首先是一个基于 redux 和 redux-saga 的数据流方案，然后为了简化开发体验，dva 还额外内置了 react-router 和 fetch，所以也可以理解为一个轻量级的应用框架。', 'https://dvajs.com/guide/', '2020-03-06 13:30:06', '2020-03-06 13:30:06', '0'), ('10', 'vuejs', 'Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。', 'https://cn.vuejs.org/', '2020-03-06 13:31:00', '2020-03-06 13:31:00', '0'), ('11', 'reactjs', 'A JavaScript library for building user interfaces', 'https://reactjs.org/', '2020-03-06 13:31:50', '2020-03-06 13:31:50', '0'), ('12', 'redux', 'Redux 是 JavaScript 状态容器，提供可预测化的状态管理。 (如果你需要一个 WordPress 框架，请查看 Redux Framework。)\n\n可以让你构建一致化的应用，运行于不同的环境（客户端、服务器、原生应用），并且易于测试。不仅于此，它还提供 超爽的开发体验，比如有一个时间旅行调试器可以编辑后实时预览。', 'https://www.redux.org.cn/', '2020-03-06 13:33:51', '2020-03-06 13:33:51', '0'), ('13', 'jquery', 'jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and extensibility, jQuery has changed the way that millions of people write JavaScript.', 'https://jquery.com/', '2020-03-06 13:38:24', '2020-03-06 13:38:24', '0'), ('14', 'jsonwebtoken', 'An implementation of JSON Web Tokens.\n\nThis was developed against draft-ietf-oauth-json-web-token-08. It makes use of node-jws', 'https://github.com/auth0/node-jsonwebtoken', '2020-03-06 13:40:49', '2020-03-06 13:40:49', '0'), ('15', 'eslint', 'ESLint\n可组装的JavaScript和JSX检查工具', 'https://eslint.bootcss.com/', '2020-03-06 13:41:47', '2020-03-06 13:41:47', '0'), ('16', 'typescript', 'TypeScript 是 JavaScript 的一个超集，支持 ECMAScript 6 标准。\n\nTypeScript 由微软开发的自由和开源的编程语言。\n\nTypeScript 设计目标是开发大型应用，它可以编译成纯 JavaScript，编译出来的 JavaScript 可以运行在任何浏览器上。', 'https://www.tslang.cn/', '2020-03-06 13:43:11', '2020-03-06 13:43:11', '0'), ('17', 'qs', 'A querystring parser with nesting support', 'https://github.com/ljharb/qs', '2020-03-06 13:44:50', '2020-03-06 13:44:50', '0'), ('18', 'echartsjs', 'ECharts，一个使用 JavaScript 实现的开源可视化库，可以流畅的运行在 PC 和移动设备上，兼容当前绝大部分浏览器（IE8/9/10/11，Chrome，Firefox，Safari等），底层依赖矢量图形库 ZRender，提供直观，交互丰富，可高度个性化定制的数据可视化图表。', 'https://www.echartsjs.com/zh/index.html', '2020-03-06 15:42:27', '2020-03-06 15:42:27', '0'), ('19', 'd3js', 'D3.js is a JavaScript library for manipulating documents based on data. D3 helps you bring data to life using HTML, SVG, and CSS. D3’s emphasis on web standards gives you the full capabilities of modern browsers without tying yourself to a proprietary framework, combining powerful visualization components and a data-driven approach to DOM manipulation.', 'https://d3js.org/', '2020-03-06 15:42:58', '2020-03-06 15:42:58', '0'), ('20', 'pro.ant.design', 'ANT DESIGN PRO\n开箱即用的中台前端/设计解决方案', 'https://pro.ant.design/index-cn', '2020-03-06 15:43:59', '2020-03-06 15:43:59', '0'), ('21', 'vue-element-admin', 'vue-element-admin 是一个后台前端解决方案，它基于 vue 和 element-ui实现。它使用了最新的前端技术栈，内置了 i18n 国际化解决方案，动态路由，权限验证，提炼了典型的业务模型，提供了丰富的功能组件，它可以帮助你快速搭建企业级中后台产品原型。相信不管你的需求是什么，本项目都能帮助到你。', 'https://github.com/PanJiaChen/vue-element-admin', '2020-03-06 15:45:18', '2020-03-06 15:45:18', '0'), ('22', 'youzan', '再造一个 有赞微商城 也不在话下\n\n好看、好用的组件库，\n移动、PC、小程序，该有的都有了。', 'https://open.youzan.com/zanui/', '2020-03-06 15:48:10', '2020-03-06 15:48:10', '0'), ('23', 'xlsx', 'Parser and writer for various spreadsheet formats. Pure-JS cleanroom implementation from official specifications, related documents, and test files. Emphasis on parsing and writing robustness, cross-format feature compatibility with a unified JS representation, and ES3/ES5 browser compatibility back to IE6.\n\nThis is the community version. We also offer a pro version with performance enhancements, additional features like styling, and dedicated support.', 'https://github.com/SheetJS/js-xlsx', '2020-03-06 15:54:12', '2020-03-06 15:54:12', '0'), ('24', 'three.js', 'three.js是JavaScript编写的WebGL第三方库。提供了非常多的3D显示功能。', 'https://threejs.org/', '2020-03-06 17:45:59', '2020-03-06 17:45:59', '0');
COMMIT;

-- ----------------------------
--  Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一索引',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(10000) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project`
-- ----------------------------
BEGIN;
INSERT INTO `project` VALUES ('25', '赚播', '项目名称：赚播\n\n==============测试环境==============\nJAVA：\napp和后台：http://test-zb-api.zhuanbo.gdxfhl.com\n运营后台：http://test-admin-api.zhuanbo.gdxfhl.com\n订单：http://test-order.zhuanbo.gdxfhl.com\n购物车：http://test-cart.zhuanbo.gdxfhl.com\n直播：http://test-live-api.zhuanbo.gdxfhl.com/\n\nPHP：\n商品: https://test-goods.zhuanbo.gdxfhl.com\n\n前端：\n运营后台：http://test-zb-admin.zhuanbo.gdxfhl.com\nh5：http://test-h5.zhuanbo.gdxfhl.com\n\n==============线上环境==============\nJAVA\napp和后台：http://zb-api.zhuanbo.gdxfhl.com\n运营后台：http://admin-api.zhuanbo.gdxfhl.com\n订单：http://order.zhuanbo.gdxfhl.com\n购物车：http://cart.zhuanbo.gdxfhl.com\n直播：http://live-api.zhuanbo.gdxfhl.com/\n\nPHP\n商品: https://goods.zhuanbo.gdxfhl.com\n\n前端\n运营后台：http://zb-admin.zhuanbo.gdxfhl.com\nh5：http://h5.zhuanbo.gdxfhl.com\n', null, '2020-03-15 00:22:46', '2020-03-15 01:58:28', '0'), ('29', '幸福引力', '项目名称：幸福引力\n\n==============测试环境==============\nJAVA\napp和后台：http://test-api.yinli.gdxfhl.com\n运营后台：http://test-admin-api.yinli.gdxfhl.com\n订单：http://test-order.yinli.gdxfhl.com\n购物车：http://test-cart.yinli.gdxfhl.com\n\nPHP\n基础运营后台：http://test-admin-base.yinli.gdxfhl.com\n基础app和后台：http://test-api-base.yinli.gdxfhl.com\n扫码枪运营后台：http://test-admin-sn.yinli.gdxfhl.com\n扫码枪app和后台：http://test-api-sn.yinli.gdxfhl.com\n\n前端\n运营后台：http://test-admin.yinli.gdxfhl.com\nh5：http://test-h5.yinli.gdxfhl.com\n\n==============线上环境==============\nJAVA\napp和后台：http://api.yinli.gdxfhl.com\n运营后台：http://admin-api.yinli.gdxfhl.com\n订单：http://order.yinli.gdxfhl.com\n购物车：http://cart.yinli.gdxfhl.com\n\nPHP\n基础运营后台：http://admin-base.yinli.gdxfhl.com\n基础app和后台：http://api-base.yinli.gdxfhl.com\n扫码枪运营后台：http://admin-sn.yinli.gdxfhl.com\n扫码枪app和后台：http://api-sn.yinli.gdxfhl.com\n\n前端\n运营后台：http://admin.yinli.gdxfhl.com\nh5：http://h5.yinli.gdxfhl.com', null, '2020-03-15 02:02:41', '2020-03-15 02:02:41', '0'), ('30', '名品猫', '项目名称：名品猫\n\n==============测试环境==============\napp和后台：https://test-api-mpmall.mingpinmao.cn\n运营后台：https://test-admin-api-mpmall.mingpinmao.cn\n订单：https://test-order-mpmall.mingpinmao.cn\n购物车：https://test-cart-mpmall.mingpinmao.cn\n\n名品玩家\napp和后台：https://test-api-mpwj.mingpinmao.cn\n运营后台：https://test-admin-api-mpwj.mingpinmao.cn\n订单：https://test-order-mpwj.mingpinmao.cn\n购物车：https://test-cart-mpwj.mingpinmao.cn\n\n商品：http://test-goods.mingpinmao.cn\n支付：https://test-mppay.mingpinmao.cn\n\n==============线上环境==============\n名品猫\napp和后台：https://api-mpmall.mingpinmao.cn\n运营后台：https://admin-api-mpmall.mingpinmao.cn\n订单：https://order-mpmall.mingpinmao.cn\n购物车：https://cart-mpmall.mingpinmao.cn\n\n名品玩家\napp和后台：https://api-mpwj.mingpinmao.cn\n运营后台：https://admin-api-mpwj.mingpinmao.cn\n订单：https://order-mpwj.mingpinmao.cn\n购物车：https://cart-mpwj.mingpinmao.cn\n\n商品：http://goods.mingpinmao.cn\n支付：https://mppay.mingpinmao.cn', null, '2020-03-15 02:06:45', '2020-03-15 02:06:45', '0'), ('31', '秘女郎', '项目名称：秘女郎\n\n==============测试环境==============\n管理后台\ntest-minvlang-admin-api.mingpinmao.cn\ntest-minvlang-api-mall.mingpinmao.cn\nh5\ntest-minvlang-admin-mall.mingpinmao.cn\ntest-minvlang-h5-mall.mingpinmao.cn\n\n==============线上环境==============\nmvl.lmdbsc.com H5网页\napi-mvl.lmdbsc.com API\nadmin-mvl.lmdbsc.com 管理后台\nadmin-api-mvl.lmdbsc.com 管理后台api', null, '2020-03-15 02:16:45', '2020-03-15 02:16:45', '0');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Table structure for `role_access`
-- ----------------------------
DROP TABLE IF EXISTS `role_access`;
CREATE TABLE `role_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `access_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一索引',
  `name` varchar(255) NOT NULL COMMENT '用户昵称',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='可扩展的用户表设计-https://learnku.com/articles/20074\n用户主表 users\n用户表主要用于存储用户信息，以及手机号登录认证。';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'xjc', null, '18813363888', '123', '2020-02-27 12:18:35', '2020-03-14 22:50:17', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoieGpjIiwiaWF0IjoxNTg0MTk3NDE3LCJleHAiOjE1ODQxOTc0Nzd9.j3iN8W5Ze93qbdraW7rJQUvQx5Jvk48BNzYdGTvAR2o'), ('2', 'xjc2', null, '2', '2', '2020-02-28 05:04:32', '2020-03-01 21:53:43', '1', null), ('3', 'xjc3', null, '3', '3', '2020-02-29 16:29:14', '2020-03-01 22:01:39', '1', null), ('4', 'xjc4', null, '4', '4', '2020-02-29 16:29:23', '2020-03-01 22:01:41', '1', null), ('5', 'xjc5', null, '5', '5', '2020-02-29 16:30:01', '2020-02-29 16:30:01', '0', null), ('6', 'xjc6', null, null, null, '2020-02-29 17:32:00', '2020-02-29 17:32:00', '0', null), ('7', 'xjc7', null, null, null, '2020-02-29 17:32:06', '2020-02-29 17:32:06', '0', null), ('8', 'xjc8', null, null, null, '2020-02-29 17:32:12', '2020-02-29 17:32:12', '0', null), ('9', 'xjc9', null, null, null, '2020-02-29 17:32:18', '2020-02-29 17:32:18', '0', null), ('10', 'xjc', '2', '144', null, '2020-02-29 17:32:24', '2020-03-01 19:55:58', '0', null), ('11', 'xjc11', null, null, null, '2020-02-29 17:32:29', '2020-02-29 17:32:29', '0', null), ('12', 'xjc12', null, null, null, '2020-02-29 17:32:35', '2020-02-29 17:32:35', '0', null), ('13', '1', null, '2', null, '2020-03-01 15:41:50', '2020-03-01 15:41:50', '0', null), ('14', '1', null, '2', null, '2020-03-01 15:43:50', '2020-03-01 15:43:50', '0', null), ('15', '1', null, '2', null, '2020-03-01 15:44:31', '2020-03-01 15:44:31', '0', null), ('16', '1', null, '2', null, '2020-03-01 15:44:50', '2020-03-01 15:44:50', '0', null), ('17', '1', null, '2', null, '2020-03-01 15:46:20', '2020-03-01 15:46:20', '0', null), ('18', '1', null, '2', null, '2020-03-01 15:46:24', '2020-03-01 15:46:24', '0', null), ('19', '1', null, '3', null, '2020-03-01 15:46:30', '2020-03-01 15:46:30', '0', null), ('20', '123', null, '12312', null, '2020-03-01 15:47:20', '2020-03-01 15:47:20', '0', null), ('21', '123', null, '12312', null, '2020-03-01 15:48:45', '2020-03-01 15:48:45', '0', null), ('22', '123', null, '12312', null, '2020-03-01 15:48:58', '2020-03-01 15:48:58', '0', null), ('23', '1', null, '1', null, '2020-03-01 15:49:22', '2020-03-01 15:49:22', '0', null), ('24', '1', '1', '1', null, '2020-03-01 15:51:25', '2020-03-01 15:51:25', '0', null), ('25', '1', '3', '2', null, '2020-03-01 18:54:31', '2020-03-01 18:54:31', '0', null), ('26', '1', '1', '1', null, '2020-03-01 18:58:14', '2020-03-01 18:58:14', '0', null), ('27', '12333', '1', '123', null, '2020-03-01 18:58:53', '2020-03-01 18:58:53', '0', null), ('28', '1344', '1', '533', null, '2020-03-01 19:15:46', '2020-03-01 19:15:46', '0', null), ('29', 'xjc2', null, '244', null, '2020-03-01 19:16:02', '2020-03-01 19:16:02', '0', null), ('30', 'xjc2', null, '244', null, '2020-03-01 19:16:12', '2020-03-01 19:16:12', '0', null), ('31', 'xjc', null, '18813363888', null, '2020-03-01 19:22:07', '2020-03-01 19:22:07', '0', null), ('32', 'xjc', null, '18813363888', null, '2020-03-01 19:43:56', '2020-03-01 19:43:56', '0', null), ('33', 'xjc10', null, '13213', null, '2020-03-01 19:47:19', '2020-03-01 19:47:19', '0', null), ('34', 'xjc', '1', '1321311222', null, '2020-03-01 19:47:40', '2020-03-01 19:57:53', '0', null), ('35', 'xjc', null, 'xjc', null, '2020-03-01 20:00:40', '2020-03-01 20:00:40', '0', null), ('36', 'xjc', null, 'xjc', null, '2020-03-01 20:01:39', '2020-03-01 20:01:39', '0', null), ('37', 'xjc', null, 'xjc', null, '2020-03-01 20:02:13', '2020-03-01 20:02:13', '0', null), ('38', 'xjc', 'xjc', 'xjc', null, '2020-03-01 20:05:53', '2020-03-01 20:05:53', '0', null), ('39', 'xjjj23', '123', '12312', null, '2020-03-01 20:06:31', '2020-03-01 20:06:31', '0', null), ('40', 'xjjj23', 'xjjj23', 'xjjj23', null, '2020-03-01 20:06:54', '2020-03-01 20:06:54', '0', null), ('41', 'xjc', 'xjc', 'xjc', null, '2020-03-01 20:08:19', '2020-03-01 20:08:19', '0', null), ('42', 'xjc', 'xjc', 'xjc', null, '2020-03-01 20:09:17', '2020-03-01 20:09:17', '0', null), ('43', 'xjc', 'xjc', 'xjc', null, '2020-03-01 20:09:53', '2020-03-01 20:09:53', '0', null), ('44', 'xjc12311', 'xjc', 'xjc1232', null, '2020-03-01 20:10:39', '2020-03-01 20:17:58', '0', null), ('45', '1342341', '3432', '22342341', null, '2020-03-02 19:26:37', '2020-03-02 19:29:18', '1', null), ('46', '112312', '1123123', '31231123', null, '2020-03-02 19:45:10', '2020-03-02 19:45:10', '0', null), ('47', '2444353411', '345345', '5345345111122', null, '2020-03-02 19:45:16', '2020-03-02 19:45:43', '1', null), ('48', '11', '1', '11', null, '2020-03-02 19:46:56', '2020-03-02 19:46:56', '0', null), ('49', '1111111', '11', '1234564', null, '2020-03-02 19:47:18', '2020-03-02 19:50:24', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `user_extends`
-- ----------------------------
DROP TABLE IF EXISTS `user_extends`;
CREATE TABLE `user_extends` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `field` varchar(255) NOT NULL COMMENT '扩展字段',
  `value` varchar(255) DEFAULT NULL COMMENT '扩展字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展用户表信息 users_extends\n对于用户表中没有维护的数据例如生日 brithday 、等级 level 等信息可以存储在当前信息表。';

-- ----------------------------
--  Table structure for `user_oauths`
-- ----------------------------
DROP TABLE IF EXISTS `user_oauths`;
CREATE TABLE `user_oauths` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `oauth_type` varchar(255) NOT NULL COMMENT '第三方登陆类型 weibo、qq、wechat 等',
  `oauth_id` varchar(255) NOT NULL COMMENT '第三方 uid 、openid 等',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'QQ / 微信同一主体下 Unionid 相同',
  `credential` varchar(255) DEFAULT NULL COMMENT '密码凭证 /access_token (目前更多是存储在缓存里)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户信息表 oauths\n用于存储第三方登录用户授权后的信息。';

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

SET FOREIGN_KEY_CHECKS = 1;
