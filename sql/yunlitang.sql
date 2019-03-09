/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yunlitang

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-09 18:18:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
INSERT INTO `cmf_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `cmf_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `cmf_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `cmf_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `cmf_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `cmf_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES ('7', '6', '1', '0', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `cmf_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('15', '6', '1', '0', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cmf_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `cmf_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `cmf_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `cmf_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES ('29', '6', '1', '0', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cmf_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cmf_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cmf_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cmf_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cmf_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES ('49', '110', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES ('61', '6', '1', '0', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cmf_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cmf_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cmf_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cmf_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cmf_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cmf_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cmf_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cmf_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cmf_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('75', '6', '1', '0', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cmf_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('95', '6', '1', '0', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cmf_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cmf_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cmf_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cmf_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cmf_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cmf_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cmf_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cmf_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cmf_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cmf_admin_menu` VALUES ('109', '95', '1', '0', '10000', 'admin', 'Theme', 'design', '', '模板设计', '', '模板设计');
INSERT INTO `cmf_admin_menu` VALUES ('110', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES ('111', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES ('112', '111', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES ('113', '111', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('114', '111', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES ('115', '111', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('116', '111', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES ('117', '111', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('118', '111', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES ('119', '111', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('120', '111', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('121', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `cmf_admin_menu` VALUES ('122', '121', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cmf_admin_menu` VALUES ('123', '122', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cmf_admin_menu` VALUES ('124', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('125', '122', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cmf_admin_menu` VALUES ('126', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('127', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cmf_admin_menu` VALUES ('128', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cmf_admin_menu` VALUES ('129', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cmf_admin_menu` VALUES ('130', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cmf_admin_menu` VALUES ('131', '122', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cmf_admin_menu` VALUES ('132', '121', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cmf_admin_menu` VALUES ('133', '132', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('134', '132', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('135', '132', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('136', '132', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('137', '132', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cmf_admin_menu` VALUES ('138', '132', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cmf_admin_menu` VALUES ('139', '132', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('140', '121', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES ('141', '140', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES ('142', '140', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('143', '140', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES ('144', '140', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('145', '140', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES ('146', '121', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('147', '146', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('148', '146', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cmf_admin_menu` VALUES ('149', '146', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES ('150', '146', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('151', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cmf_admin_menu` VALUES ('152', '151', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cmf_admin_menu` VALUES ('153', '110', '0', '0', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES ('154', '153', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `cmf_admin_menu` VALUES ('155', '154', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cmf_admin_menu` VALUES ('156', '154', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES ('157', '153', '1', '0', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cmf_admin_menu` VALUES ('158', '157', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `cmf_admin_menu` VALUES ('159', '6', '1', '0', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `cmf_admin_menu` VALUES ('160', '159', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('161', '159', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `cmf_admin_menu` VALUES ('162', '159', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('163', '132', '2', '0', '10000', 'portal', 'AdminCategory', 'toggle', '', '文章分类显示隐藏', '', '文章分类显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('164', '6', '1', '1', '10000', 'admin', 'Config', 'index', '', '配置管理', '', '配置管理');
INSERT INTO `cmf_admin_menu` VALUES ('165', '164', '1', '0', '10000', 'admin', 'Config', 'add', '', '添加配置', '', '添加配置');
INSERT INTO `cmf_admin_menu` VALUES ('166', '164', '1', '0', '10000', 'admin', 'Config', 'edit', '', '编辑配置', '', '编辑配置');
INSERT INTO `cmf_admin_menu` VALUES ('167', '164', '2', '0', '10000', 'admin', 'Config', 'sort', '', '排序配置', '', '排序配置');
INSERT INTO `cmf_admin_menu` VALUES ('168', '164', '2', '0', '10000', 'admin', 'Config', 'toggle', '', '隐藏配置', '', '隐藏配置');
INSERT INTO `cmf_admin_menu` VALUES ('169', '164', '2', '0', '10000', 'admin', 'Config', 'delete', '', '删除配置', '', '删除配置');
INSERT INTO `cmf_admin_menu` VALUES ('170', '6', '1', '1', '10000', 'admin', 'Config', 'read', '', '设置配置', '', '设置配置');
INSERT INTO `cmf_admin_menu` VALUES ('171', '170', '2', '0', '10000', 'admin', 'Config', 'save', '', '保存配置', '', '保存配置');
INSERT INTO `cmf_admin_menu` VALUES ('172', '6', '1', '1', '10000', 'admin', 'Department', 'index', '', '科室领域', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('173', '172', '1', '0', '10000', 'admin', 'Department', 'add', '', '添加科室领域', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('174', '172', '1', '0', '10000', 'admin', 'Department', 'edit', '', '编辑科室领域', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('175', '172', '2', '0', '10000', 'admin', 'Department', 'sort', '', '科室领域排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('176', '172', '2', '0', '10000', 'admin', 'Department', 'toggle', '', '科室领域显示隐藏', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('177', '172', '2', '0', '10000', 'admin', 'Department', 'delete', '', '删除科室领域', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('178', '0', '0', '0', '0', 'admin', 'Gxzh', 'default', '', '共享智慧', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('179', '178', '1', '1', '0', 'admin', 'Gxzh', 'notice', '', '系统公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('180', '178', '1', '1', '0', 'admin', 'Gxzh', 'question', '', '咨询列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('181', '178', '1', '1', '0', 'admin', 'Gxzh', 'account', '', '账单管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('182', '178', '1', '1', '0', 'admin', 'Gxzh', 'withdraw', '', '提现管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('183', '6', '1', '0', '10000', 'admin', 'Config', 'distribution', '', '分销设置', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('184', '179', '1', '0', '10000', 'admin', 'Gxzh', 'notice_add', '', '添加公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('185', '179', '1', '0', '10000', 'admin', 'Gxzh', 'notice_edit', '', '编辑公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('186', '179', '2', '0', '10000', 'admin', 'Gxzh', 'notice_delete', '', '删除公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('187', '178', '1', '1', '0', 'admin', 'Gxzh', 'usercheck', '', '用户审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('188', '178', '1', '1', '0', 'admin', 'Gxzh', 'userlist', '', '用户列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('189', '178', '1', '1', '0', 'admin', 'Gxzh', 'relationship', '', '用户关系', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('190', '178', '1', '0', '10000', 'admin', 'Gxzh', 'recharge', '', '充值', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('191', '178', '1', '0', '0', 'admin', 'Gxzh', 'answer', '', '回答列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('192', '182', '1', '0', '0', 'admin', 'Gxzh', 'withdrawcheck', '', '提现审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('193', '178', '1', '1', '0', 'admin', 'Gxzh', 'guestbook', '', '用户留言', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('194', '178', '1', '0', '0', 'admin', 'Gxzh', 'userinfo', '', '用户信息', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('195', '178', '1', '1', '0', 'admin', 'Gxzh', 'refund', '', '退款管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('196', '195', '1', '0', '0', 'admin', 'Gxzh', 'refundcheck', '', '退款审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('197', '178', '1', '0', '10000', 'admin', 'Gxzh', 'push', '', '推送', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('198', '178', '2', '0', '10000', 'admin', 'Gxzh', 'export', '', '导出统计数据', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('199', '0', '0', '0', '0', 'admin', 'Content', 'default', '', '内容管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('200', '199', '1', '1', '0', 'admin', 'Content', 'hall', '', '礼堂管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('201', '0', '1', '0', '10000', 'admin', 'Content', 'notice', '', '--new--', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('202', '201', '1', '0', '10000', 'admin', 'Content', 'notice_add', '', '添加公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('203', '201', '1', '0', '10000', 'admin', 'Content', 'notice_edit', '', '编辑公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('204', '201', '2', '0', '10000', 'admin', 'Content', 'notice_delete', '', '删除公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('205', '199', '1', '0', '0', 'admin', 'Content', 'question', '', '咨询列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('206', '199', '1', '0', '0', 'admin', 'Content', 'answer', '', '回答列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('207', '199', '1', '0', '0', 'admin', 'Content', 'account', '', '账单管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('208', '199', '1', '0', '0', 'admin', 'Content', 'withdraw', '', '提现管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('209', '208', '1', '0', '0', 'admin', 'Content', 'withdrawcheck', '', '提现审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('210', '199', '1', '0', '0', 'admin', 'Content', 'refund', '', '退款管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('211', '210', '1', '0', '0', 'admin', 'Content', 'refundcheck', '', '退款审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('212', '199', '1', '0', '0', 'admin', 'Content', 'usercheck', '', '用户审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('213', '199', '1', '0', '0', 'admin', 'Content', 'userlist', '', '用户列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('214', '199', '1', '0', '10000', 'admin', 'Content', 'recharge', '', '充值', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('215', '199', '1', '0', '10000', 'admin', 'Content', 'push', '', '推送', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('216', '199', '1', '0', '0', 'admin', 'Content', 'relationship', '', '用户关系', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('217', '199', '1', '0', '0', 'admin', 'Content', 'guestbook', '', '用户留言', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('218', '199', '1', '0', '0', 'admin', 'Content', 'userinfo', '', '用户信息', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('219', '199', '2', '0', '10000', 'admin', 'Content', 'export', '', '导出统计数据', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('220', '200', '1', '0', '10000', 'admin', 'Content', 'hall_add', '', '添加公礼堂', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('221', '200', '1', '0', '10000', 'admin', 'Content', 'hall_edit', '', '编辑礼堂', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('222', '201', '2', '0', '10000', 'admin', 'Content', 'hall_delete', '', '删除公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('223', '199', '1', '1', '0', 'admin', 'Content', 'information', '', '资讯管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('224', '223', '1', '0', '10000', 'admin', 'Content', 'information_add', '', '添加资讯', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('225', '223', '1', '0', '10000', 'admin', 'Content', 'information_edit', '', '编辑资讯', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('226', '223', '2', '0', '10000', 'admin', 'Content', 'information_delete', '', '删除公告', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('239', '199', '1', '1', '0', 'admin', 'Content', 'camera', '', '随手拍管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('240', '239', '1', '0', '10000', 'admin', 'Content', 'camera_add', '', '添加随手拍', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('241', '239', '2', '0', '10000', 'admin', 'Content', 'camera_delete', '', '删除随手拍', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('242', '0', '0', '1', '0', 'admin', 'Article', 'default', '', '图文管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('243', '242', '1', '1', '0', 'admin', 'Article', 'hall', '', '礼堂管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('244', '243', '1', '0', '10000', 'admin', 'Article', 'hall_add', '', '添加公礼堂', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('245', '243', '1', '0', '10000', 'admin', 'Article', 'hall_edit', '', '编辑礼堂', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('246', '243', '2', '0', '10000', 'admin', 'Article', 'hall_delete', '', '删除礼堂', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('247', '242', '1', '1', '0', 'admin', 'Article', 'information', '', '资讯管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('248', '247', '1', '0', '10000', 'admin', 'Article', 'information_add', '', '添加资讯', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('249', '247', '1', '0', '10000', 'admin', 'Article', 'information_edit', '', '编辑资讯', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('250', '247', '2', '0', '10000', 'admin', 'Article', 'information_delete', '', '删除资讯', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('251', '242', '1', '1', '0', 'admin', 'Article', 'camera', '', '随手拍管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('252', '251', '1', '0', '10000', 'admin', 'Article', 'camera_add', '', '添加随手拍', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('253', '251', '2', '0', '10000', 'admin', 'Article', 'camera_delete', '', '删除随手拍', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('254', '242', '1', '1', '0', 'admin', 'Article', 'group', '', '机构团体管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('255', '254', '1', '0', '10000', 'admin', 'Article', 'group_add', '', '添加社会文化机构团体', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('256', '254', '1', '0', '10000', 'admin', 'Article', 'group_edit', '', '编辑社会文化机构团体', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('257', '254', '2', '0', '10000', 'admin', 'Article', 'group_delete', '', '删除社会文化机构团体', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('258', '242', '1', '1', '0', 'admin', 'Article', 'volunteer', '', '志愿者管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('259', '258', '1', '0', '10000', 'admin', 'Article', 'volunteer_add', '', '添加志愿者', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('260', '258', '1', '0', '10000', 'admin', 'Article', 'volunteer_edit', '', '编辑志愿者', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('261', '258', '2', '0', '10000', 'admin', 'Article', 'volunteer_delete', '', '删除机构团体', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('262', '0', '0', '1', '0', 'admin', 'Appointment', 'default', '', '预约管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('263', '262', '1', '1', '0', 'admin', 'Appointment', 'index', '', '预约列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('264', '0', '1', '0', '10000', 'admin', 'Appointment', 'appointment', '', '--new--', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('265', '264', '1', '0', '10000', 'admin', 'Appointment', 'appointment_verify', '', '预约审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('266', '264', '1', '0', '10000', 'admin', 'Appointment', 'appointment_add', '', '添加预约', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('267', '264', '1', '0', '10000', 'admin', 'Appointment', 'appointment_edit', '', '编辑预约', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('268', '264', '2', '0', '10000', 'admin', 'Appointment', 'appointment_delete', '', '删除预约', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('271', '0', '1', '0', '10000', 'admin', 'Appointment', 'setting', '', '--new--', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('273', '6', '1', '1', '10000', 'admin', 'Appointment', 'about', '', '关于云礼堂', '', '');

-- ----------------------------
-- Table structure for cmf_area
-- ----------------------------
DROP TABLE IF EXISTS `cmf_area`;
CREATE TABLE `cmf_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '区县编码',
  `area` varchar(40) NOT NULL COMMENT '区县名称',
  `city_code` char(6) NOT NULL COMMENT '所属城市编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='区县信息表';

-- ----------------------------
-- Records of cmf_area
-- ----------------------------
INSERT INTO `cmf_area` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `cmf_area` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `cmf_area` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `cmf_area` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `cmf_area` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `cmf_area` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `cmf_area` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `cmf_area` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `cmf_area` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `cmf_area` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `cmf_area` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `cmf_area` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `cmf_area` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `cmf_area` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `cmf_area` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `cmf_area` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `cmf_area` VALUES ('17', '110228', '密云县', '110100');
INSERT INTO `cmf_area` VALUES ('18', '110229', '延庆县', '110100');
INSERT INTO `cmf_area` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `cmf_area` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `cmf_area` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `cmf_area` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `cmf_area` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `cmf_area` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `cmf_area` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `cmf_area` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `cmf_area` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `cmf_area` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `cmf_area` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `cmf_area` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `cmf_area` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `cmf_area` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `cmf_area` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `cmf_area` VALUES ('34', '120221', '宁河县', '120100');
INSERT INTO `cmf_area` VALUES ('35', '120223', '静海县', '120100');
INSERT INTO `cmf_area` VALUES ('36', '120225', '蓟县', '120100');
INSERT INTO `cmf_area` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `cmf_area` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `cmf_area` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `cmf_area` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `cmf_area` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `cmf_area` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `cmf_area` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `cmf_area` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `cmf_area` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `cmf_area` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `cmf_area` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `cmf_area` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `cmf_area` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `cmf_area` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `cmf_area` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `cmf_area` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `cmf_area` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `cmf_area` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `cmf_area` VALUES ('55', '130133', '赵县', '130100');
INSERT INTO `cmf_area` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `cmf_area` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `cmf_area` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `cmf_area` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `cmf_area` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `cmf_area` VALUES ('61', '130201', '市辖区', '130200');
INSERT INTO `cmf_area` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `cmf_area` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `cmf_area` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `cmf_area` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `cmf_area` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `cmf_area` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `cmf_area` VALUES ('68', '130223', '滦县', '130200');
INSERT INTO `cmf_area` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `cmf_area` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `cmf_area` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `cmf_area` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `cmf_area` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `cmf_area` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `cmf_area` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `cmf_area` VALUES ('76', '130301', '市辖区', '130300');
INSERT INTO `cmf_area` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `cmf_area` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `cmf_area` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `cmf_area` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `cmf_area` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `cmf_area` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `cmf_area` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `cmf_area` VALUES ('84', '130401', '市辖区', '130400');
INSERT INTO `cmf_area` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `cmf_area` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `cmf_area` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `cmf_area` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `cmf_area` VALUES ('89', '130421', '邯郸县', '130400');
INSERT INTO `cmf_area` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `cmf_area` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `cmf_area` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `cmf_area` VALUES ('93', '130426', '涉县', '130400');
INSERT INTO `cmf_area` VALUES ('94', '130427', '磁县', '130400');
INSERT INTO `cmf_area` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `cmf_area` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `cmf_area` VALUES ('97', '130430', '邱县', '130400');
INSERT INTO `cmf_area` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `cmf_area` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `cmf_area` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `cmf_area` VALUES ('101', '130434', '魏县', '130400');
INSERT INTO `cmf_area` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `cmf_area` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `cmf_area` VALUES ('104', '130501', '市辖区', '130500');
INSERT INTO `cmf_area` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `cmf_area` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `cmf_area` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `cmf_area` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `cmf_area` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `cmf_area` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `cmf_area` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `cmf_area` VALUES ('112', '130526', '任县', '130500');
INSERT INTO `cmf_area` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `cmf_area` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `cmf_area` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `cmf_area` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `cmf_area` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `cmf_area` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `cmf_area` VALUES ('119', '130533', '威县', '130500');
INSERT INTO `cmf_area` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `cmf_area` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `cmf_area` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `cmf_area` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `cmf_area` VALUES ('124', '130601', '市辖区', '130600');
INSERT INTO `cmf_area` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `cmf_area` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `cmf_area` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `cmf_area` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `cmf_area` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `cmf_area` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `cmf_area` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `cmf_area` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `cmf_area` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `cmf_area` VALUES ('134', '130627', '唐县', '130600');
INSERT INTO `cmf_area` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `cmf_area` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `cmf_area` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `cmf_area` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `cmf_area` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `cmf_area` VALUES ('140', '130633', '易县', '130600');
INSERT INTO `cmf_area` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `cmf_area` VALUES ('142', '130635', '蠡县', '130600');
INSERT INTO `cmf_area` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `cmf_area` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `cmf_area` VALUES ('145', '130638', '雄县', '130600');
INSERT INTO `cmf_area` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `cmf_area` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `cmf_area` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `cmf_area` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `cmf_area` VALUES ('150', '130701', '市辖区', '130700');
INSERT INTO `cmf_area` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `cmf_area` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `cmf_area` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `cmf_area` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `cmf_area` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `cmf_area` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `cmf_area` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `cmf_area` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `cmf_area` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `cmf_area` VALUES ('160', '130726', '蔚县', '130700');
INSERT INTO `cmf_area` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `cmf_area` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `cmf_area` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `cmf_area` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `cmf_area` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `cmf_area` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `cmf_area` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `cmf_area` VALUES ('168', '130801', '市辖区', '130800');
INSERT INTO `cmf_area` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `cmf_area` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `cmf_area` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `cmf_area` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `cmf_area` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `cmf_area` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `cmf_area` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `cmf_area` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `cmf_area` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `cmf_area` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `cmf_area` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `cmf_area` VALUES ('180', '130901', '市辖区', '130900');
INSERT INTO `cmf_area` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `cmf_area` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `cmf_area` VALUES ('183', '130921', '沧县', '130900');
INSERT INTO `cmf_area` VALUES ('184', '130922', '青县', '130900');
INSERT INTO `cmf_area` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `cmf_area` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `cmf_area` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `cmf_area` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `cmf_area` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `cmf_area` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `cmf_area` VALUES ('191', '130929', '献县', '130900');
INSERT INTO `cmf_area` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `cmf_area` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `cmf_area` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `cmf_area` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `cmf_area` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `cmf_area` VALUES ('197', '131001', '市辖区', '131000');
INSERT INTO `cmf_area` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `cmf_area` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `cmf_area` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `cmf_area` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `cmf_area` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `cmf_area` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `cmf_area` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `cmf_area` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `cmf_area` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `cmf_area` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `cmf_area` VALUES ('208', '131101', '市辖区', '131100');
INSERT INTO `cmf_area` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `cmf_area` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `cmf_area` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `cmf_area` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `cmf_area` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `cmf_area` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `cmf_area` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `cmf_area` VALUES ('216', '131127', '景县', '131100');
INSERT INTO `cmf_area` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `cmf_area` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `cmf_area` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `cmf_area` VALUES ('220', '140101', '市辖区', '140100');
INSERT INTO `cmf_area` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `cmf_area` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `cmf_area` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `cmf_area` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `cmf_area` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `cmf_area` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `cmf_area` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `cmf_area` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `cmf_area` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `cmf_area` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `cmf_area` VALUES ('231', '140201', '市辖区', '140200');
INSERT INTO `cmf_area` VALUES ('232', '140202', '城区', '140200');
INSERT INTO `cmf_area` VALUES ('233', '140203', '矿区', '140200');
INSERT INTO `cmf_area` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `cmf_area` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `cmf_area` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `cmf_area` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `cmf_area` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `cmf_area` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `cmf_area` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `cmf_area` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `cmf_area` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `cmf_area` VALUES ('243', '140301', '市辖区', '140300');
INSERT INTO `cmf_area` VALUES ('244', '140302', '城区', '140300');
INSERT INTO `cmf_area` VALUES ('245', '140303', '矿区', '140300');
INSERT INTO `cmf_area` VALUES ('246', '140311', '郊区', '140300');
INSERT INTO `cmf_area` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `cmf_area` VALUES ('248', '140322', '盂县', '140300');
INSERT INTO `cmf_area` VALUES ('249', '140401', '市辖区', '140400');
INSERT INTO `cmf_area` VALUES ('250', '140402', '城区', '140400');
INSERT INTO `cmf_area` VALUES ('251', '140411', '郊区', '140400');
INSERT INTO `cmf_area` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `cmf_area` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `cmf_area` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `cmf_area` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `cmf_area` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `cmf_area` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `cmf_area` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `cmf_area` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `cmf_area` VALUES ('260', '140430', '沁县', '140400');
INSERT INTO `cmf_area` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `cmf_area` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `cmf_area` VALUES ('263', '140501', '市辖区', '140500');
INSERT INTO `cmf_area` VALUES ('264', '140502', '城区', '140500');
INSERT INTO `cmf_area` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `cmf_area` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `cmf_area` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `cmf_area` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `cmf_area` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `cmf_area` VALUES ('270', '140601', '市辖区', '140600');
INSERT INTO `cmf_area` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `cmf_area` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `cmf_area` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `cmf_area` VALUES ('274', '140622', '应县', '140600');
INSERT INTO `cmf_area` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `cmf_area` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `cmf_area` VALUES ('277', '140701', '市辖区', '140700');
INSERT INTO `cmf_area` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `cmf_area` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `cmf_area` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `cmf_area` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `cmf_area` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `cmf_area` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `cmf_area` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `cmf_area` VALUES ('285', '140727', '祁县', '140700');
INSERT INTO `cmf_area` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `cmf_area` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `cmf_area` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `cmf_area` VALUES ('289', '140801', '市辖区', '140800');
INSERT INTO `cmf_area` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `cmf_area` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `cmf_area` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `cmf_area` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `cmf_area` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `cmf_area` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `cmf_area` VALUES ('296', '140826', '绛县', '140800');
INSERT INTO `cmf_area` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `cmf_area` VALUES ('298', '140828', '夏县', '140800');
INSERT INTO `cmf_area` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `cmf_area` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `cmf_area` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `cmf_area` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `cmf_area` VALUES ('303', '140901', '市辖区', '140900');
INSERT INTO `cmf_area` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `cmf_area` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `cmf_area` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `cmf_area` VALUES ('307', '140923', '代县', '140900');
INSERT INTO `cmf_area` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `cmf_area` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `cmf_area` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `cmf_area` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `cmf_area` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `cmf_area` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `cmf_area` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `cmf_area` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `cmf_area` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `cmf_area` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `cmf_area` VALUES ('318', '141001', '市辖区', '141000');
INSERT INTO `cmf_area` VALUES ('319', '141002', '尧都区', '141000');
INSERT INTO `cmf_area` VALUES ('320', '141021', '曲沃县', '141000');
INSERT INTO `cmf_area` VALUES ('321', '141022', '翼城县', '141000');
INSERT INTO `cmf_area` VALUES ('322', '141023', '襄汾县', '141000');
INSERT INTO `cmf_area` VALUES ('323', '141024', '洪洞县', '141000');
INSERT INTO `cmf_area` VALUES ('324', '141025', '古县', '141000');
INSERT INTO `cmf_area` VALUES ('325', '141026', '安泽县', '141000');
INSERT INTO `cmf_area` VALUES ('326', '141027', '浮山县', '141000');
INSERT INTO `cmf_area` VALUES ('327', '141028', '吉县', '141000');
INSERT INTO `cmf_area` VALUES ('328', '141029', '乡宁县', '141000');
INSERT INTO `cmf_area` VALUES ('329', '141030', '大宁县', '141000');
INSERT INTO `cmf_area` VALUES ('330', '141031', '隰县', '141000');
INSERT INTO `cmf_area` VALUES ('331', '141032', '永和县', '141000');
INSERT INTO `cmf_area` VALUES ('332', '141033', '蒲县', '141000');
INSERT INTO `cmf_area` VALUES ('333', '141034', '汾西县', '141000');
INSERT INTO `cmf_area` VALUES ('334', '141081', '侯马市', '141000');
INSERT INTO `cmf_area` VALUES ('335', '141082', '霍州市', '141000');
INSERT INTO `cmf_area` VALUES ('336', '141101', '市辖区', '141100');
INSERT INTO `cmf_area` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `cmf_area` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `cmf_area` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `cmf_area` VALUES ('340', '141123', '兴县', '141100');
INSERT INTO `cmf_area` VALUES ('341', '141124', '临县', '141100');
INSERT INTO `cmf_area` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `cmf_area` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `cmf_area` VALUES ('344', '141127', '岚县', '141100');
INSERT INTO `cmf_area` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `cmf_area` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `cmf_area` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `cmf_area` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `cmf_area` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `cmf_area` VALUES ('350', '150101', '市辖区', '150100');
INSERT INTO `cmf_area` VALUES ('351', '150102', '新城区', '150100');
INSERT INTO `cmf_area` VALUES ('352', '150103', '回民区', '150100');
INSERT INTO `cmf_area` VALUES ('353', '150104', '玉泉区', '150100');
INSERT INTO `cmf_area` VALUES ('354', '150105', '赛罕区', '150100');
INSERT INTO `cmf_area` VALUES ('355', '150121', '土默特左旗', '150100');
INSERT INTO `cmf_area` VALUES ('356', '150122', '托克托县', '150100');
INSERT INTO `cmf_area` VALUES ('357', '150123', '和林格尔县', '150100');
INSERT INTO `cmf_area` VALUES ('358', '150124', '清水河县', '150100');
INSERT INTO `cmf_area` VALUES ('359', '150125', '武川县', '150100');
INSERT INTO `cmf_area` VALUES ('360', '150201', '市辖区', '150200');
INSERT INTO `cmf_area` VALUES ('361', '150202', '东河区', '150200');
INSERT INTO `cmf_area` VALUES ('362', '150203', '昆都仑区', '150200');
INSERT INTO `cmf_area` VALUES ('363', '150204', '青山区', '150200');
INSERT INTO `cmf_area` VALUES ('364', '150205', '石拐区', '150200');
INSERT INTO `cmf_area` VALUES ('365', '150206', '白云矿区', '150200');
INSERT INTO `cmf_area` VALUES ('366', '150207', '九原区', '150200');
INSERT INTO `cmf_area` VALUES ('367', '150221', '土默特右旗', '150200');
INSERT INTO `cmf_area` VALUES ('368', '150222', '固阳县', '150200');
INSERT INTO `cmf_area` VALUES ('369', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `cmf_area` VALUES ('370', '150301', '市辖区', '150300');
INSERT INTO `cmf_area` VALUES ('371', '150302', '海勃湾区', '150300');
INSERT INTO `cmf_area` VALUES ('372', '150303', '海南区', '150300');
INSERT INTO `cmf_area` VALUES ('373', '150304', '乌达区', '150300');
INSERT INTO `cmf_area` VALUES ('374', '150401', '市辖区', '150400');
INSERT INTO `cmf_area` VALUES ('375', '150402', '红山区', '150400');
INSERT INTO `cmf_area` VALUES ('376', '150403', '元宝山区', '150400');
INSERT INTO `cmf_area` VALUES ('377', '150404', '松山区', '150400');
INSERT INTO `cmf_area` VALUES ('378', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `cmf_area` VALUES ('379', '150422', '巴林左旗', '150400');
INSERT INTO `cmf_area` VALUES ('380', '150423', '巴林右旗', '150400');
INSERT INTO `cmf_area` VALUES ('381', '150424', '林西县', '150400');
INSERT INTO `cmf_area` VALUES ('382', '150425', '克什克腾旗', '150400');
INSERT INTO `cmf_area` VALUES ('383', '150426', '翁牛特旗', '150400');
INSERT INTO `cmf_area` VALUES ('384', '150428', '喀喇沁旗', '150400');
INSERT INTO `cmf_area` VALUES ('385', '150429', '宁城县', '150400');
INSERT INTO `cmf_area` VALUES ('386', '150430', '敖汉旗', '150400');
INSERT INTO `cmf_area` VALUES ('387', '150501', '市辖区', '150500');
INSERT INTO `cmf_area` VALUES ('388', '150502', '科尔沁区', '150500');
INSERT INTO `cmf_area` VALUES ('389', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `cmf_area` VALUES ('390', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `cmf_area` VALUES ('391', '150523', '开鲁县', '150500');
INSERT INTO `cmf_area` VALUES ('392', '150524', '库伦旗', '150500');
INSERT INTO `cmf_area` VALUES ('393', '150525', '奈曼旗', '150500');
INSERT INTO `cmf_area` VALUES ('394', '150526', '扎鲁特旗', '150500');
INSERT INTO `cmf_area` VALUES ('395', '150581', '霍林郭勒市', '150500');
INSERT INTO `cmf_area` VALUES ('396', '150602', '东胜区', '150600');
INSERT INTO `cmf_area` VALUES ('397', '150621', '达拉特旗', '150600');
INSERT INTO `cmf_area` VALUES ('398', '150622', '准格尔旗', '150600');
INSERT INTO `cmf_area` VALUES ('399', '150623', '鄂托克前旗', '150600');
INSERT INTO `cmf_area` VALUES ('400', '150624', '鄂托克旗', '150600');
INSERT INTO `cmf_area` VALUES ('401', '150625', '杭锦旗', '150600');
INSERT INTO `cmf_area` VALUES ('402', '150626', '乌审旗', '150600');
INSERT INTO `cmf_area` VALUES ('403', '150627', '伊金霍洛旗', '150600');
INSERT INTO `cmf_area` VALUES ('404', '150701', '市辖区', '150700');
INSERT INTO `cmf_area` VALUES ('405', '150702', '海拉尔区', '150700');
INSERT INTO `cmf_area` VALUES ('406', '150721', '阿荣旗', '150700');
INSERT INTO `cmf_area` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `cmf_area` VALUES ('408', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `cmf_area` VALUES ('409', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `cmf_area` VALUES ('410', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `cmf_area` VALUES ('411', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `cmf_area` VALUES ('412', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `cmf_area` VALUES ('413', '150781', '满洲里市', '150700');
INSERT INTO `cmf_area` VALUES ('414', '150782', '牙克石市', '150700');
INSERT INTO `cmf_area` VALUES ('415', '150783', '扎兰屯市', '150700');
INSERT INTO `cmf_area` VALUES ('416', '150784', '额尔古纳市', '150700');
INSERT INTO `cmf_area` VALUES ('417', '150785', '根河市', '150700');
INSERT INTO `cmf_area` VALUES ('418', '150801', '市辖区', '150800');
INSERT INTO `cmf_area` VALUES ('419', '150802', '临河区', '150800');
INSERT INTO `cmf_area` VALUES ('420', '150821', '五原县', '150800');
INSERT INTO `cmf_area` VALUES ('421', '150822', '磴口县', '150800');
INSERT INTO `cmf_area` VALUES ('422', '150823', '乌拉特前旗', '150800');
INSERT INTO `cmf_area` VALUES ('423', '150824', '乌拉特中旗', '150800');
INSERT INTO `cmf_area` VALUES ('424', '150825', '乌拉特后旗', '150800');
INSERT INTO `cmf_area` VALUES ('425', '150826', '杭锦后旗', '150800');
INSERT INTO `cmf_area` VALUES ('426', '150901', '市辖区', '150900');
INSERT INTO `cmf_area` VALUES ('427', '150902', '集宁区', '150900');
INSERT INTO `cmf_area` VALUES ('428', '150921', '卓资县', '150900');
INSERT INTO `cmf_area` VALUES ('429', '150922', '化德县', '150900');
INSERT INTO `cmf_area` VALUES ('430', '150923', '商都县', '150900');
INSERT INTO `cmf_area` VALUES ('431', '150924', '兴和县', '150900');
INSERT INTO `cmf_area` VALUES ('432', '150925', '凉城县', '150900');
INSERT INTO `cmf_area` VALUES ('433', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `cmf_area` VALUES ('434', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `cmf_area` VALUES ('435', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `cmf_area` VALUES ('436', '150929', '四子王旗', '150900');
INSERT INTO `cmf_area` VALUES ('437', '150981', '丰镇市', '150900');
INSERT INTO `cmf_area` VALUES ('438', '152201', '乌兰浩特市', '152200');
INSERT INTO `cmf_area` VALUES ('439', '152202', '阿尔山市', '152200');
INSERT INTO `cmf_area` VALUES ('440', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `cmf_area` VALUES ('441', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `cmf_area` VALUES ('442', '152223', '扎赉特旗', '152200');
INSERT INTO `cmf_area` VALUES ('443', '152224', '突泉县', '152200');
INSERT INTO `cmf_area` VALUES ('444', '152501', '二连浩特市', '152500');
INSERT INTO `cmf_area` VALUES ('445', '152502', '锡林浩特市', '152500');
INSERT INTO `cmf_area` VALUES ('446', '152522', '阿巴嘎旗', '152500');
INSERT INTO `cmf_area` VALUES ('447', '152523', '苏尼特左旗', '152500');
INSERT INTO `cmf_area` VALUES ('448', '152524', '苏尼特右旗', '152500');
INSERT INTO `cmf_area` VALUES ('449', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `cmf_area` VALUES ('450', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `cmf_area` VALUES ('451', '152527', '太仆寺旗', '152500');
INSERT INTO `cmf_area` VALUES ('452', '152528', '镶黄旗', '152500');
INSERT INTO `cmf_area` VALUES ('453', '152529', '正镶白旗', '152500');
INSERT INTO `cmf_area` VALUES ('454', '152530', '正蓝旗', '152500');
INSERT INTO `cmf_area` VALUES ('455', '152531', '多伦县', '152500');
INSERT INTO `cmf_area` VALUES ('456', '152921', '阿拉善左旗', '152900');
INSERT INTO `cmf_area` VALUES ('457', '152922', '阿拉善右旗', '152900');
INSERT INTO `cmf_area` VALUES ('458', '152923', '额济纳旗', '152900');
INSERT INTO `cmf_area` VALUES ('459', '210101', '市辖区', '210100');
INSERT INTO `cmf_area` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `cmf_area` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `cmf_area` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `cmf_area` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `cmf_area` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `cmf_area` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `cmf_area` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `cmf_area` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `cmf_area` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `cmf_area` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `cmf_area` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `cmf_area` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `cmf_area` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `cmf_area` VALUES ('473', '210201', '市辖区', '210200');
INSERT INTO `cmf_area` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `cmf_area` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `cmf_area` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `cmf_area` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `cmf_area` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `cmf_area` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `cmf_area` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `cmf_area` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `cmf_area` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `cmf_area` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `cmf_area` VALUES ('484', '210301', '市辖区', '210300');
INSERT INTO `cmf_area` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `cmf_area` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `cmf_area` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `cmf_area` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `cmf_area` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `cmf_area` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `cmf_area` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `cmf_area` VALUES ('492', '210401', '市辖区', '210400');
INSERT INTO `cmf_area` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `cmf_area` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `cmf_area` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `cmf_area` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `cmf_area` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `cmf_area` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `cmf_area` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `cmf_area` VALUES ('500', '210501', '市辖区', '210500');
INSERT INTO `cmf_area` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `cmf_area` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `cmf_area` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `cmf_area` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `cmf_area` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `cmf_area` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `cmf_area` VALUES ('507', '210601', '市辖区', '210600');
INSERT INTO `cmf_area` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `cmf_area` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `cmf_area` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `cmf_area` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `cmf_area` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `cmf_area` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `cmf_area` VALUES ('514', '210701', '市辖区', '210700');
INSERT INTO `cmf_area` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `cmf_area` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `cmf_area` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `cmf_area` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `cmf_area` VALUES ('519', '210727', '义县', '210700');
INSERT INTO `cmf_area` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `cmf_area` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `cmf_area` VALUES ('522', '210801', '市辖区', '210800');
INSERT INTO `cmf_area` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `cmf_area` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `cmf_area` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `cmf_area` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `cmf_area` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `cmf_area` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `cmf_area` VALUES ('529', '210901', '市辖区', '210900');
INSERT INTO `cmf_area` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `cmf_area` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `cmf_area` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `cmf_area` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `cmf_area` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `cmf_area` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `cmf_area` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `cmf_area` VALUES ('537', '211001', '市辖区', '211000');
INSERT INTO `cmf_area` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `cmf_area` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `cmf_area` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `cmf_area` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `cmf_area` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `cmf_area` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `cmf_area` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `cmf_area` VALUES ('545', '211101', '市辖区', '211100');
INSERT INTO `cmf_area` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `cmf_area` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `cmf_area` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `cmf_area` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `cmf_area` VALUES ('550', '211201', '市辖区', '211200');
INSERT INTO `cmf_area` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `cmf_area` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `cmf_area` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `cmf_area` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `cmf_area` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `cmf_area` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `cmf_area` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `cmf_area` VALUES ('558', '211301', '市辖区', '211300');
INSERT INTO `cmf_area` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `cmf_area` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `cmf_area` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `cmf_area` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `cmf_area` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `cmf_area` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `cmf_area` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `cmf_area` VALUES ('566', '211401', '市辖区', '211400');
INSERT INTO `cmf_area` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `cmf_area` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `cmf_area` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `cmf_area` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `cmf_area` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `cmf_area` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `cmf_area` VALUES ('573', '220101', '市辖区', '220100');
INSERT INTO `cmf_area` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `cmf_area` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `cmf_area` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `cmf_area` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `cmf_area` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `cmf_area` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `cmf_area` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `cmf_area` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `cmf_area` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `cmf_area` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `cmf_area` VALUES ('584', '220201', '市辖区', '220200');
INSERT INTO `cmf_area` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `cmf_area` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `cmf_area` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `cmf_area` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `cmf_area` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `cmf_area` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `cmf_area` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `cmf_area` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `cmf_area` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `cmf_area` VALUES ('594', '220301', '市辖区', '220300');
INSERT INTO `cmf_area` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `cmf_area` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `cmf_area` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `cmf_area` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `cmf_area` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `cmf_area` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `cmf_area` VALUES ('601', '220401', '市辖区', '220400');
INSERT INTO `cmf_area` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `cmf_area` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `cmf_area` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `cmf_area` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `cmf_area` VALUES ('606', '220501', '市辖区', '220500');
INSERT INTO `cmf_area` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `cmf_area` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `cmf_area` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `cmf_area` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `cmf_area` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `cmf_area` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `cmf_area` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `cmf_area` VALUES ('614', '220601', '市辖区', '220600');
INSERT INTO `cmf_area` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `cmf_area` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `cmf_area` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `cmf_area` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `cmf_area` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `cmf_area` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `cmf_area` VALUES ('621', '220701', '市辖区', '220700');
INSERT INTO `cmf_area` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `cmf_area` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `cmf_area` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `cmf_area` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `cmf_area` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `cmf_area` VALUES ('627', '220801', '市辖区', '220800');
INSERT INTO `cmf_area` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `cmf_area` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `cmf_area` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `cmf_area` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `cmf_area` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `cmf_area` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `cmf_area` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `cmf_area` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `cmf_area` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `cmf_area` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `cmf_area` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `cmf_area` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `cmf_area` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `cmf_area` VALUES ('641', '230101', '市辖区', '230100');
INSERT INTO `cmf_area` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `cmf_area` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `cmf_area` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `cmf_area` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `cmf_area` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `cmf_area` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `cmf_area` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `cmf_area` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `cmf_area` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `cmf_area` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `cmf_area` VALUES ('652', '230125', '宾县', '230100');
INSERT INTO `cmf_area` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `cmf_area` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `cmf_area` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `cmf_area` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `cmf_area` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `cmf_area` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `cmf_area` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `cmf_area` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `cmf_area` VALUES ('661', '230201', '市辖区', '230200');
INSERT INTO `cmf_area` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `cmf_area` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `cmf_area` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `cmf_area` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `cmf_area` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `cmf_area` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `cmf_area` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `cmf_area` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `cmf_area` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `cmf_area` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `cmf_area` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `cmf_area` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `cmf_area` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `cmf_area` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `cmf_area` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `cmf_area` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `cmf_area` VALUES ('678', '230301', '市辖区', '230300');
INSERT INTO `cmf_area` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `cmf_area` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `cmf_area` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `cmf_area` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `cmf_area` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `cmf_area` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `cmf_area` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `cmf_area` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `cmf_area` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `cmf_area` VALUES ('688', '230401', '市辖区', '230400');
INSERT INTO `cmf_area` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `cmf_area` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `cmf_area` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `cmf_area` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `cmf_area` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `cmf_area` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `cmf_area` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `cmf_area` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `cmf_area` VALUES ('697', '230501', '市辖区', '230500');
INSERT INTO `cmf_area` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `cmf_area` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `cmf_area` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `cmf_area` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `cmf_area` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `cmf_area` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `cmf_area` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `cmf_area` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `cmf_area` VALUES ('706', '230601', '市辖区', '230600');
INSERT INTO `cmf_area` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `cmf_area` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `cmf_area` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `cmf_area` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `cmf_area` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `cmf_area` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `cmf_area` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `cmf_area` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `cmf_area` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `cmf_area` VALUES ('716', '230701', '市辖区', '230700');
INSERT INTO `cmf_area` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `cmf_area` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `cmf_area` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `cmf_area` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `cmf_area` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `cmf_area` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `cmf_area` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `cmf_area` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `cmf_area` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `cmf_area` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `cmf_area` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `cmf_area` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `cmf_area` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `cmf_area` VALUES ('730', '230715', '红星区', '230700');
INSERT INTO `cmf_area` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `cmf_area` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `cmf_area` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `cmf_area` VALUES ('734', '230801', '市辖区', '230800');
INSERT INTO `cmf_area` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `cmf_area` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `cmf_area` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `cmf_area` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `cmf_area` VALUES ('739', '230811', '郊区', '230800');
INSERT INTO `cmf_area` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `cmf_area` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `cmf_area` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `cmf_area` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `cmf_area` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `cmf_area` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `cmf_area` VALUES ('746', '230901', '市辖区', '230900');
INSERT INTO `cmf_area` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `cmf_area` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `cmf_area` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `cmf_area` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `cmf_area` VALUES ('751', '231001', '市辖区', '231000');
INSERT INTO `cmf_area` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `cmf_area` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `cmf_area` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `cmf_area` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `cmf_area` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `cmf_area` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `cmf_area` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `cmf_area` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `cmf_area` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `cmf_area` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `cmf_area` VALUES ('762', '231101', '市辖区', '231100');
INSERT INTO `cmf_area` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `cmf_area` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `cmf_area` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `cmf_area` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `cmf_area` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `cmf_area` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `cmf_area` VALUES ('769', '231201', '市辖区', '231200');
INSERT INTO `cmf_area` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `cmf_area` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `cmf_area` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `cmf_area` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `cmf_area` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `cmf_area` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `cmf_area` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `cmf_area` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `cmf_area` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `cmf_area` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `cmf_area` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `cmf_area` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `cmf_area` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `cmf_area` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `cmf_area` VALUES ('784', '310103', '卢湾区', '310100');
INSERT INTO `cmf_area` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `cmf_area` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `cmf_area` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `cmf_area` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `cmf_area` VALUES ('789', '310108', '闸北区', '310100');
INSERT INTO `cmf_area` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `cmf_area` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `cmf_area` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `cmf_area` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `cmf_area` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `cmf_area` VALUES ('795', '310115', '浦东新区', '310100');
INSERT INTO `cmf_area` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `cmf_area` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `cmf_area` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `cmf_area` VALUES ('799', '310119', '南汇区', '310100');
INSERT INTO `cmf_area` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `cmf_area` VALUES ('801', '310230', '崇明县', '310100');
INSERT INTO `cmf_area` VALUES ('802', '320101', '市辖区', '320100');
INSERT INTO `cmf_area` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `cmf_area` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `cmf_area` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `cmf_area` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `cmf_area` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `cmf_area` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `cmf_area` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `cmf_area` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `cmf_area` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `cmf_area` VALUES ('812', '320115', '江宁区', '320100');
INSERT INTO `cmf_area` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `cmf_area` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `cmf_area` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `cmf_area` VALUES ('816', '320201', '市辖区', '320200');
INSERT INTO `cmf_area` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `cmf_area` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `cmf_area` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `cmf_area` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `cmf_area` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `cmf_area` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `cmf_area` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `cmf_area` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `cmf_area` VALUES ('825', '320301', '市辖区', '320300');
INSERT INTO `cmf_area` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `cmf_area` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `cmf_area` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `cmf_area` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `cmf_area` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `cmf_area` VALUES ('831', '320321', '丰县', '320300');
INSERT INTO `cmf_area` VALUES ('832', '320322', '沛县', '320300');
INSERT INTO `cmf_area` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `cmf_area` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `cmf_area` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `cmf_area` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `cmf_area` VALUES ('837', '320401', '市辖区', '320400');
INSERT INTO `cmf_area` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `cmf_area` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `cmf_area` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `cmf_area` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `cmf_area` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `cmf_area` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `cmf_area` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `cmf_area` VALUES ('845', '320501', '市辖区', '320500');
INSERT INTO `cmf_area` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `cmf_area` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `cmf_area` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `cmf_area` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `cmf_area` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `cmf_area` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `cmf_area` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `cmf_area` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `cmf_area` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `cmf_area` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `cmf_area` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `cmf_area` VALUES ('857', '320601', '市辖区', '320600');
INSERT INTO `cmf_area` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `cmf_area` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `cmf_area` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `cmf_area` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `cmf_area` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `cmf_area` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `cmf_area` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `cmf_area` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `cmf_area` VALUES ('866', '320701', '市辖区', '320700');
INSERT INTO `cmf_area` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `cmf_area` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `cmf_area` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `cmf_area` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `cmf_area` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `cmf_area` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `cmf_area` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `cmf_area` VALUES ('874', '320801', '市辖区', '320800');
INSERT INTO `cmf_area` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `cmf_area` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `cmf_area` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `cmf_area` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `cmf_area` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `cmf_area` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `cmf_area` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `cmf_area` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `cmf_area` VALUES ('883', '320901', '市辖区', '320900');
INSERT INTO `cmf_area` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `cmf_area` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `cmf_area` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `cmf_area` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `cmf_area` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `cmf_area` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `cmf_area` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `cmf_area` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `cmf_area` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `cmf_area` VALUES ('893', '321001', '市辖区', '321000');
INSERT INTO `cmf_area` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `cmf_area` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `cmf_area` VALUES ('896', '321011', '郊区', '321000');
INSERT INTO `cmf_area` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `cmf_area` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `cmf_area` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `cmf_area` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `cmf_area` VALUES ('901', '321101', '市辖区', '321100');
INSERT INTO `cmf_area` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `cmf_area` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `cmf_area` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `cmf_area` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `cmf_area` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `cmf_area` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `cmf_area` VALUES ('908', '321201', '市辖区', '321200');
INSERT INTO `cmf_area` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `cmf_area` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `cmf_area` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `cmf_area` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `cmf_area` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `cmf_area` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `cmf_area` VALUES ('915', '321301', '市辖区', '321300');
INSERT INTO `cmf_area` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `cmf_area` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `cmf_area` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `cmf_area` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `cmf_area` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `cmf_area` VALUES ('921', '330101', '市辖区', '330100');
INSERT INTO `cmf_area` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `cmf_area` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `cmf_area` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `cmf_area` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `cmf_area` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `cmf_area` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `cmf_area` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `cmf_area` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `cmf_area` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `cmf_area` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `cmf_area` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `cmf_area` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `cmf_area` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `cmf_area` VALUES ('935', '330201', '市辖区', '330200');
INSERT INTO `cmf_area` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `cmf_area` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `cmf_area` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `cmf_area` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `cmf_area` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `cmf_area` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `cmf_area` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `cmf_area` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `cmf_area` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `cmf_area` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `cmf_area` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `cmf_area` VALUES ('947', '330301', '市辖区', '330300');
INSERT INTO `cmf_area` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `cmf_area` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `cmf_area` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `cmf_area` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `cmf_area` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `cmf_area` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `cmf_area` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `cmf_area` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `cmf_area` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `cmf_area` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `cmf_area` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `cmf_area` VALUES ('959', '330401', '市辖区', '330400');
INSERT INTO `cmf_area` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `cmf_area` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `cmf_area` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `cmf_area` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `cmf_area` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `cmf_area` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `cmf_area` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `cmf_area` VALUES ('967', '330501', '市辖区', '330500');
INSERT INTO `cmf_area` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `cmf_area` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `cmf_area` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `cmf_area` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `cmf_area` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `cmf_area` VALUES ('973', '330601', '市辖区', '330600');
INSERT INTO `cmf_area` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `cmf_area` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `cmf_area` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `cmf_area` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `cmf_area` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `cmf_area` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `cmf_area` VALUES ('980', '330701', '市辖区', '330700');
INSERT INTO `cmf_area` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `cmf_area` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `cmf_area` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `cmf_area` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `cmf_area` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `cmf_area` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `cmf_area` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `cmf_area` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `cmf_area` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `cmf_area` VALUES ('990', '330801', '市辖区', '330800');
INSERT INTO `cmf_area` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `cmf_area` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `cmf_area` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `cmf_area` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `cmf_area` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `cmf_area` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `cmf_area` VALUES ('997', '330901', '市辖区', '330900');
INSERT INTO `cmf_area` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `cmf_area` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `cmf_area` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `cmf_area` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `cmf_area` VALUES ('1002', '331001', '市辖区', '331000');
INSERT INTO `cmf_area` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `cmf_area` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `cmf_area` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `cmf_area` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `cmf_area` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `cmf_area` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `cmf_area` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `cmf_area` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `cmf_area` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `cmf_area` VALUES ('1012', '331101', '市辖区', '331100');
INSERT INTO `cmf_area` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `cmf_area` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `cmf_area` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `cmf_area` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `cmf_area` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `cmf_area` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `cmf_area` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `cmf_area` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `cmf_area` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `cmf_area` VALUES ('1022', '340101', '市辖区', '340100');
INSERT INTO `cmf_area` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `cmf_area` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `cmf_area` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `cmf_area` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `cmf_area` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `cmf_area` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `cmf_area` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `cmf_area` VALUES ('1030', '340201', '市辖区', '340200');
INSERT INTO `cmf_area` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `cmf_area` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `cmf_area` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `cmf_area` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `cmf_area` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `cmf_area` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `cmf_area` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `cmf_area` VALUES ('1038', '340301', '市辖区', '340300');
INSERT INTO `cmf_area` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `cmf_area` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `cmf_area` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `cmf_area` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `cmf_area` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `cmf_area` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `cmf_area` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `cmf_area` VALUES ('1046', '340401', '市辖区', '340400');
INSERT INTO `cmf_area` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `cmf_area` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `cmf_area` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `cmf_area` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `cmf_area` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `cmf_area` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `cmf_area` VALUES ('1053', '340501', '市辖区', '340500');
INSERT INTO `cmf_area` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `cmf_area` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `cmf_area` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `cmf_area` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `cmf_area` VALUES ('1058', '340601', '市辖区', '340600');
INSERT INTO `cmf_area` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `cmf_area` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `cmf_area` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `cmf_area` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `cmf_area` VALUES ('1063', '340701', '市辖区', '340700');
INSERT INTO `cmf_area` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `cmf_area` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `cmf_area` VALUES ('1066', '340711', '郊区', '340700');
INSERT INTO `cmf_area` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `cmf_area` VALUES ('1068', '340801', '市辖区', '340800');
INSERT INTO `cmf_area` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `cmf_area` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `cmf_area` VALUES ('1071', '340811', '郊区', '340800');
INSERT INTO `cmf_area` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `cmf_area` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `cmf_area` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `cmf_area` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `cmf_area` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `cmf_area` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `cmf_area` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `cmf_area` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `cmf_area` VALUES ('1080', '341001', '市辖区', '341000');
INSERT INTO `cmf_area` VALUES ('1081', '341002', '屯溪区', '341000');
INSERT INTO `cmf_area` VALUES ('1082', '341003', '黄山区', '341000');
INSERT INTO `cmf_area` VALUES ('1083', '341004', '徽州区', '341000');
INSERT INTO `cmf_area` VALUES ('1084', '341021', '歙县', '341000');
INSERT INTO `cmf_area` VALUES ('1085', '341022', '休宁县', '341000');
INSERT INTO `cmf_area` VALUES ('1086', '341023', '黟县', '341000');
INSERT INTO `cmf_area` VALUES ('1087', '341024', '祁门县', '341000');
INSERT INTO `cmf_area` VALUES ('1088', '341101', '市辖区', '341100');
INSERT INTO `cmf_area` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `cmf_area` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `cmf_area` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `cmf_area` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `cmf_area` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `cmf_area` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `cmf_area` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `cmf_area` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `cmf_area` VALUES ('1097', '341201', '市辖区', '341200');
INSERT INTO `cmf_area` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `cmf_area` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `cmf_area` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `cmf_area` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `cmf_area` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `cmf_area` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `cmf_area` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `cmf_area` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `cmf_area` VALUES ('1106', '341301', '市辖区', '341300');
INSERT INTO `cmf_area` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `cmf_area` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `cmf_area` VALUES ('1109', '341322', '萧县', '341300');
INSERT INTO `cmf_area` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `cmf_area` VALUES ('1111', '341324', '泗县', '341300');
INSERT INTO `cmf_area` VALUES ('1112', '341401', '市辖区', '341400');
INSERT INTO `cmf_area` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `cmf_area` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `cmf_area` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `cmf_area` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `cmf_area` VALUES ('1117', '341424', '和县', '341400');
INSERT INTO `cmf_area` VALUES ('1118', '341501', '市辖区', '341500');
INSERT INTO `cmf_area` VALUES ('1119', '341502', '金安区', '341500');
INSERT INTO `cmf_area` VALUES ('1120', '341503', '裕安区', '341500');
INSERT INTO `cmf_area` VALUES ('1121', '341521', '寿县', '341500');
INSERT INTO `cmf_area` VALUES ('1122', '341522', '霍邱县', '341500');
INSERT INTO `cmf_area` VALUES ('1123', '341523', '舒城县', '341500');
INSERT INTO `cmf_area` VALUES ('1124', '341524', '金寨县', '341500');
INSERT INTO `cmf_area` VALUES ('1125', '341525', '霍山县', '341500');
INSERT INTO `cmf_area` VALUES ('1126', '341601', '市辖区', '341600');
INSERT INTO `cmf_area` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `cmf_area` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `cmf_area` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `cmf_area` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `cmf_area` VALUES ('1131', '341701', '市辖区', '341700');
INSERT INTO `cmf_area` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `cmf_area` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `cmf_area` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `cmf_area` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `cmf_area` VALUES ('1136', '341801', '市辖区', '341800');
INSERT INTO `cmf_area` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `cmf_area` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `cmf_area` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `cmf_area` VALUES ('1140', '341823', '泾县', '341800');
INSERT INTO `cmf_area` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `cmf_area` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `cmf_area` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `cmf_area` VALUES ('1144', '350101', '市辖区', '350100');
INSERT INTO `cmf_area` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `cmf_area` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `cmf_area` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `cmf_area` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `cmf_area` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `cmf_area` VALUES ('1150', '350121', '闽侯县', '350100');
INSERT INTO `cmf_area` VALUES ('1151', '350122', '连江县', '350100');
INSERT INTO `cmf_area` VALUES ('1152', '350123', '罗源县', '350100');
INSERT INTO `cmf_area` VALUES ('1153', '350124', '闽清县', '350100');
INSERT INTO `cmf_area` VALUES ('1154', '350125', '永泰县', '350100');
INSERT INTO `cmf_area` VALUES ('1155', '350128', '平潭县', '350100');
INSERT INTO `cmf_area` VALUES ('1156', '350181', '福清市', '350100');
INSERT INTO `cmf_area` VALUES ('1157', '350182', '长乐市', '350100');
INSERT INTO `cmf_area` VALUES ('1158', '350201', '市辖区', '350200');
INSERT INTO `cmf_area` VALUES ('1159', '350203', '思明区', '350200');
INSERT INTO `cmf_area` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `cmf_area` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `cmf_area` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `cmf_area` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `cmf_area` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `cmf_area` VALUES ('1165', '350301', '市辖区', '350300');
INSERT INTO `cmf_area` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `cmf_area` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `cmf_area` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `cmf_area` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `cmf_area` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `cmf_area` VALUES ('1171', '350401', '市辖区', '350400');
INSERT INTO `cmf_area` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `cmf_area` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `cmf_area` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `cmf_area` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `cmf_area` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `cmf_area` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `cmf_area` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `cmf_area` VALUES ('1179', '350427', '沙县', '350400');
INSERT INTO `cmf_area` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `cmf_area` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `cmf_area` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `cmf_area` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `cmf_area` VALUES ('1184', '350501', '市辖区', '350500');
INSERT INTO `cmf_area` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `cmf_area` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `cmf_area` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `cmf_area` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `cmf_area` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `cmf_area` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `cmf_area` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `cmf_area` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `cmf_area` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `cmf_area` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `cmf_area` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `cmf_area` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `cmf_area` VALUES ('1197', '350601', '市辖区', '350600');
INSERT INTO `cmf_area` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `cmf_area` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `cmf_area` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `cmf_area` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `cmf_area` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `cmf_area` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `cmf_area` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `cmf_area` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `cmf_area` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `cmf_area` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `cmf_area` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `cmf_area` VALUES ('1209', '350701', '市辖区', '350700');
INSERT INTO `cmf_area` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `cmf_area` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `cmf_area` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `cmf_area` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `cmf_area` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `cmf_area` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `cmf_area` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `cmf_area` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `cmf_area` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `cmf_area` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `cmf_area` VALUES ('1220', '350801', '市辖区', '350800');
INSERT INTO `cmf_area` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `cmf_area` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `cmf_area` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `cmf_area` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `cmf_area` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `cmf_area` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `cmf_area` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `cmf_area` VALUES ('1228', '350901', '市辖区', '350900');
INSERT INTO `cmf_area` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `cmf_area` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `cmf_area` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `cmf_area` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `cmf_area` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `cmf_area` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `cmf_area` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `cmf_area` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `cmf_area` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `cmf_area` VALUES ('1238', '360101', '市辖区', '360100');
INSERT INTO `cmf_area` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `cmf_area` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `cmf_area` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `cmf_area` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `cmf_area` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `cmf_area` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `cmf_area` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `cmf_area` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `cmf_area` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `cmf_area` VALUES ('1248', '360201', '市辖区', '360200');
INSERT INTO `cmf_area` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `cmf_area` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `cmf_area` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `cmf_area` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `cmf_area` VALUES ('1253', '360301', '市辖区', '360300');
INSERT INTO `cmf_area` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `cmf_area` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `cmf_area` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `cmf_area` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `cmf_area` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `cmf_area` VALUES ('1259', '360401', '市辖区', '360400');
INSERT INTO `cmf_area` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `cmf_area` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `cmf_area` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `cmf_area` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `cmf_area` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `cmf_area` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `cmf_area` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `cmf_area` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `cmf_area` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `cmf_area` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `cmf_area` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `cmf_area` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `cmf_area` VALUES ('1272', '360501', '市辖区', '360500');
INSERT INTO `cmf_area` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `cmf_area` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `cmf_area` VALUES ('1275', '360601', '市辖区', '360600');
INSERT INTO `cmf_area` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `cmf_area` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `cmf_area` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `cmf_area` VALUES ('1279', '360701', '市辖区', '360700');
INSERT INTO `cmf_area` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `cmf_area` VALUES ('1281', '360721', '赣县', '360700');
INSERT INTO `cmf_area` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `cmf_area` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `cmf_area` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `cmf_area` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `cmf_area` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `cmf_area` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `cmf_area` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `cmf_area` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `cmf_area` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `cmf_area` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `cmf_area` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `cmf_area` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `cmf_area` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `cmf_area` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `cmf_area` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `cmf_area` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `cmf_area` VALUES ('1298', '360801', '市辖区', '360800');
INSERT INTO `cmf_area` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `cmf_area` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `cmf_area` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `cmf_area` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `cmf_area` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `cmf_area` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `cmf_area` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `cmf_area` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `cmf_area` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `cmf_area` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `cmf_area` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `cmf_area` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `cmf_area` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `cmf_area` VALUES ('1312', '360901', '市辖区', '360900');
INSERT INTO `cmf_area` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `cmf_area` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `cmf_area` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `cmf_area` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `cmf_area` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `cmf_area` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `cmf_area` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `cmf_area` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `cmf_area` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `cmf_area` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `cmf_area` VALUES ('1323', '361001', '市辖区', '361000');
INSERT INTO `cmf_area` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `cmf_area` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `cmf_area` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `cmf_area` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `cmf_area` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `cmf_area` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `cmf_area` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `cmf_area` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `cmf_area` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `cmf_area` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `cmf_area` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `cmf_area` VALUES ('1335', '361101', '市辖区', '361100');
INSERT INTO `cmf_area` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `cmf_area` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `cmf_area` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `cmf_area` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `cmf_area` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `cmf_area` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `cmf_area` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `cmf_area` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `cmf_area` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `cmf_area` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `cmf_area` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `cmf_area` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `cmf_area` VALUES ('1348', '370101', '市辖区', '370100');
INSERT INTO `cmf_area` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `cmf_area` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `cmf_area` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `cmf_area` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `cmf_area` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `cmf_area` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `cmf_area` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `cmf_area` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `cmf_area` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `cmf_area` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `cmf_area` VALUES ('1359', '370201', '市辖区', '370200');
INSERT INTO `cmf_area` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `cmf_area` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `cmf_area` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `cmf_area` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `cmf_area` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `cmf_area` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `cmf_area` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `cmf_area` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `cmf_area` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `cmf_area` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `cmf_area` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `cmf_area` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `cmf_area` VALUES ('1372', '370301', '市辖区', '370300');
INSERT INTO `cmf_area` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `cmf_area` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `cmf_area` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `cmf_area` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `cmf_area` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `cmf_area` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `cmf_area` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `cmf_area` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `cmf_area` VALUES ('1381', '370401', '市辖区', '370400');
INSERT INTO `cmf_area` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `cmf_area` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `cmf_area` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `cmf_area` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `cmf_area` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `cmf_area` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `cmf_area` VALUES ('1388', '370501', '市辖区', '370500');
INSERT INTO `cmf_area` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `cmf_area` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `cmf_area` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `cmf_area` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `cmf_area` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `cmf_area` VALUES ('1394', '370601', '市辖区', '370600');
INSERT INTO `cmf_area` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `cmf_area` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `cmf_area` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `cmf_area` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `cmf_area` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `cmf_area` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `cmf_area` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `cmf_area` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `cmf_area` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `cmf_area` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `cmf_area` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `cmf_area` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `cmf_area` VALUES ('1407', '370701', '市辖区', '370700');
INSERT INTO `cmf_area` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `cmf_area` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `cmf_area` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `cmf_area` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `cmf_area` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `cmf_area` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `cmf_area` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `cmf_area` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `cmf_area` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `cmf_area` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `cmf_area` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `cmf_area` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `cmf_area` VALUES ('1420', '370801', '市辖区', '370800');
INSERT INTO `cmf_area` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `cmf_area` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `cmf_area` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `cmf_area` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `cmf_area` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `cmf_area` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `cmf_area` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `cmf_area` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `cmf_area` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `cmf_area` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `cmf_area` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `cmf_area` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `cmf_area` VALUES ('1433', '370901', '市辖区', '370900');
INSERT INTO `cmf_area` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `cmf_area` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `cmf_area` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `cmf_area` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `cmf_area` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `cmf_area` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `cmf_area` VALUES ('1440', '371001', '市辖区', '371000');
INSERT INTO `cmf_area` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `cmf_area` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `cmf_area` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `cmf_area` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `cmf_area` VALUES ('1445', '371101', '市辖区', '371100');
INSERT INTO `cmf_area` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `cmf_area` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `cmf_area` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `cmf_area` VALUES ('1449', '371122', '莒县', '371100');
INSERT INTO `cmf_area` VALUES ('1450', '371201', '市辖区', '371200');
INSERT INTO `cmf_area` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `cmf_area` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `cmf_area` VALUES ('1453', '371301', '市辖区', '371300');
INSERT INTO `cmf_area` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `cmf_area` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `cmf_area` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `cmf_area` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `cmf_area` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `cmf_area` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `cmf_area` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `cmf_area` VALUES ('1461', '371325', '费县', '371300');
INSERT INTO `cmf_area` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `cmf_area` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `cmf_area` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `cmf_area` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `cmf_area` VALUES ('1466', '371401', '市辖区', '371400');
INSERT INTO `cmf_area` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `cmf_area` VALUES ('1468', '371421', '陵县', '371400');
INSERT INTO `cmf_area` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `cmf_area` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `cmf_area` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `cmf_area` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `cmf_area` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `cmf_area` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `cmf_area` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `cmf_area` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `cmf_area` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `cmf_area` VALUES ('1478', '371501', '市辖区', '371500');
INSERT INTO `cmf_area` VALUES ('1479', '371502', '东昌府区', '371500');
INSERT INTO `cmf_area` VALUES ('1480', '371521', '阳谷县', '371500');
INSERT INTO `cmf_area` VALUES ('1481', '371522', '莘县', '371500');
INSERT INTO `cmf_area` VALUES ('1482', '371523', '茌平县', '371500');
INSERT INTO `cmf_area` VALUES ('1483', '371524', '东阿县', '371500');
INSERT INTO `cmf_area` VALUES ('1484', '371525', '冠县', '371500');
INSERT INTO `cmf_area` VALUES ('1485', '371526', '高唐县', '371500');
INSERT INTO `cmf_area` VALUES ('1486', '371581', '临清市', '371500');
INSERT INTO `cmf_area` VALUES ('1487', '371601', '市辖区', '371600');
INSERT INTO `cmf_area` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `cmf_area` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `cmf_area` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `cmf_area` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `cmf_area` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `cmf_area` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `cmf_area` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `cmf_area` VALUES ('1495', '371701', '市辖区', '371700');
INSERT INTO `cmf_area` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `cmf_area` VALUES ('1497', '371721', '曹县', '371700');
INSERT INTO `cmf_area` VALUES ('1498', '371722', '单县', '371700');
INSERT INTO `cmf_area` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `cmf_area` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `cmf_area` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `cmf_area` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `cmf_area` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `cmf_area` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `cmf_area` VALUES ('1505', '410101', '市辖区', '410100');
INSERT INTO `cmf_area` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `cmf_area` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `cmf_area` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `cmf_area` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `cmf_area` VALUES ('1510', '410106', '上街区', '410100');
INSERT INTO `cmf_area` VALUES ('1511', '410108', '邙山区', '410100');
INSERT INTO `cmf_area` VALUES ('1512', '410122', '中牟县', '410100');
INSERT INTO `cmf_area` VALUES ('1513', '410181', '巩义市', '410100');
INSERT INTO `cmf_area` VALUES ('1514', '410182', '荥阳市', '410100');
INSERT INTO `cmf_area` VALUES ('1515', '410183', '新密市', '410100');
INSERT INTO `cmf_area` VALUES ('1516', '410184', '新郑市', '410100');
INSERT INTO `cmf_area` VALUES ('1517', '410185', '登封市', '410100');
INSERT INTO `cmf_area` VALUES ('1518', '410201', '市辖区', '410200');
INSERT INTO `cmf_area` VALUES ('1519', '410202', '龙亭区', '410200');
INSERT INTO `cmf_area` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `cmf_area` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `cmf_area` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `cmf_area` VALUES ('1523', '410211', '郊区', '410200');
INSERT INTO `cmf_area` VALUES ('1524', '410221', '杞县', '410200');
INSERT INTO `cmf_area` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `cmf_area` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `cmf_area` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `cmf_area` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `cmf_area` VALUES ('1529', '410301', '市辖区', '410300');
INSERT INTO `cmf_area` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `cmf_area` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `cmf_area` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `cmf_area` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `cmf_area` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `cmf_area` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `cmf_area` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `cmf_area` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `cmf_area` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `cmf_area` VALUES ('1539', '410325', '嵩县', '410300');
INSERT INTO `cmf_area` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `cmf_area` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `cmf_area` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `cmf_area` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `cmf_area` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `cmf_area` VALUES ('1545', '410401', '市辖区', '410400');
INSERT INTO `cmf_area` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `cmf_area` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `cmf_area` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `cmf_area` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `cmf_area` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `cmf_area` VALUES ('1551', '410422', '叶县', '410400');
INSERT INTO `cmf_area` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `cmf_area` VALUES ('1553', '410425', '郏县', '410400');
INSERT INTO `cmf_area` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `cmf_area` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `cmf_area` VALUES ('1556', '410501', '市辖区', '410500');
INSERT INTO `cmf_area` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `cmf_area` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `cmf_area` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `cmf_area` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `cmf_area` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `cmf_area` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `cmf_area` VALUES ('1563', '410526', '滑县', '410500');
INSERT INTO `cmf_area` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `cmf_area` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `cmf_area` VALUES ('1566', '410601', '市辖区', '410600');
INSERT INTO `cmf_area` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `cmf_area` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `cmf_area` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `cmf_area` VALUES ('1570', '410621', '浚县', '410600');
INSERT INTO `cmf_area` VALUES ('1571', '410622', '淇县', '410600');
INSERT INTO `cmf_area` VALUES ('1572', '410701', '市辖区', '410700');
INSERT INTO `cmf_area` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `cmf_area` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `cmf_area` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `cmf_area` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `cmf_area` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `cmf_area` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `cmf_area` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `cmf_area` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `cmf_area` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `cmf_area` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `cmf_area` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `cmf_area` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `cmf_area` VALUES ('1585', '410801', '市辖区', '410800');
INSERT INTO `cmf_area` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `cmf_area` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `cmf_area` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `cmf_area` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `cmf_area` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `cmf_area` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `cmf_area` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `cmf_area` VALUES ('1593', '410825', '温县', '410800');
INSERT INTO `cmf_area` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `cmf_area` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `cmf_area` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `cmf_area` VALUES ('1597', '410901', '市辖区', '410900');
INSERT INTO `cmf_area` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `cmf_area` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `cmf_area` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `cmf_area` VALUES ('1601', '410926', '范县', '410900');
INSERT INTO `cmf_area` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `cmf_area` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `cmf_area` VALUES ('1604', '411001', '市辖区', '411000');
INSERT INTO `cmf_area` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `cmf_area` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `cmf_area` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `cmf_area` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `cmf_area` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `cmf_area` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `cmf_area` VALUES ('1611', '411101', '市辖区', '411100');
INSERT INTO `cmf_area` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `cmf_area` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `cmf_area` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `cmf_area` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `cmf_area` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `cmf_area` VALUES ('1617', '411201', '市辖区', '411200');
INSERT INTO `cmf_area` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `cmf_area` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `cmf_area` VALUES ('1620', '411222', '陕县', '411200');
INSERT INTO `cmf_area` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `cmf_area` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `cmf_area` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `cmf_area` VALUES ('1624', '411301', '市辖区', '411300');
INSERT INTO `cmf_area` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `cmf_area` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `cmf_area` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `cmf_area` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `cmf_area` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `cmf_area` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `cmf_area` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `cmf_area` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `cmf_area` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `cmf_area` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `cmf_area` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `cmf_area` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `cmf_area` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `cmf_area` VALUES ('1638', '411401', '市辖区', '411400');
INSERT INTO `cmf_area` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `cmf_area` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `cmf_area` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `cmf_area` VALUES ('1642', '411422', '睢县', '411400');
INSERT INTO `cmf_area` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `cmf_area` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `cmf_area` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `cmf_area` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `cmf_area` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `cmf_area` VALUES ('1648', '411501', '市辖区', '411500');
INSERT INTO `cmf_area` VALUES ('1649', '411502', '师河区', '411500');
INSERT INTO `cmf_area` VALUES ('1650', '411503', '平桥区', '411500');
INSERT INTO `cmf_area` VALUES ('1651', '411521', '罗山县', '411500');
INSERT INTO `cmf_area` VALUES ('1652', '411522', '光山县', '411500');
INSERT INTO `cmf_area` VALUES ('1653', '411523', '新县', '411500');
INSERT INTO `cmf_area` VALUES ('1654', '411524', '商城县', '411500');
INSERT INTO `cmf_area` VALUES ('1655', '411525', '固始县', '411500');
INSERT INTO `cmf_area` VALUES ('1656', '411526', '潢川县', '411500');
INSERT INTO `cmf_area` VALUES ('1657', '411527', '淮滨县', '411500');
INSERT INTO `cmf_area` VALUES ('1658', '411528', '息县', '411500');
INSERT INTO `cmf_area` VALUES ('1659', '411601', '市辖区', '411600');
INSERT INTO `cmf_area` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `cmf_area` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `cmf_area` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `cmf_area` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `cmf_area` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `cmf_area` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `cmf_area` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `cmf_area` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `cmf_area` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `cmf_area` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `cmf_area` VALUES ('1670', '411701', '市辖区', '411700');
INSERT INTO `cmf_area` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `cmf_area` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `cmf_area` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `cmf_area` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `cmf_area` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `cmf_area` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `cmf_area` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `cmf_area` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `cmf_area` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `cmf_area` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `cmf_area` VALUES ('1681', '420101', '市辖区', '420100');
INSERT INTO `cmf_area` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `cmf_area` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `cmf_area` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `cmf_area` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `cmf_area` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `cmf_area` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `cmf_area` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `cmf_area` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `cmf_area` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `cmf_area` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `cmf_area` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `cmf_area` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `cmf_area` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `cmf_area` VALUES ('1695', '420201', '市辖区', '420200');
INSERT INTO `cmf_area` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `cmf_area` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `cmf_area` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `cmf_area` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `cmf_area` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `cmf_area` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `cmf_area` VALUES ('1702', '420301', '市辖区', '420300');
INSERT INTO `cmf_area` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `cmf_area` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `cmf_area` VALUES ('1705', '420321', '郧县', '420300');
INSERT INTO `cmf_area` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `cmf_area` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `cmf_area` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `cmf_area` VALUES ('1709', '420325', '房县', '420300');
INSERT INTO `cmf_area` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `cmf_area` VALUES ('1711', '420501', '市辖区', '420500');
INSERT INTO `cmf_area` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `cmf_area` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `cmf_area` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `cmf_area` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `cmf_area` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `cmf_area` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `cmf_area` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `cmf_area` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `cmf_area` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `cmf_area` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `cmf_area` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `cmf_area` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `cmf_area` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `cmf_area` VALUES ('1725', '420601', '市辖区', '420600');
INSERT INTO `cmf_area` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `cmf_area` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `cmf_area` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `cmf_area` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `cmf_area` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `cmf_area` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `cmf_area` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `cmf_area` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `cmf_area` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `cmf_area` VALUES ('1735', '420701', '市辖区', '420700');
INSERT INTO `cmf_area` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `cmf_area` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `cmf_area` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `cmf_area` VALUES ('1739', '420801', '市辖区', '420800');
INSERT INTO `cmf_area` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `cmf_area` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `cmf_area` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `cmf_area` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `cmf_area` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `cmf_area` VALUES ('1745', '420901', '市辖区', '420900');
INSERT INTO `cmf_area` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `cmf_area` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `cmf_area` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `cmf_area` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `cmf_area` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `cmf_area` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `cmf_area` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `cmf_area` VALUES ('1753', '421001', '市辖区', '421000');
INSERT INTO `cmf_area` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `cmf_area` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `cmf_area` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `cmf_area` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `cmf_area` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `cmf_area` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `cmf_area` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `cmf_area` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `cmf_area` VALUES ('1762', '421101', '市辖区', '421100');
INSERT INTO `cmf_area` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `cmf_area` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `cmf_area` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `cmf_area` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `cmf_area` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `cmf_area` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `cmf_area` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `cmf_area` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `cmf_area` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `cmf_area` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `cmf_area` VALUES ('1773', '421201', '市辖区', '421200');
INSERT INTO `cmf_area` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `cmf_area` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `cmf_area` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `cmf_area` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `cmf_area` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `cmf_area` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `cmf_area` VALUES ('1780', '421301', '市辖区', '421300');
INSERT INTO `cmf_area` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `cmf_area` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `cmf_area` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `cmf_area` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `cmf_area` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `cmf_area` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `cmf_area` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `cmf_area` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `cmf_area` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `cmf_area` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `cmf_area` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `cmf_area` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `cmf_area` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `cmf_area` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `cmf_area` VALUES ('1795', '430101', '市辖区', '430100');
INSERT INTO `cmf_area` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `cmf_area` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `cmf_area` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `cmf_area` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `cmf_area` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `cmf_area` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `cmf_area` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `cmf_area` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `cmf_area` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `cmf_area` VALUES ('1805', '430201', '市辖区', '430200');
INSERT INTO `cmf_area` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `cmf_area` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `cmf_area` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `cmf_area` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `cmf_area` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `cmf_area` VALUES ('1811', '430223', '攸县', '430200');
INSERT INTO `cmf_area` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `cmf_area` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `cmf_area` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `cmf_area` VALUES ('1815', '430301', '市辖区', '430300');
INSERT INTO `cmf_area` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `cmf_area` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `cmf_area` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `cmf_area` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `cmf_area` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `cmf_area` VALUES ('1821', '430401', '市辖区', '430400');
INSERT INTO `cmf_area` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `cmf_area` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `cmf_area` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `cmf_area` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `cmf_area` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `cmf_area` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `cmf_area` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `cmf_area` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `cmf_area` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `cmf_area` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `cmf_area` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `cmf_area` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `cmf_area` VALUES ('1834', '430501', '市辖区', '430500');
INSERT INTO `cmf_area` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `cmf_area` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `cmf_area` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `cmf_area` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `cmf_area` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `cmf_area` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `cmf_area` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `cmf_area` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `cmf_area` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `cmf_area` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `cmf_area` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `cmf_area` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `cmf_area` VALUES ('1847', '430601', '市辖区', '430600');
INSERT INTO `cmf_area` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `cmf_area` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `cmf_area` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `cmf_area` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `cmf_area` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `cmf_area` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `cmf_area` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `cmf_area` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `cmf_area` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `cmf_area` VALUES ('1857', '430701', '市辖区', '430700');
INSERT INTO `cmf_area` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `cmf_area` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `cmf_area` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `cmf_area` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `cmf_area` VALUES ('1862', '430723', '澧县', '430700');
INSERT INTO `cmf_area` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `cmf_area` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `cmf_area` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `cmf_area` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `cmf_area` VALUES ('1867', '430801', '市辖区', '430800');
INSERT INTO `cmf_area` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `cmf_area` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `cmf_area` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `cmf_area` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `cmf_area` VALUES ('1872', '430901', '市辖区', '430900');
INSERT INTO `cmf_area` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `cmf_area` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `cmf_area` VALUES ('1875', '430921', '南县', '430900');
INSERT INTO `cmf_area` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `cmf_area` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `cmf_area` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `cmf_area` VALUES ('1879', '431001', '市辖区', '431000');
INSERT INTO `cmf_area` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `cmf_area` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `cmf_area` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `cmf_area` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `cmf_area` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `cmf_area` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `cmf_area` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `cmf_area` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `cmf_area` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `cmf_area` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `cmf_area` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `cmf_area` VALUES ('1891', '431101', '市辖区', '431100');
INSERT INTO `cmf_area` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `cmf_area` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `cmf_area` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `cmf_area` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `cmf_area` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `cmf_area` VALUES ('1897', '431124', '道县', '431100');
INSERT INTO `cmf_area` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `cmf_area` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `cmf_area` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `cmf_area` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `cmf_area` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `cmf_area` VALUES ('1903', '431201', '市辖区', '431200');
INSERT INTO `cmf_area` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `cmf_area` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `cmf_area` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `cmf_area` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `cmf_area` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `cmf_area` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `cmf_area` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `cmf_area` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `cmf_area` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `cmf_area` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `cmf_area` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `cmf_area` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `cmf_area` VALUES ('1916', '431301', '市辖区', '431300');
INSERT INTO `cmf_area` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `cmf_area` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `cmf_area` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `cmf_area` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `cmf_area` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `cmf_area` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `cmf_area` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `cmf_area` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `cmf_area` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `cmf_area` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `cmf_area` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `cmf_area` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `cmf_area` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `cmf_area` VALUES ('1930', '440101', '市辖区', '440100');
INSERT INTO `cmf_area` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `cmf_area` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `cmf_area` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `cmf_area` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `cmf_area` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `cmf_area` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `cmf_area` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `cmf_area` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `cmf_area` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `cmf_area` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `cmf_area` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `cmf_area` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `cmf_area` VALUES ('1943', '440201', '市辖区', '440200');
INSERT INTO `cmf_area` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `cmf_area` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `cmf_area` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `cmf_area` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `cmf_area` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `cmf_area` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `cmf_area` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `cmf_area` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `cmf_area` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `cmf_area` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `cmf_area` VALUES ('1954', '440301', '市辖区', '440300');
INSERT INTO `cmf_area` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `cmf_area` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `cmf_area` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `cmf_area` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `cmf_area` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `cmf_area` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `cmf_area` VALUES ('1961', '440401', '市辖区', '440400');
INSERT INTO `cmf_area` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `cmf_area` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `cmf_area` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `cmf_area` VALUES ('1965', '440501', '市辖区', '440500');
INSERT INTO `cmf_area` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `cmf_area` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `cmf_area` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `cmf_area` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `cmf_area` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `cmf_area` VALUES ('1971', '440515', '澄海区', '440500');
INSERT INTO `cmf_area` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `cmf_area` VALUES ('1973', '440601', '市辖区', '440600');
INSERT INTO `cmf_area` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `cmf_area` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `cmf_area` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `cmf_area` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `cmf_area` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `cmf_area` VALUES ('1979', '440701', '市辖区', '440700');
INSERT INTO `cmf_area` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `cmf_area` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `cmf_area` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `cmf_area` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `cmf_area` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `cmf_area` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `cmf_area` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `cmf_area` VALUES ('1987', '440801', '市辖区', '440800');
INSERT INTO `cmf_area` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `cmf_area` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `cmf_area` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `cmf_area` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `cmf_area` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `cmf_area` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `cmf_area` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `cmf_area` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `cmf_area` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `cmf_area` VALUES ('1997', '440901', '市辖区', '440900');
INSERT INTO `cmf_area` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `cmf_area` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `cmf_area` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `cmf_area` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `cmf_area` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `cmf_area` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `cmf_area` VALUES ('2004', '441201', '市辖区', '441200');
INSERT INTO `cmf_area` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `cmf_area` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `cmf_area` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `cmf_area` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `cmf_area` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `cmf_area` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `cmf_area` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `cmf_area` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `cmf_area` VALUES ('2013', '441301', '市辖区', '441300');
INSERT INTO `cmf_area` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `cmf_area` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `cmf_area` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `cmf_area` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `cmf_area` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `cmf_area` VALUES ('2019', '441401', '市辖区', '441400');
INSERT INTO `cmf_area` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `cmf_area` VALUES ('2021', '441421', '梅县', '441400');
INSERT INTO `cmf_area` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `cmf_area` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `cmf_area` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `cmf_area` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `cmf_area` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `cmf_area` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `cmf_area` VALUES ('2028', '441501', '市辖区', '441500');
INSERT INTO `cmf_area` VALUES ('2029', '441502', '城区', '441500');
INSERT INTO `cmf_area` VALUES ('2030', '441521', '海丰县', '441500');
INSERT INTO `cmf_area` VALUES ('2031', '441523', '陆河县', '441500');
INSERT INTO `cmf_area` VALUES ('2032', '441581', '陆丰市', '441500');
INSERT INTO `cmf_area` VALUES ('2033', '441601', '市辖区', '441600');
INSERT INTO `cmf_area` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `cmf_area` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `cmf_area` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `cmf_area` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `cmf_area` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `cmf_area` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `cmf_area` VALUES ('2040', '441701', '市辖区', '441700');
INSERT INTO `cmf_area` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `cmf_area` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `cmf_area` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `cmf_area` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `cmf_area` VALUES ('2045', '441801', '市辖区', '441800');
INSERT INTO `cmf_area` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `cmf_area` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `cmf_area` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `cmf_area` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `cmf_area` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `cmf_area` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `cmf_area` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `cmf_area` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `cmf_area` VALUES ('2054', '445101', '市辖区', '445100');
INSERT INTO `cmf_area` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `cmf_area` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `cmf_area` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `cmf_area` VALUES ('2058', '445201', '市辖区', '445200');
INSERT INTO `cmf_area` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `cmf_area` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `cmf_area` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `cmf_area` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `cmf_area` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `cmf_area` VALUES ('2064', '445301', '市辖区', '445300');
INSERT INTO `cmf_area` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `cmf_area` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `cmf_area` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `cmf_area` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `cmf_area` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `cmf_area` VALUES ('2070', '450101', '市辖区', '450100');
INSERT INTO `cmf_area` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `cmf_area` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `cmf_area` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `cmf_area` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `cmf_area` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `cmf_area` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `cmf_area` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `cmf_area` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `cmf_area` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `cmf_area` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `cmf_area` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `cmf_area` VALUES ('2082', '450127', '横县', '450100');
INSERT INTO `cmf_area` VALUES ('2083', '450201', '市辖区', '450200');
INSERT INTO `cmf_area` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `cmf_area` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `cmf_area` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `cmf_area` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `cmf_area` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `cmf_area` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `cmf_area` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `cmf_area` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `cmf_area` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `cmf_area` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `cmf_area` VALUES ('2094', '450301', '市辖区', '450300');
INSERT INTO `cmf_area` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `cmf_area` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `cmf_area` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `cmf_area` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `cmf_area` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `cmf_area` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `cmf_area` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `cmf_area` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `cmf_area` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `cmf_area` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `cmf_area` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `cmf_area` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `cmf_area` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `cmf_area` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `cmf_area` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `cmf_area` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `cmf_area` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `cmf_area` VALUES ('2112', '450401', '市辖区', '450400');
INSERT INTO `cmf_area` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `cmf_area` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `cmf_area` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `cmf_area` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `cmf_area` VALUES ('2117', '450422', '藤县', '450400');
INSERT INTO `cmf_area` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `cmf_area` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `cmf_area` VALUES ('2120', '450501', '市辖区', '450500');
INSERT INTO `cmf_area` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `cmf_area` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `cmf_area` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `cmf_area` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `cmf_area` VALUES ('2125', '450601', '市辖区', '450600');
INSERT INTO `cmf_area` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `cmf_area` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `cmf_area` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `cmf_area` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `cmf_area` VALUES ('2130', '450701', '市辖区', '450700');
INSERT INTO `cmf_area` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `cmf_area` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `cmf_area` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `cmf_area` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `cmf_area` VALUES ('2135', '450801', '市辖区', '450800');
INSERT INTO `cmf_area` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `cmf_area` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `cmf_area` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `cmf_area` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `cmf_area` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `cmf_area` VALUES ('2141', '450901', '市辖区', '450900');
INSERT INTO `cmf_area` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `cmf_area` VALUES ('2143', '450921', '容县', '450900');
INSERT INTO `cmf_area` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `cmf_area` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `cmf_area` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `cmf_area` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `cmf_area` VALUES ('2148', '451001', '市辖区', '451000');
INSERT INTO `cmf_area` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `cmf_area` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `cmf_area` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `cmf_area` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `cmf_area` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `cmf_area` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `cmf_area` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `cmf_area` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `cmf_area` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `cmf_area` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `cmf_area` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `cmf_area` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `cmf_area` VALUES ('2161', '451101', '市辖区', '451100');
INSERT INTO `cmf_area` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `cmf_area` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `cmf_area` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `cmf_area` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `cmf_area` VALUES ('2166', '451201', '市辖区', '451200');
INSERT INTO `cmf_area` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `cmf_area` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `cmf_area` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `cmf_area` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `cmf_area` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `cmf_area` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `cmf_area` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `cmf_area` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `cmf_area` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `cmf_area` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `cmf_area` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `cmf_area` VALUES ('2178', '451301', '市辖区', '451300');
INSERT INTO `cmf_area` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `cmf_area` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `cmf_area` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `cmf_area` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `cmf_area` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `cmf_area` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `cmf_area` VALUES ('2185', '451401', '市辖区', '451400');
INSERT INTO `cmf_area` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `cmf_area` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `cmf_area` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `cmf_area` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `cmf_area` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `cmf_area` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `cmf_area` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `cmf_area` VALUES ('2193', '460101', '市辖区', '460100');
INSERT INTO `cmf_area` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `cmf_area` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `cmf_area` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `cmf_area` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `cmf_area` VALUES ('2198', '460201', '市辖区', '460200');
INSERT INTO `cmf_area` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `cmf_area` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `cmf_area` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `cmf_area` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `cmf_area` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `cmf_area` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `cmf_area` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `cmf_area` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `cmf_area` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `cmf_area` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `cmf_area` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `cmf_area` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `cmf_area` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `cmf_area` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `cmf_area` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `cmf_area` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `cmf_area` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `cmf_area` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `cmf_area` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `cmf_area` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `cmf_area` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `cmf_area` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `cmf_area` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `cmf_area` VALUES ('2227', '500110', '万盛区', '500100');
INSERT INTO `cmf_area` VALUES ('2228', '500111', '双桥区', '500100');
INSERT INTO `cmf_area` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `cmf_area` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `cmf_area` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `cmf_area` VALUES ('2232', '500115', '长寿区', '500100');
INSERT INTO `cmf_area` VALUES ('2233', '500222', '綦江县', '500100');
INSERT INTO `cmf_area` VALUES ('2234', '500223', '潼南县', '500100');
INSERT INTO `cmf_area` VALUES ('2235', '500224', '铜梁县', '500100');
INSERT INTO `cmf_area` VALUES ('2236', '500225', '大足县', '500100');
INSERT INTO `cmf_area` VALUES ('2237', '500226', '荣昌县', '500100');
INSERT INTO `cmf_area` VALUES ('2238', '500227', '璧山县', '500100');
INSERT INTO `cmf_area` VALUES ('2239', '500228', '梁平县', '500100');
INSERT INTO `cmf_area` VALUES ('2240', '500229', '城口县', '500100');
INSERT INTO `cmf_area` VALUES ('2241', '500230', '丰都县', '500100');
INSERT INTO `cmf_area` VALUES ('2242', '500231', '垫江县', '500100');
INSERT INTO `cmf_area` VALUES ('2243', '500232', '武隆县', '500100');
INSERT INTO `cmf_area` VALUES ('2244', '500233', '忠县', '500100');
INSERT INTO `cmf_area` VALUES ('2245', '500234', '开县', '500100');
INSERT INTO `cmf_area` VALUES ('2246', '500235', '云阳县', '500100');
INSERT INTO `cmf_area` VALUES ('2247', '500236', '奉节县', '500100');
INSERT INTO `cmf_area` VALUES ('2248', '500237', '巫山县', '500100');
INSERT INTO `cmf_area` VALUES ('2249', '500238', '巫溪县', '500100');
INSERT INTO `cmf_area` VALUES ('2250', '500240', '石柱土家族自治县', '500100');
INSERT INTO `cmf_area` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500100');
INSERT INTO `cmf_area` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500100');
INSERT INTO `cmf_area` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500100');
INSERT INTO `cmf_area` VALUES ('2254', '500381', '江津市', '500100');
INSERT INTO `cmf_area` VALUES ('2255', '500382', '合川市', '500100');
INSERT INTO `cmf_area` VALUES ('2256', '500383', '永川市', '500100');
INSERT INTO `cmf_area` VALUES ('2257', '500384', '南川市', '500100');
INSERT INTO `cmf_area` VALUES ('2258', '510101', '市辖区', '510100');
INSERT INTO `cmf_area` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `cmf_area` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `cmf_area` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `cmf_area` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `cmf_area` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `cmf_area` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `cmf_area` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `cmf_area` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `cmf_area` VALUES ('2267', '510115', '温江区', '510100');
INSERT INTO `cmf_area` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `cmf_area` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `cmf_area` VALUES ('2270', '510124', '郫县', '510100');
INSERT INTO `cmf_area` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `cmf_area` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `cmf_area` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `cmf_area` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `cmf_area` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `cmf_area` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `cmf_area` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `cmf_area` VALUES ('2278', '510301', '市辖区', '510300');
INSERT INTO `cmf_area` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `cmf_area` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `cmf_area` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `cmf_area` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `cmf_area` VALUES ('2283', '510321', '荣县', '510300');
INSERT INTO `cmf_area` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `cmf_area` VALUES ('2285', '510401', '市辖区', '510400');
INSERT INTO `cmf_area` VALUES ('2286', '510402', '东区', '510400');
INSERT INTO `cmf_area` VALUES ('2287', '510403', '西区', '510400');
INSERT INTO `cmf_area` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `cmf_area` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `cmf_area` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `cmf_area` VALUES ('2291', '510501', '市辖区', '510500');
INSERT INTO `cmf_area` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `cmf_area` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `cmf_area` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `cmf_area` VALUES ('2295', '510521', '泸县', '510500');
INSERT INTO `cmf_area` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `cmf_area` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `cmf_area` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `cmf_area` VALUES ('2299', '510601', '市辖区', '510600');
INSERT INTO `cmf_area` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `cmf_area` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `cmf_area` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `cmf_area` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `cmf_area` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `cmf_area` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `cmf_area` VALUES ('2306', '510701', '市辖区', '510700');
INSERT INTO `cmf_area` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `cmf_area` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `cmf_area` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `cmf_area` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `cmf_area` VALUES ('2311', '510724', '安县', '510700');
INSERT INTO `cmf_area` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `cmf_area` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `cmf_area` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `cmf_area` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `cmf_area` VALUES ('2316', '510801', '市辖区', '510800');
INSERT INTO `cmf_area` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `cmf_area` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `cmf_area` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `cmf_area` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `cmf_area` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `cmf_area` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `cmf_area` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `cmf_area` VALUES ('2324', '510901', '市辖区', '510900');
INSERT INTO `cmf_area` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `cmf_area` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `cmf_area` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `cmf_area` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `cmf_area` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `cmf_area` VALUES ('2330', '511001', '市辖区', '511000');
INSERT INTO `cmf_area` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `cmf_area` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `cmf_area` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `cmf_area` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `cmf_area` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `cmf_area` VALUES ('2336', '511101', '市辖区', '511100');
INSERT INTO `cmf_area` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `cmf_area` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `cmf_area` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `cmf_area` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `cmf_area` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `cmf_area` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `cmf_area` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `cmf_area` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `cmf_area` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `cmf_area` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `cmf_area` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `cmf_area` VALUES ('2348', '511301', '市辖区', '511300');
INSERT INTO `cmf_area` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `cmf_area` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `cmf_area` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `cmf_area` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `cmf_area` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `cmf_area` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `cmf_area` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `cmf_area` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `cmf_area` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `cmf_area` VALUES ('2358', '511401', '市辖区', '511400');
INSERT INTO `cmf_area` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `cmf_area` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `cmf_area` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `cmf_area` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `cmf_area` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `cmf_area` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `cmf_area` VALUES ('2365', '511501', '市辖区', '511500');
INSERT INTO `cmf_area` VALUES ('2366', '511502', '翠屏区', '511500');
INSERT INTO `cmf_area` VALUES ('2367', '511521', '宜宾县', '511500');
INSERT INTO `cmf_area` VALUES ('2368', '511522', '南溪县', '511500');
INSERT INTO `cmf_area` VALUES ('2369', '511523', '江安县', '511500');
INSERT INTO `cmf_area` VALUES ('2370', '511524', '长宁县', '511500');
INSERT INTO `cmf_area` VALUES ('2371', '511525', '高县', '511500');
INSERT INTO `cmf_area` VALUES ('2372', '511526', '珙县', '511500');
INSERT INTO `cmf_area` VALUES ('2373', '511527', '筠连县', '511500');
INSERT INTO `cmf_area` VALUES ('2374', '511528', '兴文县', '511500');
INSERT INTO `cmf_area` VALUES ('2375', '511529', '屏山县', '511500');
INSERT INTO `cmf_area` VALUES ('2376', '511601', '市辖区', '511600');
INSERT INTO `cmf_area` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `cmf_area` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `cmf_area` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `cmf_area` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `cmf_area` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `cmf_area` VALUES ('2382', '511701', '市辖区', '511700');
INSERT INTO `cmf_area` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `cmf_area` VALUES ('2384', '511721', '达县', '511700');
INSERT INTO `cmf_area` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `cmf_area` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `cmf_area` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `cmf_area` VALUES ('2388', '511725', '渠县', '511700');
INSERT INTO `cmf_area` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `cmf_area` VALUES ('2390', '511801', '市辖区', '511800');
INSERT INTO `cmf_area` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `cmf_area` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `cmf_area` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `cmf_area` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `cmf_area` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `cmf_area` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `cmf_area` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `cmf_area` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `cmf_area` VALUES ('2399', '511901', '市辖区', '511900');
INSERT INTO `cmf_area` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `cmf_area` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `cmf_area` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `cmf_area` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `cmf_area` VALUES ('2404', '512001', '市辖区', '512000');
INSERT INTO `cmf_area` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `cmf_area` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `cmf_area` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `cmf_area` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `cmf_area` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `cmf_area` VALUES ('2410', '513222', '理县', '513200');
INSERT INTO `cmf_area` VALUES ('2411', '513223', '茂县', '513200');
INSERT INTO `cmf_area` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `cmf_area` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `cmf_area` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `cmf_area` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `cmf_area` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `cmf_area` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `cmf_area` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `cmf_area` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `cmf_area` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `cmf_area` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `cmf_area` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `cmf_area` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `cmf_area` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `cmf_area` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `cmf_area` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `cmf_area` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `cmf_area` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `cmf_area` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `cmf_area` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `cmf_area` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `cmf_area` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `cmf_area` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `cmf_area` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `cmf_area` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `cmf_area` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `cmf_area` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `cmf_area` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `cmf_area` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `cmf_area` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `cmf_area` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `cmf_area` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `cmf_area` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `cmf_area` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `cmf_area` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `cmf_area` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `cmf_area` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `cmf_area` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `cmf_area` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `cmf_area` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `cmf_area` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `cmf_area` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `cmf_area` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `cmf_area` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `cmf_area` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `cmf_area` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `cmf_area` VALUES ('2457', '520101', '市辖区', '520100');
INSERT INTO `cmf_area` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `cmf_area` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `cmf_area` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `cmf_area` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `cmf_area` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `cmf_area` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `cmf_area` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `cmf_area` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `cmf_area` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `cmf_area` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `cmf_area` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `cmf_area` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `cmf_area` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `cmf_area` VALUES ('2471', '520222', '盘县', '520200');
INSERT INTO `cmf_area` VALUES ('2472', '520301', '市辖区', '520300');
INSERT INTO `cmf_area` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `cmf_area` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `cmf_area` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `cmf_area` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `cmf_area` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `cmf_area` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `cmf_area` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `cmf_area` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `cmf_area` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `cmf_area` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `cmf_area` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `cmf_area` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `cmf_area` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `cmf_area` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `cmf_area` VALUES ('2487', '520401', '市辖区', '520400');
INSERT INTO `cmf_area` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `cmf_area` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `cmf_area` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `cmf_area` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `cmf_area` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `cmf_area` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `cmf_area` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `cmf_area` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `cmf_area` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `cmf_area` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `cmf_area` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `cmf_area` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `cmf_area` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `cmf_area` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `cmf_area` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `cmf_area` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `cmf_area` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `cmf_area` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `cmf_area` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `cmf_area` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `cmf_area` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `cmf_area` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `cmf_area` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `cmf_area` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `cmf_area` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `cmf_area` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `cmf_area` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `cmf_area` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `cmf_area` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `cmf_area` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `cmf_area` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `cmf_area` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `cmf_area` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `cmf_area` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `cmf_area` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `cmf_area` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `cmf_area` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `cmf_area` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `cmf_area` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `cmf_area` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `cmf_area` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `cmf_area` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `cmf_area` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `cmf_area` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `cmf_area` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `cmf_area` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `cmf_area` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `cmf_area` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `cmf_area` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `cmf_area` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `cmf_area` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `cmf_area` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `cmf_area` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `cmf_area` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `cmf_area` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `cmf_area` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `cmf_area` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `cmf_area` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `cmf_area` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `cmf_area` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `cmf_area` VALUES ('2548', '530101', '市辖区', '530100');
INSERT INTO `cmf_area` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `cmf_area` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `cmf_area` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `cmf_area` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `cmf_area` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `cmf_area` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `cmf_area` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `cmf_area` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `cmf_area` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `cmf_area` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `cmf_area` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `cmf_area` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `cmf_area` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `cmf_area` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `cmf_area` VALUES ('2563', '530301', '市辖区', '530300');
INSERT INTO `cmf_area` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `cmf_area` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `cmf_area` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `cmf_area` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `cmf_area` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `cmf_area` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `cmf_area` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `cmf_area` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `cmf_area` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `cmf_area` VALUES ('2573', '530401', '市辖区', '530400');
INSERT INTO `cmf_area` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `cmf_area` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `cmf_area` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `cmf_area` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `cmf_area` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `cmf_area` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `cmf_area` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `cmf_area` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `cmf_area` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `cmf_area` VALUES ('2583', '530501', '市辖区', '530500');
INSERT INTO `cmf_area` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `cmf_area` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `cmf_area` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `cmf_area` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `cmf_area` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `cmf_area` VALUES ('2589', '530601', '市辖区', '530600');
INSERT INTO `cmf_area` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `cmf_area` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `cmf_area` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `cmf_area` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `cmf_area` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `cmf_area` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `cmf_area` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `cmf_area` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `cmf_area` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `cmf_area` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `cmf_area` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `cmf_area` VALUES ('2601', '530701', '市辖区', '530700');
INSERT INTO `cmf_area` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `cmf_area` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `cmf_area` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `cmf_area` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `cmf_area` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `cmf_area` VALUES ('2607', '530801', '市辖区', '530800');
INSERT INTO `cmf_area` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `cmf_area` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `cmf_area` VALUES ('2618', '530901', '市辖区', '530900');
INSERT INTO `cmf_area` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `cmf_area` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `cmf_area` VALUES ('2621', '530922', '云县', '530900');
INSERT INTO `cmf_area` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `cmf_area` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `cmf_area` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `cmf_area` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `cmf_area` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `cmf_area` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `cmf_area` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `cmf_area` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `cmf_area` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `cmf_area` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `cmf_area` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `cmf_area` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `cmf_area` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `cmf_area` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `cmf_area` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `cmf_area` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `cmf_area` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `cmf_area` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `cmf_area` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `cmf_area` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `cmf_area` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `cmf_area` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `cmf_area` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `cmf_area` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `cmf_area` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `cmf_area` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `cmf_area` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `cmf_area` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `cmf_area` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `cmf_area` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `cmf_area` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `cmf_area` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `cmf_area` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `cmf_area` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `cmf_area` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `cmf_area` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `cmf_area` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `cmf_area` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `cmf_area` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `cmf_area` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `cmf_area` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `cmf_area` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `cmf_area` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `cmf_area` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `cmf_area` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `cmf_area` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `cmf_area` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `cmf_area` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `cmf_area` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `cmf_area` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `cmf_area` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `cmf_area` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `cmf_area` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `cmf_area` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `cmf_area` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `cmf_area` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `cmf_area` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `cmf_area` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `cmf_area` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `cmf_area` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `cmf_area` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `cmf_area` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `cmf_area` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `cmf_area` VALUES ('2685', '540101', '市辖区', '540100');
INSERT INTO `cmf_area` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `cmf_area` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `cmf_area` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `cmf_area` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `cmf_area` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `cmf_area` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `cmf_area` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `cmf_area` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `cmf_area` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `cmf_area` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `cmf_area` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `cmf_area` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `cmf_area` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `cmf_area` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `cmf_area` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `cmf_area` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `cmf_area` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `cmf_area` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `cmf_area` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `cmf_area` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `cmf_area` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `cmf_area` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `cmf_area` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `cmf_area` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `cmf_area` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `cmf_area` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `cmf_area` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `cmf_area` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `cmf_area` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `cmf_area` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `cmf_area` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `cmf_area` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `cmf_area` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `cmf_area` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `cmf_area` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `cmf_area` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `cmf_area` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `cmf_area` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `cmf_area` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `cmf_area` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `cmf_area` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `cmf_area` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `cmf_area` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `cmf_area` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `cmf_area` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `cmf_area` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `cmf_area` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `cmf_area` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `cmf_area` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `cmf_area` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `cmf_area` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `cmf_area` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `cmf_area` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `cmf_area` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `cmf_area` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `cmf_area` VALUES ('2741', '542427', '索县', '542400');
INSERT INTO `cmf_area` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `cmf_area` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `cmf_area` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `cmf_area` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `cmf_area` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `cmf_area` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `cmf_area` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `cmf_area` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `cmf_area` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `cmf_area` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `cmf_area` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `cmf_area` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `cmf_area` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `cmf_area` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `cmf_area` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `cmf_area` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `cmf_area` VALUES ('2758', '542627', '朗县', '542600');
INSERT INTO `cmf_area` VALUES ('2759', '610101', '市辖区', '610100');
INSERT INTO `cmf_area` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `cmf_area` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `cmf_area` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `cmf_area` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `cmf_area` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `cmf_area` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `cmf_area` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `cmf_area` VALUES ('2767', '610115', '临潼区', '610100');
INSERT INTO `cmf_area` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `cmf_area` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `cmf_area` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `cmf_area` VALUES ('2771', '610125', '户县', '610100');
INSERT INTO `cmf_area` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `cmf_area` VALUES ('2773', '610201', '市辖区', '610200');
INSERT INTO `cmf_area` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `cmf_area` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `cmf_area` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `cmf_area` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `cmf_area` VALUES ('2778', '610301', '市辖区', '610300');
INSERT INTO `cmf_area` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `cmf_area` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `cmf_area` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `cmf_area` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `cmf_area` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `cmf_area` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `cmf_area` VALUES ('2785', '610326', '眉县', '610300');
INSERT INTO `cmf_area` VALUES ('2786', '610327', '陇县', '610300');
INSERT INTO `cmf_area` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `cmf_area` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `cmf_area` VALUES ('2789', '610330', '凤县', '610300');
INSERT INTO `cmf_area` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `cmf_area` VALUES ('2791', '610401', '市辖区', '610400');
INSERT INTO `cmf_area` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `cmf_area` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `cmf_area` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `cmf_area` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `cmf_area` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `cmf_area` VALUES ('2797', '610424', '乾县', '610400');
INSERT INTO `cmf_area` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `cmf_area` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `cmf_area` VALUES ('2800', '610427', '彬县', '610400');
INSERT INTO `cmf_area` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `cmf_area` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `cmf_area` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `cmf_area` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `cmf_area` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `cmf_area` VALUES ('2806', '610501', '市辖区', '610500');
INSERT INTO `cmf_area` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `cmf_area` VALUES ('2808', '610521', '华县', '610500');
INSERT INTO `cmf_area` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `cmf_area` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `cmf_area` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `cmf_area` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `cmf_area` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `cmf_area` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `cmf_area` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `cmf_area` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `cmf_area` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `cmf_area` VALUES ('2818', '610601', '市辖区', '610600');
INSERT INTO `cmf_area` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `cmf_area` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `cmf_area` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `cmf_area` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `cmf_area` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `cmf_area` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `cmf_area` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `cmf_area` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `cmf_area` VALUES ('2827', '610628', '富县', '610600');
INSERT INTO `cmf_area` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `cmf_area` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `cmf_area` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `cmf_area` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `cmf_area` VALUES ('2832', '610701', '市辖区', '610700');
INSERT INTO `cmf_area` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `cmf_area` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `cmf_area` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `cmf_area` VALUES ('2836', '610723', '洋县', '610700');
INSERT INTO `cmf_area` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `cmf_area` VALUES ('2838', '610725', '勉县', '610700');
INSERT INTO `cmf_area` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `cmf_area` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `cmf_area` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `cmf_area` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `cmf_area` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `cmf_area` VALUES ('2844', '610801', '市辖区', '610800');
INSERT INTO `cmf_area` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `cmf_area` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `cmf_area` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `cmf_area` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `cmf_area` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `cmf_area` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `cmf_area` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `cmf_area` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `cmf_area` VALUES ('2853', '610828', '佳县', '610800');
INSERT INTO `cmf_area` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `cmf_area` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `cmf_area` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `cmf_area` VALUES ('2857', '610901', '市辖区', '610900');
INSERT INTO `cmf_area` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `cmf_area` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `cmf_area` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `cmf_area` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `cmf_area` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `cmf_area` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `cmf_area` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `cmf_area` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `cmf_area` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `cmf_area` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `cmf_area` VALUES ('2868', '611001', '市辖区', '611000');
INSERT INTO `cmf_area` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `cmf_area` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `cmf_area` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `cmf_area` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `cmf_area` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `cmf_area` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `cmf_area` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `cmf_area` VALUES ('2876', '620101', '市辖区', '620100');
INSERT INTO `cmf_area` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `cmf_area` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `cmf_area` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `cmf_area` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `cmf_area` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `cmf_area` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `cmf_area` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `cmf_area` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `cmf_area` VALUES ('2885', '620201', '市辖区', '620200');
INSERT INTO `cmf_area` VALUES ('2886', '620301', '市辖区', '620300');
INSERT INTO `cmf_area` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `cmf_area` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `cmf_area` VALUES ('2889', '620401', '市辖区', '620400');
INSERT INTO `cmf_area` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `cmf_area` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `cmf_area` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `cmf_area` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `cmf_area` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `cmf_area` VALUES ('2895', '620501', '市辖区', '620500');
INSERT INTO `cmf_area` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `cmf_area` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `cmf_area` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `cmf_area` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `cmf_area` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `cmf_area` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `cmf_area` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `cmf_area` VALUES ('2903', '620601', '市辖区', '620600');
INSERT INTO `cmf_area` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `cmf_area` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `cmf_area` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `cmf_area` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `cmf_area` VALUES ('2908', '620701', '市辖区', '620700');
INSERT INTO `cmf_area` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `cmf_area` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `cmf_area` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `cmf_area` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `cmf_area` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `cmf_area` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `cmf_area` VALUES ('2915', '620801', '市辖区', '620800');
INSERT INTO `cmf_area` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `cmf_area` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `cmf_area` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `cmf_area` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `cmf_area` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `cmf_area` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `cmf_area` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `cmf_area` VALUES ('2923', '620901', '市辖区', '620900');
INSERT INTO `cmf_area` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `cmf_area` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `cmf_area` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `cmf_area` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `cmf_area` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `cmf_area` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `cmf_area` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `cmf_area` VALUES ('2931', '621001', '市辖区', '621000');
INSERT INTO `cmf_area` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `cmf_area` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `cmf_area` VALUES ('2934', '621022', '环县', '621000');
INSERT INTO `cmf_area` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `cmf_area` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `cmf_area` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `cmf_area` VALUES ('2938', '621026', '宁县', '621000');
INSERT INTO `cmf_area` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `cmf_area` VALUES ('2940', '621101', '市辖区', '621100');
INSERT INTO `cmf_area` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `cmf_area` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `cmf_area` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `cmf_area` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `cmf_area` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `cmf_area` VALUES ('2946', '621125', '漳县', '621100');
INSERT INTO `cmf_area` VALUES ('2947', '621126', '岷县', '621100');
INSERT INTO `cmf_area` VALUES ('2948', '621201', '市辖区', '621200');
INSERT INTO `cmf_area` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `cmf_area` VALUES ('2950', '621221', '成县', '621200');
INSERT INTO `cmf_area` VALUES ('2951', '621222', '文县', '621200');
INSERT INTO `cmf_area` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `cmf_area` VALUES ('2953', '621224', '康县', '621200');
INSERT INTO `cmf_area` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `cmf_area` VALUES ('2955', '621226', '礼县', '621200');
INSERT INTO `cmf_area` VALUES ('2956', '621227', '徽县', '621200');
INSERT INTO `cmf_area` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `cmf_area` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `cmf_area` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `cmf_area` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `cmf_area` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `cmf_area` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `cmf_area` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `cmf_area` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `cmf_area` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `cmf_area` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `cmf_area` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `cmf_area` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `cmf_area` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `cmf_area` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `cmf_area` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `cmf_area` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `cmf_area` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `cmf_area` VALUES ('2974', '630101', '市辖区', '630100');
INSERT INTO `cmf_area` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `cmf_area` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `cmf_area` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `cmf_area` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `cmf_area` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `cmf_area` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `cmf_area` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `cmf_area` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `cmf_area` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `cmf_area` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `cmf_area` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `cmf_area` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `cmf_area` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `cmf_area` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `cmf_area` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `cmf_area` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `cmf_area` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `cmf_area` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `cmf_area` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `cmf_area` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `cmf_area` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `cmf_area` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `cmf_area` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `cmf_area` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `cmf_area` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `cmf_area` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `cmf_area` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `cmf_area` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `cmf_area` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `cmf_area` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `cmf_area` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `cmf_area` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `cmf_area` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `cmf_area` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `cmf_area` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `cmf_area` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `cmf_area` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `cmf_area` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `cmf_area` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `cmf_area` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `cmf_area` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `cmf_area` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `cmf_area` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `cmf_area` VALUES ('3018', '640101', '市辖区', '640100');
INSERT INTO `cmf_area` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `cmf_area` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `cmf_area` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `cmf_area` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `cmf_area` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `cmf_area` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `cmf_area` VALUES ('3025', '640201', '市辖区', '640200');
INSERT INTO `cmf_area` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `cmf_area` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `cmf_area` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `cmf_area` VALUES ('3029', '640301', '市辖区', '640300');
INSERT INTO `cmf_area` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `cmf_area` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `cmf_area` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `cmf_area` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `cmf_area` VALUES ('3034', '640401', '市辖区', '640400');
INSERT INTO `cmf_area` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `cmf_area` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `cmf_area` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `cmf_area` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `cmf_area` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `cmf_area` VALUES ('3040', '640501', '市辖区', '640500');
INSERT INTO `cmf_area` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `cmf_area` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `cmf_area` VALUES ('3043', '640522', '海原县', '640500');
INSERT INTO `cmf_area` VALUES ('3044', '650101', '市辖区', '650100');
INSERT INTO `cmf_area` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `cmf_area` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `cmf_area` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `cmf_area` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `cmf_area` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `cmf_area` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `cmf_area` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `cmf_area` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `cmf_area` VALUES ('3053', '650201', '市辖区', '650200');
INSERT INTO `cmf_area` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `cmf_area` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `cmf_area` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `cmf_area` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `cmf_area` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `cmf_area` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `cmf_area` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `cmf_area` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `cmf_area` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `cmf_area` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `cmf_area` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `cmf_area` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `cmf_area` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `cmf_area` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `cmf_area` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `cmf_area` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `cmf_area` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `cmf_area` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `cmf_area` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `cmf_area` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `cmf_area` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `cmf_area` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `cmf_area` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `cmf_area` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `cmf_area` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `cmf_area` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `cmf_area` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `cmf_area` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `cmf_area` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `cmf_area` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `cmf_area` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `cmf_area` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `cmf_area` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `cmf_area` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `cmf_area` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `cmf_area` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `cmf_area` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `cmf_area` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `cmf_area` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `cmf_area` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `cmf_area` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `cmf_area` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `cmf_area` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `cmf_area` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `cmf_area` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `cmf_area` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `cmf_area` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `cmf_area` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `cmf_area` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `cmf_area` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `cmf_area` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `cmf_area` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `cmf_area` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `cmf_area` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `cmf_area` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `cmf_area` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `cmf_area` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `cmf_area` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `cmf_area` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `cmf_area` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `cmf_area` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `cmf_area` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `cmf_area` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `cmf_area` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `cmf_area` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `cmf_area` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `cmf_area` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `cmf_area` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `cmf_area` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `cmf_area` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `cmf_area` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `cmf_area` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `cmf_area` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `cmf_area` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `cmf_area` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `cmf_area` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `cmf_area` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `cmf_area` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `cmf_area` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `cmf_area` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `cmf_area` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `cmf_area` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `cmf_area` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `cmf_area` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `cmf_area` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `cmf_area` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `cmf_area` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `cmf_area` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `cmf_area` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `cmf_area` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `cmf_area` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------
INSERT INTO `cmf_asset` VALUES ('1', '1', '7035', '1549767286', '1', '0', 'b04d07bedb15807bc0e1e5ed7d193a022af76b6abb31a50d8ff2803c1782f2a7', '108.png', 'portal/20190210/24f7894ce16fb39d5f4174dfb144ab28.png', 'b04d07bedb15807bc0e1e5ed7d193a02', '5231c76251f55892fc1c0c03802ba288bc367274', 'png', null);
INSERT INTO `cmf_asset` VALUES ('2', '1', '44828', '1549845985', '1', '0', '5c600443babc6ce13deace4ba1ff3c8084a936cf58ec24401fe2cc16acbf8c4c', 'gh_165cf6e3ff8e_258.jpg', 'admin/20190211/90c5deb707e6135d5415229efe2f7586.jpg', '5c600443babc6ce13deace4ba1ff3c80', 'd9d2df4b932a4443305f62635c03ed3045f2c408', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('3', '3', '15163', '1550031167', '1', '0', '0ca78375dda1f0877ae643363b3610533567386ca281ae09633f78635ea00bff', '微信截图_20180724085903.png', 'admin/20190213/a0c51a0109c2b936687c8d91410de9c5.png', '0ca78375dda1f0877ae643363b361053', 'c72d69b9a55a3e287af7f9a25a57e68a3124c2b6', 'png', null);
INSERT INTO `cmf_asset` VALUES ('4', '3', '85591', '1550031193', '1', '0', '7d06ee723e0cda1d55f90f5ba841c1c88b9b1ed3591e3b5eff09d530771ed63d', '750_245.png', 'admin/20190213/b157f1b9081948169fe41f1d09a5286f.png', '7d06ee723e0cda1d55f90f5ba841c1c8', '2f87072c3c61a72b83c7729963bedd19501b8bff', 'png', null);
INSERT INTO `cmf_asset` VALUES ('5', '3', '45474', '1550031244', '1', '0', 'efaf5f398e0e75c513c9ca7d49588bbd7075e307a726eea7e02557b4d2656a97', 'timg.jpg', 'admin/20190213/065ca8021588aaaa60e7b52ae7fa41c0.jpg', 'efaf5f398e0e75c513c9ca7d49588bbd', '9087e2c70a73403bf7eec0a57848b8f7ccee55db', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('6', '3', '59117', '1550031326', '1', '0', 'd382f803a5facdddbfe5c51d046b18530ca676765cfb3af3cb6ca3fdda821d3a', 'timg (2).jpg', 'admin/20190213/b9dbc5a10a53377a1ed83342c3a1831b.jpg', 'd382f803a5facdddbfe5c51d046b1853', '3aefd54d82a9bcd0eae694673bc54cb4c3a03109', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('7', '3', '4111', '1550038188', '1', '0', 'e2cf78b9c74f2d82053afd2b842ad7a71057ecc388da0e61ad31137fdec70f2c', 'headicon.png', 'admin/20190213/25bf54658598a9960cbdb9686c3db70a.png', 'e2cf78b9c74f2d82053afd2b842ad7a7', '2cb944149ce01aed05428b1860c0d420f3951764', 'png', null);
INSERT INTO `cmf_asset` VALUES ('8', '3', '19036', '1550556981', '1', '0', '91c9a62c9915c648dfe95abd533f28a71760bb9abbc38a9b61d5deb2a8117c71', '门槛.PNG', 'admin/20190219/c04ab426c5bef1690ce507136a074c5e.png', '91c9a62c9915c648dfe95abd533f28a7', '04185af39efa9219c1ab2d2547fee98817b4bb8a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('9', '3', '29434', '1550557371', '1', '0', '79d7bae60cfef5e380dc213a2efb76b59cd37b276e0f676eb49f0b8a18f02ae3', '解决问题钥匙.PNG', 'admin/20190219/8d56c3aa72b0658e6023f6236818bb3b.png', '79d7bae60cfef5e380dc213a2efb76b5', 'a4f5b400f4ee4a1944c0ada1d3545a0a31ed986d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('10', '3', '114816', '1550581642', '1', '0', '6654154b7235f4f371eea7ac8c3fd2ce4cc23eda7913e6a9ea12c25a2e07ad08', '图标.png', 'admin/20190219/1e2c0b784b2673031e6d80a3eb251ac4.png', '6654154b7235f4f371eea7ac8c3fd2ce', '3a0becc08baf6134a7c5d0faaa0c334a60c9193c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('11', '3', '2812679', '1550614865', '1', '0', 'bf5b60dcd03b06b606fbfe6df61dae6934ae807140e9671f817cd6c256aa3f86', '1550614739115.mp4', 'default/20190220/e0b67894402874c03091da956f79d079.mp4', 'bf5b60dcd03b06b606fbfe6df61dae69', '396b7d90d92cc390974c72a726fb87c53e7ece80', 'mp4', null);
INSERT INTO `cmf_asset` VALUES ('12', '3', '499153', '1550663412', '1', '0', '956820e00c31fb8319b08adb3bbf96668c7c8a9e1bdf5bc7e6122f87fe48c9a8', '111[20-24-45].JPG', 'default/20190220/d076e7753a1dee26bb8be3a3b5182490.jpg', '956820e00c31fb8319b08adb3bbf9666', 'f1b3c464d0ca2f210e158a19e30abf9c06425c32', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('13', '3', '258776', '1550668825', '1', '0', 'c853902bda33d34531ab547540e59de11ec740d6099923c8ba21bcdf1cdb211d', '软文用图片.jpg', 'default/20190220/68760cebfb18d23a3e0c7811c139f6e1.jpg', 'c853902bda33d34531ab547540e59de1', '15ddd5d3ad06b5b90aa9a6109a7051439748c2e9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('14', '3', '765410', '1550754083', '1', '0', '46b5faddf75104352fd3cfd1e55c02c7f495bf6d58439b0744169303a6ea5270', '透视互联.png', 'default/20190221/bd505d1231cf188bc8c7e0539f9cf1b1.png', '46b5faddf75104352fd3cfd1e55c02c7', '31a16554005c67bef3f7b7f0e535b5207c7219af', 'png', null);
INSERT INTO `cmf_asset` VALUES ('15', '3', '185927', '1550837297', '1', '0', 'f5b45918862ca33ac7208dc096cc452f6e94e2ce1426de4fdf6922ad397b25d9', '博士.png', 'admin/20190222/11a00afbc421dc67913b62337095c0ac.png', 'f5b45918862ca33ac7208dc096cc452f', '2942d47e1112374e301747e3789052e186d1b957', 'png', null);
INSERT INTO `cmf_asset` VALUES ('16', '3', '1277503', '1550837441', '1', '0', '268fa2cdbefa39e08ed61725cb2460d6fd8854c0bf6999cd323991b68bd2ad96', 'logo.jpg', 'admin/20190222/4d934d27ba3c8b2b5e5ef78b6f294c0c.jpg', '268fa2cdbefa39e08ed61725cb2460d6', 'db669c4ea1cbe7f6c115c0b5c38dd1b8a5311fcb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('17', '3', '166019', '1550837455', '1', '0', 'e0e151bb50bd7e3afe648041362cc4b6e0ec9b7629e860deaf8db683c7cfc63e', 'logo1.png', 'admin/20190222/ea3a97d35be0e03a615017fad5ec1ce2.png', 'e0e151bb50bd7e3afe648041362cc4b6', '06be9fad12d6131d05ff5633b0be5873a6c9a376', 'png', null);
INSERT INTO `cmf_asset` VALUES ('18', '3', '123324', '1550901215', '1', '0', '333be6c7580c0da29bf61f81828a52fd6988b17c74c3e61c33c0fde76b8bb6dc', '22.PNG', 'admin/20190223/3c091e2e721dc71d7223d58e07393bf8.png', '333be6c7580c0da29bf61f81828a52fd', 'aef0cfd63b9c1ff960b54e1958fc6911cf9a048c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('19', '3', '97274', '1550901717', '1', '0', '634f36465829205d4f4fe062213405f0f18e8b1a6699a9dd00dd6771014fd0dc', '门槛1111.PNG', 'admin/20190223/bf10af6a58e5e784488e1dbea5251d8e.png', '634f36465829205d4f4fe062213405f0', 'de2e4f96f450e39511764079cb167417d6813508', 'png', null);
INSERT INTO `cmf_asset` VALUES ('20', '3', '112661', '1550901728', '1', '0', 'a409fa4b95f313f586e70ac8c0482018d39b98e39cae132ad300156be88ceb52', '入口.png', 'admin/20190223/41c8db590282d8f9057df3d08c64853e.png', 'a409fa4b95f313f586e70ac8c0482018', '55035af24ed3af3d464d4752f53602d06883e7b5', 'png', null);
INSERT INTO `cmf_asset` VALUES ('21', '3', '430320', '1550903088', '1', '0', 'bf01f509c25184e1a91e739008da4dcff2996e7979aac9888ab65d9409690607', '1313.PNG', 'admin/20190223/5329eed41d342dc967df25eea9cff09b.png', 'bf01f509c25184e1a91e739008da4dcf', '25f43cc60123ead35d49f381f2aea6f3abf03c0d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('22', '3', '290779', '1550903303', '1', '0', '0c00da0211916165e9cef32c2e352cbcc218309f155ff10ff7bf8aacdd3c4a67', '233.PNG', 'admin/20190223/11d6f09517184b1cefe25435978d40af.png', '0c00da0211916165e9cef32c2e352cbc', '955b59d56c18aad4c5bf54893b8dc235179bb88e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('23', '3', '147620', '1550903559', '1', '0', 'e3b7c5dcc20241934f51a2fe437ca70709a470f94177e5f43f06b94fda413a5e', '1846622593.jpg', 'default/20190223/0c38479471d65d790014f124c6e62226.jpg', 'e3b7c5dcc20241934f51a2fe437ca707', '87c92f457b205feb64ada18ed3401d1ad9ac7e3d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('24', '1', '4111', '1551414160', '1', '0', 'e2cf78b9c74f2d82053afd2b842ad7a71057ecc388da0e61ad31137fdec70f2c', 'headicon.png', 'admin/20190301/19ca71ecf47a827bab7f5c513fe5d208.png', 'e2cf78b9c74f2d82053afd2b842ad7a7', '2cb944149ce01aed05428b1860c0d420f3951764', 'png', null);
INSERT INTO `cmf_asset` VALUES ('25', '1', '13813', '1551520663', '1', '0', '5fb02bc1b5761e1bd55423b1ae3f0dae133c200c5a66846bc9367773a4b4b1fe', '会员默认图标.png', 'admin/20190302/41a3c0b21d084dda3252161b066b88b4.png', '5fb02bc1b5761e1bd55423b1ae3f0dae', '361e1e01a94441de9d2345e01d5b93c42834992c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('26', '1', '35497', '1551520942', '1', '0', 'ed627525d2229871e0ac0115676514dc0b2871ee9077410e9918f1413a699a94', '领域.png', 'admin/20190302/33232b415a0ad1a6a015098d52c0fa20.png', 'ed627525d2229871e0ac0115676514dc', '11c92068b4c5fc3caa217fbce86100352aca7b5d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('27', '1', '59266', '1551521008', '1', '0', 'b4888d2b4d70b6d72c4a57a02b8f5799de6a8df7ca5e056b4c967a4119c80af3', '咨询222.png', 'admin/20190302/919464e012164ab1ca92c565915d2f9e.png', 'b4888d2b4d70b6d72c4a57a02b8f5799', '0fdb54377b4aa55d29bd93e215deefe7133759c9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('28', '1', '208839', '1551523160', '1', '0', 'd960a279641abaf63d41b945fc141cf1f0542d88cb20a7129da6505f375ada67', '咨询400.png', 'admin/20190302/a544b3311005974b6446b465dfd5f969.png', 'd960a279641abaf63d41b945fc141cf1', '23400f320599a95b56a7abc4e126f084f269063d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('29', '1', '116392', '1551523503', '1', '0', '1103c1099b79ee055e9a1d2022c7dcd8573fb5a591861f8ce2b42095a0cd7b1d', '666666.PNG', 'admin/20190302/a6001ee79dd88477cf24871a71f02bef.png', '1103c1099b79ee055e9a1d2022c7dcd8', 'a91ddfaedb49a77a1a4802614cb72d847be09868', 'png', null);
INSERT INTO `cmf_asset` VALUES ('30', '1', '166454', '1551523874', '1', '0', '753dc46d17e0c7bae1b3b9e029a208907b9ddf8e14b27c81729fa559e96ad906', '百姓服务400.png', 'admin/20190302/40186296903ca8600e13df22eea6d41c.png', '753dc46d17e0c7bae1b3b9e029a20890', '381b2303cfbfe854298906410de768832a02f70a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('31', '1', '199058', '1551523998', '1', '0', '08dcd31402f9fb09909facd1c3e30fa9954c83ebc978bd0b614c8f7a96b74307', '工业400.png', 'admin/20190302/c7b81bcc9dec338623527e968de50175.png', '08dcd31402f9fb09909facd1c3e30fa9', 'efe5b67d9518626ff325fcb0368b72294b057646', 'png', null);
INSERT INTO `cmf_asset` VALUES ('32', '1', '99606', '1551524112', '1', '0', 'd99250207c7c20037d12a600b858832794769a4a474e74d205844957a5be40d2', '设计 400.png', 'admin/20190302/ee6f64e9274d0a13e692d588bf987389.png', 'd99250207c7c20037d12a600b8588327', '2ae9a3c787b63be4641ed76138e2f70dfce02d49', 'png', null);
INSERT INTO `cmf_asset` VALUES ('33', '1', '83376', '1551524264', '1', '0', '0e69ecd2a5f2628491fefbdd894b5cb937fabc64db435b7e809722da656d3ceb', '2工业400.png', 'admin/20190302/d0c56de997eb4aaff222d0d559a70d6c.png', '0e69ecd2a5f2628491fefbdd894b5cb9', '7b4371a4c70e181189b1467f874301048021275f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('34', '1', '23465', '1551524369', '1', '0', '50c2925a7d92ebfe1db66fda62c677211041ee6a9554d98ea1694cf98ed3ca39', '2百姓服务400.png', 'admin/20190302/487902d6977771365fc83f72973447d3.png', '50c2925a7d92ebfe1db66fda62c67721', '8fc8e0455808f1fffcbd97eb4605596595c28f2b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('35', '1', '143815', '1551524505', '1', '0', '9222847eb5ac9101bdeac5c5457a345f8e2cf8b316edeb901089db8d7300fb85', '网络400.png', 'admin/20190302/a979e185bc50f3843a13569580b5e59a.png', '9222847eb5ac9101bdeac5c5457a345f', 'f35c14d79e060c80e7927e89deaa4e5f598704aa', 'png', null);
INSERT INTO `cmf_asset` VALUES ('36', '1', '34317', '1551524599', '1', '0', 'b9bfee63937e816f2a0be2e1b3e110e949069370625d5bd54a12f3b9fdebf21d', '农业400.png', 'admin/20190302/6c1eeb06780464cecfb83499d9a6c9db.png', 'b9bfee63937e816f2a0be2e1b3e110e9', '6e5e7d58f238b13d6f840c45a76f2ebf1c84e44e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('37', '1', '91443', '1551524750', '1', '0', '3335b2fbb4aad072164a82ce2ac2b1dc8967d1324851290ff1800ef5dd3ac23d', '博士400.png', 'admin/20190302/7f30b65e041d7761995d86eb4fe3f002.png', '3335b2fbb4aad072164a82ce2ac2b1dc', 'b82cef7e8bda6c0eddd15a2ac4fd17ddaca51cd3', 'png', null);
INSERT INTO `cmf_asset` VALUES ('38', '1', '46852', '1551525209', '1', '0', '29c9d250d6536bfd2c7afb2376c30a3879e19dfe9a6cae5e00789faa7d9b162c', '门槛200 (2).PNG', 'admin/20190302/39f9d493767d6b6fb215eb66687631f0.png', '29c9d250d6536bfd2c7afb2376c30a38', '813539959b335db8b07c2fbea4a59deb90595cb8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('39', '1', '13819', '1551525214', '1', '0', '329157c726b9fbec75dd9603b91500b25dcafec4d231579d8b463327d158a2be', '门槛200.PNG', 'admin/20190302/ef8db359dc72d238ebe4a1a4de29cde1.png', '329157c726b9fbec75dd9603b91500b2', 'c9627489d8fbacc9b348ee6ef8947eab14c8baa9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('40', '1', '44912', '1551525219', '1', '0', '82630d02f404f6be57bbc40feeb04f71a921ed6b91284a5c601d4e8a3b6488f7', '隐私保护200.PNG', 'admin/20190302/2e6b1743645a8e20005e91a56a4970b5.png', '82630d02f404f6be57bbc40feeb04f71', 'c45e32a22f63ef78de7631049471bf24224d1bad', 'png', null);
INSERT INTO `cmf_asset` VALUES ('41', '1', '82831', '1551685352', '1', '0', 'df7a773bafc2d581f5ad891f82d3c555539702c4df2d52762927934d4dec1272', '微信图片_20190304154215.png', 'admin/20190304/2482ce982de4ba9adef4dbc6495e3911.png', 'df7a773bafc2d581f5ad891f82d3c555', '72d36b36a644e896fcf38f169ef72f0ab73f9b3a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('42', '1', '113741', '1551685414', '1', '0', 'b5923ccbc7f05bbfd3faeaaa42ac7f6de322d294fbf13c05037aaeb0ec8963ac', '微信图片_20190304154210.png', 'admin/20190304/0fb1098d050993b5724ad4842f409a8f.png', 'b5923ccbc7f05bbfd3faeaaa42ac7f6d', '9f7a6bfb2efeaaa67594f94223451a0b83a2a3af', 'png', null);
INSERT INTO `cmf_asset` VALUES ('43', '1', '143138', '1551685442', '1', '0', '65ec9f478c383d95cda7b687317daf1424ef05081ece635b782c2bc1c0ec2527', '微信图片_20190304154154.png', 'admin/20190304/51528f371f3b615653f95e44f6faca26.png', '65ec9f478c383d95cda7b687317daf14', '150e1c2168fa05bab8cb72097da9cb7bb3ec0590', 'png', null);
INSERT INTO `cmf_asset` VALUES ('44', '1', '223338', '1551685470', '1', '0', '6fa15fc6b7ce3896bf6cac7be53b4c2180f69b84906f5cc646c1ced98000d12c', '微信图片_20190304154411.png', 'admin/20190304/0be06d024acdd8b0c0a46371850aaee8.png', '6fa15fc6b7ce3896bf6cac7be53b4c21', '21ac392b324f373caf490c1b600f90f5989fe6a9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('45', '1', '597886', '1551705050', '1', '0', '4a51ee30bbec53013a833ff8e700aa6984e7acacf109c7c905ee75cc4af43d6f', '关于我们.png', 'default/20190304/a73d40d9c88504c2d83a18d00bf55f96.png', '4a51ee30bbec53013a833ff8e700aa69', '75078e84a534bbb6adecca087f5943f205d945dd', 'png', null);
INSERT INTO `cmf_asset` VALUES ('46', '1', '3941646', '1551705590', '1', '0', '9e430611895d200bfcb65b6a9664af3e022d65e4fc9547c351fd8f10e7fe858e', '应用场景.png', 'default/20190304/e04aee4531544cc8612e4171a5160c99.png', '9e430611895d200bfcb65b6a9664af3e', '471fbed2f341300d5aecbc37a0207bb52e5f8e2c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('47', '1', '945676', '1551705844', '1', '0', 'ca272e3ace81e96cc40ab1ab0c23d0bb06a78caa2512250fa35aefcb315aff15', '使用演示.png', 'default/20190304/b488cf10729b37507eadcc53fdb59434.png', 'ca272e3ace81e96cc40ab1ab0c23d0bb', '5e71e030228323784fa35c6771ff4be55f61b9d8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('48', '1', '174791', '1551924444', '1', '0', '10a75f6482ca4d6a3fa18d9a2e9c42aea0d406d5c2eb9e200b0d5e0240c499b2', 'dahe.png', 'admin/20190307/f3030275c968fb482f4bab584f513442.png', '10a75f6482ca4d6a3fa18d9a2e9c42ae', 'f923b88ac1c148826d967933dfacc56b376fe66f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('49', '1', '2055149', '1551924469', '1', '0', 'da8447b431598283fe10e7e735d2a7e2a64395d65d03cc3866dc236dbfc02a15', '下载APP.png', 'admin/20190307/14e6204263c368f8dc77f33ebe2580d8.png', 'da8447b431598283fe10e7e735d2a7e2', 'f8ae5a99edd21de1f0a44866ef388aafb9bbf103', 'png', null);
INSERT INTO `cmf_asset` VALUES ('50', '1', '1351800', '1551924522', '1', '0', '98e075da5a5dfd84172ec2b201ca2f87a6399ae1ba58b35338f37d563239b698', 'diedie.png', 'default/20190307/962b0124e54a693ab8e3ab7035686f23.png', '98e075da5a5dfd84172ec2b201ca2f87', '9ebaed485da5f8d04babf43890015b9c54fee7e9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('51', '1', '318465', '1551924796', '1', '0', '3cf571d4cf2a4c4b2df823a27852a7d5d234b9ade0915d12883a238c6916feb0', 'movie.mp4', 'portal/20190307/dd8718e844f8ea96fdb7cf97346c842b.mp4', '3cf571d4cf2a4c4b2df823a27852a7d5', 'c90b44a96ed080c1a6c8ce8888a40a5aaaa7e7ca', 'mp4', null);
INSERT INTO `cmf_asset` VALUES ('52', '1', '2456515', '1551925333', '1', '0', '975e900204d3ef88a514d71914470476bdcd6cefe69cde0fe9ffa61f5d0178ea', '关于我们.png', 'admin/20190307/da3067f6dedc5b7f8fa9a93cf01e128e.png', '975e900204d3ef88a514d71914470476', '64291fc1aa32abe184a985455e95e81ae24bec78', 'png', null);
INSERT INTO `cmf_asset` VALUES ('53', '1', '52723', '1551925617', '1', '0', '1bfd5a580699831bfb7d3fab3d5404b926f74b23c7d7e812bb65167f104ac3fe', '微信截图_20190225105430.png', 'admin/20190307/4729fef2db0d59901a00675846c3509a.png', '1bfd5a580699831bfb7d3fab3d5404b9', 'a22420b9ee314dd5f800881fa68ce918c2674b78', 'png', null);
INSERT INTO `cmf_asset` VALUES ('54', '1', '178138', '1551931350', '1', '0', 'dd53a2ba20fa7e0f7769627cb2f9276eb6afdaa3bb1224116b3c3ab634e10211', 'yuanmeng.png', 'admin/20190307/be9f8eae1f0785254134c8f986f456c0.png', 'dd53a2ba20fa7e0f7769627cb2f9276e', 'dbba5ac6dbbd5229da3640e2d0914f97b7ad34a3', 'png', null);
INSERT INTO `cmf_asset` VALUES ('55', '1', '259632', '1552010846', '1', '0', 'a4ab972ab055eaaf8f08561d2b1ab99b22cc7b9a1f665e396a8b0e756128c364', 'tiyu.png', 'admin/20190308/1565d7d45748ecdfd433ef47a5d93d3f.png', 'a4ab972ab055eaaf8f08561d2b1ab99b', '582953c3f7a4448cf98d19b53865b1b975e5b6ad', 'png', null);
INSERT INTO `cmf_asset` VALUES ('56', '1', '2572794', '1552014238', '1', '0', '8632226aa62e78fe83f7bf9cbaccdc026184a04e8f60cfa980c880a17bf8ac9e', '首页.png', 'admin/20190308/1a7273c515181c47f4260e3cc7ecc350.png', '8632226aa62e78fe83f7bf9cbaccdc02', '6c97fbd20758e6588f6f6c43dcf4b9d1852a767e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('57', '1', '814061', '1552027174', '1', '0', '8a424d91282a5dd30e70643ace67b124966ef1e1addf45d9ceea3ba47c7bc5f1', 'yuzhou.png', 'admin/20190308/a5841dd6eb96a915b57c8494ec838f66.png', '8a424d91282a5dd30e70643ace67b124', '9249c1bdfeb3b9c99e7ea9d420243849162bc2e0', 'png', null);

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------
INSERT INTO `cmf_auth_access` VALUES ('336', '3', 'admin/gxzh/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('337', '3', 'admin/gxzh/withdraw', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('338', '3', 'admin/gxzh/withdrawcheck', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('339', '2', 'admin/setting/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('340', '2', 'admin/slide/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('341', '2', 'admin/slide/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('342', '2', 'admin/slide/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('343', '2', 'admin/slide/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('344', '2', 'admin/slide/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('345', '2', 'admin/slide/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('346', '2', 'admin/slideitem/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('347', '2', 'admin/slideitem/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('348', '2', 'admin/slideitem/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('349', '2', 'admin/slideitem/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('350', '2', 'admin/slideitem/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('351', '2', 'admin/slideitem/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('352', '2', 'admin/slideitem/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('353', '2', 'admin/slideitem/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('354', '2', 'admin/slideitem/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('355', '2', 'admin/setting/password', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('356', '2', 'admin/setting/passwordpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('357', '2', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('358', '2', 'admin/config/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('359', '2', 'admin/config/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('360', '2', 'admin/config/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('361', '2', 'admin/config/sort', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('362', '2', 'admin/config/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('363', '2', 'admin/config/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('364', '2', 'admin/config/read', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('365', '2', 'admin/config/save', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('366', '2', 'admin/department/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('367', '2', 'admin/department/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('368', '2', 'admin/department/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('369', '2', 'admin/department/sort', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('370', '2', 'admin/department/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('371', '2', 'admin/department/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('372', '2', 'admin/gxzh/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('373', '2', 'admin/gxzh/notice', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('374', '2', 'admin/gxzh/notice_add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('375', '2', 'admin/gxzh/notice_edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('376', '2', 'admin/gxzh/notice_delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('377', '2', 'admin/gxzh/question', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('378', '2', 'admin/gxzh/account', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('379', '2', 'admin/gxzh/withdraw', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('380', '2', 'admin/gxzh/withdrawcheck', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('381', '2', 'admin/gxzh/usercheck', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('382', '2', 'admin/gxzh/userlist', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('383', '2', 'admin/gxzh/relationship', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('384', '2', 'admin/gxzh/answer', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('385', '2', 'admin/gxzh/guestbook', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('386', '2', 'admin/gxzh/userinfo', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('387', '2', 'admin/gxzh/refund', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('388', '2', 'admin/gxzh/refundcheck', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('389', '2', 'admin/gxzh/recharge', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('390', '2', 'admin/gxzh/push', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('391', '2', 'admin/gxzh/export', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('392', '2', 'user/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('393', '2', 'admin/user/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('394', '2', 'admin/user/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('395', '2', 'admin/user/userinfo', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('396', '2', 'admin/user/userinfopost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('397', '2', 'user/adminindex/default1', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('398', '2', 'user/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('399', '2', 'user/adminindex/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('400', '2', 'user/adminindex/cancelban', 'admin_url');

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', '1', 'portal', 'admin_url', 'portal/AdminCategory/toggle', '', '文章分类显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('164', '1', 'admin', 'admin_url', 'admin/Config/index', '', '配置管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/Config/add', '', '添加配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/Config/edit', '', '编辑配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', '1', 'admin', 'admin_url', 'admin/Config/sort', '', '排序配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', '1', 'admin', 'admin_url', 'admin/Config/toggle', '', '隐藏配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', '1', 'admin', 'admin_url', 'admin/Config/delete', '', '删除配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', '1', 'admin', 'admin_url', 'admin/Config/read', '', '设置配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', '1', 'admin', 'admin_url', 'admin/Config/save', '', '保存配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', '1', 'admin', 'admin_url', 'admin/Department/index', '', '科室领域', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', '1', 'admin', 'admin_url', 'admin/Department/add', '', '添加科室领域', '');
INSERT INTO `cmf_auth_rule` VALUES ('174', '1', 'admin', 'admin_url', 'admin/Department/edit', '', '编辑科室领域', '');
INSERT INTO `cmf_auth_rule` VALUES ('175', '1', 'admin', 'admin_url', 'admin/Department/sort', '', '科室领域排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('176', '1', 'admin', 'admin_url', 'admin/Department/toggle', '', '科室领域显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('177', '1', 'admin', 'admin_url', 'admin/Department/delete', '', '删除科室领域', '');
INSERT INTO `cmf_auth_rule` VALUES ('178', '1', 'admin', 'admin_url', 'admin/Gxzh/default', '', '共享智慧', '');
INSERT INTO `cmf_auth_rule` VALUES ('179', '1', 'admin', 'admin_url', 'admin/Gxzh/notice', '', '系统公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('180', '1', 'admin', 'admin_url', 'admin/Gxzh/question', '', '咨询列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('181', '1', 'admin', 'admin_url', 'admin/Gxzh/account', '', '账单管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('182', '1', 'admin', 'admin_url', 'admin/Gxzh/withdraw', '', '提现管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('183', '1', 'admin', 'admin_url', 'admin/Config/distribution', '', '分销设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('184', '1', 'admin', 'admin_url', 'admin/Gxzh/notice_add', '', '添加公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('185', '1', 'admin', 'admin_url', 'admin/Gxzh/notice_edit', '', '编辑公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('186', '1', 'admin', 'admin_url', 'admin/Gxzh/notice_delete', '', '删除公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('187', '1', 'admin', 'admin_url', 'admin/Gxzh/usercheck', '', '用户审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('188', '1', 'admin', 'admin_url', 'admin/Gxzh/userlist', '', '用户列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('189', '1', 'admin', 'admin_url', 'admin/Gxzh/relationship', '', '用户关系', '');
INSERT INTO `cmf_auth_rule` VALUES ('190', '1', 'admin', 'admin_url', 'admin/Gxzh/recharge', '', '充值', '');
INSERT INTO `cmf_auth_rule` VALUES ('191', '1', 'admin', 'admin_url', 'admin/Gxzh/answer', '', '回答列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('192', '1', 'admin', 'admin_url', 'admin/Gxzh/withdrawcheck', '', '提现审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('193', '1', 'admin', 'admin_url', 'admin/Gxzh/guestbook', '', '用户留言', '');
INSERT INTO `cmf_auth_rule` VALUES ('194', '1', 'admin', 'admin_url', 'admin/Gxzh/userinfo', '', '用户信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('195', '1', 'admin', 'admin_url', 'admin/Gxzh/refund', '', '退款管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('196', '1', 'admin', 'admin_url', 'admin/Gxzh/refundcheck', '', '退款审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('197', '1', 'admin', 'admin_url', 'admin/Gxzh/push', '', '推送', '');
INSERT INTO `cmf_auth_rule` VALUES ('198', '1', 'admin', 'admin_url', 'admin/Gxzh/export', '', '导出统计数据', '');
INSERT INTO `cmf_auth_rule` VALUES ('199', '1', 'admin', 'admin_url', 'admin/Content/default', '', '内容管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('200', '1', 'admin', 'admin_url', 'admin/Content/hall', '', '礼堂管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('201', '1', 'admin', 'admin_url', 'admin/Content/notice_add', '', '添加公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('202', '1', 'admin', 'admin_url', 'admin/Content/notice_edit', '', '编辑公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('203', '1', 'admin', 'admin_url', 'admin/Content/notice_delete', '', '删除公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('204', '1', 'admin', 'admin_url', 'admin/Content/question', '', '咨询列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('205', '1', 'admin', 'admin_url', 'admin/Content/answer', '', '回答列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('206', '1', 'admin', 'admin_url', 'admin/Content/account', '', '账单管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('207', '1', 'admin', 'admin_url', 'admin/Content/withdraw', '', '提现管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('208', '1', 'admin', 'admin_url', 'admin/Content/withdrawcheck', '', '提现审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('209', '1', 'admin', 'admin_url', 'admin/Content/refund', '', '退款管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('210', '1', 'admin', 'admin_url', 'admin/Content/refundcheck', '', '退款审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('211', '1', 'admin', 'admin_url', 'admin/Content/usercheck', '', '用户审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('212', '1', 'admin', 'admin_url', 'admin/Content/userlist', '', '用户列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('213', '1', 'admin', 'admin_url', 'admin/Content/recharge', '', '充值', '');
INSERT INTO `cmf_auth_rule` VALUES ('214', '1', 'admin', 'admin_url', 'admin/Content/push', '', '推送', '');
INSERT INTO `cmf_auth_rule` VALUES ('215', '1', 'admin', 'admin_url', 'admin/Content/relationship', '', '用户关系', '');
INSERT INTO `cmf_auth_rule` VALUES ('216', '1', 'admin', 'admin_url', 'admin/Content/guestbook', '', '用户留言', '');
INSERT INTO `cmf_auth_rule` VALUES ('217', '1', 'admin', 'admin_url', 'admin/Content/userinfo', '', '用户信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('218', '1', 'admin', 'admin_url', 'admin/Content/export', '', '导出统计数据', '');
INSERT INTO `cmf_auth_rule` VALUES ('219', '1', 'admin', 'admin_url', 'admin/Content/hall_add', '', '添加公礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('220', '1', 'admin', 'admin_url', 'admin/Content/hall_edit', '', '编辑礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('221', '1', 'admin', 'admin_url', 'admin/Content/hall_delete', '', '删除公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('222', '1', 'admin', 'admin_url', 'admin/Content/information', '', '资讯管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('223', '1', 'admin', 'admin_url', 'admin/Content/information_add', '', '添加资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('224', '1', 'admin', 'admin_url', 'admin/Content/information_edit', '', '编辑资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('225', '1', 'admin', 'admin_url', 'admin/Content/information_delete', '', '删除公告', '');
INSERT INTO `cmf_auth_rule` VALUES ('226', '1', 'admin', 'admin_url', 'admin/Artical/default', '', '图文管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('227', '1', 'admin', 'admin_url', 'admin/Artical/hall', '', '礼堂管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('228', '1', 'admin', 'admin_url', 'admin/Artical/hall_add', '', '添加公礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('229', '1', 'admin', 'admin_url', 'admin/Artical/hall_edit', '', '编辑礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('230', '1', 'admin', 'admin_url', 'admin/Artical/hall_delete', '', '删除礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('231', '1', 'admin', 'admin_url', 'admin/Artical/information', '', '资讯管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('232', '1', 'admin', 'admin_url', 'admin/Artical/information_add', '', '添加资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('233', '1', 'admin', 'admin_url', 'admin/Artical/information_edit', '', '编辑资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('234', '1', 'admin', 'admin_url', 'admin/Artical/information_delete', '', '删除资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('235', '1', 'admin', 'admin_url', 'admin/Artical/camera', '', '随手拍管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('236', '1', 'admin', 'admin_url', 'admin/Artical/camera_add', '', '添加随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('237', '1', 'admin', 'admin_url', 'admin/Artical/camera_delete', '', '删除随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('238', '1', 'admin', 'admin_url', 'admin/Content/camera', '', '随手拍管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('239', '1', 'admin', 'admin_url', 'admin/Content/camera_add', '', '添加随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('240', '1', 'admin', 'admin_url', 'admin/Content/camera_delete', '', '删除随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('241', '1', 'admin', 'admin_url', 'admin/Article/default', '', '图文管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('242', '1', 'admin', 'admin_url', 'admin/Article/hall', '', '礼堂管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('243', '1', 'admin', 'admin_url', 'admin/Article/hall_add', '', '添加公礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('244', '1', 'admin', 'admin_url', 'admin/Article/hall_edit', '', '编辑礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('245', '1', 'admin', 'admin_url', 'admin/Article/hall_delete', '', '删除礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('246', '1', 'admin', 'admin_url', 'admin/Article/information', '', '资讯管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('247', '1', 'admin', 'admin_url', 'admin/Article/information_add', '', '添加资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('248', '1', 'admin', 'admin_url', 'admin/Article/information_edit', '', '编辑资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('249', '1', 'admin', 'admin_url', 'admin/Article/information_delete', '', '删除资讯', '');
INSERT INTO `cmf_auth_rule` VALUES ('250', '1', 'admin', 'admin_url', 'admin/Article/camera', '', '随手拍管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('251', '1', 'admin', 'admin_url', 'admin/Article/camera_add', '', '添加随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('252', '1', 'admin', 'admin_url', 'admin/Article/camera_delete', '', '删除随手拍', '');
INSERT INTO `cmf_auth_rule` VALUES ('253', '1', 'admin', 'admin_url', 'admin/Article/group', '', '机构团体管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('254', '1', 'admin', 'admin_url', 'admin/Article/group_add', '', '添加社会文化机构团体', '');
INSERT INTO `cmf_auth_rule` VALUES ('255', '1', 'admin', 'admin_url', 'admin/Article/group_edit', '', '编辑社会文化机构团体', '');
INSERT INTO `cmf_auth_rule` VALUES ('256', '1', 'admin', 'admin_url', 'admin/Article/group_delete', '', '删除社会文化机构团体', '');
INSERT INTO `cmf_auth_rule` VALUES ('257', '1', 'admin', 'admin_url', 'admin/Article/volunteer', '', '志愿者管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('258', '1', 'admin', 'admin_url', 'admin/Article/volunteer_add', '', '添加志愿者', '');
INSERT INTO `cmf_auth_rule` VALUES ('259', '1', 'admin', 'admin_url', 'admin/Article/volunteer_edit', '', '编辑志愿者', '');
INSERT INTO `cmf_auth_rule` VALUES ('260', '1', 'admin', 'admin_url', 'admin/Article/volunteer_delete', '', '删除机构团体', '');
INSERT INTO `cmf_auth_rule` VALUES ('261', '1', 'admin', 'admin_url', 'admin/Appointment/default', '', '预约管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('262', '1', 'admin', 'admin_url', 'admin/Appointment/index', '', '预约列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('263', '1', 'admin', 'admin_url', 'admin/Appointment/appointment_verify', '', '预约审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('264', '1', 'admin', 'admin_url', 'admin/Appointment/appointment_add', '', '添加预约', '');
INSERT INTO `cmf_auth_rule` VALUES ('265', '1', 'admin', 'admin_url', 'admin/Appointment/appointment_edit', '', '编辑预约', '');
INSERT INTO `cmf_auth_rule` VALUES ('266', '1', 'admin', 'admin_url', 'admin/Appointment/appointment_delete', '', '删除预约', '');
INSERT INTO `cmf_auth_rule` VALUES ('267', '1', 'app', 'admin_url', 'app/Appointment/about', '', '关于云礼堂', '');
INSERT INTO `cmf_auth_rule` VALUES ('268', '1', 'admin', 'admin_url', 'admin/Appointment/about', '', '关于云礼堂', '');

-- ----------------------------
-- Table structure for cmf_city
-- ----------------------------
DROP TABLE IF EXISTS `cmf_city`;
CREATE TABLE `cmf_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '城市编码',
  `city` varchar(40) NOT NULL COMMENT '城市名称',
  `province_code` char(6) NOT NULL COMMENT '所属省份编码',
  `pinyin` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='城市信息表';

-- ----------------------------
-- Records of cmf_city
-- ----------------------------
INSERT INTO `cmf_city` VALUES ('1', '110100', '北京市', '110000', 'beijingshi');
INSERT INTO `cmf_city` VALUES ('3', '120100', '天津市', '120000', 'tianjinshi');
INSERT INTO `cmf_city` VALUES ('5', '130100', '石家庄市', '130000', 'shijiazhuangshi');
INSERT INTO `cmf_city` VALUES ('6', '130200', '唐山市', '130000', 'tangshanshi');
INSERT INTO `cmf_city` VALUES ('7', '130300', '秦皇岛市', '130000', 'qinhuangdaoshi');
INSERT INTO `cmf_city` VALUES ('8', '130400', '邯郸市', '130000', 'handanshi');
INSERT INTO `cmf_city` VALUES ('9', '130500', '邢台市', '130000', 'xingtaishi');
INSERT INTO `cmf_city` VALUES ('10', '130600', '保定市', '130000', 'baodingshi');
INSERT INTO `cmf_city` VALUES ('11', '130700', '张家口市', '130000', 'zhangjiakoushi');
INSERT INTO `cmf_city` VALUES ('12', '130800', '承德市', '130000', 'chengdeshi');
INSERT INTO `cmf_city` VALUES ('13', '130900', '沧州市', '130000', 'cangzhoushi');
INSERT INTO `cmf_city` VALUES ('14', '131000', '廊坊市', '130000', 'langfangshi');
INSERT INTO `cmf_city` VALUES ('15', '131100', '衡水市', '130000', 'hengshuishi');
INSERT INTO `cmf_city` VALUES ('16', '140100', '太原市', '140000', 'taiyuanshi');
INSERT INTO `cmf_city` VALUES ('17', '140200', '大同市', '140000', 'datongshi');
INSERT INTO `cmf_city` VALUES ('18', '140300', '阳泉市', '140000', 'yangquanshi');
INSERT INTO `cmf_city` VALUES ('19', '140400', '长治市', '140000', 'changzhishi');
INSERT INTO `cmf_city` VALUES ('20', '140500', '晋城市', '140000', 'jinchengshi');
INSERT INTO `cmf_city` VALUES ('21', '140600', '朔州市', '140000', 'shuozhoushi');
INSERT INTO `cmf_city` VALUES ('22', '140700', '晋中市', '140000', 'jinzhongshi');
INSERT INTO `cmf_city` VALUES ('23', '140800', '运城市', '140000', 'yunchengshi');
INSERT INTO `cmf_city` VALUES ('24', '140900', '忻州市', '140000', 'xinzhoushi');
INSERT INTO `cmf_city` VALUES ('25', '141000', '临汾市', '140000', 'linfenshi');
INSERT INTO `cmf_city` VALUES ('26', '141100', '吕梁市', '140000', 'lyuliangshi');
INSERT INTO `cmf_city` VALUES ('27', '150100', '呼和浩特市', '150000', 'huhehaoteshi');
INSERT INTO `cmf_city` VALUES ('28', '150200', '包头市', '150000', 'baotoushi');
INSERT INTO `cmf_city` VALUES ('29', '150300', '乌海市', '150000', 'wuhaishi');
INSERT INTO `cmf_city` VALUES ('30', '150400', '赤峰市', '150000', 'chifengshi');
INSERT INTO `cmf_city` VALUES ('31', '150500', '通辽市', '150000', 'tongliaoshi');
INSERT INTO `cmf_city` VALUES ('32', '150600', '鄂尔多斯市', '150000', 'eerduosishi');
INSERT INTO `cmf_city` VALUES ('33', '150700', '呼伦贝尔市', '150000', 'hulunbeiershi');
INSERT INTO `cmf_city` VALUES ('34', '150800', '巴彦淖尔市', '150000', 'bayannaoershi');
INSERT INTO `cmf_city` VALUES ('35', '150900', '乌兰察布市', '150000', 'wulanchabushi');
INSERT INTO `cmf_city` VALUES ('36', '152200', '兴安盟', '150000', 'xinganmeng');
INSERT INTO `cmf_city` VALUES ('37', '152500', '锡林郭勒盟', '150000', 'xilinguolemeng');
INSERT INTO `cmf_city` VALUES ('38', '152900', '阿拉善盟', '150000', 'alashanmeng');
INSERT INTO `cmf_city` VALUES ('39', '210100', '沈阳市', '210000', 'shenyangshi');
INSERT INTO `cmf_city` VALUES ('40', '210200', '大连市', '210000', 'dalianshi');
INSERT INTO `cmf_city` VALUES ('41', '210300', '鞍山市', '210000', 'anshanshi');
INSERT INTO `cmf_city` VALUES ('42', '210400', '抚顺市', '210000', 'fushunshi');
INSERT INTO `cmf_city` VALUES ('43', '210500', '本溪市', '210000', 'benxishi');
INSERT INTO `cmf_city` VALUES ('44', '210600', '丹东市', '210000', 'dandongshi');
INSERT INTO `cmf_city` VALUES ('45', '210700', '锦州市', '210000', 'jinzhoushi');
INSERT INTO `cmf_city` VALUES ('46', '210800', '营口市', '210000', 'yingkoushi');
INSERT INTO `cmf_city` VALUES ('47', '210900', '阜新市', '210000', 'fuxinshi');
INSERT INTO `cmf_city` VALUES ('48', '211000', '辽阳市', '210000', 'liaoyangshi');
INSERT INTO `cmf_city` VALUES ('49', '211100', '盘锦市', '210000', 'panjinshi');
INSERT INTO `cmf_city` VALUES ('50', '211200', '铁岭市', '210000', 'tielingshi');
INSERT INTO `cmf_city` VALUES ('51', '211300', '朝阳市', '210000', 'zhaoyangshi');
INSERT INTO `cmf_city` VALUES ('52', '211400', '葫芦岛市', '210000', 'huludaoshi');
INSERT INTO `cmf_city` VALUES ('53', '220100', '长春市', '220000', 'changchunshi');
INSERT INTO `cmf_city` VALUES ('54', '220200', '吉林市', '220000', 'jilinshi');
INSERT INTO `cmf_city` VALUES ('55', '220300', '四平市', '220000', 'sipingshi');
INSERT INTO `cmf_city` VALUES ('56', '220400', '辽源市', '220000', 'liaoyuanshi');
INSERT INTO `cmf_city` VALUES ('57', '220500', '通化市', '220000', 'tonghuashi');
INSERT INTO `cmf_city` VALUES ('58', '220600', '白山市', '220000', 'baishanshi');
INSERT INTO `cmf_city` VALUES ('59', '220700', '松原市', '220000', 'songyuanshi');
INSERT INTO `cmf_city` VALUES ('60', '220800', '白城市', '220000', 'baichengshi');
INSERT INTO `cmf_city` VALUES ('61', '222400', '延边朝鲜族自治州', '220000', 'yanbianchaoxianzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('62', '230100', '哈尔滨市', '230000', 'haerbinshi');
INSERT INTO `cmf_city` VALUES ('63', '230200', '齐齐哈尔市', '230000', 'qiqihaershi');
INSERT INTO `cmf_city` VALUES ('64', '230300', '鸡西市', '230000', 'jixishi');
INSERT INTO `cmf_city` VALUES ('65', '230400', '鹤岗市', '230000', 'hegangshi');
INSERT INTO `cmf_city` VALUES ('66', '230500', '双鸭山市', '230000', 'shuangyashanshi');
INSERT INTO `cmf_city` VALUES ('67', '230600', '大庆市', '230000', 'daqingshi');
INSERT INTO `cmf_city` VALUES ('68', '230700', '伊春市', '230000', 'yichunshi');
INSERT INTO `cmf_city` VALUES ('69', '230800', '佳木斯市', '230000', 'jiamusishi');
INSERT INTO `cmf_city` VALUES ('70', '230900', '七台河市', '230000', 'qitaiheshi');
INSERT INTO `cmf_city` VALUES ('71', '231000', '牡丹江市', '230000', 'mudanjiangshi');
INSERT INTO `cmf_city` VALUES ('72', '231100', '黑河市', '230000', 'heiheshi');
INSERT INTO `cmf_city` VALUES ('73', '231200', '绥化市', '230000', 'suihuashi');
INSERT INTO `cmf_city` VALUES ('74', '232700', '大兴安岭地区', '230000', 'daxinganlingdiqu');
INSERT INTO `cmf_city` VALUES ('75', '310100', '上海市', '310000', 'shanghaishi');
INSERT INTO `cmf_city` VALUES ('77', '320100', '南京市', '320000', 'nanjingshi');
INSERT INTO `cmf_city` VALUES ('78', '320200', '无锡市', '320000', 'wuxishi');
INSERT INTO `cmf_city` VALUES ('79', '320300', '徐州市', '320000', 'xuzhoushi');
INSERT INTO `cmf_city` VALUES ('80', '320400', '常州市', '320000', 'changzhoushi');
INSERT INTO `cmf_city` VALUES ('81', '320500', '苏州市', '320000', 'suzhoushi');
INSERT INTO `cmf_city` VALUES ('82', '320600', '南通市', '320000', 'nantongshi');
INSERT INTO `cmf_city` VALUES ('83', '320700', '连云港市', '320000', 'lianyungangshi');
INSERT INTO `cmf_city` VALUES ('84', '320800', '淮安市', '320000', 'huaianshi');
INSERT INTO `cmf_city` VALUES ('85', '320900', '盐城市', '320000', 'yanchengshi');
INSERT INTO `cmf_city` VALUES ('86', '321000', '扬州市', '320000', 'yangzhoushi');
INSERT INTO `cmf_city` VALUES ('87', '321100', '镇江市', '320000', 'zhenjiangshi');
INSERT INTO `cmf_city` VALUES ('88', '321200', '泰州市', '320000', 'taizhoushi');
INSERT INTO `cmf_city` VALUES ('89', '321300', '宿迁市', '320000', 'suqianshi');
INSERT INTO `cmf_city` VALUES ('90', '330100', '杭州市', '330000', 'hangzhoushi');
INSERT INTO `cmf_city` VALUES ('91', '330200', '宁波市', '330000', 'ningboshi');
INSERT INTO `cmf_city` VALUES ('92', '330300', '温州市', '330000', 'wenzhoushi');
INSERT INTO `cmf_city` VALUES ('93', '330400', '嘉兴市', '330000', 'jiaxingshi');
INSERT INTO `cmf_city` VALUES ('94', '330500', '湖州市', '330000', 'huzhoushi');
INSERT INTO `cmf_city` VALUES ('95', '330600', '绍兴市', '330000', 'shaoxingshi');
INSERT INTO `cmf_city` VALUES ('96', '330700', '金华市', '330000', 'jinhuashi');
INSERT INTO `cmf_city` VALUES ('97', '330800', '衢州市', '330000', 'quzhoushi');
INSERT INTO `cmf_city` VALUES ('98', '330900', '舟山市', '330000', 'zhoushanshi');
INSERT INTO `cmf_city` VALUES ('99', '331000', '台州市', '330000', 'taizhoushi');
INSERT INTO `cmf_city` VALUES ('100', '331100', '丽水市', '330000', 'lishuishi');
INSERT INTO `cmf_city` VALUES ('101', '340100', '合肥市', '340000', 'hefeishi');
INSERT INTO `cmf_city` VALUES ('102', '340200', '芜湖市', '340000', 'wuhushi');
INSERT INTO `cmf_city` VALUES ('103', '340300', '蚌埠市', '340000', 'bengbushi');
INSERT INTO `cmf_city` VALUES ('104', '340400', '淮南市', '340000', 'huainanshi');
INSERT INTO `cmf_city` VALUES ('105', '340500', '马鞍山市', '340000', 'maanshanshi');
INSERT INTO `cmf_city` VALUES ('106', '340600', '淮北市', '340000', 'huaibeishi');
INSERT INTO `cmf_city` VALUES ('107', '340700', '铜陵市', '340000', 'tonglingshi');
INSERT INTO `cmf_city` VALUES ('108', '340800', '安庆市', '340000', 'anqingshi');
INSERT INTO `cmf_city` VALUES ('109', '341000', '黄山市', '340000', 'huangshanshi');
INSERT INTO `cmf_city` VALUES ('110', '341100', '滁州市', '340000', 'chuzhoushi');
INSERT INTO `cmf_city` VALUES ('111', '341200', '阜阳市', '340000', 'fuyangshi');
INSERT INTO `cmf_city` VALUES ('112', '341300', '宿州市', '340000', 'suzhoushi');
INSERT INTO `cmf_city` VALUES ('113', '341400', '巢湖市', '340000', 'chaohushi');
INSERT INTO `cmf_city` VALUES ('114', '341500', '六安市', '340000', 'luanshi');
INSERT INTO `cmf_city` VALUES ('115', '341600', '亳州市', '340000', 'bozhoushi');
INSERT INTO `cmf_city` VALUES ('116', '341700', '池州市', '340000', 'chizhoushi');
INSERT INTO `cmf_city` VALUES ('117', '341800', '宣城市', '340000', 'xuanchengshi');
INSERT INTO `cmf_city` VALUES ('118', '350100', '福州市', '350000', 'fuzhoushi');
INSERT INTO `cmf_city` VALUES ('119', '350200', '厦门市', '350000', 'xiamenshi');
INSERT INTO `cmf_city` VALUES ('120', '350300', '莆田市', '350000', 'putianshi');
INSERT INTO `cmf_city` VALUES ('121', '350400', '三明市', '350000', 'sanmingshi');
INSERT INTO `cmf_city` VALUES ('122', '350500', '泉州市', '350000', 'quanzhoushi');
INSERT INTO `cmf_city` VALUES ('123', '350600', '漳州市', '350000', 'zhangzhoushi');
INSERT INTO `cmf_city` VALUES ('124', '350700', '南平市', '350000', 'nanpingshi');
INSERT INTO `cmf_city` VALUES ('125', '350800', '龙岩市', '350000', 'longyanshi');
INSERT INTO `cmf_city` VALUES ('126', '350900', '宁德市', '350000', 'ningdeshi');
INSERT INTO `cmf_city` VALUES ('127', '360100', '南昌市', '360000', 'nanchangshi');
INSERT INTO `cmf_city` VALUES ('128', '360200', '景德镇市', '360000', 'jingdezhenshi');
INSERT INTO `cmf_city` VALUES ('129', '360300', '萍乡市', '360000', 'pingxiangshi');
INSERT INTO `cmf_city` VALUES ('130', '360400', '九江市', '360000', 'jiujiangshi');
INSERT INTO `cmf_city` VALUES ('131', '360500', '新余市', '360000', 'xinyushi');
INSERT INTO `cmf_city` VALUES ('132', '360600', '鹰潭市', '360000', 'yingtanshi');
INSERT INTO `cmf_city` VALUES ('133', '360700', '赣州市', '360000', 'ganzhoushi');
INSERT INTO `cmf_city` VALUES ('134', '360800', '吉安市', '360000', 'jianshi');
INSERT INTO `cmf_city` VALUES ('135', '360900', '宜春市', '360000', 'yichunshi');
INSERT INTO `cmf_city` VALUES ('136', '361000', '抚州市', '360000', 'fuzhoushi');
INSERT INTO `cmf_city` VALUES ('137', '361100', '上饶市', '360000', 'shangraoshi');
INSERT INTO `cmf_city` VALUES ('138', '370100', '济南市', '370000', 'jinanshi');
INSERT INTO `cmf_city` VALUES ('139', '370200', '青岛市', '370000', 'qingdaoshi');
INSERT INTO `cmf_city` VALUES ('140', '370300', '淄博市', '370000', 'ziboshi');
INSERT INTO `cmf_city` VALUES ('141', '370400', '枣庄市', '370000', 'zaozhuangshi');
INSERT INTO `cmf_city` VALUES ('142', '370500', '东营市', '370000', 'dongyingshi');
INSERT INTO `cmf_city` VALUES ('143', '370600', '烟台市', '370000', 'yantaishi');
INSERT INTO `cmf_city` VALUES ('144', '370700', '潍坊市', '370000', 'weifangshi');
INSERT INTO `cmf_city` VALUES ('145', '370800', '济宁市', '370000', 'jiningshi');
INSERT INTO `cmf_city` VALUES ('146', '370900', '泰安市', '370000', 'taianshi');
INSERT INTO `cmf_city` VALUES ('147', '371000', '威海市', '370000', 'weihaishi');
INSERT INTO `cmf_city` VALUES ('148', '371100', '日照市', '370000', 'rizhaoshi');
INSERT INTO `cmf_city` VALUES ('149', '371200', '莱芜市', '370000', 'laiwushi');
INSERT INTO `cmf_city` VALUES ('150', '371300', '临沂市', '370000', 'linyishi');
INSERT INTO `cmf_city` VALUES ('151', '371400', '德州市', '370000', 'dezhoushi');
INSERT INTO `cmf_city` VALUES ('152', '371500', '聊城市', '370000', 'liaochengshi');
INSERT INTO `cmf_city` VALUES ('153', '371600', '滨州市', '370000', 'binzhoushi');
INSERT INTO `cmf_city` VALUES ('154', '371700', '荷泽市', '370000', 'hezeshi');
INSERT INTO `cmf_city` VALUES ('155', '410100', '郑州市', '410000', 'zhengzhoushi');
INSERT INTO `cmf_city` VALUES ('156', '410200', '开封市', '410000', 'kaifengshi');
INSERT INTO `cmf_city` VALUES ('157', '410300', '洛阳市', '410000', 'luoyangshi');
INSERT INTO `cmf_city` VALUES ('158', '410400', '平顶山市', '410000', 'pingdingshanshi');
INSERT INTO `cmf_city` VALUES ('159', '410500', '安阳市', '410000', 'anyangshi');
INSERT INTO `cmf_city` VALUES ('160', '410600', '鹤壁市', '410000', 'hebishi');
INSERT INTO `cmf_city` VALUES ('161', '410700', '新乡市', '410000', 'xinxiangshi');
INSERT INTO `cmf_city` VALUES ('162', '410800', '焦作市', '410000', 'jiaozuoshi');
INSERT INTO `cmf_city` VALUES ('163', '410900', '濮阳市', '410000', 'puyangshi');
INSERT INTO `cmf_city` VALUES ('164', '411000', '许昌市', '410000', 'xuchangshi');
INSERT INTO `cmf_city` VALUES ('165', '411100', '漯河市', '410000', 'taheshi');
INSERT INTO `cmf_city` VALUES ('166', '411200', '三门峡市', '410000', 'sanmenxiashi');
INSERT INTO `cmf_city` VALUES ('167', '411300', '南阳市', '410000', 'nanyangshi');
INSERT INTO `cmf_city` VALUES ('168', '411400', '商丘市', '410000', 'shangqiushi');
INSERT INTO `cmf_city` VALUES ('169', '411500', '信阳市', '410000', 'xinyangshi');
INSERT INTO `cmf_city` VALUES ('170', '411600', '周口市', '410000', 'zhoukoushi');
INSERT INTO `cmf_city` VALUES ('171', '411700', '驻马店市', '410000', 'zhumadianshi');
INSERT INTO `cmf_city` VALUES ('172', '420100', '武汉市', '420000', 'wuhanshi');
INSERT INTO `cmf_city` VALUES ('173', '420200', '黄石市', '420000', 'huangshishi');
INSERT INTO `cmf_city` VALUES ('174', '420300', '十堰市', '420000', 'shiyanshi');
INSERT INTO `cmf_city` VALUES ('175', '420500', '宜昌市', '420000', 'yichangshi');
INSERT INTO `cmf_city` VALUES ('176', '420600', '襄樊市', '420000', 'xiangfanshi');
INSERT INTO `cmf_city` VALUES ('177', '420700', '鄂州市', '420000', 'ezhoushi');
INSERT INTO `cmf_city` VALUES ('178', '420800', '荆门市', '420000', 'jingmenshi');
INSERT INTO `cmf_city` VALUES ('179', '420900', '孝感市', '420000', 'xiaoganshi');
INSERT INTO `cmf_city` VALUES ('180', '421000', '荆州市', '420000', 'jingzhoushi');
INSERT INTO `cmf_city` VALUES ('181', '421100', '黄冈市', '420000', 'huanggangshi');
INSERT INTO `cmf_city` VALUES ('182', '421200', '咸宁市', '420000', 'xianningshi');
INSERT INTO `cmf_city` VALUES ('183', '421300', '随州市', '420000', 'suizhoushi');
INSERT INTO `cmf_city` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000', 'enshitujiazumiaozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('185', '429000', '省直辖行政单位', '420000', 'shengzhixiaxingzhengdanwei');
INSERT INTO `cmf_city` VALUES ('186', '430100', '长沙市', '430000', 'changshashi');
INSERT INTO `cmf_city` VALUES ('187', '430200', '株洲市', '430000', 'zhuzhoushi');
INSERT INTO `cmf_city` VALUES ('188', '430300', '湘潭市', '430000', 'xiangtanshi');
INSERT INTO `cmf_city` VALUES ('189', '430400', '衡阳市', '430000', 'hengyangshi');
INSERT INTO `cmf_city` VALUES ('190', '430500', '邵阳市', '430000', 'shaoyangshi');
INSERT INTO `cmf_city` VALUES ('191', '430600', '岳阳市', '430000', 'yueyangshi');
INSERT INTO `cmf_city` VALUES ('192', '430700', '常德市', '430000', 'changdeshi');
INSERT INTO `cmf_city` VALUES ('193', '430800', '张家界市', '430000', 'zhangjiajieshi');
INSERT INTO `cmf_city` VALUES ('194', '430900', '益阳市', '430000', 'yiyangshi');
INSERT INTO `cmf_city` VALUES ('195', '431000', '郴州市', '430000', 'chenzhoushi');
INSERT INTO `cmf_city` VALUES ('196', '431100', '永州市', '430000', 'yongzhoushi');
INSERT INTO `cmf_city` VALUES ('197', '431200', '怀化市', '430000', 'huaihuashi');
INSERT INTO `cmf_city` VALUES ('198', '431300', '娄底市', '430000', 'loudishi');
INSERT INTO `cmf_city` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000', 'xiangxitujiazumiaozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('200', '440100', '广州市', '440000', 'guangzhoushi');
INSERT INTO `cmf_city` VALUES ('201', '440200', '韶关市', '440000', 'shaoguanshi');
INSERT INTO `cmf_city` VALUES ('202', '440300', '深圳市', '440000', 'shenzhenshi');
INSERT INTO `cmf_city` VALUES ('203', '440400', '珠海市', '440000', 'zhuhaishi');
INSERT INTO `cmf_city` VALUES ('204', '440500', '汕头市', '440000', 'shantoushi');
INSERT INTO `cmf_city` VALUES ('205', '440600', '佛山市', '440000', 'foshanshi');
INSERT INTO `cmf_city` VALUES ('206', '440700', '江门市', '440000', 'jiangmenshi');
INSERT INTO `cmf_city` VALUES ('207', '440800', '湛江市', '440000', 'zhanjiangshi');
INSERT INTO `cmf_city` VALUES ('208', '440900', '茂名市', '440000', 'maomingshi');
INSERT INTO `cmf_city` VALUES ('209', '441200', '肇庆市', '440000', 'zhaoqingshi');
INSERT INTO `cmf_city` VALUES ('210', '441300', '惠州市', '440000', 'huizhoushi');
INSERT INTO `cmf_city` VALUES ('211', '441400', '梅州市', '440000', 'meizhoushi');
INSERT INTO `cmf_city` VALUES ('212', '441500', '汕尾市', '440000', 'shanweishi');
INSERT INTO `cmf_city` VALUES ('213', '441600', '河源市', '440000', 'heyuanshi');
INSERT INTO `cmf_city` VALUES ('214', '441700', '阳江市', '440000', 'yangjiangshi');
INSERT INTO `cmf_city` VALUES ('215', '441800', '清远市', '440000', 'qingyuanshi');
INSERT INTO `cmf_city` VALUES ('216', '441900', '东莞市', '440000', 'dongguanshi');
INSERT INTO `cmf_city` VALUES ('217', '442000', '中山市', '440000', 'zhongshanshi');
INSERT INTO `cmf_city` VALUES ('218', '445100', '潮州市', '440000', 'chaozhoushi');
INSERT INTO `cmf_city` VALUES ('219', '445200', '揭阳市', '440000', 'jieyangshi');
INSERT INTO `cmf_city` VALUES ('220', '445300', '云浮市', '440000', 'yunfushi');
INSERT INTO `cmf_city` VALUES ('221', '450100', '南宁市', '450000', 'nanningshi');
INSERT INTO `cmf_city` VALUES ('222', '450200', '柳州市', '450000', 'liuzhoushi');
INSERT INTO `cmf_city` VALUES ('223', '450300', '桂林市', '450000', 'guilinshi');
INSERT INTO `cmf_city` VALUES ('224', '450400', '梧州市', '450000', 'wuzhoushi');
INSERT INTO `cmf_city` VALUES ('225', '450500', '北海市', '450000', 'beihaishi');
INSERT INTO `cmf_city` VALUES ('226', '450600', '防城港市', '450000', 'fangchenggangshi');
INSERT INTO `cmf_city` VALUES ('227', '450700', '钦州市', '450000', 'qinzhoushi');
INSERT INTO `cmf_city` VALUES ('228', '450800', '贵港市', '450000', 'guigangshi');
INSERT INTO `cmf_city` VALUES ('229', '450900', '玉林市', '450000', 'yulinshi');
INSERT INTO `cmf_city` VALUES ('230', '451000', '百色市', '450000', 'baiseshi');
INSERT INTO `cmf_city` VALUES ('231', '451100', '贺州市', '450000', 'hezhoushi');
INSERT INTO `cmf_city` VALUES ('232', '451200', '河池市', '450000', 'hechishi');
INSERT INTO `cmf_city` VALUES ('233', '451300', '来宾市', '450000', 'laibinshi');
INSERT INTO `cmf_city` VALUES ('234', '451400', '崇左市', '450000', 'chongzuoshi');
INSERT INTO `cmf_city` VALUES ('235', '460100', '海口市', '460000', 'haikoushi');
INSERT INTO `cmf_city` VALUES ('236', '460200', '三亚市', '460000', 'sanyashi');
INSERT INTO `cmf_city` VALUES ('237', '469000', '省直辖县级行政单位', '460000', 'shengzhixiaxianjixingzhengdanwei');
INSERT INTO `cmf_city` VALUES ('238', '500100', '重庆市', '500000', 'chongqingshi');
INSERT INTO `cmf_city` VALUES ('241', '510100', '成都市', '510000', 'chengdushi');
INSERT INTO `cmf_city` VALUES ('242', '510300', '自贡市', '510000', 'zigongshi');
INSERT INTO `cmf_city` VALUES ('243', '510400', '攀枝花市', '510000', 'panzhihuashi');
INSERT INTO `cmf_city` VALUES ('244', '510500', '泸州市', '510000', 'luzhoushi');
INSERT INTO `cmf_city` VALUES ('245', '510600', '德阳市', '510000', 'deyangshi');
INSERT INTO `cmf_city` VALUES ('246', '510700', '绵阳市', '510000', 'mianyangshi');
INSERT INTO `cmf_city` VALUES ('247', '510800', '广元市', '510000', 'guangyuanshi');
INSERT INTO `cmf_city` VALUES ('248', '510900', '遂宁市', '510000', 'suiningshi');
INSERT INTO `cmf_city` VALUES ('249', '511000', '内江市', '510000', 'neijiangshi');
INSERT INTO `cmf_city` VALUES ('250', '511100', '乐山市', '510000', 'leshanshi');
INSERT INTO `cmf_city` VALUES ('251', '511300', '南充市', '510000', 'nanchongshi');
INSERT INTO `cmf_city` VALUES ('252', '511400', '眉山市', '510000', 'meishanshi');
INSERT INTO `cmf_city` VALUES ('253', '511500', '宜宾市', '510000', 'yibinshi');
INSERT INTO `cmf_city` VALUES ('254', '511600', '广安市', '510000', 'guanganshi');
INSERT INTO `cmf_city` VALUES ('255', '511700', '达州市', '510000', 'dazhoushi');
INSERT INTO `cmf_city` VALUES ('256', '511800', '雅安市', '510000', 'yaanshi');
INSERT INTO `cmf_city` VALUES ('257', '511900', '巴中市', '510000', 'bazhongshi');
INSERT INTO `cmf_city` VALUES ('258', '512000', '资阳市', '510000', 'ziyangshi');
INSERT INTO `cmf_city` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000', 'abazangzuqiangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('260', '513300', '甘孜藏族自治州', '510000', 'ganzizangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('261', '513400', '凉山彝族自治州', '510000', 'liangshanyizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('262', '520100', '贵阳市', '520000', 'guiyangshi');
INSERT INTO `cmf_city` VALUES ('263', '520200', '六盘水市', '520000', 'liupanshuishi');
INSERT INTO `cmf_city` VALUES ('264', '520300', '遵义市', '520000', 'zunyishi');
INSERT INTO `cmf_city` VALUES ('265', '520400', '安顺市', '520000', 'anshunshi');
INSERT INTO `cmf_city` VALUES ('266', '522200', '铜仁地区', '520000', 'tongrendiqu');
INSERT INTO `cmf_city` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000', 'qianxinanbuyizumiaozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('268', '522400', '毕节地区', '520000', 'bijiediqu');
INSERT INTO `cmf_city` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000', 'qiandongnanmiaozudongzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000', 'qiannanbuyizumiaozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('271', '530100', '昆明市', '530000', 'kunmingshi');
INSERT INTO `cmf_city` VALUES ('272', '530300', '曲靖市', '530000', 'qujingshi');
INSERT INTO `cmf_city` VALUES ('273', '530400', '玉溪市', '530000', 'yuxishi');
INSERT INTO `cmf_city` VALUES ('274', '530500', '保山市', '530000', 'baoshanshi');
INSERT INTO `cmf_city` VALUES ('275', '530600', '昭通市', '530000', 'zhaotongshi');
INSERT INTO `cmf_city` VALUES ('276', '530700', '丽江市', '530000', 'lijiangshi');
INSERT INTO `cmf_city` VALUES ('277', '530800', '思茅市', '530000', 'simaoshi');
INSERT INTO `cmf_city` VALUES ('278', '530900', '临沧市', '530000', 'lincangshi');
INSERT INTO `cmf_city` VALUES ('279', '532300', '楚雄彝族自治州', '530000', 'chuxiongyizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000', 'honghehanizuyizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('281', '532600', '文山壮族苗族自治州', '530000', 'wenshanzhuangzumiaozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('282', '532800', '西双版纳傣族自治州', '530000', 'xishuangbannadaizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('283', '532900', '大理白族自治州', '530000', 'dalibaizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000', 'dehongdaizujingpozuzizhizhou');
INSERT INTO `cmf_city` VALUES ('285', '533300', '怒江傈僳族自治州', '530000', 'nujianglisuzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('286', '533400', '迪庆藏族自治州', '530000', 'diqingzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('287', '540100', '拉萨市', '540000', 'lasashi');
INSERT INTO `cmf_city` VALUES ('288', '542100', '昌都地区', '540000', 'changdudiqu');
INSERT INTO `cmf_city` VALUES ('289', '542200', '山南地区', '540000', 'shannandiqu');
INSERT INTO `cmf_city` VALUES ('290', '542300', '日喀则地区', '540000', 'rikazediqu');
INSERT INTO `cmf_city` VALUES ('291', '542400', '那曲地区', '540000', 'naqudiqu');
INSERT INTO `cmf_city` VALUES ('292', '542500', '阿里地区', '540000', 'alidiqu');
INSERT INTO `cmf_city` VALUES ('293', '542600', '林芝地区', '540000', 'linzhidiqu');
INSERT INTO `cmf_city` VALUES ('294', '610100', '西安市', '610000', 'xianshi');
INSERT INTO `cmf_city` VALUES ('295', '610200', '铜川市', '610000', 'tongchuanshi');
INSERT INTO `cmf_city` VALUES ('296', '610300', '宝鸡市', '610000', 'baojishi');
INSERT INTO `cmf_city` VALUES ('297', '610400', '咸阳市', '610000', 'xianyangshi');
INSERT INTO `cmf_city` VALUES ('298', '610500', '渭南市', '610000', 'weinanshi');
INSERT INTO `cmf_city` VALUES ('299', '610600', '延安市', '610000', 'yananshi');
INSERT INTO `cmf_city` VALUES ('300', '610700', '汉中市', '610000', 'hanzhongshi');
INSERT INTO `cmf_city` VALUES ('301', '610800', '榆林市', '610000', 'yulinshi');
INSERT INTO `cmf_city` VALUES ('302', '610900', '安康市', '610000', 'ankangshi');
INSERT INTO `cmf_city` VALUES ('303', '611000', '商洛市', '610000', 'shangluoshi');
INSERT INTO `cmf_city` VALUES ('304', '620100', '兰州市', '620000', 'lanzhoushi');
INSERT INTO `cmf_city` VALUES ('305', '620200', '嘉峪关市', '620000', 'jiayuguanshi');
INSERT INTO `cmf_city` VALUES ('306', '620300', '金昌市', '620000', 'jinchangshi');
INSERT INTO `cmf_city` VALUES ('307', '620400', '白银市', '620000', 'baiyinshi');
INSERT INTO `cmf_city` VALUES ('308', '620500', '天水市', '620000', 'tianshuishi');
INSERT INTO `cmf_city` VALUES ('309', '620600', '武威市', '620000', 'wuweishi');
INSERT INTO `cmf_city` VALUES ('310', '620700', '张掖市', '620000', 'zhangyeshi');
INSERT INTO `cmf_city` VALUES ('311', '620800', '平凉市', '620000', 'pingliangshi');
INSERT INTO `cmf_city` VALUES ('312', '620900', '酒泉市', '620000', 'jiuquanshi');
INSERT INTO `cmf_city` VALUES ('313', '621000', '庆阳市', '620000', 'qingyangshi');
INSERT INTO `cmf_city` VALUES ('314', '621100', '定西市', '620000', 'dingxishi');
INSERT INTO `cmf_city` VALUES ('315', '621200', '陇南市', '620000', 'longnanshi');
INSERT INTO `cmf_city` VALUES ('316', '622900', '临夏回族自治州', '620000', 'linxiahuizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('317', '623000', '甘南藏族自治州', '620000', 'gannanzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('318', '630100', '西宁市', '630000', 'xiningshi');
INSERT INTO `cmf_city` VALUES ('319', '632100', '海东地区', '630000', 'haidongdiqu');
INSERT INTO `cmf_city` VALUES ('320', '632200', '海北藏族自治州', '630000', 'haibeizangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('321', '632300', '黄南藏族自治州', '630000', 'huangnanzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('322', '632500', '海南藏族自治州', '630000', 'hainanzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('323', '632600', '果洛藏族自治州', '630000', 'guoluozangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('324', '632700', '玉树藏族自治州', '630000', 'yushuzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000', 'haiximengguzuzangzuzizhizhou');
INSERT INTO `cmf_city` VALUES ('326', '640100', '银川市', '640000', 'yinchuanshi');
INSERT INTO `cmf_city` VALUES ('327', '640200', '石嘴山市', '640000', 'shizuishanshi');
INSERT INTO `cmf_city` VALUES ('328', '640300', '吴忠市', '640000', 'wuzhongshi');
INSERT INTO `cmf_city` VALUES ('329', '640400', '固原市', '640000', 'guyuanshi');
INSERT INTO `cmf_city` VALUES ('330', '640500', '中卫市', '640000', 'zhongweishi');
INSERT INTO `cmf_city` VALUES ('331', '650100', '乌鲁木齐市', '650000', 'wulumuqishi');
INSERT INTO `cmf_city` VALUES ('332', '650200', '克拉玛依市', '650000', 'kelamayishi');
INSERT INTO `cmf_city` VALUES ('333', '652100', '吐鲁番地区', '650000', 'tulufandiqu');
INSERT INTO `cmf_city` VALUES ('334', '652200', '哈密地区', '650000', 'hamidiqu');
INSERT INTO `cmf_city` VALUES ('335', '652300', '昌吉回族自治州', '650000', 'changjihuizuzizhizhou');
INSERT INTO `cmf_city` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000', 'boertalamengguzizhizhou');
INSERT INTO `cmf_city` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000', 'bayinguolengmengguzizhizhou');
INSERT INTO `cmf_city` VALUES ('338', '652900', '阿克苏地区', '650000', 'akesudiqu');
INSERT INTO `cmf_city` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000', 'kezilesukeerkezizizhizhou');
INSERT INTO `cmf_city` VALUES ('340', '653100', '喀什地区', '650000', 'kashidiqu');
INSERT INTO `cmf_city` VALUES ('341', '653200', '和田地区', '650000', 'hetiandiqu');
INSERT INTO `cmf_city` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000', 'yilihasakezizhizhou');
INSERT INTO `cmf_city` VALUES ('343', '654200', '塔城地区', '650000', 'tachengdiqu');
INSERT INTO `cmf_city` VALUES ('344', '654300', '阿勒泰地区', '650000', 'aletaidiqu');
INSERT INTO `cmf_city` VALUES ('345', '659000', '省直辖行政单位', '650000', 'shengzhixiaxingzhengdanwei');

-- ----------------------------
-- Table structure for cmf_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_default_camera
-- ----------------------------
DROP TABLE IF EXISTS `cmf_default_camera`;
CREATE TABLE `cmf_default_camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `support_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_default_camera
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_default_hall
-- ----------------------------
DROP TABLE IF EXISTS `cmf_default_hall`;
CREATE TABLE `cmf_default_hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `abstract` varchar(255) NOT NULL,
  `content` text,
  `video` varchar(255) DEFAULT NULL COMMENT '礼堂视频',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论id',
  `support_id` int(11) DEFAULT NULL COMMENT '点赞id',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图',
  `type` varchar(255) NOT NULL COMMENT '礼堂分类',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_default_hall
-- ----------------------------
INSERT INTO `cmf_default_hall` VALUES ('17', '如果微软各位', '额外让他问过我', '为人体七号潜艇和肉体好人多坏人还特意我&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', 'portal/20190307/dd8718e844f8ea96fdb7cf97346c842b.mp4', null, null, 'admin/20190307/4729fef2db0d59901a00675846c3509a.png', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('18', '热舞如果温柔温热', '安慰发噶人', '沙尔会把恩伯&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('19', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？如下图', '问问哈维尔二号位', '虽然还不是让他能让你你&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('20', '而特温特伯', '色人格人格虽然', '虽然哈瑞特是如何突然e&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('22', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？如下图', '污染哇Bart', '无任何回报&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, 'default/20190307/962b0124e54a693ab8e3ab7035686f23.png', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('23', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '污染哇Bart', '而微软格尔&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('24', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', '围观围观我&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('25', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '污染哇Bart', '而且发给我few&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('26', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', '无任何如果&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('27', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', '围观围观&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('28', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', '问题歌曲环球网&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('29', '如果要进入网站和手机两种不同的控制器和页面，该怎么初始化？', '色人格人格虽然', '哇嘎嘎饿啊日&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '', null, null, '', '路桥街道', null, null);
INSERT INTO `cmf_default_hall` VALUES ('32', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '安慰发噶人', '', '', null, null, '', '路桥街道', '1551950230', '1551950230');

-- ----------------------------
-- Table structure for cmf_default_information
-- ----------------------------
DROP TABLE IF EXISTS `cmf_default_information`;
CREATE TABLE `cmf_default_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `support_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `abstract` varchar(255) DEFAULT NULL COMMENT '摘要',
  `cover` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '正文 ',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_default_information
-- ----------------------------
INSERT INTO `cmf_default_information` VALUES ('1', null, null, '本地', '而已哇', '安慰发噶人', '', '<p>war呵特&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;</p>', '1551953155', '1551955078');

-- ----------------------------
-- Table structure for cmf_defaut_info
-- ----------------------------
DROP TABLE IF EXISTS `cmf_defaut_info`;
CREATE TABLE `cmf_defaut_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about` text,
  `pics` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_defaut_info
-- ----------------------------
INSERT INTO `cmf_defaut_info` VALUES ('1', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">今天3月8号，是妇女节，也是漫威首部女性超级英雄电影《惊奇队长》在国内上映的日子。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">作为漫威第一部以女性超级英雄为主角、宣传女性力量的电影，特地选在国际妇女节这天上映，也算是用心良苦了。</span></p><p><img class=\"normal\" width=\"500px\" src=\"https://pics4.baidu.com/feed/6a600c338744ebf8fb20c9148e3dac2e6159a795.jpeg?token=2b0209cd8e88e08437f491847b59d50b&s=9AB7B0AEA0CB44F44FA53EB70300C016\" style=\"border: 0px; display: block; margin: 0px auto;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">但是呢，就在前一天，漫威影业官方微博，却因为一句“祝福”闯下大祸。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">3月7日，漫威影业官方微博特意给全中国女生送来独家祝福，祝大家女生节快乐!</span></p><p><img class=\"large\" src=\"https://pics0.baidu.com/feed/e1fe9925bc315c60be8f1e3adb75b01748547711.jpeg?token=cda53bef143a37cac45d9e83d1fec85f&s=0100DC1376AF3AAC2CA889E0030070A3\" style=\"border: 0px; width: 537px; display: block;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">结果，评论一片痛骂漫威宣发的：</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">@林竹：漫威影业这条不删，这电影本妇女就不去看了</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">@渣六六抱着抖森说：已知：宣传女性力量的电影强行把劳动妇女节说成女生节，求：漫威中国的全体员工到底有多恨漫威?</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">@萝贝贝：《惊奇队长》三八妇女节上映，中国宣发主动过女生节……这跟头翻得……</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">@爬墙专业Phd毕业卡:文案出来行么?第一部女性超英电影宣传什么 女生节 像话么???</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">而漫威这个翻车就翻在“<span class=\"bjh-strong\" style=\"font-size: 18px; font-weight: 700;\">女生节</span>”这个关键点上。</span></p><p><img class=\"large\" src=\"https://pics3.baidu.com/feed/77094b36acaf2edd0f718720d8d47aed3b019344.jpeg?token=e5a74013b2d6d6f479ebf9fd989ef75d&s=538298458A632B1D80AD49B70300C042\" style=\"border: 0px; width: 537px; display: block;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">这个节到底有什么问题呢?</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">这个节定在3月7号，与3月8号妇女节只有一日之差，一开始是中国高校发起的关爱女生、展示女生风采的节日。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">但逐渐的，就开始偏离初衷了，高校女生节大尺度横幅事件频出，标语中出现了许多不堪入目的话语，涉及“性骚扰”、“性别歧视”......各种荤段子(一“日”之后就是妇女)，给这个节日蒙上了猥琐与歧视的阴影。</span></p><p><img class=\"large\" src=\"https://pics1.baidu.com/feed/37d12f2eb9389b50cf38e76ed2f19ed9e6116e0b.jpeg?token=a1e02a2084e650a5b4188b61ff79503d&s=2C921CD74C70BBCC0032DDBB03005019\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"normal\" width=\"480px\" src=\"https://pics3.baidu.com/feed/9f2f070828381f30b50155a0ffc5370c6f06f0ec.jpeg?token=cd450b99fc4b1993d7751acfbc5d313c&s=F7FA19D690340F8EDC86B5E10300F021\" style=\"border: 0px; display: block; margin: 0px auto;\"/></p><p><img class=\"large\" src=\"https://pics3.baidu.com/feed/2934349b033b5bb53fe285196317ae3db700bc6d.jpeg?token=b1aeb00276b5a25ba67f587c562dfabe&s=76E008F34C983C45701F96A90300400D\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics2.baidu.com/feed/241f95cad1c8a78674ee52e232cdb23972cf505a.jpeg?token=7334630f31da3e7e015053835037dc66&s=6A8223C14A63BA4D289D05BD03001002\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics0.baidu.com/feed/0b46f21fbe096b636d79b1ef5af7fc40eaf8ac72.jpeg?token=e9bef903ee8ae410a9221f666d261924&s=0E3261846402AAEE193CC4B90300D003\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics7.baidu.com/feed/8601a18b87d6277fd4c1fc467efc6434eb24fcc2.jpeg?token=7d2faf1b0083f183e280403615b61508\" style=\"border: 0px; width: 537px; display: block;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">而且，这个节叫做“女生节”，而不是“妇女节”或直译为“国际女性日”，刻意地将“女性”划分为了“女生”(年轻可追求)和“妇女”(年老退出异性恋婚恋市场)两个人群，在分等的过程中形成了隐性歧视，即年轻漂亮的“女生”被放在了等级最高的位置，随着婚育和年龄增长而贬值。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">慢慢的，不少年轻女性也开始迎合这种男性本位的歧视，自己都接受不了妇女节，潜意识里觉得妇女=已婚女人=非处女……于是，大家都不爱过妇女节，也不喜欢被叫“妇女”。</span></p><p><img class=\"large\" src=\"https://pics3.baidu.com/feed/64380cd7912397dd1ddb72da0c46c9b3d2a28793.jpeg?token=8f36ebc579e2d133cdc8ecd71481832b&s=A29CE12340A233AD210405E703003021\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics5.baidu.com/feed/0dd7912397dda144b828df1de473aba60df48640.jpeg?token=3d8bd3534ba44929d33877196896862c&s=C089BB554241334D34344CA60300E043\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics7.baidu.com/feed/b151f8198618367a9841b3f679b7f0d0b21ce51e.jpeg?token=ee96bf0fcddc01d10e60ea1025f051cc&s=CAA9BB4542013B4D363C4CA6030070C3\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics0.baidu.com/feed/14ce36d3d539b6009e92df9bbe944e2ec75cb783.jpeg?token=6304db01a71466adebc65eb415d89e94&s=4AABAB4542513BC8363C5CA20300E0C1\" style=\"border: 0px; width: 537px; display: block;\"/></p><p><img class=\"large\" src=\"https://pics7.baidu.com/feed/1f178a82b9014a90f4ce4297ffb34216b21bee74.jpeg?token=2908513c4eb5f03666359d0b6ab9d2a9&s=3BD6E8128EF84C88566597F10300C03D\" style=\"border: 0px; width: 537px; display: block;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">不仅要避开妇女节，提前一天搞出一个女生节。即使是妇女节当天也不好好叫妇女节，要叫什么女王节、女神节，最后被商家炒作利用来成了购物节......</span></p><p><img class=\"normal\" width=\"482px\" src=\"https://pics5.baidu.com/feed/cefc1e178a82b9014939c69d2649d2733b12efd4.jpeg?token=dc23c60d018f4d60adb48b46bc02e3ae&s=3FB049814A71349A3E858C870300C083\" style=\"border: 0px; display: block; margin: 0px auto;\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">要知道，这跟妇女节本身的意义根本背道而驰。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">国际劳动妇女节，全称“联合国妇女权益和国际和平日”或“联合国女权和国际和平日”，是为纪念妇女权利运动而设立的节日。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">这一天，是为了庆祝妇女在经济、政治和社会等领域做出的重要贡献和取得的巨大成就。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">这一天，也是一个号角，号召协力争取妇女权利和妇女对政治经济事务的参与。</span></p><audio controls=\"controls\" style=\"display: none;\"></audio>', null);

-- ----------------------------
-- Table structure for cmf_gxzh_answer
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_answer`;
CREATE TABLE `cmf_gxzh_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `uid` int(11) NOT NULL COMMENT '提问者uid',
  `doctor_uid` int(11) NOT NULL COMMENT '回答者uid',
  `grasp_rate` int(11) NOT NULL DEFAULT '0' COMMENT '把握率',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '1未被选择 2已选择',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `chat_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未结束 1已结束',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_type` varchar(255) NOT NULL DEFAULT '' COMMENT '支付方式   wechat:微信   alipay:支付宝  balance余额支付',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0代付款 1付款成功',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL COMMENT '完成时间',
  `isclose` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未结账 1已结账',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_answer
-- ----------------------------
INSERT INTO `cmf_gxzh_answer` VALUES ('1', '6', '4', '4', '100', '25.00', '1', '天咯来咯', '0', '0', '', '0.00', '', '0', '1550303873', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('2', '2', '4', '4', '100', '25.00', '1', '陌陌陌陌粉末', '0', '0', '', '0.00', '', '0', '1550304159', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('3', '3', '4', '4', '98', '25.00', '1', '摸鸡鸡', '0', '0', '', '0.00', '', '0', '1550304305', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('4', '4', '4', '4', '68', '25.00', '1', '兔子咋啦啊', '0', '0', '', '0.00', '', '0', '1550304347', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('5', '7', '4', '4', '98', '23.00', '2', '陆陆续续', '0', '0', 'pitchon_5', '23.00', 'balance', '1', '1550304444', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('6', '17', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550473971', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('7', '18', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550474066', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('8', '19', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550474258', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('9', '20', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550474336', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('10', '21', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550474399', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('11', '22', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476438', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('12', '23', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476474', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('13', '24', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476633', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('14', '25', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476743', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('15', '26', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476804', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('16', '27', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476879', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('17', '28', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476908', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('18', '29', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550476937', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('19', '30', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550477073', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('20', '31', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550477311', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('21', '32', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550477540', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('22', '33', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550477568', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('23', '35', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550477924', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('24', '36', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478011', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('25', '37', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478140', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('26', '38', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478170', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('27', '39', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478240', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('28', '40', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478382', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('29', '41', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478404', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('30', '42', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550478454', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('31', '43', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_31', '36.00', 'balance', '1', '1550478899', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('32', '44', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_32', '36.00', 'balance', '1', '1550479124', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('33', '45', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_33', '36.00', 'balance', '1', '1550479196', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('34', '46', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_34', '36.00', 'balance', '1', '1550479210', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('35', '47', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_35', '36.00', 'balance', '1', '1550479266', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('36', '48', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_36', '36.00', 'balance', '1', '1550479284', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('37', '49', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_37', '36.00', 'balance', '1', '1550479443', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('38', '50', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_38', '36.00', 'balance', '1', '1550479454', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('39', '51', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_39', '36.00', 'balance', '1', '1550479575', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('40', '52', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_40', '36.00', 'balance', '1', '1550479684', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('41', '53', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_41', '36.00', 'balance', '1', '1550480268', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('42', '54', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_42', '36.00', 'balance', '1', '1550480280', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('43', '55', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_43', '36.00', 'balance', '1', '1550480389', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('44', '56', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_44', '36.00', 'balance', '1', '1550480409', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('45', '57', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_45', '36.00', 'balance', '1', '1550480455', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('46', '58', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_46', '36.00', 'balance', '1', '1550480468', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('47', '59', '4', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550480469', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('48', '60', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_48', '36.00', 'balance', '1', '1550480724', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('49', '61', '4', '4', '99', '36.00', '2', '', '1', '0', 'pitchon_49', '36.00', 'balance', '1', '1550480845', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('50', '62', '4', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_50', '36.00', 'balance', '1', '1550480905', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('51', '63', '2', '4', '98', '36.00', '2', '炒股哈哈刚刚个', '0', '0', 'pitchon_51', '36.00', 'balance', '1', '1550482631', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('52', '66', '2', '4', '98', '25.00', '2', '吃v就几句话', '1', '0', 'pitchon_52', '25.00', 'balance', '1', '1550483418', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('53', '67', '2', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_53', '36.00', 'balance', '1', '1550483929', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('54', '68', '2', '4', '98', '588.00', '2', '规律不不不', '0', '0', 'pitchon_54', '588.00', 'balance', '1', '1550484130', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('55', '69', '2', '4', '98', '366.00', '2', '不好好还好吧', '1', '0', 'pitchon_55', '366.00', 'balance', '1', '1550484377', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('56', '70', '4', '2', '98', '26.00', '2', '啦咯6嗯早', '0', '0', 'pitchon_56', '26.00', 'balance', '1', '1550484562', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('57', '4', '4', '2', '1', '1.00', '1', '，', '0', '0', '', '0.00', '', '0', '1550489238', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('58', '71', '2', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_58', '36.00', 'balance', '1', '1550489381', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('59', '73', '5', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1550501446', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('60', '74', '5', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_60', '36.00', 'balance', '1', '1550501654', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('61', '76', '5', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_61', '36.00', 'balance', '1', '1550539201', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('62', '77', '5', '4', '99', '36.00', '2', '', '1', '0', 'pitchon_62', '36.00', 'balance', '1', '1550539237', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('63', '72', '5', '4', '100', '36.00', '1', '好几遍vv', '0', '0', '', '0.00', '', '0', '1550540095', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('64', '78', '9', '4', '100', '25.00', '2', '退咯们弄', '0', '0', 'pitchon_64', '25.00', 'balance', '1', '1550541944', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('65', '80', '9', '4', '69', '885.00', '2', '有图', '1', '0', 'pitchon_65', '885.00', 'balance', '1', '1550554681', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('66', '80', '9', '7', '99', '15.00', '2', '明年', '1', '0', 'pitchon_66', '15.00', 'balance', '1', '1550564451', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('67', '81', '5', '7', '99', '12.00', '2', '494949', '1', '0', 'pitchon_67', '12.00', 'balance', '1', '1550564477', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('68', '82', '5', '7', '100', '1.00', '2', '76888', '1', '0', 'pitchon_68', '1.00', 'balance', '1', '1550586839', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('69', '84', '9', '4', '66', '55.00', '2', '与提高1咯女KKK', '1', '0', 'pitchon_69', '55.00', 'balance', '1', '1550643053', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('70', '85', '2', '4', '99', '36.00', '2', '', '1', '0', 'pitchon_70', '36.00', 'balance', '1', '1550663761', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('71', '86', '5', '7', '98', '10.00', '2', '我根厉害', '1', '0', 'pitchon_71', '10.00', 'balance', '1', '1550714778', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('72', '87', '9', '4', '98', '25.00', '1', '恶魔www', '0', '0', '', '0.00', '', '0', '1550804434', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('73', '88', '4', '9', '98', '25.00', '1', '几个哈哈哈哈', '0', '0', '', '0.00', '', '0', '1550808403', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('74', '90', '9', '4', '100', '66.00', '1', '娜可露露', '0', '0', '', '0.00', '', '0', '1550815001', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('75', '89', '5', '7', '99', '100.00', '2', '同乐具体', '1', '0', 'pitchon_75_1550817997', '100.00', 'balance', '1', '1550817937', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('76', '96', '5', '7', '99', '20.00', '2', '', '0', '0', 'pitchon_76_1550905178', '20.00', 'balance', '1', '1550905174', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('77', '97', '13', '2', '1', '0.01', '1', 'q', '0', '0', '', '0.00', '', '0', '1550911716', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('78', '99', '2', '13', '1', '0.01', '2', 'q', '0', '0', 'pitchon_78_1550912594', '0.01', 'alipay', '1', '1550912549', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('79', '98', '5', '7', '99', '0.20', '2', '娜可露露', '1', '0', 'pitchon_79_1550913382', '0.20', 'alipay', '1', '1550913191', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('80', '100', '2', '13', '99', '0.01', '2', '', '1', '0', 'pitchon_80_1550913257', '0.01', 'wechat', '1', '1550913253', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('81', '101', '5', '7', '99', '0.03', '2', '测试抢单系统啦。本我默默默默哦摸摸摸摸摸摸中央音乐学院YY信息戏子无义YY知我者谓我心忧知我者谓我心忧我现在', '1', '0', 'pitchon_81_1550921127', '0.03', 'balance', '1', '1550920737', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('82', '102', '5', '7', '99', '20.00', '2', '', '0', '0', '', '0.00', '', '0', '1550922209', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('83', '103', '5', '7', '99', '0.10', '2', '', '0', '0', '', '0.00', '', '0', '1550922674', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('84', '104', '5', '7', '99', '0.10', '2', '', '0', '0', 'pitchon_84_1550922731', '0.10', 'wechat', '1', '1550922727', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('85', '105', '5', '7', '99', '0.10', '2', '', '0', '0', 'pitchon_85_1550922887', '0.10', 'wechat', '1', '1550922883', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('86', '101', '5', '14', '95', '0.30', '2', '环境监控', '1', '0', 'pitchon_86_1550961162', '0.30', 'balance', '1', '1550961066', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('87', '107', '5', '4', '99', '36.00', '2', '', '0', '0', 'pitchon_87_1550961798', '36.00', 'balance', '1', '1550961794', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('88', '98', '5', '14', '100', '5.00', '2', '855', '1', '0', 'pitchon_88_1551265840', '5.00', 'balance', '1', '1550997580', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('89', '110', '5', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1550998897', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('90', '90', '9', '2', '1', '1.00', '1', '，', '0', '0', '', '0.00', '', '0', '1550999018', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('91', '90', '9', '5', '41', '1.00', '1', '488', '0', '0', '', '0.00', '', '0', '1550999570', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('92', '108', '15', '5', '80', '1.00', '1', 'ffff', '0', '0', '', '0.00', '', '0', '1551090174', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('93', '115', '5', '14', '80', '8.00', '2', 'qqwww', '1', '0', 'pitchon_93_1551090739', '8.00', 'balance', '1', '1551090434', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('94', '116', '14', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1551090981', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('95', '117', '14', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1551091045', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('96', '118', '5', '14', '99', '0.10', '2', '', '1', '0', 'pitchon_96_1551091371', '0.10', 'balance', '1', '1551091365', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('97', '119', '5', '7', '99', '0.10', '2', '', '0', '0', 'pitchon_97_1551092212', '0.10', 'balance', '1', '1551092208', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('98', '120', '5', '7', '99', '0.10', '2', '', '0', '0', 'pitchon_98_1551092999', '0.10', 'balance', '1', '1551092995', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('99', '122', '5', '7', '99', '0.10', '2', '', '0', '0', '', '0.00', '', '0', '1551094063', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('100', '123', '15', '5', '99', '0.10', '2', '测试有没有你觉得不好的地方，有没有bug', '0', '0', 'pitchon_100_1551573400', '0.10', 'wechat', '1', '1551100521', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('101', '123', '15', '14', '100', '0.02', '1', '我另外一个账号测试的，冒', '0', '0', '', '0.00', '', '0', '1551100632', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('102', '114', '5', '14', '99', '12.00', '2', '4949', '1', '0', 'pitchon_102_1551102959', '12.00', 'balance', '1', '1551102931', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('103', '124', '5', '7', '99', '1.00', '2', '7949494', '1', '0', 'pitchon_103_1551150103', '1.00', 'balance', '1', '1551149348', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('104', '124', '5', '14', '99', '0.50', '2', '明年', '1', '0', 'pitchon_104_1551150125', '0.50', 'balance', '1', '1551149415', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('105', '125', '5', '14', '99', '0.10', '2', '', '0', '0', 'pitchon_105_1551150303', '0.10', 'balance', '1', '1551150300', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('106', '128', '7', '5', '99', '1.00', '2', '79794', '0', '0', 'pitchon_106_1551183211', '1.00', 'balance', '1', '1551183194', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('107', '123', '15', '7', '12', '1.00', '1', '556', '0', '0', '', '0.00', '', '0', '1551185005', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('108', '129', '5', '7', '100', '1.00', '1', '89666', '0', '0', '', '0.00', '', '0', '1551185070', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('109', '131', '5', '24', '100', '1.00', '2', '86585', '0', '0', 'pitchon_109_1551271849', '1.00', 'balance', '1', '1551271812', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('110', '130', '5', '24', '99', '1.00', '1', '94991', '0', '0', '', '0.00', '', '0', '1551272202', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('111', '132', '5', '24', '99', '1.00', '2', '97949', '0', '0', 'pitchon_111_1551272314', '1.00', 'balance', '1', '1551272295', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('112', '133', '5', '24', '100', '1.00', '2', '8988', '0', '0', 'pitchon_112_1551272764', '1.00', 'balance', '1', '1551272705', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('113', '134', '5', '24', '100', '0.10', '2', '94749', '0', '0', 'pitchon_113_1551273847', '0.10', 'wechat', '1', '1551273735', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('114', '135', '5', '24', '100', '0.01', '2', '4994', '0', '0', 'pitchon_114_1551274122', '0.01', 'wechat', '1', '1551274026', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('115', '129', '5', '24', '100', '0.10', '1', '949494', '0', '0', '', '0.00', '', '0', '1551324572', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('116', '138', '5', '24', '100', '100.00', '2', '464994', '1', '0', 'pitchon_116_1551340839', '100.00', 'balance', '1', '1551340810', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('117', '139', '9', '4', '99', '88.00', '2', '', '0', '0', '', '0.00', '', '0', '1551347517', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('118', '140', '9', '4', '99', '88.00', '2', '', '0', '0', '', '0.00', '', '0', '1551347721', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('119', '141', '5', '24', '100', '100.00', '2', '9494994', '1', '0', 'pitchon_119_1551351169', '100.00', 'balance', '1', '1551351141', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('120', '142', '5', '14', '99', '0.10', '2', '', '0', '0', '', '0.00', '', '0', '1551351562', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('121', '143', '5', '14', '99', '0.10', '2', '', '1', '0', 'pitchon_121_1551351859', '0.10', 'balance', '1', '1551351855', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('122', '144', '5', '14', '99', '0.10', '2', '', '0', '0', 'pitchon_122_1551352046', '0.10', 'balance', '1', '1551352043', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('123', '145', '9', '4', '99', '88.00', '2', '', '0', '0', '', '0.00', '', '0', '1551402719', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('124', '146', '9', '4', '99', '88.00', '2', '', '0', '0', '', '0.00', '', '0', '1551402776', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('125', '147', '9', '4', '99', '88.00', '2', '', '0', '0', '', '0.00', '', '0', '1551406663', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('126', '151', '4', '9', '69', '25.00', '1', '来咯哦哦哦兔兔', '0', '0', '', '0.00', '', '0', '1551408317', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('127', '153', '4', '9', '98', '55559.00', '2', '咯哦哦www五', '0', '0', 'pitchon_127_1551408538', '55559.00', 'balance', '1', '1551408508', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('128', '154', '23', '2', '1', '0.01', '2', '22', '1', '0', 'pitchon_128_1551416727', '0.01', 'balance', '1', '1551414891', null, '1551416773', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('129', '155', '2', '23', '99', '0.01', '2', '', '1', '0', 'pitchon_129_1551416387', '0.01', 'balance', '1', '1551416375', null, '1551416572', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('130', '156', '9', '4', '100', '588.00', '2', 'KTV图T1', '1', '0', 'pitchon_130_1551442388', '588.00', 'balance', '1', '1551442377', null, '1551444518', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('131', '158', '9', '4', '66', '55.00', '2', '漏啦', '0', '0', 'pitchon_131_1551444931', '55.00', 'balance', '1', '1551444925', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('132', '160', '5', '14', '100', '100.00', '2', '64949', '1', '0', 'pitchon_132_1551451565', '100.00', 'balance', '1', '1551449706', null, '1551451207', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('133', '161', '5', '14', '100', '150.00', '2', '哦里', '1', '0', 'pitchon_133_1551451593', '150.00', 'balance', '1', '1551451515', null, '1551451629', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('134', '162', '14', '5', '100', '1.00', '2', '56898899988999988998', '1', '0', 'pitchon_134_1551492464', '1.00', 'balance', '1', '1551492317', null, '1551492563', '1');
INSERT INTO `cmf_gxzh_answer` VALUES ('135', '163', '14', '5', '100', '99.00', '2', '86898', '1', '0', 'pitchon_135_1551495554', '99.00', 'balance', '1', '1551495509', null, '1551495567', '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('136', '164', '2', '9', '1', '5.01', '2', '医院', '0', '1', 'pitchon_136_1551498294', '0.01', 'wechat', '1', '1551496141', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('137', '165', '2', '4', '1', '6.01', '2', '更好', '0', '4', 'pitchon_137_1551498497', '0.01', 'alipay', '1', '1551498464', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('138', '157', '9', '2', '1', '1.00', '1', '。。', '0', '0', '', '0.00', '', '0', '1551511611', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('139', '157', '9', '4', '100', '8.00', '1', '我女哦哦', '0', '0', '', '0.00', '', '0', '1551511671', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('140', '167', '5', '7', '98', '99.00', '1', '测试啦啦啦', '0', '0', '', '0.00', '', '0', '1551514184', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('141', '170', '31', '5', '99', '500.00', '2', '', '0', '0', '', '0.00', '', '0', '1551525102', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('142', '169', '31', '5', '100', '0.01', '2', 'fog', '0', '0', 'pitchon_142_1551529911', '0.01', 'wechat', '1', '1551527253', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('143', '169', '31', '14', '80', '10.00', '1', 'Fog2', '0', '0', '', '0.00', '', '0', '1551527323', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('144', '173', '31', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1551528654', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('145', '172', '31', '14', '100', '0.01', '1', '7987', '0', '0', '', '0.00', '', '0', '1551530087', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('146', '172', '31', '5', '88', '0.02', '1', 'Fog', '0', '0', '', '0.00', '', '0', '1551530140', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('147', '168', '29', '5', '100', '0.01', '1', '跟我走就对了', '0', '0', '', '0.00', '', '0', '1551532758', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('148', '175', '5', '14', '99', '0.10', '2', '', '0', '0', 'pitchon_148_1551572982', '0.10', 'balance', '1', '1551572979', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('149', '172', '31', '15', '100', '1.00', '1', 'qqq', '0', '0', '', '0.00', '', '0', '1551573538', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('150', '141', '5', '15', '100', '1.00', '1', 'qqqq', '0', '0', '', '0.00', '', '0', '1551573631', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('151', '178', '31', '14', '100', '0.01', '1', ' Fog', '0', '0', '', '0.00', '', '0', '1551575484', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('152', '178', '31', '5', '99', '0.02', '2', 'Fog2', '0', '0', 'pitchon_152_1551576362', '0.02', 'wechat', '1', '1551575507', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('153', '182', '31', '14', '99', '0.02', '1', 'f', '0', '0', '', '0.00', '', '0', '1551575620', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('154', '180', '31', '14', '100', '0.01', '1', '68566', '0', '0', '', '0.00', '', '0', '1551575656', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('155', '183', '31', '5', '99', '0.01', '2', '8655', '0', '0', 'pitchon_155_1551576035', '0.01', 'wechat', '1', '1551575672', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('156', '185', '31', '14', '100', '0.01', '1', '655', '0', '0', '', '0.00', '', '0', '1551577005', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('157', '185', '31', '5', '95', '0.02', '2', '5555', '0', '0', 'pitchon_157_1551577778', '0.02', 'wechat', '1', '1551577024', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('158', '186', '33', '5', '99', '100.00', '2', '', '0', '0', '', '0.00', '', '0', '1551577794', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('159', '187', '33', '14', '100', '0.01', '1', '9464949', '0', '0', '', '0.00', '', '0', '1551578271', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('160', '187', '33', '5', '80', '0.01', '1', '94949', '0', '0', '', '0.00', '', '0', '1551578283', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('161', '188', '14', '31', '95', '1.50', '2', '什么问题说', '1', '0', 'pitchon_161_1551586024', '1.50', 'balance', '1', '1551581049', null, '1551586341', '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('162', '188', '14', '17', '55', '1.00', '1', '5555', '0', '0', '', '0.00', '', '0', '1551586183', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('163', '188', '14', '5', '100', '1.00', '2', '咯哦', '0', '0', 'pitchon_163_1551672679', '1.00', 'balance', '1', '1551586292', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('164', '184', '31', '14', '100', '1.00', '1', '64646', '0', '0', '', '0.00', '', '0', '1551597402', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('165', '189', '4', '9', '36', '258.00', '1', 'hhhb ', '0', '0', '', '0.00', '', '0', '1551664804', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('166', '190', '14', '5', '99', '105.00', '2', '测试', '0', '0', 'pitchon_166_1551673001', '105.00', 'balance', '1', '1551672814', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('167', '191', '14', '5', '100', '25.00', '1', '94949', '0', '0', '', '0.00', '', '0', '1551672977', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('168', '192', '14', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1551673046', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('169', '193', '14', '5', '99', '10.00', '2', '', '0', '0', 'pitchon_169_1551673085', '10.00', 'balance', '1', '1551673083', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('170', '194', '14', '5', '99', '10.00', '2', '', '0', '0', 'pitchon_170_1551673149', '10.00', 'balance', '1', '1551673147', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('171', '195', '14', '5', '99', '10.00', '2', '', '0', '0', 'pitchon_171_1551673195', '10.00', 'balance', '1', '1551673190', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('172', '197', '14', '5', '100', '169118.00', '1', '84848', '0', '0', '', '0.00', '', '0', '1551679712', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('173', '196', '14', '5', '100', '1.00', '2', '94994', '0', '0', 'pitchon_173_1551681136', '1.00', 'balance', '1', '1551681111', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('174', '205', '4', '5', '99', '10.00', '2', '', '0', '0', '', '0.00', '', '0', '1551695116', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('175', '201', '20', '9', '45', '455.00', '1', '退款', '0', '0', '', '0.00', '', '0', '1551696912', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('176', '211', '9', '2', '99', '2.00', '2', '', '0', '0', '', '0.00', '', '0', '1551697245', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('177', '212', '9', '2', '99', '2.00', '2', '', '0', '0', '', '0.00', '', '0', '1551697268', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('178', '213', '9', '2', '99', '2.00', '2', '', '0', '0', '', '0.00', '', '0', '1551697359', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('179', '214', '14', '5', '99', '10.00', '2', '', '0', '0', 'pitchon_179_1551699760', '10.00', 'balance', '1', '1551699757', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('180', '215', '14', '5', '99', '10.00', '2', '', '0', '0', 'pitchon_180_1551699941', '10.00', 'balance', '1', '1551699938', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('181', '179', '31', '5', '90', '1.00', '1', '11114', '0', '0', '', '0.00', '', '0', '1551706338', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('182', '216', '5', '14', '99', '0.10', '2', '', '0', '0', 'pitchon_182_1551707310', '0.10', 'balance', '1', '1551707297', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('183', '217', '14', '5', '100', '2000.00', '1', '我做个这个', '0', '0', '', '0.00', '', '0', '1551745224', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('184', '219', '9', '5', '99', '100.00', '2', '', '0', '0', 'pitchon_184_1551748188', '100.00', 'balance', '1', '1551748185', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('185', '221', '5', '14', '99', '0.10', '2', '', '0', '0', 'pitchon_185_1551753216', '0.10', 'balance', '1', '1551753213', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('186', '222', '5', '14', '100', '100.00', '1', '这个问题我能解决', '0', '0', '', '0.00', '', '0', '1551754143', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('187', '224', '34', '5', '99', '100.00', '2', '', '0', '0', '', '0.00', '', '0', '1551762279', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('188', '225', '4', '5', '99', '100.00', '2', '', '0', '0', '', '0.00', '', '0', '1551774301', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('189', '226', '4', '5', '99', '100.00', '2', '', '0', '0', '', '0.00', '', '0', '1551774413', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('190', '227', '4', '5', '99', '100.00', '2', '', '0', '0', '', '0.00', '', '0', '1551774414', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('191', '228', '4', '5', '99', '100.00', '2', '', '0', '0', 'pitchon_191_1551774542', '100.00', 'balance', '1', '1551774516', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('192', '229', '20', '9', '96', '55.00', '1', '还好吧那你呢', '0', '0', '', '0.00', '', '0', '1551774753', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('193', '230', '20', '9', '66', '6652.00', '2', '把换个衣服VB', '0', '0', 'pitchon_193_1551777015', '6652.00', 'balance', '1', '1551774841', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('194', '231', '20', '9', '98', '0.10', '1', '哦兔兔', '0', '0', '', '0.00', '', '0', '1551790228', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('195', '232', '34', '4', '99', '36.00', '2', '', '0', '0', '', '0.00', '', '0', '1551796201', null, null, '0');
INSERT INTO `cmf_gxzh_answer` VALUES ('196', '233', '22', '14', '100', '1.00', '1', '8685', '0', '0', '', '0.00', '', '0', '1551830216', null, null, '0');

-- ----------------------------
-- Table structure for cmf_gxzh_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_chatlog`;
CREATE TABLE `cmf_gxzh_chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL COMMENT '接收用户id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `to` int(11) DEFAULT NULL COMMENT '发送用户id',
  `status` int(2) DEFAULT '1' COMMENT '发送状态：0-未发送,1-已发送',
  `content` varchar(1500) NOT NULL COMMENT '聊天内容',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '语音时长',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `type` varchar(50) NOT NULL DEFAULT 'msg' COMMENT '消息类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_chatlog
-- ----------------------------
INSERT INTO `cmf_gxzh_chatlog` VALUES ('1', '2', '51', '4', '1', '你那里', '0', '1550482681', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('2', '2', '53', '4', '1', '哦哦哦', '0', '1550484059', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('3', '2', '55', '4', '1', '噜噜噜', '0', '1550484403', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('4', '4', '56', '2', '1', '[object Object]', '0', '1550485487', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('5', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/1bbc0caecb8bc8ac7f8361ecbe92cb56.mp3', '0', '1550485581', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('6', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/b6b31443f74c9609d4f67999339795af.mp3', '0', '1550485758', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('7', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/fe3e510591248b7d096c825da56b981e.mp3', '0', '1550485870', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('8', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/f8487198f7586dfea17592e5f98c254c.mp3', '0', '1550485877', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('9', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/2da4c5285a984000b54e5f315e02400d.mp3', '0', '1550485924', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('10', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/e47449c576ea821477feb6ea7aca4abf.mp3', '0', '1550486066', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('11', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/bf8f99a1f342c778ad6834e7055eb06b.mp3', '0', '1550486172', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('12', '4', '56', '2', '1', '把那你呢', '0', '1550486264', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('13', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/b70a84537ae00437e5810d2bc87c3cc4.mp3', '0', '1550486357', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('14', '4', '56', '2', '1', '皇后娘娘', '0', '1550486520', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('15', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/12ac92b7ef0a23155e0fc63503a16ab2.jpg', '0', '1550486766', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('16', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/eff56665b534e551edcb7a8532bdfba2.mp3', '0', '1550486791', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('17', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/1ef581197355332fe12a39b335b8a5b3.mp3', '0', '1550486871', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('18', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/7873b0957e5fc73cf793ae7a1e8aff22.mp3', '0', '1550486976', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('19', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/65f84e702b25cbd9161d0e5fc95ee033.mp3', '0', '1550487046', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('20', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/f2056e5edff03666cf42c25975212966.mp3', '0', '1550487092', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('21', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/3205a7536736a37c33e4b7e1b4465ebb.mp3', '0', '1550487393', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('22', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/69d6582e0a9a93c320e4455344e0fd51.mp3', '0', '1550487618', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('23', '2', '55', '4', '1', '菩提', '0', '1550488168', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('24', '4', '58', '2', '1', 'QQ', '0', '1550489943', '1550489943', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('25', '4', '58', '2', '1', '任天野', '0', '1550489949', '1550489949', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('26', '2', '58', '4', '1', '，，', '0', '1550489954', '1550489954', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('27', '2', '58', '4', '1', '海陆空', '0', '1550489959', '1550489959', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('28', '4', '58', '2', '1', '探讨探讨', '0', '1550490039', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('29', '5', '60', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/e6a093e6a49b62073193fa2f3afbb713.mp3', '0', '1550501698', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('30', '5', '60', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190218/f89a38aa79ea2428b2acfce972819adc.mp3', '0', '1550501710', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('31', '5', '60', '4', '1', 'gfsss', '0', '1550501716', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('32', '5', '60', '4', '1', '～(^з^)-F', '0', '1550501740', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('33', '4', '60', '5', '1', '你今天', '0', '1550509862', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('34', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/446c632cb78fd1b2ec58045b9218ecce.mp3', '0', '1550539059', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('35', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/ac86e21b3163b2d5c0693f1b3fb6578c.mp3', '0', '1550539530', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('36', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/98e64c9d5d7868ab1f8a118a4129056a.mp3', '0', '1550539785', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('37', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/6dd6a0290769d5194c5d5edc6fef3929.mp3', '0', '1550539876', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('38', '5', '61', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/c714fbc5ca655b1b8d97e1534969e646.mp3', '0', '1550540040', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('39', '5', '62', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/3d357a870f46df23b7f166c59d32b5cd.mp3', '0', '1550550198', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('40', '5', '62', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/75e709aec51c59063d6ee86fc8bc1aac.jpg', '0', '1550550213', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('41', '5', '62', '4', '1', 'jdjdjs', '0', '1550550224', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('42', '5', '62', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/f14b73106754d3579718b4cbdc4f2fea.mp3', '0', '1550550235', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('43', '5', '62', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/e2a51981d077808a631b5d492ac30ceb.mp3', '0', '1550550242', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('44', '9', '65', '4', '1', '那你那会', '0', '1550554825', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('45', '4', '65', '9', '1', '投过', '0', '1550554833', '1550554833', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('46', '9', '65', '4', '1', '皇后娘娘', '0', '1550554840', '1550554840', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('47', '4', '65', '9', '1', '我亦无他', '0', '1550554842', '1550554842', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('48', '9', '65', '4', '1', '今年', '0', '1550555293', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('49', '4', '65', '9', '1', '图', '0', '1550555309', '1550555309', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('50', '9', '65', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/afaf8d3793d95c1dd5004b9e518e329a.jpg', '0', '1550555318', '1550555318', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('51', '9', '65', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/68ed698a67af3adc0ce7491eac169396.mp3', '0', '1550555326', '1550555326', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('52', '9', '65', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/80cd0f2cfb66e089ec7c1f0c24752a56.mp3', '0', '1550555330', '1550555330', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('53', '9', '65', '4', '1', '环保部', '0', '1550561537', '1550561537', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('54', '4', '65', '9', '1', '祥云路', '0', '1550561540', '1550561540', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('55', '9', '65', '4', '1', ' 纪念币', '0', '1550562677', '1550562677', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('56', '9', '65', '4', '1', '不不不', '0', '1550562680', '1550562680', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('57', '4', '65', '9', '1', '图片', '0', '1550562685', '1550562685', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('58', '9', '65', '4', '1', '不会', '0', '1550562693', '1550562693', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('59', '4', '65', '9', '1', '身份', '0', '1550562696', '1550562696', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('60', '5', '61', '4', '1', 'chjj', '0', '1550562702', '1550562702', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('61', '5', '61', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/7a1a9360b0d6e798d6680aaa540c3575.jpg', '0', '1550562712', '1550562712', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('62', '9', '65', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/1d37402deecc99d5033a7765d71c6fd3.jpg', '0', '1550562721', '1550562721', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('63', '9', '65', '4', '1', '好吧', '0', '1550562756', '1550562756', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('64', '9', '65', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/db3f7fb3dd21584a1a52379e859d0437.jpg', '0', '1550563031', '1550563031', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('65', '7', '67', '5', '1', 'going', '0', '1550564593', '1550564593', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('66', '5', '67', '7', '1', '奶奶', '0', '1550564613', '1550564613', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('67', '7', '67', '5', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/ea3b3454a2e9b4984fe849562c8785b2.jpg', '0', '1550564674', '1550564674', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('68', '5', '67', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/d83c515ff365c368753aa63162a41295.mp3', '0', '1550564697', '1550564697', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('69', '5', '67', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/3457a1d787516d1f524c722aacb488e2.mp3', '0', '1550564703', '1550564703', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('70', '5', '67', '7', '1', '你你你', '0', '1550564709', '1550564709', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('71', '2', '58', '4', '1', '，，', '0', '1550565185', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('72', '2', '52', '4', '1', '，，', '0', '1550571740', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('73', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/9e6d97ba0e222a0b24c2fafb2d0ec5a8.mp3', '0', '1550586870', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('74', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/e5017ec6502625e0c1c024534fddd0f1.mp3', '0', '1550586874', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('75', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/97a7a91167c0af7c173fa791141b9040.jpg', '0', '1550586889', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('76', '5', '68', '7', '1', '你以为', '0', '1550586897', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('77', '7', '68', '5', '1', 'http://app.insistcn.cn/upload/gxzh/20190219/024f1a2b930fbe068622181b2b907331.jpg', '0', '1550586923', '1550586923', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('78', '9', '66', '7', '1', '今年你那边', '0', '1550624904', '1550624904', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('79', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/a6135200ca12f341587b01ec0f06ddd5.mp3', '0', '1550643074', '1550643074', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('80', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/5c20da12c97be26330774eb0cc6a1d35.mp3', '0', '1550643437', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('81', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/dc3908a0b120c2be5952f75e98bbd7b7.mp3', '0', '1550643558', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('82', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/47cc94a1db9b875cdb775ccd90704c27.mp3', '0', '1550643591', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('83', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/f201b8cee88d6fc4a0fe1ba02050a1dc.mp3', '0', '1550643717', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('84', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/016185ae4b2e3473272a29b23c644485.mp3', '0', '1550643771', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('85', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/86a522861a65117b1316e201de6827af.mp3', '0', '1550643804', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('86', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/c7870f80a8f261a8ef17b48fea01254d.mp3', '0', '1550644202', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('87', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/d72cdba6df21fcdcc703577149bce92c.mp3', '0', '1550644234', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('88', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/6d3a1747d7765c87683e5e87bc9f99d9.mp3', '0', '1550644267', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('89', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b86fb8404480a1563ac610558895e8aa.mp3', '0', '1550644328', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('90', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/db2af2c4a9d89e01ddd1a416cc31c77e.mp3', '0', '1550644349', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('91', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b148e3e86f1dd52da59390ce42793713.mp3', '0', '1550644599', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('92', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/de4035177cae93a9667663b43cc88d91.mp3', '0', '1550644633', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('93', '4', '50', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/c5dcaffa2404d1213e9aa4ba5a16585a.mp3', '0', '1550644668', '1550644668', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('94', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/8b67b9056af5d8f80a2f8cd313c412ed.mp3', '0', '1550644702', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('95', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/6d85cd4cc61a2490ce883d3a2bf9bea1.mp3', '0', '1550644759', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('96', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/dc4937cd2889dab513d72159f075d53c.mp3', '0', '1550644880', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('97', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/fab8ecb8b423a722c7388bc610e9e4ae.mp3', '0', '1550645456', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('98', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/6e13590af06487b767bcf178c9aa94f2.mp3', '0', '1550645500', '1550645500', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('99', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/8eaebe42df262b281d5b62097c533ca0.mp3', '0', '1550645699', '1550645699', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('100', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/0f5c801c1caca815fa4cf1ae5f0e1f15.mp3', '0', '1550645753', '1550645753', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('101', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/99748964c0776b0d0cb48ba604e9acb6.mp3', '0', '1550646006', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('102', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/8c1dcbc7d6e911c965f5d12bc25fa3fe.mp3', '0', '1550646027', '1550646027', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('103', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/03ea1b7c9adf5094b70037e2759986d3.mp3', '0', '1550646036', '1550646036', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('104', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/8d4ad3b52bd73b1b9d5c2a4bf5178443.mp3', '0', '1550646143', '1550646143', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('105', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/c6d4acd86106d0626e65b975217ca808.mp3', '0', '1550646154', '1550646154', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('106', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b66d97d9406bbaf3b45f93d59407780a.mp3', '0', '1550646389', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('107', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/ef248e06774b7b4afb23a634c1bde733.mp3', '0', '1550646397', '1550646397', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('108', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/7a2500af43b9ea9fd92319d5a5c0cf55.mp3', '0', '1550646399', '1550646399', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('109', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/3adb41c947aa3628f19ee98cd15ce5b6.mp3', '0', '1550646405', '1550646405', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('110', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/740b2b952133d6a671c9abad105409c9.mp3', '0', '1550647034', '1550647034', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('111', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b4b386a78aa4f1344a970b00c780b4a6.mp3', '0', '1550647954', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('112', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/676e748b9c733d7bf236c05a99702778.mp3', '0', '1550647980', '1550647980', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('113', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/8c539fe71be90ede8b056b867ac5482c.mp3', '0', '1550647986', '1550647986', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('114', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/28539718c0e4b2e91fdf10bc02f99b22.mp3', '0', '1550647996', '1550647996', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('115', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/cdb415c24f866110db6b0fca5adde19a.mp3', '0', '1550648015', '1550648015', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('116', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/f1f4d9378e943f29843493a19f5e485d.mp3', '0', '1550648016', '1550648016', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('117', '9', '69', '4', '1', '不能吧', '0', '1550648086', '1550648086', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('118', '4', '69', '9', '1', '太极', '0', '1550648091', '1550648091', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('119', '4', '69', '9', '1', '突突兔', '0', '1550648096', '1550648096', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('120', '9', '69', '4', '1', '环保部', '0', '1550648101', '1550648101', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('121', '4', '69', '9', '1', '组团', '0', '1550648170', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('122', '9', '69', '4', '1', '不不不', '0', '1550648178', '1550648178', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('123', '4', '69', '9', '1', '拒绝', '0', '1550648188', '1550648188', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('124', '9', '69', '4', '1', '那你你不会', '0', '1550648191', '1550648191', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('125', '4', '69', '9', '1', '太极', '0', '1550648371', '1550648371', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('126', '9', '69', '4', '1', '不不不', '0', '1550648380', '1550648380', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('127', '4', '69', '9', '1', '近年来', '0', '1550648397', '1550648397', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('128', '4', '69', '9', '1', '就是', '0', '1550648443', '1550648443', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('129', '9', '69', '4', '1', '好吧', '0', '1550648452', '1550648452', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('130', '4', '69', '9', '1', '具体', '0', '1550648473', '1550648473', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('131', '4', '69', '9', '1', '萝莉控', '0', '1550648589', '1550648589', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('132', '9', '69', '4', '1', 'vvv', '0', '1550648598', '1550648598', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('133', '4', '69', '9', '1', '萝莉控', '0', '1550648706', '1550648706', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('134', '9', '69', '4', '1', '翡翠城', '0', '1550648717', '1550648717', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('135', '9', '69', '4', '1', '不不不', '0', '1550648720', '1550648720', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('136', '9', '69', '4', '1', '停车场', '0', '1550648771', '1550648771', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('137', '9', '69', '4', '1', '不不不', '0', '1550648831', '1550648831', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('138', '9', '69', '4', '1', '古古惑惑', '0', '1550648835', '1550648835', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('139', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b1be5c0987f61e18db5bf7e5a1cff92c.mp3', '0', '1550656543', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('140', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/e476b2634d3b1904fed8d3e7969a8827.mp3', '0', '1550656776', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('141', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/458b4bf9ac9398ecb50e3889b47bee8d.jpg', '0', '1550657113', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('142', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/5e31d376b5bb92c77694f1dce0b8af80.jpg', '0', '1550657157', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('143', '9', '69', '4', '1', '环保部', '0', '1550657177', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('144', '9', '69', '4', '1', '隔壁', '0', '1550657333', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('145', '9', '69', '4', '1', 'GV', '0', '1550657422', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('146', '9', '69', '4', '1', '那你', '0', '1550657428', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('147', '4', '69', '9', '1', '结局', '0', '1550657444', '1550657444', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('148', '4', '69', '9', '1', '图', '0', '1550657585', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('149', '9', '69', '4', '1', '不不不', '0', '1550657619', '1550657619', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('150', '4', '69', '9', '1', '哈哈', '0', '1550657682', '1550657682', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('151', '4', '69', '9', '1', '我看看', '0', '1550657816', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('152', '9', '69', '4', '1', 'vvv', '0', '1550657824', '1550657824', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('153', '4', '69', '9', '1', '商丘市', '0', '1550657869', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('154', '4', '69', '9', '1', '会', '0', '1550657920', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('155', '4', '69', '9', '1', '图', '0', '1550657922', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('156', '9', '69', '4', '1', '不不不', '0', '1550657928', '1550657928', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('157', '4', '69', '9', '1', '跟混合', '0', '1550657932', '1550657932', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('158', '9', '69', '4', '1', '不不不那你呢', '0', '1550657934', '1550657934', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('159', '4', '69', '9', '1', '图', '0', '1550657937', '1550657937', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('160', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/a38e807aa663c2d08924e068fe1f8e48.jpg', '0', '1550657947', '1550657947', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('161', '9', '69', '4', '1', '那你呢', '0', '1550658004', '1550658004', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('162', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/2f95bcb01b22181eefe968920cd68197.jpg', '0', '1550658013', '1550658013', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('163', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/7873270b8d2a4a592b3d071d8be7d38e.jpg', '0', '1550658232', '1550658232', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('164', '4', '69', '9', '1', '推', '0', '1550658238', '1550658238', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('165', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/5210508dc01b5d20377360b772bceb84.mp3', '0', '1550658243', '1550658243', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('166', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/51560858e5072d15de2b827d9072f283.mp3', '0', '1550658251', '1550658251', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('167', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/9ef8c6f3613e2b5ab3c3b18cc8d8867c.mp3', '0', '1550658342', '1550658342', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('168', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/494a5fadefe0e739f70fb90b9f3c2e73.mp3', '0', '1550658391', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('169', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/5b77a01f98983b1db0321a4187268d6c.mp3', '0', '1550658399', '1550658399', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('170', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/fdc6c41fa8baa4e9dd3fc65004ca8114.mp3', '0', '1550658407', '1550658407', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('171', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/18c9cbf25a77710d752e0341b861f054.mp3', '0', '1550658508', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('172', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/1cfd8c6008a00db2df70c49f0b5f2b41.mp3', '0', '1550659604', '1550659604', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('173', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/ad1758929902f7b3edec2f8312e2dd08.mp3', '0', '1550659612', '1550659612', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('174', '9', '69', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b43a0f5a493b73914f611d103e37558a.mp3', '0', '1550659620', '1550659620', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('175', '4', '69', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/1068564e61d8dc8a7f11a924e20665be.mp3', '0', '1550659635', '1550659635', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('176', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/d6714e7033fed701f4a290b57dffd595.mp3', '0', '1550661399', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('177', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/ef3087eaf6bc3321b053f3e74c3bdce1.mp3', '0', '1550661411', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('178', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/30d5ae57fd01004b6335ad638c66dc4a.mp3', '0', '1550661508', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('179', '2', '70', '4', '1', '1111', '0', '1550663773', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('180', '4', '56', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/cbaf237baaee46eae3cddb4935d346af.mp3', '0', '1550665082', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('181', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/1b65e01f5807c735e723d49ed77557dc.mp3', '0', '1550667493', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('182', '5', '68', '7', '1', '最后', '0', '1550667504', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('183', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/663e00bd6022b9046b8af32c6455b272.jpg', '0', '1550667509', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('184', '5', '61', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/3f8f61d22c33979fd9995164dc8318c4.mp3', '0', '1550669807', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('185', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/dbe3e355d38efc3a54f6a2c460da3bc1.mp3', '0', '1550672384', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('186', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/b0cdd981dfd3199eae4445089dca63a5.mp3', '0', '1550672394', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('187', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/ea090edf5ccdb8917bb8f30c0aa39dd5.mp3', '0', '1550672421', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('188', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190220/e4df89f3a842886812813b9b7f797d92.mp3', '0', '1550672440', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('189', '5', '71', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190221/51262d6fbbadf4e6ba3f333861443720.mp3', '0', '1550714830', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('190', '5', '71', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190221/37c45b7927f8f1efcea79ab380f0fc05.jpg', '0', '1550714839', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('191', '5', '71', '7', '1', '你估计', '0', '1550714847', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('192', '5', '71', '7', '1', '买了', '0', '1550733347', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('193', '5', '71', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190221/4cb6c4a9aa836d12dc98c0edeb6129b6.mp3', '0', '1550733358', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('194', '5', '68', '7', '1', '共享', '0', '1550807886', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('195', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/7e57efe9bc296d23a9b222effbb80258.mp3', '0', '1550807894', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('196', '5', '68', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/86c43ba1a96ee5cd5a30e30a87bea849.mp3', '0', '1550807903', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('197', '9', '64', '4', '1', '今年', '0', '1550815851', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('198', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/a28da3c7a9ec170e660c74c21367ca99.jpg', '0', '1550815855', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('199', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/54cc41f207b10f29c4a6cc3e6bf34720.mp3', '0', '1550815860', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('200', '9', '64', '4', '1', '在不', '0', '1550815900', '1550815900', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('201', '4', '64', '9', '1', '没事', '0', '1550815922', '1550815922', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('202', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/cd701a02c518c0d6e4f74a1c6d7eb9df.mp3', '0', '1550816013', '1550816013', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('203', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/fcd54f154833524bba12c29ff6c0dfb9.mp3', '0', '1550816053', '1550816053', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('204', '4', '49', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/6d7341c918addcdecdec42d21fbd2e4c.mp3', '0', '1550823195', '1550823195', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('205', '4', '44', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/8709b60e7932f1b5d9b7258d79fb81c8.jpg', '0', '1550825288', '1550825288', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('206', '4', '44', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/414e2aa4f5f94c6ae4935890eca7ab58.jpg', '0', '1550825347', '1550825347', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('207', '4', '44', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/082211f1754c8795eb7d0da3476c2e0f.jpg', '0', '1550825371', '1550825371', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('208', '4', '43', '4', '1', '才吃饭', '0', '1550825837', '1550825837', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('209', '4', '46', '4', '1', '好12', '0', '1550826461', '1550826461', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('210', '4', '50', '4', '1', '12', '0', '1550826595', '1550826595', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('211', '4', '49', '4', '1', '15', '0', '1550826843', '1550826843', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('212', '4', '50', '4', '1', '25', '0', '1550827063', '1550827063', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('213', '9', '64', '4', '1', '15', '0', '1550827173', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('214', '9', '64', '4', '1', '15', '0', '1550827318', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('215', '9', '64', '4', '1', '25', '0', '1550827344', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('216', '9', '64', '4', '1', '55', '0', '1550827756', '1550827756', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('217', '9', '64', '4', '1', 'vvv', '0', '1550827834', '1550827834', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('218', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/137c0a4d3f83bf869da5c2f77c0e70d4.jpg', '0', '1550827868', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('219', '4', '64', '9', '1', '图腾', '0', '1550828101', '1550828101', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('220', '9', '64', '4', '1', '69', '0', '1550828107', '1550828107', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('221', '4', '64', '9', '1', '25', '0', '1550828266', '1550828266', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('222', '9', '64', '4', '1', '金宝贝', '0', '1550828601', '1550828601', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('223', '4', '64', '9', '1', '构图', '0', '1550828608', '1550828608', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('224', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/af26fc7681115204dd740624f4f74261.jpg', '0', '1550828617', '1550828617', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('225', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/a4974aa95fa933eb995a4a9867e751dc.jpg', '0', '1550828624', '1550828624', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('226', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/2b014e05f4ced2ecf7d96838ec3930f8.mp3', '0', '1550828631', '1550828631', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('227', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/8f3fe1e496f4b57fa019911d9486ece3.jpg', '0', '1550828651', '1550828651', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('228', '9', '64', '4', '1', '78', '0', '1550828661', '1550828661', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('229', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/aa4764e3fc9709f5264b591256950f1f.mp3', '0', '1550828833', '1550828833', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('230', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/216ca86291945b3328d9e70fbcdcfdd8.mp3', '0', '1550828883', '1550828883', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('231', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/fd4084f9a9e0fd29c29d834c54043968.mp3', '0', '1550829010', '1550829010', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('232', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/633b5ed6b453c27c93968eda14421fa4.mp3', '0', '1550829103', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('233', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/dd24739b80153b7d2123c5d60c3534fe.mp3', '0', '1550829121', '1550829121', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('234', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/788a05cd2f4c6cda99c0a9d610fd04ac.mp3', '0', '1550829156', '1550829156', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('235', '9', '64', '4', '1', '58', '0', '1550829180', '1550829180', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('236', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/495e611b1c5c07b8d4193ac64347e312.mp3', '0', '1550829351', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('237', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/e2bf430b827938efdbfcac163df721b2.mp3', '1', '1550830208', '1550830208', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('238', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/edfd6e720d4ecb876b047440aff273b5.mp3', '1', '1550830216', '1550830216', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('239', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/7d54a1006e07bd20bd79a48c4f5f0c28.mp3', '1', '1550830241', '1550830241', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('240', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/19d52e7b6acd1c3fff47def7271ebbd0.mp3', '1', '1550832092', '1550832092', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('241', '9', '64', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/c6a5dae495cedeef1a310d760c4ac4c2.mp3', '1', '1550832100', '1550832100', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('242', '9', '64', '4', '1', '环保部', '1', '1550832175', '1550832175', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('243', '4', '64', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/3ccac121579ea1717f3924cf4d353832.mp3', '1', '1550832180', '1550832180', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('244', '4', '48', '4', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/39c2be8dc66a94e275b1f3af5f861558.mp3', '1', '1550832354', '1550832354', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('245', '7', '66', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/ada7d058be55e8085f4f08de4657c45a.mp3', '3', '1550836770', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('246', '7', '66', '9', '1', 'http://app.insistcn.cn/upload/gxzh/20190222/735b836111391d4793745c84650a35d7.mp3', '6', '1550836778', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('247', '5', '76', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/b3cacb2358e66f6667b2d7813696b207.mp3', '1', '1550905196', '1550905196', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('248', '5', '76', '7', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/1f728ac027b57e37bcf8e3d714ed8002.mp3', '1', '1550908016', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('249', '2', '80', '13', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/bbf8bc170333008e0b854ecbc6f890bd.mp3', '3', '1550913338', '1550913338', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('250', '2', '78', '13', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/1b2cbfc7e26e0e7a2d3c31ebcfc4c422.mp3', '6', '1550915079', '1550915079', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('251', '2', '78', '13', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/c355afb959fde3c5cf643d0d65e7bffa.jpg', '6', '1550915094', '1550915094', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('252', '2', '78', '13', '1', '？？？？', '6', '1550915109', '1550915109', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('253', '2', '78', '13', '1', '14', '6', '1550915140', '1550915140', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('254', '13', '78', '2', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/7b6b3df656beb49098b55559393ee65d.mp3', '1', '1550915679', '1550915679', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('255', '2', '78', '13', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/5da5baad4ed09a8b96ca5987f084da91.mp3', '5', '1550915692', '1550915692', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('256', '13', '78', '2', '1', 'qer', '1', '1550915701', '1550915701', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('257', '2', '78', '13', '1', '哈哈哈', '5', '1550915711', '1550915711', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('258', '2', '78', '13', '1', '合伙', '0', '1550916161', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('259', '13', '78', '2', '1', 'hn', '0', '1550916172', '1550916172', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('260', '2', '78', '13', '1', 'http://app.insistcn.cn/upload/gxzh/20190223/802fcc675ad8e1d6c009f13a038b8666.mp3', '4', '1550916182', '1550916182', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('261', '2', '78', '13', '1', '合伙', '4', '1550916190', '1550916190', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('262', '2', '78', '13', '0', 'ABC', '0', '1550916493', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('263', '2', '78', '13', '0', 'http://app.insistcn.cn/upload/gxzh/20190223/e1d90bd41daf8e823ddc8bd056980736.mp3', '2', '1550916501', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('264', '2', '78', '13', '0', 'ABC', '0', '1550916507', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('265', '5', '79', '7', '1', 'kgcvb', '0', '1550916751', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('266', '5', '79', '7', '1', 'https://app.insistcn.cn/upload/gxzh/20190223/3d1b53f29eeee8dae6165d0b87f628df.mp3', '8', '1550916764', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('267', '5', '81', '7', '1', '测试测试，不知道这个行不行啊', '0', '1550921159', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('268', '5', '81', '7', '1', 'https://app.insistcn.cn/upload/gxzh/20190223/b89374ce999d8dadffc392af6456d898.mp3', '2', '1550921166', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('269', '5', '81', '7', '1', '1', '0', '1550921182', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('270', '5', '81', '7', '1', '2000', '0', '1550921220', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('271', '5', '81', '7', '1', '5000', '0', '1550921230', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('272', '5', '85', '7', '1', '哦里摸摸', '0', '1550923016', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('273', '5', '85', '7', '1', '50', '0', '1550923027', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('274', '5', '86', '14', '1', '哦里胡同口', '0', '1550961240', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('275', '5', '86', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190224/c881d123daa7eb13a7c551282a085337.jpg', '0', '1550961246', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('276', '5', '86', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190224/f41b8159a6c2ddd27ff98f51355db5b0.mp3', '11', '1550961263', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('277', '4', '56', '2', '1', 'https://app.insistcn.cn/upload/gxzh/20190224/ba82964d1082d4bed52272ada363833a.mp3', '2', '1550991844', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('278', '4', '56', '2', '1', '58', '0', '1550991863', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('279', '4', '56', '2', '1', 'https://app.insistcn.cn/upload/gxzh/20190224/12d19ac7a3f3fdd03395957e28215183.mp3', '1', '1551007352', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('280', '4', '56', '2', '1', '28', '0', '1551007361', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('281', '5', '93', '14', '1', 'HPLC', '0', '1551090763', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('282', '5', '96', '14', '1', 'rrr', '0', '1551091875', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('283', '5', '97', '7', '1', '33333', '0', '1551092238', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('284', '5', '98', '7', '1', 'ttyy', '0', '1551093008', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('285', '5', '98', '7', '1', 'https://app.insistcn.cn/upload/gxzh/20190225/cdce6bd2acc3e0895a32bfb1f95997ce.mp3', '2', '1551093025', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('286', '5', '98', '7', '1', 'https://app.insistcn.cn/upload/gxzh/20190225/8e38c9b309df9b4b51aec1588b187b2f.mp3', '6', '1551093032', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('287', '5', '98', '7', '1', 'yyy', '0', '1551093328', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('288', '5', '103', '7', '1', '功能', '0', '1551150073', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('289', '5', '104', '14', '1', '1根', '0', '1551150132', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('290', '5', '105', '14', '1', '轰轰轰', '0', '1551150657', '1551150657', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('291', '9', '64', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/263ba7cf74904eb1072c4a1e3798acc6.mp3', '3', '1551162056', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('292', '9', '64', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/807b47fbfe3ec0ba8c51349c563b8a8a.mp3', '2', '1551162060', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('293', '9', '64', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/c44c6e3cc3a1ccd4086ff34760ef8b83.mp3', '1', '1551162135', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('294', '9', '64', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/f87ce771e5176c75383dc45429aa9915.mp3', '1', '1551162138', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('295', '5', '95', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/3b5e9db09719e3d6a9950988bcc4f4e4.mp3', '3', '1551162286', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('296', '2', '78', '13', '0', '**', '0', '1551167190', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('297', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/70ed9831a8ad514ceea494ab90c556cf.mp3', '9', '1551173844', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('298', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/6d33a1e7b354645734d3c93c0b701e7e.mp3', '4', '1551173852', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('299', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/a37e25a8b32959817c56567b19e5f6e1.mp3', '1', '1551173865', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('300', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/a721d8d9ca15fc32f01edd0d6ebcb4eb.mp3', '2', '1551173870', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('301', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/1df67f9a62bb2c154ee6649b4bb654aa.mp3', '1', '1551173876', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('302', '2', '78', '13', '0', 'https://app.insistcn.cn/upload/gxzh/20190226/48a03db39f01993c52b6aaef4e4e3abc.mp3', '2', '1551173881', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('303', '7', '97', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/a5822ba8000624fe419403acc359f4df.mp3', '10', '1551185411', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('304', '7', '97', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/13605e8379f68df5f7d83c1ddf800237.mp3', '1', '1551185413', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('305', '7', '97', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/f2c157c5deb12c31ffe518f5ebb1660c.mp3', '1', '1551185417', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('306', '7', '97', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/67a834774f3aab0dadd1b90eb877c3b1.mp3', '1', '1551185420', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('307', '7', '106', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/817c9154f910209ff0b559c2cad3bb63.mp3', '3', '1551185455', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('308', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/fbd82a6cec9d139efef35cc9334e69b0.mp3', '2', '1551185490', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('309', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/036a0964e39a4245714a1ef02d634a0f.mp3', '4', '1551185497', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('310', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190226/ac5dca0f2fea23d2734a744ac99a033a.mp3', '1', '1551185500', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('311', '5', '95', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190227/f78920c9ad3573a5f499217c225e298b.mp3', '5', '1551265718', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('312', '5', '95', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190227/ff85633398a1fe8ba836c0292dda820b.mp3', '1', '1551265724', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('313', '5', '95', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190227/891b03ad91c1ea3536e77d7b9169df6f.mp3', '2', '1551265727', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('314', '5', '95', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190227/84f01e3fc83edc729176cd33635ea199.jpg', '0', '1551265734', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('315', '5', '109', '24', '0', '你摸过', '0', '1551271886', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('316', '5', '105', '14', '1', '～(^з^)-F', '0', '1551311546', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('317', '5', '105', '14', '1', '┗(＾0＾)┓', '0', '1551311556', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('318', '5', '105', '14', '1', '✌(̿▀̿ ̿Ĺ̯̿̿▀̿ ̿)✌', '0', '1551311575', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('319', '5', '105', '14', '1', '(*^▽^*)', '0', '1551311585', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('320', '9', '64', '4', '1', '好好补补', '0', '1551321241', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('321', '9', '64', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190228/800a3416c39cd4a760c0e7e94df58412.jpg', '0', '1551321287', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('322', '2', '129', '23', '1', '得到', '0', '1551416405', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('323', '23', '129', '2', '1', '发广告', '0', '1551416413', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('324', '2', '129', '23', '1', '做好', '0', '1551416426', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('325', '23', '129', '2', '1', '哈哈哈', '0', '1551416442', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('326', '23', '128', '2', '1', '哈哈哈', '0', '1551416739', '1551416739', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('327', '2', '128', '23', '1', 'KKK', '0', '1551416751', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('328', '9', '64', '4', '1', '你好', '0', '1551420601', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('329', '9', '64', '4', '1', 'jjj', '0', '1551442237', '1551442237', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('330', '4', '64', '9', '1', '瑜伽', '0', '1551442241', '1551442241', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('331', '9', '64', '4', '1', 'hhbb', '0', '1551442245', '1551442245', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('332', '4', '64', '9', '1', '呼呼呼', '0', '1551442247', '1551442247', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('333', '9', '130', '4', '1', '哦呦', '0', '1551442395', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('334', '4', '130', '9', '1', '55码', '0', '1551442399', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('335', '9', '130', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190301/1cca084ef5608950afda046987e139d7.mp3', '2', '1551442409', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('336', '9', '130', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190301/13850027e1b875ed000f38d5c15eb864.mp3', '2', '1551442421', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('337', '4', '130', '9', '1', '先看看', '0', '1551442430', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('338', '4', '130', '9', '1', '娜可露露', '0', '1551442469', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('339', '9', '130', '4', '1', '兰蔻', '0', '1551442751', '1551442751', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('340', '4', '130', '9', '1', '萝莉控', '0', '1551442755', '1551442755', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('341', '9', '130', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190301/9433042e0fa73fe310883e0f7f48f489.mp3', '1', '1551442763', '1551442763', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('342', '9', '130', '4', '1', '莫有', '0', '1551442824', '1551442824', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('343', '4', '130', '9', '1', '天咯来咯', '0', '1551442827', '1551442827', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('344', '9', '131', '4', '1', '哦呦', '0', '1551444938', '1551444938', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('345', '4', '131', '9', '1', '接口', '0', '1551444941', '1551444941', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('346', '5', '132', '14', '1', '给你一张', '0', '1551449762', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('347', '5', '132', '14', '1', '嘻嘻嘻', '0', '1551449766', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('348', '5', '132', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190301/b343b1b0ca5cd0a24e0b50e90a1c7ce8.mp3', '3', '1551449775', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('349', '4', '44', '4', '1', '你有约', '0', '1551450116', '1551450116', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('350', '4', '44', '4', '1', '图腾', '0', '1551450120', '1551450120', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('351', '4', '131', '9', '1', '涂涂乐', '0', '1551450135', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('352', '4', '131', '9', '1', '退款', '0', '1551450137', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('353', '4', '131', '9', '1', '噢噢噢哦哦', '0', '1551450144', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('354', '4', '131', '9', '1', '啦啦啦啦啦', '0', '1551450150', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('355', '9', '131', '4', '1', '么么哒', '0', '1551450174', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('356', '9', '131', '4', '1', '图噢噢噢哦哦', '0', '1551450178', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('357', '4', '131', '9', '1', '记录贴', '0', '1551489447', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('358', '9', '131', '4', '1', '红尘滚滚', '0', '1551489450', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('359', '4', '131', '9', '1', '涂料', '0', '1551489459', '1551489459', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('360', '4', '131', '9', '1', '提交了', '0', '1551489704', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('361', '9', '131', '4', '1', '唱唱歌', '0', '1551489711', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('362', '4', '131', '9', '1', '结局', '0', '1551489717', '1551489717', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('363', '4', '131', '9', '1', '最主要', '0', '1551489770', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('364', '4', '131', '9', '1', '结局', '0', '1551489791', '1551489791', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('365', '4', '131', '9', '1', '最主要', '0', '1551491517', '1551491517', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('366', '9', '131', '4', '1', 'v个肥嘟嘟', '0', '1551491563', '1551491563', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('367', '9', '131', '4', '1', '长谷川', '0', '1551491566', '1551491566', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('368', '2', '137', '4', '1', '海陆空', '0', '1551498626', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('369', '4', '137', '2', '1', '好红红火火恍恍惚惚GV', '0', '1551498697', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('370', '2', '137', '4', '1', '太', '0', '1551498712', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('371', '9', '131', '4', '1', '55', '0', '1551498936', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('372', '5', '85', '7', '0', '100', '0', '1551532061', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('373', '5', '85', '7', '0', '300', '0', '1551532082', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('374', '5', '144', '31', '0', 'jcgg', '0', '1551532394', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('375', '5', '144', '31', '0', 'https://app.insistcn.cn/upload/gxzh/20190302/6c4dea336093e0878ab65cebede2b11e.jpg', '0', '1551532400', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('376', '5', '144', '31', '0', 'https://app.insistcn.cn/upload/gxzh/20190302/ffaee34cd10327bcb56fa552bcb8708f.mp3', '5', '1551532410', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('377', '5', '142', '31', '0', 'https://app.insistcn.cn/upload/gxzh/20190302/f7c4e044d2da558727768ed8a6e06e24.jpg', '0', '1551532425', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('378', '5', '142', '31', '0', 'nsnsnsn', '0', '1551532430', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('379', '5', '142', '31', '0', 'https://app.insistcn.cn/upload/gxzh/20190302/2c76d3bb54a8a589c7adefbc885fa833.mp3', '1', '1551532434', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('380', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/a7e338aa388cefb102b9ed203de24d2a.mp3', '3', '1551571162', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('381', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/9f2578a14ee6004e970b191514e5a14e.mp3', '2', '1551571168', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('382', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/bd083db5a06fe890282e5cb02249b2b5.mp3', '1', '1551571396', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('383', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/eb96237c2a81e1f4847e7e5c951baa6a.mp3', '1', '1551571398', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('384', '5', '105', '14', '1', 'fhgvc', '0', '1551571423', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('385', '5', '105', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/468eb8f8fde6bf47bf4e3c8c65707d18.mp3', '1', '1551571435', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('386', '5', '148', '14', '1', '明明您', '0', '1551572994', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('387', '5', '148', '14', '1', 'https://app.insistcn.cn/upload/gxzh/20190303/e237ec81bb683ed94340d9b9953c5565.mp3', '2', '1551573000', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('388', '5', '141', '31', '0', 'https://app.insistcn.cn/upload/gxzh/20190303/345f955e9866de595f58ad3973d285b2.mp3', '3', '1551573681', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('389', '4', '48', '4', '1', '669', '0', '1551599653', '1551599653', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('390', '2', '137', '4', '1', '，，，', '0', '1551601151', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('391', '2', '137', '4', '1', '1', '0', '1551669955', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('392', '14', '170', '5', '1', '10', '0', '1551673581', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('393', '9', '64', '4', '1', '哦哦', '0', '1551680740', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('394', '9', '64', '4', '1', '某来咯', '0', '1551681289', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('395', '9', '131', '4', '1', '葵花', '0', '1551681419', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('396', '9', '131', '4', '1', '太极', '0', '1551681507', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('397', '9', '131', '4', '1', 'ggh ', '0', '1551681581', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('398', '9', '131', '4', '1', '哦哟哟', '0', '1551681658', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('399', '9', '131', '4', '1', '哦哟哟', '0', '1551681662', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('400', '9', '131', '4', '1', '哦哟哟', '0', '1551681679', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('401', '9', '131', '4', '1', '突然', '0', '1551681797', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('402', '9', '131', '4', '1', '最主要', '0', '1551681808', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('403', '9', '131', '4', '1', '最主要', '0', '1551681814', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('404', '9', '131', '4', '1', '结局', '0', '1551681916', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('405', '9', '131', '4', '1', '结局模型', '0', '1551681924', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('406', '9', '131', '4', '1', '', '0', '1551684124', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('407', '9', '131', '4', '1', '', '0', '1551684307', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('408', '9', '131', '4', '1', '', '0', '1551684394', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('409', '9', '131', '4', '1', '', '0', '1551684692', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('410', '9', '131', '4', '1', '你有约', '0', '1551684838', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('411', '9', '131', '4', '1', '', '0', '1551684857', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('412', '9', '131', '4', '1', '你在郑州', '0', '1551685006', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('413', '9', '131', '4', '1', '', '0', '1551685015', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('414', '9', '131', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190304/0a7ae9524afd78e3c351f212c6e73e2d.jpg', '0', '1551685041', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('415', '9', '131', '4', '1', '你看看', '0', '1551685174', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('416', '4', '131', '9', '1', 'jhn ', '0', '1551685219', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('417', '9', '131', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190304/3273102b0ead30ca18a1aa4870fd7f88.jpg', '0', '1551685303', '1551685303', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('418', '9', '131', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190304/a57c5c93fa13d75b85ef3f6055eddac4.jpg', '0', '1551685359', '1551685359', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('419', '9', '131', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190304/b2ec584902d9b73a0d27e6f1e6a5660a.jpg', '0', '1551685422', '1551685422', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('420', '9', '131', '4', '1', '', '0', '1551685473', '1551685473', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('421', '9', '131', '4', '1', '', '0', '1551685488', '1551685488', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('422', '9', '131', '4', '1', '恶魔', '0', '1551685578', '1551685578', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('423', '9', '131', '4', '1', '葵花', '0', '1551685783', '1551685783', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('424', '4', '131', '9', '1', 'hb ', '0', '1551686111', '1551686111', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('425', '9', '131', '4', '1', '郑州', '0', '1551686298', '1551686298', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('426', '9', '131', '4', '1', '木头', '0', '1551686525', '1551686525', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('427', '9', '131', '4', '1', 'https://app.insistcn.cn/upload/gxzh/20190304/52edbce0c89445783e86a9c09eb2b49b.jpg', '0', '1551686733', '1551686733', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('428', '9', '131', '4', '1', '图', '0', '1551687553', '1551687553', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('429', '9', '131', '4', '1', '图最主要', '0', '1551687559', '1551687559', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('430', '9', '127', '4', '1', '哦哦刘', '0', '1551696942', '1551696942', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('431', '14', '179', '5', '1', '5', '0', '1551745557', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('432', '14', '173', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/91476d90e1e7b6c81dd5ceabb9ac1ca3.mp3', '3', '1551752313', null, 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('433', '14', '173', '5', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/6cf2bfb93cc54666fa4935dcfd007fba.jpg', '0', '1551752317', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('434', '14', '173', '5', '1', '测试文字', '0', '1551752327', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('435', '14', '173', '5', '1', '1', '0', '1551752336', null, 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('436', '5', '191', '4', '1', '你好', '0', '1551776807', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('437', '5', '190', '4', '1', '你好', '0', '1551776819', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('438', '5', '189', '4', '1', '你是哪位啊', '0', '1551776837', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('439', '5', '188', '4', '1', '哦里咯', '0', '1551776845', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('440', '5', '187', '34', '0', '你好', '0', '1551776859', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('441', '5', '187', '34', '0', '✌(̿▀̿ ̿Ĺ̯̿̿▀̿ ̿)✌', '0', '1551776882', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('442', '5', '187', '34', '0', '( ˘ ³˘)♥', '0', '1551776887', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('443', '20', '193', '9', '1', '水电费', '0', '1551777853', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('444', '20', '193', '9', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/723e77185e935e4caa95786189f176e1.jpg', '0', '1551778011', null, 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('445', '9', '193', '20', '1', '扭扭捏捏', '0', '1551778050', '1551778050', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('446', '9', '193', '20', '1', '白白净净', '0', '1551778075', '1551778075', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('447', '20', '193', '9', '1', '阿斯顿发送到', '0', '1551778081', '1551778081', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('448', '20', '193', '9', '1', 'ads', '0', '1551778119', '1551778119', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('449', '9', '193', '20', '1', '巴巴爸爸', '0', '1551778173', '1551778173', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('450', '9', '193', '20', '1', '京津冀', '0', '1551778295', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('451', '20', '193', '9', '1', '水电费', '0', '1551778842', '1551778842', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('452', '9', '193', '20', '1', '隔壁', '0', '1551778896', '1551778896', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('453', '20', '193', '9', '1', '', '0', '1551778964', '1551778964', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('454', '20', '193', '9', '1', 'sdfs ', '0', '1551778984', '1551778984', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('455', '9', '193', '20', '1', '不不不宝宝', '0', '1551779032', '1551779032', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('456', '9', '193', '20', '1', '踩踩踩', '0', '1551779114', '1551779114', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('457', '9', '193', '20', '1', '不能解决', '0', '1551779378', '1551779378', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('458', '20', '193', '9', '1', 'Ggg', '0', '1551779384', '1551779384', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('459', '9', '193', '20', '1', '古古惑惑', '0', '1551779515', '1551779515', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('460', '20', '193', '9', '1', '阿萨德', '0', '1551779664', '1551779664', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('461', '20', '193', '9', '1', '阿萨德放大', '0', '1551779680', '1551779680', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('462', '20', '193', '9', '1', '50', '0', '1551779752', '1551779752', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('463', '9', '193', '20', '1', '干活哈哈', '0', '1551779875', '1551779875', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('464', '9', '193', '20', '1', '哥很遗憾', '0', '1551779909', '1551779909', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('465', '20', '193', '9', '1', '阿斯顿发送到发', '0', '1551780113', '1551780113', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('466', '20', '193', '9', '1', '电风扇', '0', '1551780320', '1551780320', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('467', '9', '193', '20', '1', '环保部', '0', '1551780332', '1551780332', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('468', '9', '193', '20', '1', '不不不', '0', '1551780520', '1551780520', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('469', '20', '193', '9', '1', '阿道夫说的', '0', '1551780806', '1551780806', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('470', '9', '193', '20', '1', '你那边吧', '0', '1551780838', '1551780838', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('471', '20', '193', '9', '1', '', '0', '1551780972', '1551780972', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('472', '20', '193', '9', '1', '455', '0', '1551781098', '1551781098', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('473', '9', '193', '20', '1', '环保部', '0', '1551781480', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('474', '20', '193', '9', '1', '胜多负少', '0', '1551781509', '1551781509', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('475', '9', '193', '20', '1', '金鸡胶囊', '0', '1551781749', '1551781749', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('476', '9', '193', '20', '1', '集结号', '0', '1551781952', '1551781952', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('477', '9', '193', '20', '1', '刚刚好', '0', '1551782010', '1551782010', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('478', '9', '193', '20', '1', '交警', '0', '1551782030', '1551782030', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('479', '20', '193', '9', '1', '水电费', '0', '1551782060', '1551782060', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('480', '20', '193', '9', '1', '阿斯蒂芬', '0', '1551782128', '1551782128', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('481', '20', '193', '9', '1', '是的发送到', '0', '1551782140', '1551782140', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('482', '20', '193', '9', '1', '撒的发生', '0', '1551782171', '1551782171', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('483', '20', '193', '9', '1', '阿斯顿发送到', '0', '1551782218', '1551782218', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('484', '9', '193', '20', '1', '好好补补', '0', '1551782223', '1551782223', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('485', '9', '193', '20', '1', '军那边', '0', '1551782229', '1551782229', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('486', '9', '193', '20', '1', '宝宝vv吃', '0', '1551782231', '1551782231', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('487', '4', '127', '9', '1', '58', '0', '1551783217', '1551783217', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('488', '20', '193', '9', '1', 'sg', '0', '1551789867', null, 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('489', '9', '193', '20', '1', '萝莉控', '0', '1551789922', '1551789922', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('490', '9', '193', '20', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/a94fdd93799bf2b9b88a416b92a699a5.mp3', '2', '1551789931', '1551789931', 'voice');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('491', '9', '193', '20', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/6255d12b4bab7ddf9c08b4db4ece9130.jpg', '0', '1551789945', '1551789945', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('492', '20', '193', '9', '1', 'afafsdfds发速度发大水', '0', '1551790844', '1551790844', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('493', '20', '193', '9', '1', 'asfdfasd', '0', '1551791032', '1551791032', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('494', '20', '193', '9', '1', '你好', '0', '1551791121', '1551791121', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('495', '20', '193', '9', '1', '你好dsf都是废话', '0', '1551791131', '1551791131', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('496', '20', '193', '9', '1', '你好dsf都是废话', '0', '1551791170', '1551791170', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('497', '20', '193', '9', '1', '', '0', '1551791350', '1551791350', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('498', '20', '193', '9', '1', '', '0', '1551791440', '1551791440', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('499', '20', '193', '9', '1', '23', '0', '1551791550', '1551791550', 'redpack');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('500', '20', '193', '9', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/077dbdee8dda1338b2fc7738823a2a7f.png', '0', '1551791611', '1551791611', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('501', '20', '193', '9', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/077dbdee8dda1338b2fc7738823a2a7f.png', '0', '1551791625', '1551791625', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('502', '20', '193', '9', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/077dbdee8dda1338b2fc7738823a2a7f.png', '0', '1551791629', '1551791629', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('503', '20', '193', '9', '1', '大概', '0', '1551791740', '1551791740', 'msg');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('504', '20', '193', '9', '1', 'https://app.insistcn.cn/upload/gxzh/20190305/c78ba8f90f0064b3661801f12cf35e2c.png', '0', '1551791812', '1551791812', 'img');
INSERT INTO `cmf_gxzh_chatlog` VALUES ('505', '9', '193', '20', '1', '我也这样想', '0', '1551791823', '1551791823', 'msg');

-- ----------------------------
-- Table structure for cmf_gxzh_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_comment`;
CREATE TABLE `cmf_gxzh_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(200) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '评价人uid',
  `star` int(11) NOT NULL COMMENT '评分',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_comment
-- ----------------------------
INSERT INTO `cmf_gxzh_comment` VALUES ('1', '7', '71', '71', '5', '一下午', '1548675993', '1548675993');
INSERT INTO `cmf_gxzh_comment` VALUES ('2', 'pitchon_65', '4', '9', '4', '好吧哈哈不不不', '1550570081', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('3', 'pitchon_65', '4', '9', '4', '好吧哈哈不不不不不不', '1550570146', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('4', 'pitchon_67', '7', '9', '5', 'VB不能解决', '1550571420', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('5', 'pitchon_52', '4', '2', '4', '，', '1550571746', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('6', 'pitchon_55', '4', '2', '3', '，，', '1550571881', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('7', 'pitchon_70', '4', '2', '1', '1222', '1550663811', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('8', 'pitchon_69', '4', '9', '5', '女宝宝v刚好回家', '1550815488', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('9', 'pitchon_75_1550817997', '7', '5', '3', '呵呵，挺满意的', '1550818218', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('10', 'pitchon_71', '7', '5', '5', '不错', '1550818290', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('11', 'pitchon_68', '7', '5', '5', '扣扣', '1550836002', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('12', 'pitchon_66', '7', '7', '5', '咯啦啦啦', '1550880613', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('13', 'pitchon_80_1550913257', '13', '2', '4', '22', '1550913352', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('14', 'pitchon_49', '4', '4', '5', 'KKK噢噢噢哦哦', '1550914585', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('15', 'pitchon_79_1550913382', '7', '5', '5', '测试', '1550920497', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('16', 'pitchon_81_1550921127', '7', '5', '5', '测试', '1550921550', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('17', 'pitchon_62', '4', '5', '5', 'toy', '1550921752', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('18', 'pitchon_86_1550961162', '14', '5', '5', '咯啦啦啦', '1550961319', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('19', 'pitchon_93_1551090739', '14', '5', '5', 'tttt', '1551090790', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('20', 'pitchon_96_1551091371', '14', '5', '5', 'rtt', '1551091894', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('21', 'pitchon_102_1551102959', '14', '5', '5', 'ddd', '1551102968', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('22', 'pitchon_103_1551150061', '7', '5', '5', '哦咯了', '1551150085', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('23', 'pitchon_104_1551150125', '14', '5', '5', '老厉害', '1551150169', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('24', 'pitchon_88_1551265840', '14', '5', '5', '公里', '1551265852', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('25', 'pitchon_116_1551340839', '24', '5', '2', '回来了', '1551340901', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('26', 'pitchon_119_1551351169', '24', '5', '5', '你以为', '1551351265', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('27', 'pitchon_121_1551351859', '14', '5', '5', '好了', '1551356125', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('28', 'pitchon_121_1551351859', '14', '5', '5', '好了', '1551356127', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('29', 'pitchon_121_1551351859', '14', '5', '5', '好了', '1551356128', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('30', 'pitchon_121_1551351859', '14', '5', '5', '后两节课', '1551356135', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('31', 'pitchon_129_1551416387', '23', '2', '3', '22', '1551416572', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('32', 'pitchon_128_1551416727', '2', '23', '3', '该喝', '1551416773', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('33', 'pitchon_130_1551442388', '4', '9', '5', 'XXOO弄', '1551444518', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('34', 'pitchon_132_1551449738', '14', '5', '5', '11', '1551451207', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('35', 'pitchon_133_1551451593', '14', '5', '5', '狗狗', '1551451629', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('36', 'pitchon_134_1551492464', '5', '14', '5', '行', '1551492563', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('37', 'pitchon_135_1551495554', '5', '14', '5', 'cjvh', '1551495567', null);
INSERT INTO `cmf_gxzh_comment` VALUES ('38', 'pitchon_161_1551586024', '31', '14', '5', '卡啊', '1551586341', null);

-- ----------------------------
-- Table structure for cmf_gxzh_config
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_config`;
CREATE TABLE `cmf_gxzh_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '配置说明',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text CHARACTER SET utf8 COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cmf_gxzh_config
-- ----------------------------
INSERT INTO `cmf_gxzh_config` VALUES ('8', 'keywords', '2', '关键词过滤', '2', '', '英文逗号分隔', '1549876860', '1549876884', '1', 'A片，黄色，', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('3', 'aboutus', '5', '关于我们', '2', '', '', '1549853834', '1550567977', '1', '<p style=\"text-align: left;\"><iframe src=\"https://v.qq.com/txp/iframe/player.html?vid=c0827gab7qy\" width=\"360\" height=\"200\" frameborder=\"0\"></iframe></p><p style=\"line-height: 2.5em;\"><br style=\"text-align: left;\"/></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\">1.我们不卖任何实物商品！不要任何充值，绝不是传销。</span></strong></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><br style=\"text-align: left;\"/></span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\">2.我们更侧重于经验的分享，这些经验好多在百度知乎是不可能找到的，压箱底的技术是不可能在搜索引擎上查到的</span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><br/></span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><strong style=\"white-space: normal;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\">3.我们想让你的成长变得更轻松，你可以不出家门就能找到最专业最实用的解答，不是飞在天上，高大空的说教，而是最适合你的，最能帮助你的答案。</span></strong></span></strong></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><br style=\"text-align: left;\"/></span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\">4.我们想让你的聪明才智得到利益最大化，可以充分变现，让你不再怀才不遇。</span></strong></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><br style=\"text-align: left;\"/></span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\">5.自认为普普通通的你，也许你懂的正是人家所需要的，只是你不知道而已。</span></strong></p><p style=\"line-height: 2.5em;\"><br/></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><span style=\"font-size: 18px;\">6.对隐私保护更好，让你敢说，而且说了有经济效益。我们不设门槛，以解决问题为导向，任何人都有机会回答问题。但是我们有多重身份和资质认证，让你选择时更容易。</span></span></strong></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><br style=\"text-align: left;\"/></span></strong></p><p style=\"line-height: 2.5em; text-align: left;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><strong style=\"white-space: normal;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; color: rgb(255, 0, 0); font-size: 18px; background-color: rgb(219, 238, 243);\">7.我们会保护你的知识产权和想法，你的一个技能或一个想法可以赚很多次钱，我们不会公开你的答案，更不会上传到网络，成为公开的网络数据。</span></strong></span></strong></p><p><br style=\"text-align: left;\"/></p>', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('4', 'SERVICE_TYPE', '4', '服务类型', '3', '', 'id:文本，一行一个，id值不可轻易修改', '1549854864', '1550898981', '1', '1:图文咨询\r\n2:上门服务', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('5', 'INTERVAL_PRICE', '4', '价格区间', '3', '', '', '1549854896', '1549856544', '1', '0-30\r\n31-99\r\n100-10000', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('6', 'LEVEL', '4', '职称等级', '3', '', 'id:文本，一行一个，id值不可轻易修改', '1549854926', '1550899625', '1', '1:技术员级\r\n2:助理级\r\n3:中级(工程师级）\r\n4:副高级（高级工程师级）\r\n5:正高级（研究员级）\r\n6:大咖（大师级）', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('7', 'LABEL1', '1', '快速提问', '4', '', '', '1549855014', '1550036101', '1', '快速提问', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('9', 'withdraw', '1', '提现手续费', '1', '', '填写百分比', '1549877023', '0', '1', '10', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('10', 'avatar', '3', '默认头像', '1', '', '', '1549877063', '0', '1', '/upload/admin/20190302/41a3c0b21d084dda3252161b066b88b4.png', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('11', 'LABEL2', '1', '您的问题', '4', '', '', '1550035958', '1550036088', '1', '您的问题会分发给相关领域的所有专家/能人', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('12', 'LABEL3', '1', '找专家', '4', '', '', '1550036020', '0', '1', '找专家/能人', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('13', 'LABEL4', '1', '一对一', '4', '', '', '1550036072', '0', '1', '一对一单独问答，保护您的商业秘密和个人隐私', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('14', 'icon1', '3', '提问图标1', '4', '', '', '1550490887', '0', '1', '/upload/admin/20190302/39f9d493767d6b6fb215eb66687631f0.png', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('15', 'icon1_text', '1', '提问图标1的文字', '4', '', '', '1550490957', '1550634127', '1', '汇集行业能人', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('16', 'icon2', '3', '提问图标2', '4', '', '', '1550490983', '0', '1', '/upload/admin/20190302/ef8db359dc72d238ebe4a1a4de29cde1.png', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('17', 'icon2_text', '1', '提问图标2的文字', '4', '', '', '1550491019', '1550634139', '1', '以解决问题为导向  ', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('18', 'icon3', '3', '提问图标3', '4', '', '', '1550491054', '0', '1', '/upload/admin/20190302/2e6b1743645a8e20005e91a56a4970b5.png', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('19', 'icon3_text', '1', '提问图标3的文字', '4', '', '', '1550491075', '1550634153', '1', '坚持隐私保护', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('20', 'withdrawAmount', '1', '最小提现金额', '1', '', '', '1551164204', '0', '1', '50', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('22', 'service_agreement', '5', '服务协议', '4', '', '', '1551419261', '1551489920', '1', '<p>本协议是您与共享智慧客户端所有者（以下简称为“共享智慧”）之间就共享智慧客户端服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击“注册”按钮后，本协议即构成对双方有约束力的法律文件。</p><p>&nbsp;</p><p><strong>第1条本客户端服务条款的确认和接纳</strong></p><p>1.1. 本客户端的各项电子服务的所有权和运作权归共享智慧所有。用户同意所有注册协议条款并完成注册程序，才能成为本客户端的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。<br/> 1.2. 用户点击同意本协议的，即视为用户确认自己具有享受本客户端服务，能够独立承担法律责任。<br/> 1.3. 共享智慧保留在中华人民共和国大陆地区法施行之法律允许的范围内独自决定拒绝服务、关闭用户账户、清除或编辑内容或取消订单的权利。</p><p><br/></p><p><strong>第2条本客户端服务</strong></p><p>2.1. 共享智慧通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本客户端规定的情况下，方有权使用本客户端的相关服务。<br/> 2.2. 用户必须自行准备如下设备和承担如下开支：<br/> &nbsp;&nbsp;（1）上网设备，包括并不限于电脑、手机或者其他上网终端、调制解调器及其他必备的上网装置；<br/> &nbsp;&nbsp;（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。</p><p><br/></p><p><strong>第3条用户信息</strong></p><p>3.1. 用户应自行诚信向本客户端提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且共享智慧保留终止用户使用共享智慧各项服务的权利。<br/> 3.2. 用户在使用本客户端时，涉及用户真实姓名/名称、身份证资料、联系电话、工作单位等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。<br/> 3.3. 用户注册成功后，将产生用户名和密码等账户信息，您可以根据本客户端规定改变您的密码。用户应谨慎合理的保存、使用其用户名和密码。用户若发现任何非法使用用户账号或存在安全漏洞的情况，请立即通知本客户端并向公安机关报案。<br/> 3.4. 用户同意，共享智慧拥有通过邮件、短信、手机推送信息，电话等形式，向在本客户端注册、购买的用户发送订单信息、促销活动等告知信息的权利。<br/> 3.5. 用户不得将在本站注册获得的账户借给他人使用，否则用户应承担由此产生的全部责任，并与实际使用人承担连带责任。<br/> 3.6. 用户同意，共享智慧有权使用用户的注册信息、用户名、密码等信息，登陆进入用户的注册账户，进行证据保全，包括但不限于公证、见证等。</p><p><br/></p><p><strong>第4条用户依法言行义务</strong></p><p>本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：<br/> &nbsp;&nbsp;（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；<br/> &nbsp;&nbsp;（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；<br/> &nbsp;&nbsp;（3）不得利用本客户端从事洗钱、窃取商业秘密、窃取个人信息等违法犯罪活动；<br/> &nbsp;&nbsp;（4）不得干扰本客户端的正常运转，不得侵入本客户端及国家计算机信息系统；<br/> &nbsp;&nbsp;（5）不得传输或发表任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的、淫秽的、不文明的等信息资料；<br/> &nbsp;&nbsp;（6）不得传输或发表损害国家社会公共利益和涉及国家安全的信息资料或言论；<br/> &nbsp;&nbsp;（7）不得教唆他人从事本条所禁止的行为；<br/> &nbsp;&nbsp;（8）不得利用在本客户端注册的账户进行牟利性经营活动；<br/> &nbsp;&nbsp;（9）不得发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容；用户应关注并遵守本客户端不时公布或修改的各类合法规则规定。本客户端保有删除各类不符合法律政策或不真实的信息内容而无须通知用户的权利。若用户未遵守以上规定的，本客户端有权作出独立判断并采取暂停或关闭用户帐号等措施。用户须对自己在网上的言论和行为承担法律责任。</p><p><br/></p><p><strong>第5条服务信息</strong></p><p>本客户端上的服务价格、服务类别、能否提供等信息随时都有可能发生变动，本客户端不作特别通知。本客户端显示的信息可能会有一定的滞后性或差错，对此情形您知悉并理解；共享智慧欢迎纠错，并会视情况给予纠错者一定的奖励。</p><p><br/></p><p><strong>第6条订单</strong></p><p>6.1. 在您下订单时，请您仔细确认所购服务的名称、价格、说明等信息。联系人与用户本人不一致的，联系人的行为和意思表示视为用户的行为和意思表示，用户应对联系人的行为及意思表示的法律后果承担连带责任。<br/> 6.2. 除法律另有强制性规定外，双方约定如下：<br/> &nbsp;&nbsp;（1）本客户端上展示的服务类别和价格等信息是回答者自己填写的，您下单时须填写您希望购买的服务、价款等内容；<br/> &nbsp;&nbsp;（2）系统生成的订单信息是计算机信息系统根据您填写的内容自动生成的数据。</p><p>&nbsp;&nbsp;（3）客户端收到您的订单信息后，本客户端会将您在订单中订购的服务向您指定联系人交付，当你选择好回答者后，你与回答者达成合同关系。<br/> &nbsp;&nbsp;（4）您可以随时登陆您在本客户端注册的账户，查询您的订单状态。<br/> 6.3. 由于市场变化及各种以合理商业努力难以控制的因素的影响，本客户端无法保证您提交的订单信息中希望购买的服务都能提供；如您拟购买的服务，发生无法提供的情形，您有权取消订单。<br/> 6.4. 本客户端仅为用户提供中文咨询及书面服务，若用户有英文服务需求，请致电本站客户服务部另行协商确定服务价格。</p><p><br/></p><p><strong>第7条所有权及知识产权条款</strong></p><p>7.1.用户所拥有的著作权财产权等权利（包括并不限于：复制权、发行权、出租权、展览权、表演权、放映权、广播权、信息网络传播权、摄制权、改编权、翻译权、汇编权以及应当由著作权人享有的其他可转让权利）全部归用户个人所拥有，共享智慧不会以任何形式占有，用户授权的除外。</p><p>7.2共享智慧所有信息仅供参考，不做个别诊断和使用的根据。</p><p>南通执着信息科技有限公司致力于提供正确、完整的资讯，但不保证信息的正确性和完整性，且不对因信息的不正确或遗漏导致的任何损失或损害承担责任。</p><p>共享智慧所提供的信息，仅供参考，不能替代医生和其他专业人员的建议，如自行使用共享智慧中资料发生偏差，南通执着信息科技有限公司概不负责，亦不负任何法律责任。</p><p>《寻医问药》模块中的服务提供者均为拥有中华人民共和国医师资格证书的专业医生（《百姓回答》除外）。但咨询建议仅为依据提问者描述而提供建议性内容，不能作为诊断及医疗的依据。</p><p>是否采用共享智慧的医生意见为提问者个人行为，南通执着信息科技有限公司不承担任何可能产生的责任。</p><p>南通执着信息科技有限公司保留对本声明作出不定时修改的权利。</p><p><br/></p><p><strong>第8条服务内容&nbsp; &nbsp; &nbsp;</strong> &nbsp; &nbsp;</p><p>8.1. 咨询服务条款</p><p>本条款所称“咨询”特指用户通过本客户端提交的咨询信息。</p><p>用户必须在注册及申请收费服务时，详细阅读本客户端使用说明信息，并严格按要求操作。在个人信息部分必须提供真实的用户信息。</p><p>一旦发现用户提供的个人信息中有虚假，共享智慧有权立即终止向用户提供的所有服务，并冻结用户的帐户，有权要求用户赔偿因提供虚假信息给其他用户及共享智慧造成的损失。</p><p>咨询均只限于根据用户的主观描述，回答者尽可能利用自己知识及经验给予一定的解惑及如何解决方面的建议，不对结果是否符合用户预期做保证。</p><p>咨询中医生所提供内容均是个人建议，不得做为诊断、治疗的直接医疗处置，用户需知晓并同意诊断及治疗均需前往医院。擅自将医生建议做为处方使用的，后果自负，与医生及共享智慧无关。</p><p>用户在咨询过程中要语言文明，平等交流。如有对回答者恶意中伤，语言不文明，回答者有权立即中断服务，用户无权要求退款。</p><p>8.2. 咨询服务中共享智慧与用户双方的权利及义务</p><p>共享智慧有义务在现有技术上维护平台服务的正常进行，并努力提升技术及改进技术，使咨询服务更好进行。</p><p>对于用户在本客户端预定服务中的不当行为或其它任何共享智慧认为应当终止服务的情况，共享智慧有权随时作出删除相关信息、终止服务提供等处理，而无须征得用户的同意。</p><p>如存在下列情况：</p><p>&nbsp;&nbsp;（1）用户或其它第三方通知共享智慧，认为某个具体用户或具体交易事项可能存在重大问题；<br/> &nbsp;&nbsp;（2）用户或其它第三方向共享智慧告知咨询内容有违法或不当行为的，共享智慧以普通非专业的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为具有违法或不当性质的。</p><p>共享智慧有权根据不同情况选择保留或删除相关信息或继续、停止对该用户提供服务，并追究相关法律责任。</p><p>咨询双方因服务引起的纠纷，请共享智慧给予调解的，共享智慧将有权了解相关信息，并将双方提供的信息与对方沟通。因在共享智慧上发生服务纠纷，引起诉讼的，用户通过司法部门或行政部门依照法定程序要求共享智慧提供相关数据，共享智慧应积极配合并提供有关资料。</p><p>共享智慧有权对用户的注册数据及电话咨询的行为进行查阅，发现注册数据或咨询行为中存在任何问题或怀疑，均有权向用户发出询问及要求改正的通知或者直接作出删除等处理。</p><p>当用户顺利使用完付费咨询服务后不得因为咨询服务中的内容不满意要求退款，如果回答者存在故意欺诈行为，提问者可以向共享智慧申请退款，但申诉期为确认订单后的7日内。</p><p>系统因下列状况无法正常运作，使用户无法使用时，共享智慧不承担损害赔偿责任，该状况包括但不限于：</p><p>&nbsp;&nbsp;（1）共享智慧在本网站公告之系统停机维护期间；<br/> &nbsp;&nbsp;（2）电信设备出现故障不能进行数据传输的；<br/> &nbsp;&nbsp;（3）因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力之因素，造成系统障碍不能执行业务的；<br/> &nbsp;&nbsp;（4）由于黑客攻击、电信部门技术调整或故障、银行方面的问题等原因而造成的服务中断或者延迟。</p><p><br/></p><p><strong>第9条协议更新及用户关注义务</strong></p><p>根据国家法律法规变化及网络运营需要，共享智慧有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在本客户端上即生效，并代替原来的协议。用户可随时登陆查阅最新协议；用户有义务不时关注并阅读最新版的协议及客户端公告。如用户不同意更新后的协议，可以且应立即停止接受共享智慧客户端依据本协议提供的服务；如用户继续使用本客户端提供的服务，即视为同意更新后的协议。共享智慧建议您在使用本客户端之前阅读本协议及本客户端的公告。如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。</p><p><br/></p><p><strong>第10条法律管辖和适用</strong></p><p>本协议的订立、执行和解释及争议的解决均应适用在中华人民共和国大陆地区适用之有效法律（但不包括其冲突法规则）。如发生本协议与适用之法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。如缔约方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向有管辖权的中华人民共和国大陆地区法院提起诉讼。</p><p><br/></p><p><strong>第11条其他</strong></p><p>11.1. 共享智慧客户端所有者是指在政府部门依法备案的共享智慧经营主体---南通执着信息科技有限公司。<br/> 11.2. 共享智慧尊重用户和消费者的合法权利，本协议及本客户端上发布的各类规则、声明等其他内容，均是为了更好的、更加便利的为用户和消费者提供服务。本客户端欢迎用户和社会各界提出意见和建议，共享智慧将虚心接受并适时修改本协议及本客户端的各类规则。<br/> 11.3. 您点击客户端“同意服务条款”，即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</p><p>南通执着信息科技有限公司</p><p>2019 年 3 月</p><p><br/></p>', '0');
INSERT INTO `cmf_gxzh_config` VALUES ('21', 'delay_days', '1', '延迟到账天数', '4', '', '', '1551408774', '1551667600', '1', '7', '0');

-- ----------------------------
-- Table structure for cmf_gxzh_coupon
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_coupon`;
CREATE TABLE `cmf_gxzh_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `price` decimal(10,2) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0未使用 1使用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_coupon
-- ----------------------------
INSERT INTO `cmf_gxzh_coupon` VALUES ('1', '2', '5.00', '1', null, null);
INSERT INTO `cmf_gxzh_coupon` VALUES ('2', '4', '1.00', '1', null, null);
INSERT INTO `cmf_gxzh_coupon` VALUES ('3', '4', '2.00', '1', null, null);
INSERT INTO `cmf_gxzh_coupon` VALUES ('4', '2', '6.00', '1', null, null);
INSERT INTO `cmf_gxzh_coupon` VALUES ('5', '31', '10.00', '0', null, null);
INSERT INTO `cmf_gxzh_coupon` VALUES ('6', '5', '6.00', '0', null, null);

-- ----------------------------
-- Table structure for cmf_gxzh_department
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_department`;
CREATE TABLE `cmf_gxzh_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '科室部门名称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `list_order` int(11) unsigned NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `question_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_department
-- ----------------------------
INSERT INTO `cmf_gxzh_department` VALUES ('2', '咨询服务', '0', '/upload/admin/20190302/a6001ee79dd88477cf24871a71f02bef.png', '1', '1', '0-2', '6');
INSERT INTO `cmf_gxzh_department` VALUES ('3', '设计制作', '0', '/upload/admin/20190302/ee6f64e9274d0a13e692d588bf987389.png', '4', '1', '0-3', '2');
INSERT INTO `cmf_gxzh_department` VALUES ('7', '生活服务', '0', '/upload/admin/20190302/487902d6977771365fc83f72973447d3.png', '0', '1', '0-7', '97');
INSERT INTO `cmf_gxzh_department` VALUES ('8', '安装维修', '7', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('9', '吃喝玩乐', '7', '', '3', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('13', '法律咨询', '2', '', '0', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('14', '知识产权', '2', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('15', '工商财税', '2', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('16', '平面/包装', '3', '', '0', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('17', '工业设计', '3', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('20', '工程智造', '0', '/upload/admin/20190302/d0c56de997eb4aaff222d0d559a70d6c.png', '2', '1', '0-20', '4');
INSERT INTO `cmf_gxzh_department` VALUES ('21', '其他3', '2', '', '0', '0', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('22', '其他2', '2', '', '0', '0', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('23', '网络/软件', '0', '/upload/admin/20190302/a979e185bc50f3843a13569580b5e59a.png', '7', '1', '0-23', '12');
INSERT INTO `cmf_gxzh_department` VALUES ('24', '农林牧渔', '0', '/upload/admin/20190302/6c1eeb06780464cecfb83499d9a6c9db.png', '8', '1', '0-24', '8');
INSERT INTO `cmf_gxzh_department` VALUES ('25', '其他', '2', '', '0', '0', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('26', '婚庆摄影', '7', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('27', '其他服务', '7', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('28', '翻译服务', '2', '', '3', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('29', '体系认证', '2', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('30', '营销方案', '2', '', '5', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('31', '其他服务', '2', '', '8', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('32', '动漫/影视', '3', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('33', '广告策划', '3', '', '3', '0', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('34', '其他服务', '3', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('35', '电路设计', '20', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('36', '结构设计', '20', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('37', 'PLC/DCS', '20', '', '3', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('38', '建筑设计', '20', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('39', '工厂工艺', '20', '', '5', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('40', '工业制造', '20', '', '6', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('41', '设备维修', '20', '', '7', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('42', '其他服务', '20', '', '10', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('43', '融资创业', '2', '', '6', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('44', '购房/置业', '2', '', '7', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('45', '农林牧副渔', '20', '', '9', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('46', '检测/实验', '20', '', '8', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('47', '工程建设', '20', '', '0', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('48', '其他服务', '23', '', '7', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('49', '融资创业', '23', '', '6', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('50', '电商服务', '23', '', '5', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('51', '数据分析', '23', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('52', '软件开发', '23', '', '3', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('53', 'APP开发', '23', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('54', '网站建设', '23', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('55', '其他1', '24', '', '5', '0', '0-2-55', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('56', '渔业', '24', '', '4', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('57', '畜牧业', '24', '', '3', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('58', '林业', '24', '', '2', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('59', '农业', '24', '', '1', '1', '', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('60', '教育学习', '0', '/upload/admin/20190302/7f30b65e041d7761995d86eb4fe3f002.png', '6', '1', '0-60', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('61', '寻医问药', '0', '/uploads/image/201902/02/20190202092925_99568.png', '5', '1', '', '2');
INSERT INTO `cmf_gxzh_department` VALUES ('62', '测试', '8', '', '10000', '0', '0-2-62', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('63', '测试领域', '0', '/upload/admin/20190219/1e2c0b784b2673031e6d80a3eb251ac4.png', '10000', '0', '0-63', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('64', '热心百姓', '61', '', '10', '1', '-64', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('65', '家庭教育', '60', '', '1', '1', '0-60-65', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('66', '学前教育', '60', '', '2', '1', '0-60-66', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('67', '中小学教育', '60', '', '3', '1', '0-60-67', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('68', '语言学习', '60', '', '4', '1', '0-60-68', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('69', '特长学习', '60', '', '5', '1', '0-60-69', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('70', '留学教育', '60', '', '6', '1', '0-60-70', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('71', '其他', '60', '', '7', '1', '0-60-71', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('72', '内科', '61', '', '1', '1', '-72', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('73', '外科', '61', '', '2', '1', '-73', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('74', '儿科', '61', '', '3', '1', '-74', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('75', '皮肤科', '61', '', '4', '1', '-75', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('76', '肿瘤科', '61', '', '8', '1', '-76', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('77', '生殖科', '61', '', '6', '1', '-77', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('78', '眼耳鼻喉科', '61', '', '5', '1', '-78', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('79', '疼痛科', '61', '', '7', '1', '-79', '0');
INSERT INTO `cmf_gxzh_department` VALUES ('80', '疑难杂症', '61', '', '9', '1', '-80', '0');

-- ----------------------------
-- Table structure for cmf_gxzh_distribution
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_distribution`;
CREATE TABLE `cmf_gxzh_distribution` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_gxzh_distribution
-- ----------------------------
INSERT INTO `cmf_gxzh_distribution` VALUES ('1', 'index', '[\"50\",\"25\"]');

-- ----------------------------
-- Table structure for cmf_gxzh_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_guestbook`;
CREATE TABLE `cmf_gxzh_guestbook` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `contents` varchar(1000) NOT NULL,
  `imgs` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cmf_gxzh_guestbook
-- ----------------------------
INSERT INTO `cmf_gxzh_guestbook` VALUES ('1', '5', '测试私信', '', '1550404401');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('2', '5', 'xggcxsdfbcx', '', '1550501962');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('3', '9', '八年级斤斤计较', '', '1550660954');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('4', '5', 'fff', '', '1551094409');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('5', '5', 'fff', '', '1551094412');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('6', '9', '那你。。不', '/upload/gxzh/20190302/d41c5f07c278673a0a2addc68be6ea9e.jpg,/upload/gxzh/20190302/54ce66e439c85b82679408cc6369c515.jpg', '1551495115');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('7', '9', '曹冲称象', '/upload/gxzh/20190302/22d5329cad55999277dc4782404bdb2d.jpg', '1551495252');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('8', '9', '你那边vvv', '/upload/gxzh/20190302/7d3fee65babc4147c3c152f1727b655c.jpg', '1551495331');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('9', '5', '咖喱鸡块', '/upload/gxzh/20190302/348053887acb7ccdfcf151a4db65939e.jpg', '1551507123');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('10', '4', 'dadfa ', '', '1551516352');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('11', '4', 'sdfadf a', '/upload/gxzh/20190302/f0de7fa64c0a109df0fa4176fd9064dd.jpg,/upload/gxzh/20190302/e4efa6c79e5fbf9f45c60503aeea292c.jpg', '1551516557');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('12', '4', 'ssdf sddzzdfzfxfdg电饭锅发的地方给对方地方', '/upload/gxzh/20190302/81da1c200f797edf9f14cd23cc1ffd83.jpg', '1551516617');
INSERT INTO `cmf_gxzh_guestbook` VALUES ('13', '4', 'asdfa sd fsadf asd ', '/upload/gxzh/20190305/f502dfe93b1e1fb4294ff6305715c06c.jpg', '1551756070');

-- ----------------------------
-- Table structure for cmf_gxzh_money_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_money_log`;
CREATE TABLE `cmf_gxzh_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `type` int(2) NOT NULL COMMENT '1:余额 ',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作',
  `before` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '操作前数额',
  `after` decimal(20,2) unsigned NOT NULL COMMENT '操作后数额',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '变动的数额',
  `op` char(1) NOT NULL DEFAULT '' COMMENT '+ , -',
  `msg` varchar(255) DEFAULT NULL COMMENT '日志信息',
  `order_id` varchar(200) DEFAULT NULL COMMENT '订单号',
  `created_at` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `type` (`type`) USING BTREE,
  KEY `op` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_gxzh_money_log
-- ----------------------------
INSERT INTO `cmf_gxzh_money_log` VALUES ('4', '2', '1', 'backstage', '0.00', '1.00', '1.00', '+', '后台充值', '', '1549966870');
INSERT INTO `cmf_gxzh_money_log` VALUES ('5', '2', '1', 'backstage', '1.00', '2.00', '1.00', '+', '后台充值', '', '1549967139');
INSERT INTO `cmf_gxzh_money_log` VALUES ('6', '4', '1', 'backstage', '0.00', '9999999.00', '9999999.00', '+', '后台充值', '', '1550460848');
INSERT INTO `cmf_gxzh_money_log` VALUES ('7', '4', '1', 'pitchon', '9999999.00', '9999976.00', '23.00', '-', '选择抢单专家', 'pitchon_5', '1550461826');
INSERT INTO `cmf_gxzh_money_log` VALUES ('8', '4', '1', 'pitchon', '9999976.00', '9999999.00', '23.00', '+', '抢单被选中', 'pitchon_5', '1550461826');
INSERT INTO `cmf_gxzh_money_log` VALUES ('9', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_31', '1550478901');
INSERT INTO `cmf_gxzh_money_log` VALUES ('10', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_31', '1550478901');
INSERT INTO `cmf_gxzh_money_log` VALUES ('11', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_32', '1550479126');
INSERT INTO `cmf_gxzh_money_log` VALUES ('12', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_32', '1550479126');
INSERT INTO `cmf_gxzh_money_log` VALUES ('13', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_33', '1550479198');
INSERT INTO `cmf_gxzh_money_log` VALUES ('14', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_33', '1550479198');
INSERT INTO `cmf_gxzh_money_log` VALUES ('15', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_34', '1550479211');
INSERT INTO `cmf_gxzh_money_log` VALUES ('16', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_34', '1550479211');
INSERT INTO `cmf_gxzh_money_log` VALUES ('17', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_35', '1550479268');
INSERT INTO `cmf_gxzh_money_log` VALUES ('18', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_35', '1550479268');
INSERT INTO `cmf_gxzh_money_log` VALUES ('19', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_36', '1550479287');
INSERT INTO `cmf_gxzh_money_log` VALUES ('20', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_36', '1550479287');
INSERT INTO `cmf_gxzh_money_log` VALUES ('21', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_37', '1550479445');
INSERT INTO `cmf_gxzh_money_log` VALUES ('22', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_37', '1550479445');
INSERT INTO `cmf_gxzh_money_log` VALUES ('23', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_38', '1550479456');
INSERT INTO `cmf_gxzh_money_log` VALUES ('24', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_38', '1550479456');
INSERT INTO `cmf_gxzh_money_log` VALUES ('25', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_39', '1550479577');
INSERT INTO `cmf_gxzh_money_log` VALUES ('26', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_39', '1550479577');
INSERT INTO `cmf_gxzh_money_log` VALUES ('27', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_40', '1550479686');
INSERT INTO `cmf_gxzh_money_log` VALUES ('28', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_40', '1550479686');
INSERT INTO `cmf_gxzh_money_log` VALUES ('29', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_41', '1550480270');
INSERT INTO `cmf_gxzh_money_log` VALUES ('30', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_41', '1550480270');
INSERT INTO `cmf_gxzh_money_log` VALUES ('31', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_42', '1550480282');
INSERT INTO `cmf_gxzh_money_log` VALUES ('32', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_42', '1550480282');
INSERT INTO `cmf_gxzh_money_log` VALUES ('33', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_43', '1550480392');
INSERT INTO `cmf_gxzh_money_log` VALUES ('34', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_43', '1550480392');
INSERT INTO `cmf_gxzh_money_log` VALUES ('35', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_44', '1550480412');
INSERT INTO `cmf_gxzh_money_log` VALUES ('36', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_44', '1550480412');
INSERT INTO `cmf_gxzh_money_log` VALUES ('37', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_45', '1550480457');
INSERT INTO `cmf_gxzh_money_log` VALUES ('38', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_45', '1550480457');
INSERT INTO `cmf_gxzh_money_log` VALUES ('39', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_46', '1550480470');
INSERT INTO `cmf_gxzh_money_log` VALUES ('40', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_46', '1550480470');
INSERT INTO `cmf_gxzh_money_log` VALUES ('41', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_48', '1550480726');
INSERT INTO `cmf_gxzh_money_log` VALUES ('42', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_48', '1550480726');
INSERT INTO `cmf_gxzh_money_log` VALUES ('43', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_49', '1550480847');
INSERT INTO `cmf_gxzh_money_log` VALUES ('44', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_49', '1550480847');
INSERT INTO `cmf_gxzh_money_log` VALUES ('45', '4', '1', 'pitchon', '9999999.00', '9999963.00', '36.00', '-', '选择抢单专家', 'pitchon_50', '1550480908');
INSERT INTO `cmf_gxzh_money_log` VALUES ('46', '4', '1', 'pitchon', '9999963.00', '9999999.00', '36.00', '+', '抢单被选中', 'pitchon_50', '1550480908');
INSERT INTO `cmf_gxzh_money_log` VALUES ('47', '2', '1', 'backstage', '2.00', '100001.00', '99999.00', '+', '后台充值', '', '1550482654');
INSERT INTO `cmf_gxzh_money_log` VALUES ('48', '2', '1', 'pitchon', '100001.00', '99965.00', '36.00', '-', '选择抢单专家', 'pitchon_51', '1550482657');
INSERT INTO `cmf_gxzh_money_log` VALUES ('49', '4', '1', 'pitchon', '9999999.00', '10000035.00', '36.00', '+', '抢单被选中', 'pitchon_51', '1550482657');
INSERT INTO `cmf_gxzh_money_log` VALUES ('50', '2', '1', 'pitchon', '99965.00', '99929.00', '36.00', '-', '选择抢单专家', 'pitchon_53', '1550483933');
INSERT INTO `cmf_gxzh_money_log` VALUES ('51', '4', '1', 'pitchon', '10000035.00', '10000071.00', '36.00', '+', '抢单被选中', 'pitchon_53', '1550483933');
INSERT INTO `cmf_gxzh_money_log` VALUES ('56', '2', '1', 'pitchon', '99929.00', '99341.00', '588.00', '-', '选择抢单专家', 'pitchon_54', '1550484253');
INSERT INTO `cmf_gxzh_money_log` VALUES ('57', '4', '1', 'pitchon', '10000071.00', '10000659.00', '588.00', '+', '抢单被选中', 'pitchon_54', '1550484253');
INSERT INTO `cmf_gxzh_money_log` VALUES ('58', '2', '1', 'pitchon', '99341.00', '98975.00', '366.00', '-', '选择抢单专家', 'pitchon_55', '1550484393');
INSERT INTO `cmf_gxzh_money_log` VALUES ('59', '4', '1', 'pitchon', '10000659.00', '10001025.00', '366.00', '+', '抢单被选中', 'pitchon_55', '1550484393');
INSERT INTO `cmf_gxzh_money_log` VALUES ('60', '4', '1', 'pitchon', '10001025.00', '10000999.00', '26.00', '-', '选择抢单专家', 'pitchon_56', '1550484582');
INSERT INTO `cmf_gxzh_money_log` VALUES ('61', '2', '1', 'pitchon', '98975.00', '99001.00', '26.00', '+', '抢单被选中', 'pitchon_56', '1550484582');
INSERT INTO `cmf_gxzh_money_log` VALUES ('62', '2', '1', 'pitchon', '99001.00', '98965.00', '36.00', '-', '选择抢单专家', 'pitchon_58', '1550489385');
INSERT INTO `cmf_gxzh_money_log` VALUES ('63', '4', '1', 'pitchon', '10000999.00', '10001035.00', '36.00', '+', '抢单被选中', 'pitchon_58', '1550489385');
INSERT INTO `cmf_gxzh_money_log` VALUES ('64', '5', '1', 'backstage', '0.00', '10000.00', '10000.00', '+', '后台充值', '', '1550501629');
INSERT INTO `cmf_gxzh_money_log` VALUES ('65', '5', '1', 'pitchon', '10000.00', '9964.00', '36.00', '-', '选择抢单专家', 'pitchon_60', '1550501659');
INSERT INTO `cmf_gxzh_money_log` VALUES ('66', '4', '1', 'pitchon', '10001035.00', '10001071.00', '36.00', '+', '抢单被选中', 'pitchon_60', '1550501659');
INSERT INTO `cmf_gxzh_money_log` VALUES ('67', '5', '1', 'pitchon', '9964.00', '9928.00', '36.00', '-', '选择抢单专家', 'pitchon_61', '1550539207');
INSERT INTO `cmf_gxzh_money_log` VALUES ('68', '4', '1', 'pitchon', '10001071.00', '10001107.00', '36.00', '+', '抢单被选中', 'pitchon_61', '1550539207');
INSERT INTO `cmf_gxzh_money_log` VALUES ('69', '5', '1', 'pitchon', '9928.00', '9892.00', '36.00', '-', '选择抢单专家', 'pitchon_62', '1550539245');
INSERT INTO `cmf_gxzh_money_log` VALUES ('70', '4', '1', 'pitchon', '10001107.00', '10001143.00', '36.00', '+', '抢单被选中', 'pitchon_62', '1550539245');
INSERT INTO `cmf_gxzh_money_log` VALUES ('71', '9', '1', 'backstage', '0.00', '66688.00', '66688.00', '+', '后台充值', '', '1550554806');
INSERT INTO `cmf_gxzh_money_log` VALUES ('72', '9', '1', 'pitchon', '66688.00', '65803.00', '885.00', '-', '选择抢单专家', 'pitchon_65', '1550554819');
INSERT INTO `cmf_gxzh_money_log` VALUES ('73', '4', '1', 'pitchon', '10001143.00', '10002028.00', '885.00', '+', '抢单被选中', 'pitchon_65', '1550554819');
INSERT INTO `cmf_gxzh_money_log` VALUES ('74', '5', '1', 'pitchon', '9892.00', '9880.00', '12.00', '-', '选择抢单专家', 'pitchon_67', '1550564516');
INSERT INTO `cmf_gxzh_money_log` VALUES ('75', '7', '1', 'pitchon', '0.00', '12.00', '12.00', '+', '抢单被选中', 'pitchon_67', '1550564516');
INSERT INTO `cmf_gxzh_money_log` VALUES ('76', '9', '1', 'pitchon', '65803.00', '65778.00', '25.00', '-', '选择抢单专家', 'pitchon_64', '1550569191');
INSERT INTO `cmf_gxzh_money_log` VALUES ('77', '4', '1', 'pitchon', '10002028.00', '10002053.00', '25.00', '+', '抢单被选中', 'pitchon_64', '1550569191');
INSERT INTO `cmf_gxzh_money_log` VALUES ('78', '2', '1', 'pitchon', '98965.00', '98940.00', '25.00', '-', '选择抢单专家', 'pitchon_52', '1550571734');
INSERT INTO `cmf_gxzh_money_log` VALUES ('79', '4', '1', 'pitchon', '10002053.00', '10002078.00', '25.00', '+', '抢单被选中', 'pitchon_52', '1550571734');
INSERT INTO `cmf_gxzh_money_log` VALUES ('80', '5', '1', 'pitchon', '9880.00', '9879.00', '1.00', '-', '选择抢单专家', 'pitchon_68', '1550586862');
INSERT INTO `cmf_gxzh_money_log` VALUES ('81', '7', '1', 'pitchon', '12.00', '13.00', '1.00', '+', '抢单被选中', 'pitchon_68', '1550586862');
INSERT INTO `cmf_gxzh_money_log` VALUES ('82', '9', '1', 'pitchon', '65778.00', '65763.00', '15.00', '-', '选择抢单专家', 'pitchon_66', '1550624893');
INSERT INTO `cmf_gxzh_money_log` VALUES ('83', '7', '1', 'pitchon', '13.00', '28.00', '15.00', '+', '抢单被选中', 'pitchon_66', '1550624893');
INSERT INTO `cmf_gxzh_money_log` VALUES ('84', '11', '1', 'backstage', '0.00', '1000.00', '1000.00', '+', '后台充值', '', '1550630678');
INSERT INTO `cmf_gxzh_money_log` VALUES ('85', '9', '1', 'pitchon', '65763.00', '65708.00', '55.00', '-', '选择抢单专家', 'pitchon_69', '1550643064');
INSERT INTO `cmf_gxzh_money_log` VALUES ('86', '4', '1', 'pitchon', '10002078.00', '10002133.00', '55.00', '+', '抢单被选中', 'pitchon_69', '1550643064');
INSERT INTO `cmf_gxzh_money_log` VALUES ('87', '2', '1', 'pitchon', '98940.00', '98904.00', '36.00', '-', '选择抢单专家', 'pitchon_70', '1550663766');
INSERT INTO `cmf_gxzh_money_log` VALUES ('88', '4', '1', 'pitchon', '10002133.00', '10002169.00', '36.00', '+', '抢单被选中', 'pitchon_70', '1550663766');
INSERT INTO `cmf_gxzh_money_log` VALUES ('89', '5', '1', 'pitchon', '9879.00', '9869.00', '10.00', '-', '选择抢单专家', 'pitchon_71', '1550714802');
INSERT INTO `cmf_gxzh_money_log` VALUES ('90', '7', '1', 'pitchon', '28.00', '38.00', '10.00', '+', '抢单被选中', 'pitchon_71', '1550714802');
INSERT INTO `cmf_gxzh_money_log` VALUES ('91', '2', '1', 'withdraw', '98904.00', '98906.00', '2.00', '+', '提现申请通过', 'withdraw_2_20190219174825', '1550752743');
INSERT INTO `cmf_gxzh_money_log` VALUES ('92', '2', '1', 'withdraw', '98906.00', '98907.00', '1.00', '+', '提现申请通过', 'withdraw_2_20190219174716', '1550752754');
INSERT INTO `cmf_gxzh_money_log` VALUES ('93', '5', '1', 'pitchon', '9869.00', '9769.00', '100.00', '-', '选择抢单专家', 'pitchon_75_1550817997', '1550817997');
INSERT INTO `cmf_gxzh_money_log` VALUES ('94', '7', '1', 'pitchon', '38.00', '138.00', '100.00', '+', '抢单被选中', 'pitchon_75_1550817997', '1550817997');
INSERT INTO `cmf_gxzh_money_log` VALUES ('95', '4', '1', 'redpack', '10002169.00', '10002157.00', '12.00', '-', '发红包', 'redpack_1550826451', '1550826451');
INSERT INTO `cmf_gxzh_money_log` VALUES ('96', '2', '1', 'redpack', '98907.00', '98919.00', '12.00', '+', '收红包', 'redpack_1550826451', '1550826451');
INSERT INTO `cmf_gxzh_money_log` VALUES ('97', '4', '1', 'redpack', '10002157.00', '10002145.00', '12.00', '-', '发红包', 'redpack_1550826524', '1550826524');
INSERT INTO `cmf_gxzh_money_log` VALUES ('98', '4', '1', 'redpack', '10002145.00', '10002157.00', '12.00', '+', '收红包', 'redpack_1550826524', '1550826524');
INSERT INTO `cmf_gxzh_money_log` VALUES ('99', '4', '1', 'redpack', '10002157.00', '10002145.00', '12.00', '-', '发红包', 'redpack_1550826595', '1550826595');
INSERT INTO `cmf_gxzh_money_log` VALUES ('100', '4', '1', 'redpack', '10002145.00', '10002157.00', '12.00', '+', '收红包', 'redpack_1550826595', '1550826595');
INSERT INTO `cmf_gxzh_money_log` VALUES ('101', '4', '1', 'redpack', '10002157.00', '10002142.00', '15.00', '-', '发红包', 'redpack_1550826843', '1550826843');
INSERT INTO `cmf_gxzh_money_log` VALUES ('102', '4', '1', 'redpack', '10002142.00', '10002157.00', '15.00', '+', '收红包', 'redpack_1550826843', '1550826843');
INSERT INTO `cmf_gxzh_money_log` VALUES ('103', '4', '1', 'redpack', '10002157.00', '10002132.00', '25.00', '-', '发红包', 'redpack_1550827063', '1550827063');
INSERT INTO `cmf_gxzh_money_log` VALUES ('104', '4', '1', 'redpack', '10002132.00', '10002157.00', '25.00', '+', '收红包', 'redpack_1550827063', '1550827063');
INSERT INTO `cmf_gxzh_money_log` VALUES ('105', '9', '1', 'redpack', '65708.00', '65693.00', '15.00', '-', '发红包', 'redpack_1550827173', '1550827173');
INSERT INTO `cmf_gxzh_money_log` VALUES ('106', '4', '1', 'redpack', '10002157.00', '10002172.00', '15.00', '+', '收红包', 'redpack_1550827173', '1550827173');
INSERT INTO `cmf_gxzh_money_log` VALUES ('107', '9', '1', 'redpack', '65693.00', '65678.00', '15.00', '-', '发红包', 'redpack_1550827318', '1550827318');
INSERT INTO `cmf_gxzh_money_log` VALUES ('108', '4', '1', 'redpack', '10002172.00', '10002187.00', '15.00', '+', '收红包', 'redpack_1550827318', '1550827318');
INSERT INTO `cmf_gxzh_money_log` VALUES ('109', '9', '1', 'redpack', '65678.00', '65653.00', '25.00', '-', '发红包', 'redpack_1550827344', '1550827344');
INSERT INTO `cmf_gxzh_money_log` VALUES ('110', '4', '1', 'redpack', '10002187.00', '10002212.00', '25.00', '+', '收红包', 'redpack_1550827344', '1550827344');
INSERT INTO `cmf_gxzh_money_log` VALUES ('111', '9', '1', 'redpack', '65653.00', '65598.00', '55.00', '-', '发红包', 'redpack_1550827756', '1550827756');
INSERT INTO `cmf_gxzh_money_log` VALUES ('112', '4', '1', 'redpack', '10002212.00', '10002267.00', '55.00', '+', '收红包', 'redpack_1550827756', '1550827756');
INSERT INTO `cmf_gxzh_money_log` VALUES ('113', '9', '1', 'redpack', '65598.00', '65529.00', '69.00', '-', '发红包', 'redpack_1550828107', '1550828107');
INSERT INTO `cmf_gxzh_money_log` VALUES ('114', '4', '1', 'redpack', '10002267.00', '10002336.00', '69.00', '+', '收红包', 'redpack_1550828107', '1550828107');
INSERT INTO `cmf_gxzh_money_log` VALUES ('115', '4', '1', 'redpack', '10002336.00', '10002311.00', '25.00', '-', '发红包', 'redpack_1550828266', '1550828266');
INSERT INTO `cmf_gxzh_money_log` VALUES ('116', '9', '1', 'redpack', '65529.00', '65554.00', '25.00', '+', '收红包', 'redpack_1550828266', '1550828266');
INSERT INTO `cmf_gxzh_money_log` VALUES ('117', '9', '1', 'redpack', '65554.00', '65476.00', '78.00', '-', '发红包', 'redpack_1550828661', '1550828661');
INSERT INTO `cmf_gxzh_money_log` VALUES ('118', '4', '1', 'redpack', '10002311.00', '10002389.00', '78.00', '+', '收红包', 'redpack_1550828661', '1550828661');
INSERT INTO `cmf_gxzh_money_log` VALUES ('119', '9', '1', 'redpack', '65476.00', '65418.00', '58.00', '-', '发红包', 'redpack_1550829180', '1550829180');
INSERT INTO `cmf_gxzh_money_log` VALUES ('120', '4', '1', 'redpack', '10002389.00', '10002447.00', '58.00', '+', '收红包', 'redpack_1550829180', '1550829180');
INSERT INTO `cmf_gxzh_money_log` VALUES ('121', '9', '1', 'redpack', '65418.00', '65363.00', '55.00', '-', '发红包', 'redpack_1550830440', '1550830440');
INSERT INTO `cmf_gxzh_money_log` VALUES ('122', '4', '1', 'redpack', '10002447.00', '10002502.00', '55.00', '+', '收红包', 'redpack_1550830440', '1550830440');
INSERT INTO `cmf_gxzh_money_log` VALUES ('123', '9', '1', 'redpack', '65363.00', '65308.00', '55.00', '-', '发红包', 'redpack_1550830480', '1550830480');
INSERT INTO `cmf_gxzh_money_log` VALUES ('124', '4', '1', 'redpack', '10002502.00', '10002557.00', '55.00', '+', '收红包', 'redpack_1550830480', '1550830480');
INSERT INTO `cmf_gxzh_money_log` VALUES ('125', '9', '1', 'redpack', '65308.00', '65282.00', '26.00', '-', '发红包', 'redpack_1550830508', '1550830508');
INSERT INTO `cmf_gxzh_money_log` VALUES ('126', '4', '1', 'redpack', '10002557.00', '10002583.00', '26.00', '+', '收红包', 'redpack_1550830508', '1550830508');
INSERT INTO `cmf_gxzh_money_log` VALUES ('127', '9', '1', 'redpack', '65282.00', '65213.00', '69.00', '-', '发红包', 'redpack_1550830587', '1550830587');
INSERT INTO `cmf_gxzh_money_log` VALUES ('128', '4', '1', 'redpack', '10002583.00', '10002652.00', '69.00', '+', '收红包', 'redpack_1550830587', '1550830587');
INSERT INTO `cmf_gxzh_money_log` VALUES ('129', '9', '1', 'redpack', '65213.00', '65147.00', '66.00', '-', '发红包', 'redpack_1550830638', '1550830638');
INSERT INTO `cmf_gxzh_money_log` VALUES ('130', '4', '1', 'redpack', '10002652.00', '10002718.00', '66.00', '+', '收红包', 'redpack_1550830638', '1550830638');
INSERT INTO `cmf_gxzh_money_log` VALUES ('131', '9', '1', 'redpack', '65147.00', '65092.00', '55.00', '-', '发红包', 'redpack_1550830712', '1550830712');
INSERT INTO `cmf_gxzh_money_log` VALUES ('132', '4', '1', 'redpack', '10002718.00', '10002773.00', '55.00', '+', '收红包', 'redpack_1550830712', '1550830712');
INSERT INTO `cmf_gxzh_money_log` VALUES ('133', '9', '1', 'redpack', '65092.00', '65026.00', '66.00', '-', '发红包', 'redpack_1550830813', '1550830813');
INSERT INTO `cmf_gxzh_money_log` VALUES ('134', '4', '1', 'redpack', '10002773.00', '10002839.00', '66.00', '+', '收红包', 'redpack_1550830813', '1550830813');
INSERT INTO `cmf_gxzh_money_log` VALUES ('135', '9', '1', 'redpack', '65026.00', '64990.00', '36.00', '-', '发红包', 'redpack_1550830904', '1550830904');
INSERT INTO `cmf_gxzh_money_log` VALUES ('136', '4', '1', 'redpack', '10002839.00', '10002875.00', '36.00', '+', '收红包', 'redpack_1550830904', '1550830904');
INSERT INTO `cmf_gxzh_money_log` VALUES ('137', '9', '1', 'redpack', '64990.00', '64924.00', '66.00', '-', '发红包', 'redpack_1550830952', '1550830952');
INSERT INTO `cmf_gxzh_money_log` VALUES ('138', '4', '1', 'redpack', '10002875.00', '10002941.00', '66.00', '+', '收红包', 'redpack_1550830952', '1550830952');
INSERT INTO `cmf_gxzh_money_log` VALUES ('139', '9', '1', 'redpack', '64924.00', '64888.00', '36.00', '-', '发红包', 'redpack_1550830993', '1550830993');
INSERT INTO `cmf_gxzh_money_log` VALUES ('140', '4', '1', 'redpack', '10002941.00', '10002977.00', '36.00', '+', '收红包', 'redpack_1550830993', '1550830993');
INSERT INTO `cmf_gxzh_money_log` VALUES ('141', '9', '1', 'redpack', '64888.00', '64833.00', '55.00', '-', '发红包', 'redpack_1550831068', '1550831068');
INSERT INTO `cmf_gxzh_money_log` VALUES ('142', '4', '1', 'redpack', '10002977.00', '10003032.00', '55.00', '+', '收红包', 'redpack_1550831068', '1550831068');
INSERT INTO `cmf_gxzh_money_log` VALUES ('143', '9', '1', 'redpack', '64833.00', '64807.00', '26.00', '-', '发红包', 'redpack_1550831120', '1550831120');
INSERT INTO `cmf_gxzh_money_log` VALUES ('144', '4', '1', 'redpack', '10003032.00', '10003058.00', '26.00', '+', '收红包', 'redpack_1550831120', '1550831120');
INSERT INTO `cmf_gxzh_money_log` VALUES ('145', '9', '1', 'redpack', '64807.00', '64749.00', '58.00', '-', '发红包', 'redpack_1550831181', '1550831181');
INSERT INTO `cmf_gxzh_money_log` VALUES ('146', '4', '1', 'redpack', '10003058.00', '10003116.00', '58.00', '+', '收红包', 'redpack_1550831181', '1550831181');
INSERT INTO `cmf_gxzh_money_log` VALUES ('147', '9', '1', 'redpack', '64749.00', '64694.00', '55.00', '-', '发红包', 'redpack_1550831268', '1550831268');
INSERT INTO `cmf_gxzh_money_log` VALUES ('148', '4', '1', 'redpack', '10003116.00', '10003171.00', '55.00', '+', '收红包', 'redpack_1550831268', '1550831268');
INSERT INTO `cmf_gxzh_money_log` VALUES ('149', '9', '1', 'redpack', '64694.00', '64628.00', '66.00', '-', '发红包', 'redpack_1550831670', '1550831670');
INSERT INTO `cmf_gxzh_money_log` VALUES ('150', '4', '1', 'redpack', '10003171.00', '10003237.00', '66.00', '+', '收红包', 'redpack_1550831670', '1550831670');
INSERT INTO `cmf_gxzh_money_log` VALUES ('151', '4', '1', 'redpack', '10003237.00', '10003168.00', '69.00', '-', '发红包', 'redpack_1550831697', '1550831697');
INSERT INTO `cmf_gxzh_money_log` VALUES ('152', '9', '1', 'redpack', '64628.00', '64697.00', '69.00', '+', '收红包', 'redpack_1550831697', '1550831697');
INSERT INTO `cmf_gxzh_money_log` VALUES ('153', '9', '1', 'redpack', '64697.00', '64634.00', '63.00', '-', '发红包', 'redpack_1550832056', '1550832056');
INSERT INTO `cmf_gxzh_money_log` VALUES ('154', '4', '1', 'redpack', '10003168.00', '10003231.00', '63.00', '+', '收红包', 'redpack_1550832056', '1550832056');
INSERT INTO `cmf_gxzh_money_log` VALUES ('155', '4', '1', 'redpack', '10003231.00', '10003172.00', '59.00', '-', '发红包', 'redpack_1550835700', '1550835700');
INSERT INTO `cmf_gxzh_money_log` VALUES ('156', '9', '1', 'redpack', '64634.00', '64693.00', '59.00', '+', '收红包', 'redpack_1550835700', '1550835700');
INSERT INTO `cmf_gxzh_money_log` VALUES ('157', '7', '1', 'redpack', '138.00', '137.00', '1.00', '-', '发红包', 'redpack_1550836743', '1550836743');
INSERT INTO `cmf_gxzh_money_log` VALUES ('158', '9', '1', 'redpack', '64693.00', '64694.00', '1.00', '+', '收红包', 'redpack_1550836743', '1550836743');
INSERT INTO `cmf_gxzh_money_log` VALUES ('159', '2', '1', 'recharge', '98919.00', '98919.01', '0.01', '+', '支付宝充值', '', '1550836748');
INSERT INTO `cmf_gxzh_money_log` VALUES ('160', '2', '1', 'recharge', '98919.01', '98919.02', '0.01', '+', '支付宝充值', '', '1550837013');
INSERT INTO `cmf_gxzh_money_log` VALUES ('161', '2', '1', 'recharge', '98919.02', '98919.03', '0.01', '+', '微信充值', '', '1550837400');
INSERT INTO `cmf_gxzh_money_log` VALUES ('162', '2', '1', 'recharge', '98919.03', '98919.04', '0.01', '+', '微信充值', '', '1550837416');
INSERT INTO `cmf_gxzh_money_log` VALUES ('163', '2', '1', 'recharge', '98919.04', '98919.05', '0.01', '+', '微信充值', '', '1550837431');
INSERT INTO `cmf_gxzh_money_log` VALUES ('164', '2', '1', 'recharge', '98919.05', '98919.06', '0.01', '+', '微信充值', '', '1550837461');
INSERT INTO `cmf_gxzh_money_log` VALUES ('165', '2', '1', 'recharge', '98919.06', '98919.07', '0.01', '+', '支付宝充值', '', '1550837616');
INSERT INTO `cmf_gxzh_money_log` VALUES ('166', '2', '1', 'recharge', '98919.07', '98919.08', '0.01', '+', '微信充值', '', '1550837641');
INSERT INTO `cmf_gxzh_money_log` VALUES ('167', '2', '1', 'refund', '98919.08', '98920.08', '1.00', '+', '退款申请通过', 'refund_2_20190222201346', '1550837644');
INSERT INTO `cmf_gxzh_money_log` VALUES ('168', '4', '1', 'refund', '10003172.00', '10003183.00', '11.00', '+', '退款申请通过', 'refund_4_20190222160731', '1550837680');
INSERT INTO `cmf_gxzh_money_log` VALUES ('169', '7', '1', 'refund', '137.00', '149.00', '12.00', '+', '退款申请通过', 'refund_7_20190222201809', '1550837899');
INSERT INTO `cmf_gxzh_money_log` VALUES ('170', '5', '1', 'pitchon', '9769.00', '9749.00', '20.00', '-', '选择抢单专家', 'pitchon_76_1550905178', '1550905178');
INSERT INTO `cmf_gxzh_money_log` VALUES ('171', '7', '1', 'pitchon', '149.00', '169.00', '20.00', '+', '抢单被选中', 'pitchon_76_1550905178', '1550905178');
INSERT INTO `cmf_gxzh_money_log` VALUES ('176', '2', '1', 'recharge', '98920.08', '98920.09', '0.01', '+', '微信支付', 'pitchon_80_1550913257', '1550913265');
INSERT INTO `cmf_gxzh_money_log` VALUES ('177', '2', '1', 'pitchon', '98920.09', '98920.08', '0.01', '-', '选择专家', 'pitchon_80_1550913257', '1550913265');
INSERT INTO `cmf_gxzh_money_log` VALUES ('178', '13', '1', 'pitchon', '0.00', '0.01', '0.01', '+', '服务被选中', 'pitchon_80_1550913257', '1550913265');
INSERT INTO `cmf_gxzh_money_log` VALUES ('179', '2', '1', 'redpack', '98920.08', '98919.08', '1.00', '-', '发红包', 'redpack_1550913322', '1550913322');
INSERT INTO `cmf_gxzh_money_log` VALUES ('180', '13', '1', 'redpack', '0.01', '1.01', '1.00', '+', '收红包', 'redpack_1550913322', '1550913322');
INSERT INTO `cmf_gxzh_money_log` VALUES ('181', '5', '1', 'recharge', '9749.00', '9749.20', '0.20', '+', '支付宝支付', 'pitchon_79_1550913382', '1550913408');
INSERT INTO `cmf_gxzh_money_log` VALUES ('182', '5', '1', 'pitchon', '9749.20', '9749.00', '0.20', '-', '选择抢单专家', 'pitchon_79_1550913382', '1550913408');
INSERT INTO `cmf_gxzh_money_log` VALUES ('183', '7', '1', 'pitchon', '169.00', '169.20', '0.20', '+', '抢单被选中', 'pitchon_79_1550913382', '1550913408');
INSERT INTO `cmf_gxzh_money_log` VALUES ('184', '2', '1', 'recharge', '98919.08', '98919.09', '0.01', '+', '支付宝支付', 'pitchon_78_1550912594', '1550913430');
INSERT INTO `cmf_gxzh_money_log` VALUES ('185', '2', '1', 'pitchon', '98919.09', '98919.08', '0.01', '-', '选择抢单专家', 'pitchon_78_1550912594', '1550913430');
INSERT INTO `cmf_gxzh_money_log` VALUES ('186', '13', '1', 'pitchon', '1.01', '1.02', '0.01', '+', '抢单被选中', 'pitchon_78_1550912594', '1550913430');
INSERT INTO `cmf_gxzh_money_log` VALUES ('187', '5', '1', 'pitchon', '9749.00', '9748.97', '0.03', '-', '选择抢单专家', 'pitchon_81_1550921127', '1550921127');
INSERT INTO `cmf_gxzh_money_log` VALUES ('188', '7', '1', 'pitchon', '169.20', '169.23', '0.03', '+', '抢单被选中', 'pitchon_81_1550921127', '1550921127');
INSERT INTO `cmf_gxzh_money_log` VALUES ('189', '5', '1', 'redpack', '9748.97', '9747.97', '1.00', '-', '发红包', 'redpack_1550921182', '1550921182');
INSERT INTO `cmf_gxzh_money_log` VALUES ('190', '7', '1', 'redpack', '169.23', '170.23', '1.00', '+', '收红包', 'redpack_1550921182', '1550921182');
INSERT INTO `cmf_gxzh_money_log` VALUES ('191', '5', '1', 'redpack', '9747.97', '7747.97', '2000.00', '-', '发红包', 'redpack_1550921220', '1550921220');
INSERT INTO `cmf_gxzh_money_log` VALUES ('192', '7', '1', 'redpack', '170.23', '2170.23', '2000.00', '+', '收红包', 'redpack_1550921220', '1550921220');
INSERT INTO `cmf_gxzh_money_log` VALUES ('193', '5', '1', 'redpack', '7747.97', '2747.97', '5000.00', '-', '发红包', 'redpack_1550921230', '1550921230');
INSERT INTO `cmf_gxzh_money_log` VALUES ('194', '7', '1', 'redpack', '2170.23', '7170.23', '5000.00', '+', '收红包', 'redpack_1550921230', '1550921230');
INSERT INTO `cmf_gxzh_money_log` VALUES ('195', '5', '1', 'recharge', '2747.97', '2748.07', '0.10', '+', '微信支付', 'pitchon_84_1550922731', '1550922744');
INSERT INTO `cmf_gxzh_money_log` VALUES ('196', '5', '1', 'pitchon', '2748.07', '2747.97', '0.10', '-', '选择专家', 'pitchon_84_1550922731', '1550922744');
INSERT INTO `cmf_gxzh_money_log` VALUES ('197', '7', '1', 'pitchon', '7170.23', '7170.33', '0.10', '+', '服务被选中', 'pitchon_84_1550922731', '1550922744');
INSERT INTO `cmf_gxzh_money_log` VALUES ('198', '5', '1', 'recharge', '2747.97', '2748.07', '0.10', '+', '微信支付', 'pitchon_85_1550922887', '1550922896');
INSERT INTO `cmf_gxzh_money_log` VALUES ('199', '5', '1', 'pitchon', '2748.07', '2747.97', '0.10', '-', '选择专家', 'pitchon_85_1550922887', '1550922896');
INSERT INTO `cmf_gxzh_money_log` VALUES ('200', '7', '1', 'pitchon', '7170.33', '7170.43', '0.10', '+', '服务被选中', 'pitchon_85_1550922887', '1550922896');
INSERT INTO `cmf_gxzh_money_log` VALUES ('201', '5', '1', 'redpack', '2747.97', '2697.97', '50.00', '-', '发红包', 'redpack_1550923027', '1550923027');
INSERT INTO `cmf_gxzh_money_log` VALUES ('202', '7', '1', 'redpack', '7170.43', '7220.43', '50.00', '+', '收红包', 'redpack_1550923027', '1550923027');
INSERT INTO `cmf_gxzh_money_log` VALUES ('203', '5', '1', 'pitchon', '2697.97', '2697.67', '0.30', '-', '选择抢单专家', 'pitchon_86_1550961162', '1550961162');
INSERT INTO `cmf_gxzh_money_log` VALUES ('204', '14', '1', 'pitchon', '0.00', '0.30', '0.30', '+', '抢单被选中', 'pitchon_86_1550961162', '1550961162');
INSERT INTO `cmf_gxzh_money_log` VALUES ('205', '5', '1', 'pitchon', '2697.67', '2661.67', '36.00', '-', '选择抢单专家', 'pitchon_87_1550961798', '1550961798');
INSERT INTO `cmf_gxzh_money_log` VALUES ('206', '4', '1', 'pitchon', '10003183.00', '10003219.00', '36.00', '+', '抢单被选中', 'pitchon_87_1550961798', '1550961798');
INSERT INTO `cmf_gxzh_money_log` VALUES ('207', '4', '1', 'redpack', '10003219.00', '10003161.00', '58.00', '-', '发红包', 'redpack_1550991863', '1550991863');
INSERT INTO `cmf_gxzh_money_log` VALUES ('208', '2', '1', 'redpack', '98919.08', '98977.08', '58.00', '+', '收红包', 'redpack_1550991863', '1550991863');
INSERT INTO `cmf_gxzh_money_log` VALUES ('209', '4', '1', 'redpack', '10003161.00', '10003133.00', '28.00', '-', '发红包', 'redpack_1551007361', '1551007361');
INSERT INTO `cmf_gxzh_money_log` VALUES ('210', '2', '1', 'redpack', '98977.08', '99005.08', '28.00', '+', '收红包', 'redpack_1551007361', '1551007361');
INSERT INTO `cmf_gxzh_money_log` VALUES ('211', '5', '1', 'pitchon', '2661.67', '2653.67', '8.00', '-', '选择抢单专家', 'pitchon_93_1551090739', '1551090739');
INSERT INTO `cmf_gxzh_money_log` VALUES ('212', '14', '1', 'pitchon', '0.30', '8.30', '8.00', '+', '抢单被选中', 'pitchon_93_1551090739', '1551090739');
INSERT INTO `cmf_gxzh_money_log` VALUES ('213', '5', '1', 'pitchon', '2653.67', '2653.57', '0.10', '-', '选择抢单专家', 'pitchon_96_1551091371', '1551091371');
INSERT INTO `cmf_gxzh_money_log` VALUES ('214', '14', '1', 'pitchon', '8.30', '8.40', '0.10', '+', '抢单被选中', 'pitchon_96_1551091371', '1551091371');
INSERT INTO `cmf_gxzh_money_log` VALUES ('215', '5', '1', 'pitchon', '2653.57', '2653.47', '0.10', '-', '选择抢单专家', 'pitchon_97_1551092212', '1551092212');
INSERT INTO `cmf_gxzh_money_log` VALUES ('216', '7', '1', 'pitchon', '7220.43', '7220.53', '0.10', '+', '抢单被选中', 'pitchon_97_1551092212', '1551092212');
INSERT INTO `cmf_gxzh_money_log` VALUES ('217', '5', '1', 'pitchon', '2653.47', '2653.37', '0.10', '-', '选择抢单专家', 'pitchon_98_1551092999', '1551092999');
INSERT INTO `cmf_gxzh_money_log` VALUES ('218', '7', '1', 'pitchon', '7220.53', '7220.63', '0.10', '+', '抢单被选中', 'pitchon_98_1551092999', '1551092999');
INSERT INTO `cmf_gxzh_money_log` VALUES ('219', '5', '1', 'pitchon', '2653.37', '2641.37', '12.00', '-', '选择抢单专家', 'pitchon_102_1551102959', '1551102959');
INSERT INTO `cmf_gxzh_money_log` VALUES ('220', '14', '1', 'pitchon', '8.40', '20.40', '12.00', '+', '抢单被选中', 'pitchon_102_1551102959', '1551102959');
INSERT INTO `cmf_gxzh_money_log` VALUES ('221', '5', '1', 'pitchon', '2641.37', '2640.37', '1.00', '-', '选择抢单专家', 'pitchon_103_1551150061', '1551150061');
INSERT INTO `cmf_gxzh_money_log` VALUES ('222', '7', '1', 'pitchon', '7220.63', '7221.63', '1.00', '+', '抢单被选中', 'pitchon_103_1551150061', '1551150061');
INSERT INTO `cmf_gxzh_money_log` VALUES ('223', '5', '1', 'pitchon', '2640.37', '2639.37', '1.00', '-', '选择抢单专家', 'pitchon_103_1551150103', '1551150103');
INSERT INTO `cmf_gxzh_money_log` VALUES ('224', '7', '1', 'pitchon', '7221.63', '7222.63', '1.00', '+', '抢单被选中', 'pitchon_103_1551150103', '1551150103');
INSERT INTO `cmf_gxzh_money_log` VALUES ('225', '5', '1', 'pitchon', '2639.37', '2638.87', '0.50', '-', '选择抢单专家', 'pitchon_104_1551150125', '1551150125');
INSERT INTO `cmf_gxzh_money_log` VALUES ('226', '14', '1', 'pitchon', '20.40', '20.90', '0.50', '+', '抢单被选中', 'pitchon_104_1551150125', '1551150125');
INSERT INTO `cmf_gxzh_money_log` VALUES ('227', '5', '1', 'pitchon', '2638.87', '2638.77', '0.10', '-', '选择抢单专家', 'pitchon_105_1551150303', '1551150303');
INSERT INTO `cmf_gxzh_money_log` VALUES ('228', '14', '1', 'pitchon', '20.90', '21.00', '0.10', '+', '抢单被选中', 'pitchon_105_1551150303', '1551150303');
INSERT INTO `cmf_gxzh_money_log` VALUES ('229', '7', '1', 'pitchon', '7222.63', '7221.63', '1.00', '-', '选择抢单专家', 'pitchon_106_1551183211', '1551183211');
INSERT INTO `cmf_gxzh_money_log` VALUES ('230', '5', '1', 'pitchon', '2638.77', '2639.77', '1.00', '+', '抢单被选中', 'pitchon_106_1551183211', '1551183211');
INSERT INTO `cmf_gxzh_money_log` VALUES ('231', '5', '1', 'withdraw', '2639.77', '2549.77', '90.00', '-', '提现申请通过', 'withdraw_5_20190226203735', '1551184673');
INSERT INTO `cmf_gxzh_money_log` VALUES ('232', '5', '1', 'withdraw', '2549.77', '2249.77', '300.00', '-', '提现申请通过', 'withdraw_5_20190226204110', '1551184927');
INSERT INTO `cmf_gxzh_money_log` VALUES ('233', '5', '1', 'pitchon', '2249.77', '2244.77', '5.00', '-', '选择抢单专家', 'pitchon_88_1551265840', '1551265840');
INSERT INTO `cmf_gxzh_money_log` VALUES ('234', '14', '1', 'pitchon', '21.00', '26.00', '5.00', '+', '抢单被选中', 'pitchon_88_1551265840', '1551265840');
INSERT INTO `cmf_gxzh_money_log` VALUES ('235', '5', '1', 'pitchon', '2244.77', '2243.77', '1.00', '-', '选择抢单专家', 'pitchon_109_1551271846', '1551271846');
INSERT INTO `cmf_gxzh_money_log` VALUES ('236', '24', '1', 'pitchon', '0.00', '1.00', '1.00', '+', '抢单被选中', 'pitchon_109_1551271846', '1551271846');
INSERT INTO `cmf_gxzh_money_log` VALUES ('237', '5', '1', 'pitchon', '2243.77', '2242.77', '1.00', '-', '选择抢单专家', 'pitchon_109_1551271849', '1551271850');
INSERT INTO `cmf_gxzh_money_log` VALUES ('238', '24', '1', 'pitchon', '1.00', '2.00', '1.00', '+', '抢单被选中', 'pitchon_109_1551271849', '1551271850');
INSERT INTO `cmf_gxzh_money_log` VALUES ('239', '5', '1', 'pitchon', '2242.77', '2241.77', '1.00', '-', '选择抢单专家', 'pitchon_111_1551272314', '1551272314');
INSERT INTO `cmf_gxzh_money_log` VALUES ('240', '24', '1', 'pitchon', '2.00', '3.00', '1.00', '+', '抢单被选中', 'pitchon_111_1551272314', '1551272314');
INSERT INTO `cmf_gxzh_money_log` VALUES ('241', '5', '1', 'pitchon', '2241.77', '2240.77', '1.00', '-', '选择抢单专家', 'pitchon_112_1551272764', '1551272764');
INSERT INTO `cmf_gxzh_money_log` VALUES ('242', '24', '1', 'pitchon', '3.00', '4.00', '1.00', '+', '抢单被选中', 'pitchon_112_1551272764', '1551272764');
INSERT INTO `cmf_gxzh_money_log` VALUES ('243', '5', '1', 'recharge', '2240.77', '2240.87', '0.10', '+', '微信支付', 'pitchon_113_1551273847', '1551273868');
INSERT INTO `cmf_gxzh_money_log` VALUES ('244', '5', '1', 'pitchon', '2240.87', '2240.77', '0.10', '-', '选择抢单专家', 'pitchon_113_1551273847', '1551273868');
INSERT INTO `cmf_gxzh_money_log` VALUES ('245', '24', '1', 'pitchon', '4.00', '4.10', '0.10', '+', '抢单被选中', 'pitchon_113_1551273847', '1551273868');
INSERT INTO `cmf_gxzh_money_log` VALUES ('246', '5', '1', 'recharge', '2240.77', '2240.78', '0.01', '+', '微信支付', 'pitchon_114_1551274122', '1551274132');
INSERT INTO `cmf_gxzh_money_log` VALUES ('247', '5', '1', 'pitchon', '2240.78', '2240.77', '0.01', '-', '选择抢单专家', 'pitchon_114_1551274122', '1551274132');
INSERT INTO `cmf_gxzh_money_log` VALUES ('248', '24', '1', 'pitchon', '4.10', '4.11', '0.01', '+', '抢单被选中', 'pitchon_114_1551274122', '1551274132');
INSERT INTO `cmf_gxzh_money_log` VALUES ('249', '5', '1', 'pitchon', '2240.77', '2140.77', '100.00', '-', '选择抢单专家', 'pitchon_116_1551340839', '1551340839');
INSERT INTO `cmf_gxzh_money_log` VALUES ('250', '24', '1', 'pitchon', '4.11', '104.11', '100.00', '+', '抢单被选中', 'pitchon_116_1551340839', '1551340839');
INSERT INTO `cmf_gxzh_money_log` VALUES ('251', '5', '1', 'refund', '2140.77', '2240.77', '100.00', '+', '退款申请通过', 'refund_5_20190228160221', '1551340964');
INSERT INTO `cmf_gxzh_money_log` VALUES ('252', '4', '1', 'refund', '10003133.00', '10003122.00', '11.00', '-', '提问者退款，审核通过', 'refund_2_20190228173810', '1551346872');
INSERT INTO `cmf_gxzh_money_log` VALUES ('253', '2', '1', 'refund', '99005.08', '99016.08', '11.00', '+', '退款申请通过', 'refund_2_20190228173810', '1551346872');
INSERT INTO `cmf_gxzh_money_log` VALUES ('254', '5', '1', 'pitchon', '2240.77', '2140.77', '100.00', '-', '选择抢单专家', 'pitchon_119_1551351169', '1551351169');
INSERT INTO `cmf_gxzh_money_log` VALUES ('255', '24', '1', 'pitchon', '104.11', '204.11', '100.00', '+', '抢单被选中', 'pitchon_119_1551351169', '1551351169');
INSERT INTO `cmf_gxzh_money_log` VALUES ('256', '24', '1', 'refund', '204.11', '104.11', '100.00', '-', '提问者退款，审核通过', 'refund_5_20190228185446', '1551351415');
INSERT INTO `cmf_gxzh_money_log` VALUES ('257', '5', '1', 'refund', '2140.77', '2240.77', '100.00', '+', '退款申请通过', 'refund_5_20190228185446', '1551351415');
INSERT INTO `cmf_gxzh_money_log` VALUES ('258', '5', '1', 'pitchon', '2240.77', '2240.67', '0.10', '-', '选择抢单专家', 'pitchon_121_1551351859', '1551351859');
INSERT INTO `cmf_gxzh_money_log` VALUES ('259', '14', '1', 'pitchon', '26.00', '26.10', '0.10', '+', '抢单被选中', 'pitchon_121_1551351859', '1551351859');
INSERT INTO `cmf_gxzh_money_log` VALUES ('260', '5', '1', 'pitchon', '2240.67', '2240.57', '0.10', '-', '选择抢单专家', 'pitchon_122_1551352046', '1551352046');
INSERT INTO `cmf_gxzh_money_log` VALUES ('261', '14', '1', 'pitchon', '26.10', '26.20', '0.10', '+', '抢单被选中', 'pitchon_122_1551352046', '1551352046');
INSERT INTO `cmf_gxzh_money_log` VALUES ('262', '4', '1', 'pitchon', '10003122.00', '9947563.00', '55559.00', '-', '选择抢单专家', 'pitchon_127_1551408538', '1551408538');
INSERT INTO `cmf_gxzh_money_log` VALUES ('263', '9', '1', 'pitchon', '64694.00', '120253.00', '55559.00', '+', '抢单被选中', 'pitchon_127_1551408538', '1551408538');
INSERT INTO `cmf_gxzh_money_log` VALUES ('264', '2', '1', 'pitchon', '99016.08', '99016.07', '0.01', '-', '选择抢单专家', 'pitchon_129_1551416387', '1551416387');
INSERT INTO `cmf_gxzh_money_log` VALUES ('265', '23', '1', 'backstage', '0.00', '10000.00', '10000.00', '+', '后台充值', '', '1551416713');
INSERT INTO `cmf_gxzh_money_log` VALUES ('266', '23', '1', 'pitchon', '10000.00', '9999.99', '0.01', '-', '选择抢单专家', 'pitchon_128_1551416727', '1551416727');
INSERT INTO `cmf_gxzh_money_log` VALUES ('267', '2', '1', 'pitchon', '99016.07', '99016.08', '0.01', '+', '回答问题奖励', 'pitchon_128_1551416727', '1551418981');
INSERT INTO `cmf_gxzh_money_log` VALUES ('268', '23', '1', 'pitchon', '9999.99', '10000.00', '0.01', '+', '回答问题奖励', 'pitchon_129_1551416387', '1551418981');
INSERT INTO `cmf_gxzh_money_log` VALUES ('269', '9', '1', 'pitchon', '120253.00', '119665.00', '588.00', '-', '选择抢单专家', 'pitchon_130_1551442388', '1551442388');
INSERT INTO `cmf_gxzh_money_log` VALUES ('270', '4', '1', 'pitchon', '9947563.00', '9948151.00', '588.00', '+', '回答问题奖励', 'pitchon_130_1551442388', '1551444541');
INSERT INTO `cmf_gxzh_money_log` VALUES ('271', '9', '1', 'pitchon', '119665.00', '119610.00', '55.00', '-', '选择抢单专家', 'pitchon_131_1551444931', '1551444931');
INSERT INTO `cmf_gxzh_money_log` VALUES ('272', '27', '1', 'recharge', '0.00', '1.00', '1.00', '+', '微信充值', '', '1551448079');
INSERT INTO `cmf_gxzh_money_log` VALUES ('273', '5', '1', 'pitchon', '2240.57', '2140.57', '100.00', '-', '选择抢单专家', 'pitchon_132_1551449738', '1551449738');
INSERT INTO `cmf_gxzh_money_log` VALUES ('274', '14', '1', 'pitchon', '26.20', '126.20', '100.00', '+', '回答问题奖励', 'pitchon_132_1551449738', '1551451261');
INSERT INTO `cmf_gxzh_money_log` VALUES ('275', '5', '1', 'pitchon', '2140.57', '2040.57', '100.00', '-', '选择抢单专家', 'pitchon_132_1551451565', '1551451565');
INSERT INTO `cmf_gxzh_money_log` VALUES ('276', '5', '1', 'pitchon', '2040.57', '1890.57', '150.00', '-', '选择抢单专家', 'pitchon_133_1551451593', '1551451593');
INSERT INTO `cmf_gxzh_money_log` VALUES ('277', '14', '1', 'pitchon', '126.20', '125.20', '1.00', '-', '选择抢单专家', 'pitchon_134_1551492464', '1551492464');
INSERT INTO `cmf_gxzh_money_log` VALUES ('278', '14', '1', 'pitchon', '125.20', '275.20', '150.00', '+', '回答问题奖励', 'pitchon_133_1551451593', '1551494941');
INSERT INTO `cmf_gxzh_money_log` VALUES ('279', '5', '1', 'pitchon', '1890.57', '1891.57', '1.00', '+', '回答问题奖励', 'pitchon_134_1551492464', '1551494941');
INSERT INTO `cmf_gxzh_money_log` VALUES ('280', '14', '1', 'pitchon', '275.20', '176.20', '99.00', '-', '选择抢单专家', 'pitchon_135_1551495554', '1551495554');
INSERT INTO `cmf_gxzh_money_log` VALUES ('281', '14', '1', 'refund', '176.20', '226.20', '50.00', '+', '退款申请通过', 'refund_14_20190302110000', '1551495681');
INSERT INTO `cmf_gxzh_money_log` VALUES ('282', '2', '1', 'recharge', '99016.08', '99016.09', '0.01', '+', '微信支付', 'pitchon_136_1551498294', '1551498302');
INSERT INTO `cmf_gxzh_money_log` VALUES ('283', '2', '1', 'pitchon', '99016.09', '99016.08', '0.01', '-', '选择抢单专家', 'pitchon_136_1551498294', '1551498302');
INSERT INTO `cmf_gxzh_money_log` VALUES ('284', '2', '1', 'recharge', '99016.08', '99016.09', '0.01', '+', '支付宝支付', 'pitchon_137_1551498497', '1551498506');
INSERT INTO `cmf_gxzh_money_log` VALUES ('285', '2', '1', 'pitchon', '99016.09', '99016.08', '0.01', '-', '选择抢单专家', 'pitchon_137_1551498497', '1551498506');
INSERT INTO `cmf_gxzh_money_log` VALUES ('286', '9', '1', 'redpack', '119610.00', '119555.00', '55.00', '-', '协商再次付款', 'redpack_1551498936', '1551498936');
INSERT INTO `cmf_gxzh_money_log` VALUES ('287', '31', '1', 'recharge', '0.00', '0.01', '0.01', '+', '微信支付', 'pitchon_142_1551529911', '1551529936');
INSERT INTO `cmf_gxzh_money_log` VALUES ('288', '31', '1', 'pitchon', '0.01', '0.00', '0.01', '-', '选择抢单专家', 'pitchon_142_1551529911', '1551529936');
INSERT INTO `cmf_gxzh_money_log` VALUES ('289', '5', '1', 'redpack', '1891.57', '1791.57', '100.00', '-', '协商再次付款', 'redpack_1551532061', '1551532061');
INSERT INTO `cmf_gxzh_money_log` VALUES ('290', '5', '1', 'redpack', '1791.57', '1491.57', '300.00', '-', '协商再次付款', 'redpack_1551532082', '1551532082');
INSERT INTO `cmf_gxzh_money_log` VALUES ('291', '5', '1', 'pitchon', '1491.57', '1491.47', '0.10', '-', '选择抢单专家', 'pitchon_148_1551572982', '1551572982');
INSERT INTO `cmf_gxzh_money_log` VALUES ('292', '15', '1', 'recharge', '0.00', '0.10', '0.10', '+', '微信支付', 'pitchon_100_1551573400', '1551573409');
INSERT INTO `cmf_gxzh_money_log` VALUES ('293', '15', '1', 'pitchon', '0.10', '0.00', '0.10', '-', '选择抢单专家', 'pitchon_100_1551573400', '1551573409');
INSERT INTO `cmf_gxzh_money_log` VALUES ('294', '31', '1', 'recharge', '0.00', '0.01', '0.01', '+', '微信支付', 'pitchon_155_1551576035', '1551576047');
INSERT INTO `cmf_gxzh_money_log` VALUES ('295', '31', '1', 'pitchon', '0.01', '0.00', '0.01', '-', '选择抢单专家', 'pitchon_155_1551576035', '1551576047');
INSERT INTO `cmf_gxzh_money_log` VALUES ('296', '31', '1', 'recharge', '0.00', '0.02', '0.02', '+', '微信支付', 'pitchon_152_1551576362', '1551576370');
INSERT INTO `cmf_gxzh_money_log` VALUES ('297', '31', '1', 'pitchon', '0.02', '0.00', '0.02', '-', '选择抢单专家', 'pitchon_152_1551576362', '1551576370');
INSERT INTO `cmf_gxzh_money_log` VALUES ('298', '31', '1', 'recharge', '0.00', '0.02', '0.02', '+', '微信支付', 'pitchon_157_1551577778', '1551577790');
INSERT INTO `cmf_gxzh_money_log` VALUES ('299', '31', '1', 'pitchon', '0.02', '0.00', '0.02', '-', '选择抢单专家', 'pitchon_157_1551577778', '1551577790');
INSERT INTO `cmf_gxzh_money_log` VALUES ('300', '14', '1', 'pitchon', '226.20', '224.70', '1.50', '-', '选择抢单专家', 'pitchon_161_1551586024', '1551586024');
INSERT INTO `cmf_gxzh_money_log` VALUES ('301', '4', '1', 'redpack', '9948151.00', '9947482.00', '669.00', '-', '协商再次付款', 'redpack_1551599653', '1551599653');
INSERT INTO `cmf_gxzh_money_log` VALUES ('302', '2', '1', 'redpack', '99016.08', '99015.08', '1.00', '-', '协商再次付款', 'redpack_1551669955', '1551669955');
INSERT INTO `cmf_gxzh_money_log` VALUES ('303', '14', '1', 'pitchon', '224.70', '223.70', '1.00', '-', '选择抢单专家', 'pitchon_163_1551672679', '1551672679');
INSERT INTO `cmf_gxzh_money_log` VALUES ('304', '14', '1', 'pitchon', '223.70', '118.70', '105.00', '-', '选择抢单专家', 'pitchon_166_1551673001', '1551673001');
INSERT INTO `cmf_gxzh_money_log` VALUES ('305', '14', '1', 'pitchon', '118.70', '108.70', '10.00', '-', '选择抢单专家', 'pitchon_169_1551673085', '1551673085');
INSERT INTO `cmf_gxzh_money_log` VALUES ('306', '14', '1', 'pitchon', '108.70', '98.70', '10.00', '-', '选择抢单专家', 'pitchon_170_1551673149', '1551673149');
INSERT INTO `cmf_gxzh_money_log` VALUES ('307', '14', '1', 'pitchon', '98.70', '88.70', '10.00', '-', '选择抢单专家', 'pitchon_171_1551673195', '1551673195');
INSERT INTO `cmf_gxzh_money_log` VALUES ('308', '14', '1', 'redpack', '88.70', '78.70', '10.00', '-', '协商再次付款', 'redpack_1551673581', '1551673581');
INSERT INTO `cmf_gxzh_money_log` VALUES ('309', '14', '1', 'pitchon', '78.70', '77.70', '1.00', '-', '选择抢单专家', 'pitchon_173_1551681136', '1551681136');
INSERT INTO `cmf_gxzh_money_log` VALUES ('310', '9', '1', 'redpack', '119555.00', '119530.00', '25.00', '-', '协商再次付款', 'redpack_1551684009', '1551684009');
INSERT INTO `cmf_gxzh_money_log` VALUES ('311', '9', '1', 'redpack', '119530.00', '119494.00', '36.00', '-', '协商再次付款', 'redpack_1551684123', '1551684123');
INSERT INTO `cmf_gxzh_money_log` VALUES ('312', '9', '1', 'redpack', '119494.00', '119466.00', '28.00', '-', '协商再次付款', 'redpack_1551684307', '1551684307');
INSERT INTO `cmf_gxzh_money_log` VALUES ('313', '9', '1', 'redpack', '119466.00', '119378.00', '88.00', '-', '协商再次付款', 'redpack_1551684394', '1551684394');
INSERT INTO `cmf_gxzh_money_log` VALUES ('314', '9', '1', 'redpack', '119378.00', '119293.00', '85.00', '-', '协商再次付款', 'redpack_1551684565', '1551684565');
INSERT INTO `cmf_gxzh_money_log` VALUES ('315', '9', '1', 'redpack', '119293.00', '119208.00', '85.00', '-', '协商再次付款', 'redpack_1551684590', '1551684590');
INSERT INTO `cmf_gxzh_money_log` VALUES ('316', '9', '1', 'redpack', '119208.00', '119183.00', '25.00', '-', '协商再次付款', 'redpack_1551684692', '1551684692');
INSERT INTO `cmf_gxzh_money_log` VALUES ('317', '9', '1', 'redpack', '119183.00', '119114.00', '69.00', '-', '协商再次付款', 'redpack_1551684857', '1551684857');
INSERT INTO `cmf_gxzh_money_log` VALUES ('318', '9', '1', 'redpack', '119114.00', '119048.00', '66.00', '-', '协商再次付款', 'redpack_1551685014', '1551685014');
INSERT INTO `cmf_gxzh_money_log` VALUES ('319', '14', '1', 'pitchon', '77.70', '67.70', '10.00', '-', '选择抢单专家', 'pitchon_179_1551699760', '1551699760');
INSERT INTO `cmf_gxzh_money_log` VALUES ('320', '14', '1', 'pitchon', '67.70', '57.70', '10.00', '-', '选择抢单专家', 'pitchon_180_1551699941', '1551699941');
INSERT INTO `cmf_gxzh_money_log` VALUES ('321', '5', '1', 'pitchon', '1491.47', '1491.37', '0.10', '-', '选择抢单专家', 'pitchon_182_1551707310', '1551707310');
INSERT INTO `cmf_gxzh_money_log` VALUES ('322', '14', '1', 'redpack', '57.70', '52.70', '5.00', '-', '协商再次付款', 'redpack_1551745556', '1551745556');
INSERT INTO `cmf_gxzh_money_log` VALUES ('323', '9', '1', 'pitchon', '119048.00', '118948.00', '100.00', '-', '选择抢单专家', 'pitchon_184_1551748188', '1551748188');
INSERT INTO `cmf_gxzh_money_log` VALUES ('324', '14', '1', 'redpack', '52.70', '51.70', '1.00', '-', '协商再次付款', 'redpack_1551752336', '1551752336');
INSERT INTO `cmf_gxzh_money_log` VALUES ('325', '5', '1', 'pitchon', '1491.37', '1491.27', '0.10', '-', '选择抢单专家', 'pitchon_185_1551753216', '1551753216');
INSERT INTO `cmf_gxzh_money_log` VALUES ('326', '4', '1', 'pitchon', '9947482.00', '9947382.00', '100.00', '-', '选择抢单专家', 'pitchon_191_1551774542', '1551774542');
INSERT INTO `cmf_gxzh_money_log` VALUES ('327', '20', '1', 'backstage', '0.00', '60000.00', '60000.00', '+', '后台充值', '', '1551776271');
INSERT INTO `cmf_gxzh_money_log` VALUES ('328', '20', '1', 'pitchon', '60000.00', '53348.00', '6652.00', '-', '选择抢单专家', 'pitchon_193_1551777015', '1551777015');
INSERT INTO `cmf_gxzh_money_log` VALUES ('329', '20', '1', 'redpack', '53348.00', '53303.00', '45.00', '-', '协商再次付款', 'redpack_1551777975', '1551777975');
INSERT INTO `cmf_gxzh_money_log` VALUES ('330', '20', '1', 'redpack', '53303.00', '53283.00', '20.00', '-', '协商再次付款', 'redpack_1551780950', '1551780950');
INSERT INTO `cmf_gxzh_money_log` VALUES ('331', '20', '1', 'redpack', '53283.00', '53227.00', '56.00', '-', '协商再次付款', 'redpack_1551780972', '1551780972');
INSERT INTO `cmf_gxzh_money_log` VALUES ('332', '20', '1', 'redpack', '53227.00', '52772.00', '455.00', '-', '协商再次付款', 'redpack_1551781098', '1551781098');
INSERT INTO `cmf_gxzh_money_log` VALUES ('333', '4', '1', 'redpack', '9947382.00', '9947324.00', '58.00', '-', '协商再次付款', 'redpack_1551783217', '1551783217');
INSERT INTO `cmf_gxzh_money_log` VALUES ('334', '20', '1', 'redpack', '52772.00', '52738.00', '34.00', '-', '协商再次付款', 'redpack_1551791440', '1551791440');
INSERT INTO `cmf_gxzh_money_log` VALUES ('335', '20', '1', 'redpack', '52738.00', '52715.00', '23.00', '-', '协商再次付款', 'redpack_1551791550', '1551791550');

-- ----------------------------
-- Table structure for cmf_gxzh_msg
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_msg`;
CREATE TABLE `cmf_gxzh_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(11) DEFAULT NULL COMMENT '用户uid',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '1=>公告 2=>通知信息',
  `remark` text COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态，1启用，0禁用',
  `created_at` int(11) unsigned DEFAULT NULL,
  `updated_at` int(11) unsigned DEFAULT NULL,
  `is_deleted` int(2) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告表';

-- ----------------------------
-- Records of cmf_gxzh_msg
-- ----------------------------
INSERT INTO `cmf_gxzh_msg` VALUES ('1', '共享家族又添新成员啦！', null, '1', '公告', '<p><iframe src=\"https://v.qq.com/txp/iframe/player.html?vid=c0827gab7qy\" width=\"360\" height=\"200\" frameborder=\"0\"></iframe></p><p><br/></p><p><br/></p><p><br/></p><p style=\"line-height: 2.5em; text-align: center;\"><span style=\"font-size: 20px;\"><strong><span style=\"font-size: 20px;\">真正意义上的共享该如何定义呢？</span></strong></span></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 20px;\"><strong><span style=\"font-size: 20px; background-color: rgb(242, 220, 219);\"><br/></span></strong></span></p><p><br/></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-size: 18px;\">“共享经济”的本质</span></strong><span style=\"font-size: 18px;\">：</span></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 18px;\"><span style=\"background-color: rgb(229, 185, 183);\">&nbsp; &nbsp; &nbsp; &nbsp; 对社会闲置资源进行再次调配，从而满足人们群众以较低的价格享用这些资源的需求。</span>就当下的市场发展情况来看，满足这一条件的共享企业可谓凤毛麟角，如果非要推举一个，共享智慧App堪称典范。</span></p><p><br/></p><p><br/></p><p style=\"line-height: 2.5em;\"><strong><span style=\"font-size: 18px;\">共享智慧App：</span></strong></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 18px; background-color: rgb(204, 193, 217);\"> &nbsp; &nbsp; &nbsp; &nbsp; 侧重于经验分享，开辟了一个快速获取知识的新途径。不出售任何实物商品，不需要任何充值，在这里，用户既可以是提问者，也可以是回答者，零门槛设置让每一位用户的才智能充分变现，你懂得的也许正是别人所需要的。</span></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp; &nbsp; 实时更新的防护系统最大程度的保护用户的隐私安全不受侵犯，足不出户利用自己的才智帮助他人或者解决自己当前面临的问题。</span></p><p><br/></p><p style=\"line-height: 2.5em;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;如果将<strong>共享经济</strong>视为互联网+的一个新思维，那么，迎合共享经济自身的特点应该成为也必须成为各大企业主首当其冲要做的事情，惟其如此才有可能真正抓住“共享”机遇，从而在激烈的市场竞争中站稳脚跟，充分认识到这一点的轻资产且易大规模铺开、最主要的是产品利用率高的<strong>共享智慧</strong>，会不会为共享经济的发展指明出路？让我们拭目以待。</span></p><p><br/></p>', '1', null, null, '0', '999');
INSERT INTO `cmf_gxzh_msg` VALUES ('2', '您的抢单被选中', '4', '2', null, '咨询问题：完美世界', '0', '1550461826', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('3', '您的抢单被选中', '4', '2', null, '咨询问题：mooed', '0', '1550478901', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('4', '您的抢单被选中', '4', '2', null, '咨询问题：玉兔', '0', '1550479126', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('5', '您的抢单被选中', '4', '2', null, '咨询问题：噢噢噢哦哦', '0', '1550479198', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('6', '您的抢单被选中', '4', '2', null, '咨询问题：函数图', '0', '1550479211', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('7', '您的抢单被选中', '4', '2', null, '咨询问题：哦now', '0', '1550479268', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('8', '您的抢单被选中', '4', '2', null, '咨询问题：来PK哦要', '0', '1550479287', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('9', '您的抢单被选中', '4', '2', null, '咨询问题：莫有样在真转', '0', '1550479445', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('10', '您的抢单被选中', '4', '2', null, '咨询问题：考虑图示', '0', '1550479456', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('11', '您的抢单被选中', '4', '2', null, '咨询问题：马路杀手', '0', '1550479577', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('12', '您的抢单被选中', '4', '2', null, '咨询问题：66841566', '0', '1550479686', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('13', '您的抢单被选中', '4', '2', null, '咨询问题：谈得上', '0', '1550480270', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('14', '您的抢单被选中', '4', '2', null, '咨询问题：海陆空', '0', '1550480282', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('15', '您的抢单被选中', '4', '2', null, '咨询问题：急哭了', '0', '1550480392', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('16', '您的抢单被选中', '4', '2', null, '咨询问题：漂亮', '0', '1550480412', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('17', '您的抢单被选中', '4', '2', null, '咨询问题：小咯哦哦啦啊', '0', '1550480457', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('18', '您的抢单被选中', '4', '2', null, '咨询问题：去咯无卡', '0', '1550480470', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('19', '您的抢单被选中', '4', '2', null, '咨询问题：特逗', '0', '1550480726', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('20', '您的抢单被选中', '4', '2', null, '咨询问题：好女哦旅途', '0', '1550480847', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('21', '您的抢单被选中', '4', '2', null, '咨询问题：15699哦信誉图', '0', '1550480908', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('22', '您的问题已有抢单', '2', '2', null, '您的问题<测试开始>已有抢单', '1', '1550482631', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('23', '您的抢单被选中', '4', '2', null, '咨询问题：测试开始', '0', '1550482657', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('24', '您的问题已有抢单', '2', '2', null, '您的问题<第二个>已有抢单', '1', '1550483418', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('25', '您的抢单被选中', '4', '2', null, '咨询问题：向特定专家提问', '0', '1550483933', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('26', '您的问题已有抢单', '2', '2', null, '您的问题<第五个>已有抢单', '0', '1550484130', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('29', '您的抢单被选中', '4', '2', null, '咨询问题：第五个', '0', '1550484253', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('30', '您的问题已有抢单', '2', '2', null, '您的问题<第六个>已有抢单', '1', '1550484377', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('31', '您的抢单被选中', '4', '2', null, '咨询问题：第六个', '0', '1550484393', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('32', '您的问题已有抢单', '4', '2', null, '您的问题<测试发布问题>已有抢单', '0', '1550484562', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('33', '您的抢单被选中', '2', '2', null, '咨询问题：测试发布问题', '1', '1550484582', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('34', '您的问题已有抢单', '4', '2', null, '您的问题<缺乏维生素>已有抢单', '0', '1550489238', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('35', '您的抢单被选中', '4', '2', null, '咨询问题：7777', '0', '1550489385', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('36', '您的抢单被选中', '4', '2', null, '咨询问题：fdsff', '0', '1550501659', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('37', '您的抢单被选中', '4', '2', null, '咨询问题：dndndn', '0', '1550539207', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('38', '您的抢单被选中', '4', '2', null, '咨询问题：nxjdj', '1', '1550539245', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('39', '您的问题已有抢单', '5', '2', null, '您的问题<sfff>已有抢单', '1', '1550540095', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('40', '您的问题已有抢单', '9', '2', null, '您的问题<v京津冀>已有抢单', '1', '1550541944', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('41', '您的问题已有抢单', '9', '2', null, '您的问题<不斤斤计较>已有抢单', '1', '1550554681', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('42', '您的抢单被选中', '4', '2', null, '咨询问题：不斤斤计较', '0', '1550554819', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('43', '您的问题已有抢单', '9', '2', null, '您的问题<不斤斤计较>已有抢单', '1', '1550564451', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('44', '您的问题已有抢单', '5', '2', null, '您的问题<Fog测试1>已有抢单', '1', '1550564477', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('45', '您的抢单被选中', '7', '2', null, '咨询问题：Fog测试1', '1', '1550564516', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('46', '您的抢单被选中', '4', '2', null, '咨询问题：v京津冀', '0', '1550569191', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('47', '您的抢单被选中', '4', '2', null, '咨询问题：第二个', '0', '1550571734', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('48', '您的问题已有抢单', '5', '2', null, '您的问题<回来了>已有抢单', '1', '1550586839', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('49', '您的抢单被选中', '7', '2', null, '咨询问题：回来了', '0', '1550586862', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('50', '您的抢单被选中', '7', '2', null, '咨询问题：不斤斤计较', '0', '1550624893', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('51', '您的问题已有抢单', '9', '2', null, '您的问题<规律不会>已有抢单', '1', '1550643053', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('52', '您的抢单被选中', '4', '2', null, '咨询问题：规律不会', '1', '1550643064', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('53', '您的抢单被选中', '4', '2', null, '咨询问题：太可怜了', '1', '1550663766', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('54', '共享智慧与百度知道和知乎有什么区别呢？', null, '1', null, '<p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">一、<strong>共同点</strong>：</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">都有提问，回答问题的功能。</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">二、不同点：</span></strong></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">1.<strong>百度，知乎</strong>：财大气粗，大量使用AI（人工智能)技术,但是人工智能是人喂饱的，需要大量的学习已知的问题。</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>共享智慧</strong>:是个创业型的公司，没有这么强悍的技术。</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong><br/></strong></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>2.共享智慧&nbsp;</strong></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp;更侧重于经验的分享，这些经验好多在百度知乎是不可能找到的，压箱底的技术是不可能在搜索引擎上查到的</span><br/></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong style=\"white-space: normal;\"><span style=\"font-size: 18px;\">3.共享智慧</span></strong></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>&nbsp; &nbsp; &nbsp;</strong>对隐私保护更好，让你敢说，而且说了有经济效益。我们不设门槛，以解决问题为导向，任何人都有机会回答问题。但是我们有多重身份和资质认证，让你选择时更容易。</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"></span></p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"color: rgb(255, 0, 0); font-size: 18px; background-color: rgb(219, 238, 243);\">4.共享智慧</span></strong></p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"color: rgb(255, 0, 0); font-size: 18px; background-color: rgb(219, 238, 243);\">&nbsp; &nbsp; &nbsp;我们会保护你的知识产权和想法，你的一个技能或一个想法可以赚很多次钱，我们不会公开你的答案，更不会上传到网络，成为公开的网络数据。</span></strong></p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"color: rgb(255, 0, 0); font-size: 18px; background-color: rgb(219, 238, 243);\"><br/></span></strong></p><p style=\"text-align: left; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">5.最本质最核心的是：</span></strong></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"color: rgb(255, 0, 0); background-color: rgb(219, 238, 243);\"><strong><span style=\"color: rgb(255, 0, 0); background-color: rgb(219, 238, 243); font-size: 18px;\"><br/></span></strong></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>百度、知乎</strong>：</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp;他们是在卖产品，只是这个产品是“专家”，与我们普通人没什么关系，最多我们是个利润的贡献者。</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>共享智慧</strong>：</span></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp; 给不平凡的你一个展示自我的机会，依靠自己的智慧赚钱，跟抢红包是有很大区别的。</span></p><p style=\"text-align: left; line-height: 2em;\"><br/></p><p style=\"text-align: left; line-height: 2em;\"><br/></p><p style=\"text-align: left; line-height: 2em;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"text-align: left; line-height: 2em;\"><br/></p><p><br style=\"text-align: left;\"/></p>', '1', null, null, '0', '999');
INSERT INTO `cmf_gxzh_msg` VALUES ('55', '您的问题已有抢单', '5', '2', null, '您的问题<测试>已有抢单', '1', '1550714778', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('56', '您的抢单被选中', '7', '2', null, '咨询问题：测试', '0', '1550714802', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('57', '提现申请通过', '2', '2', null, '提现申请通过，提现金额：2', '1', '1550752743', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('58', '提现申请通过', '2', '2', null, '提现申请通过，提现金额：1', '1', '1550752754', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('59', '您的问题已有抢单', '9', '2', null, '您的问题<好纠结宝宝>已有抢单', '1', '1550804434', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('60', '您的问题已有抢单', '4', '2', null, '您的问题<无影无踪>已有抢单', '1', '1550808403', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('61', '您的问题已有抢单', '9', '2', null, '您的问题<盖好被被>已有抢单', '0', '1550815001', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('62', '您的问题已有抢单', '5', '2', null, '您的问题<A片>已有抢单', '1', '1550817937', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('63', '您的抢单被选中', '7', '2', null, '咨询问题：A片', '0', '1550817997', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('64', '退款申请通过', '2', '2', null, '退款申请通过，退款金额：1', '0', '1550837644', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('65', '退款申请通过', '4', '2', null, '退款申请通过，退款金额：11', '1', '1550837680', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('66', '退款申请通过', '7', '2', null, '退款申请通过，退款金额：12', '0', '1550837899', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('67', '退款申请未通过', '7', '2', null, '退款申请未通过，原因：你的理由不成立', '0', '1550838113', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('68', '您的抢单被选中', '7', '2', null, '咨询问题：测试', '0', '1550905178', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('69', '您的问题已有抢单', '13', '2', null, '您的问题<测试测试>已有抢单', '0', '1550911716', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('70', '您的问题已有抢单', '2', '2', null, '您的问题<测测>已有抢单', '0', '1550912549', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('71', '您的问题已有抢单', '5', '2', null, '您的问题<测试支付宝支付>已有抢单', '1', '1550913191', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('72', '服务被选中', '13', '2', null, '服务被选中', '0', '1550913265', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('73', '抢单被选中', '7', '2', null, '抢单被选中', '0', '1550913408', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('74', '抢单被选中', '13', '2', null, '抢单被选中', '0', '1550913430', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('75', '您的问题已有抢单', '5', '2', null, '您的问题<测试快速提问1>已有抢单', '1', '1550920737', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('76', '您的抢单被选中', '7', '2', null, '咨询问题：测试快速提问1', '0', '1550921127', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('77', '服务被选中', '7', '2', null, '服务被选中', '0', '1550922744', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('78', '服务被选中', '7', '2', null, '服务被选中', '0', '1550922896', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('79', '您的问题已有抢单', '5', '2', null, '您的问题<测试快速提问1>已有抢单', '1', '1550961066', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('80', '您的抢单被选中', '14', '2', null, '咨询问题：测试快速提问1', '1', '1550961162', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('81', '您的抢单被选中', '4', '2', null, '咨询问题：紧急集合', '0', '1550961798', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('82', '您的问题已有抢单', '5', '2', null, '您的问题<测试支付宝支付>已有抢单', '1', '1550997580', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('83', '您的问题已有抢单', '9', '2', null, '您的问题<盖好被被>已有抢单', '0', '1550999018', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('84', '您的问题已有抢单', '9', '2', null, '您的问题<盖好被被>已有抢单', '0', '1550999570', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('85', '您的问题已有抢单', '15', '2', null, '您的问题<自走棋>已有抢单', '0', '1551090174', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('86', '您的问题已有抢单', '5', '2', null, '您的问题<农药残留检测>已有抢单', '1', '1551090434', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('87', '您的抢单被选中', '14', '2', null, '咨询问题：农药残留检测', '1', '1551090739', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('88', '您的抢单被选中', '14', '2', null, '咨询问题：yyy', '1', '1551091371', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('89', '您的抢单被选中', '7', '2', null, '咨询问题：11111', '0', '1551092212', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('90', '您的抢单被选中', '7', '2', null, '咨询问题：qqq', '0', '1551092999', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('91', '您的问题已有抢单', '15', '2', null, '您的问题<你要测试啥呀>已有抢单', '0', '1551100521', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('92', '您的问题已有抢单', '15', '2', null, '您的问题<你要测试啥呀>已有抢单', '0', '1551100632', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('93', '您的问题已有抢单', '5', '2', null, '您的问题<农药残留检测>已有抢单', '1', '1551102931', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('94', '您的抢单被选中', '14', '2', null, '咨询问题：农药残留检测', '1', '1551102959', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('95', '您的问题已有抢单', '5', '2', null, '您的问题<测试抢单完成后，其余用户抢单列表中是否消失>已有抢单', '1', '1551149348', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('96', '您的问题已有抢单', '5', '2', null, '您的问题<测试抢单完成后，其余用户抢单列表中是否消失>已有抢单', '1', '1551149415', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('97', '您的抢单被选中', '7', '2', null, '咨询问题：测试抢单完成后，其余用户抢单列表中是否消失', '0', '1551150061', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('98', '您的抢单被选中', '7', '2', null, '咨询问题：测试抢单完成后，其余用户抢单列表中是否消失', '0', '1551150103', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('99', '您的抢单被选中', '14', '2', null, '咨询问题：测试抢单完成后，其余用户抢单列表中是否消失', '1', '1551150125', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('100', '您的抢单被选中', '14', '2', null, '咨询问题：测试找专家', '1', '1551150303', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('101', '您的问题已有抢单', '7', '2', null, '您的问题<测试推送>已有抢单', '0', '1551183194', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('102', '您的抢单被选中', '5', '2', null, '咨询问题：测试推送', '0', '1551183211', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('103', '提现申请通过', '5', '2', null, '提现申请通过，提现金额：90', '1', '1551184673', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('104', '提现申请未通过', '5', '2', null, '提现申请未通过，原因：你的进而不够', '1', '1551184743', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('105', '提现申请通过', '5', '2', null, '提现申请通过，提现金额：300', '0', '1551184927', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('106', '提现申请未通过', '5', '2', null, '提现申请未通过，原因：发育发育发育', '0', '1551184965', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('107', '您的问题已有抢单', '15', '2', null, '您的问题<你要测试啥呀>已有抢单', '0', '1551185005', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('108', '您的问题已有抢单', '5', '2', null, '您的问题<好了>已有抢单', '1', '1551185070', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('109', '退款申请未通过', '2', '2', null, '退款申请未通过，原因：驳回', '1', '1551265447', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('110', '您的抢单被选中', '14', '2', null, '咨询问题：测试支付宝支付', '1', '1551265840', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('111', '您的问题已有抢单', '5', '2', null, '您的问题<会议>已有抢单', '0', '1551271812', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('112', '您的抢单被选中', '24', '2', null, '咨询问题：会议', '0', '1551271846', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('113', '您的抢单被选中', '24', '2', null, '咨询问题：会议', '0', '1551271850', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('114', '您的问题已有抢单', '5', '2', null, '您的问题<测试图标出数字>已有抢单', '0', '1551272202', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('115', '您的问题已有抢单', '5', '2', null, '您的问题<测试推送>已有抢单', '0', '1551272295', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('116', '您的抢单被选中', '24', '2', null, '咨询问题：测试推送', '0', '1551272314', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('117', '您的问题已有抢单', '5', '2', null, '您的问题<测试推送>已有抢单', '1', '1551272705', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('118', '您的抢单被选中', '24', '2', null, '咨询问题：测试推送', '0', '1551272764', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('119', '您的问题已有抢单', '5', '2', null, '您的问题<测试订单收入>已有抢单', '0', '1551273735', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('120', '抢单被选中', '24', '2', null, '抢单被选中', '0', '1551273868', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('121', '您的问题已有抢单', '5', '2', null, '您的问题<测试付款后是否跳转>已有抢单', '1', '1551274026', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('122', '抢单被选中', '24', '2', null, '抢单被选中', '0', '1551274132', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('123', '您的问题已有抢单', '5', '2', null, '您的问题<好了>已有抢单', '0', '1551324572', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('124', '您的问题已有抢单', '5', '2', null, '您的问题<测试退款1，回答者的余额会不会减少>已有抢单', '1', '1551340810', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('125', '您的抢单被选中', '24', '2', null, '咨询问题：测试退款1，回答者的余额会不会减少', '0', '1551340839', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('126', '退款申请通过', '5', '2', null, '退款申请通过，退款金额：100', '1', '1551340964', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('127', '提问者退款，审核通过', '4', '2', null, '提问者退款，审核通过，退款金额：11', '0', '1551346872', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('128', '退款申请通过', '2', '2', null, '退款申请通过，退款金额：11', '0', '1551346872', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('129', '您的问题已有抢单', '5', '2', null, '您的问题<测试退款2>已有抢单', '1', '1551351141', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('130', '您的抢单被选中', '24', '2', null, '咨询问题：测试退款2', '0', '1551351169', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('131', '提问者退款，审核通过', '24', '2', null, '提问者退款，审核通过，退款金额：100', '0', '1551351415', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('132', '退款申请通过', '5', '2', null, '退款申请通过，退款金额：100', '1', '1551351415', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('133', '您的抢单被选中', '14', '2', null, '咨询问题：回来了', '1', '1551351859', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('134', '您的抢单被选中', '14', '2', null, '咨询问题：测试找专家', '1', '1551352046', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('135', '您的问题已有抢单', '4', '2', null, '您的问题<卡恩农业>已有抢单', '0', '1551408317', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('136', '您的问题已有抢单', '4', '2', null, '您的问题<童模>已有抢单', '0', '1551408508', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('137', '您的抢单被选中', '9', '2', null, '咨询问题：童模', '0', '1551408538', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('138', '您的问题已有抢单', '23', '2', null, '您的问题<测测111>已有抢单', '0', '1551414891', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('139', '您的抢单被选中', '23', '2', null, '咨询问题：得得', '0', '1551416387', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('140', '您的抢单被选中', '2', '2', null, '咨询问题：测测111', '0', '1551416727', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('141', '退款申请未通过', '23', '2', null, '退款申请未通过，原因：222', '0', '1551418946', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('142', '退款申请未通过', '2', '2', null, '退款申请未通过，原因：222', '0', '1551418954', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('143', '您的问题已有抢单', '9', '2', null, '您的问题<hbbbb>已有抢单', '0', '1551442377', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('144', '您的抢单被选中', '4', '2', null, '咨询问题：hbbbb', '0', '1551442388', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('145', '您的问题已有抢单', '9', '2', null, '您的问题<哦哟下午>已有抢单', '0', '1551444925', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('146', '您的抢单被选中', '4', '2', null, '咨询问题：哦哟下午', '0', '1551444931', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('147', '您的问题已有抢单', '5', '2', null, '您的问题<测试付款逻辑>已有抢单', '0', '1551449706', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('148', '您的抢单被选中', '14', '2', null, '咨询问题：测试付款逻辑', '1', '1551449738', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('149', '您的问题已有抢单', '5', '2', null, '您的问题<测试付款延迟>已有抢单', '0', '1551451515', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('150', '您的抢单被选中', '14', '2', null, '咨询问题：测试付款逻辑', '1', '1551451565', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('151', '您的抢单被选中', '14', '2', null, '咨询问题：测试付款延迟', '1', '1551451593', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('152', '您的问题已有抢单', '14', '2', null, '您的问题<测试快速提问>已有抢单', '1', '1551492317', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('153', '您的抢单被选中', '5', '2', null, '咨询问题：测试快速提问', '0', '1551492464', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('154', '您的问题已有抢单', '14', '2', null, '您的问题<测试快速提问2>已有抢单', '1', '1551495509', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('155', '您的抢单被选中', '5', '2', null, '咨询问题：测试快速提问2', '0', '1551495554', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('156', '退款申请通过', '14', '2', null, '退款申请通过，退款金额：50', '1', '1551495681', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('157', '您的问题已有抢单', '2', '2', null, '您的问题<得得得>已有抢单', '0', '1551496141', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('158', '抢单被选中', '9', '2', null, '抢单被选中', '0', '1551498302', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('159', '您的问题已有抢单', '2', '2', null, '您的问题<噢噢噢>已有抢单', '1', '1551498464', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('160', '你已被选为回答者，请及时答复', '4', '2', null, '你已被选为回答者，请及时答复', '0', '1551498506', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('161', '您的问题已有抢单', '9', '2', null, '您的问题<town我>已有抢单', '0', '1551511611', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('162', '您的问题已有抢单', '9', '2', null, '您的问题<town我>已有抢单', '0', '1551511671', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('163', '您的问题已有抢单', '5', '2', null, '您的问题<1.3版本测试快速提问>已有抢单', '0', '1551514184', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('164', '您的问题已有抢单', '31', '2', null, '您的问题<焊接技术>已有抢单', '1', '1551527253', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('165', '您的问题已有抢单', '31', '2', null, '您的问题<焊接技术>已有抢单', '1', '1551527323', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('166', '你已被选为回答者，请及时答复', '5', '2', null, '你已被选为回答者，请及时答复', '0', '1551529936', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('167', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551530087', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('168', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551530140', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('169', '您的问题已有抢单', '29', '2', null, '您的问题<怎样才能发财？>已有抢单', '0', '1551532758', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('170', '你已被选为回答者，请及时答复', '14', '2', null, '咨询问题：测试找专家', '1', '1551572982', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('171', '你已被选为回答者，请及时答复', '5', '2', null, '你已被选为回答者，请及时答复', '0', '1551573409', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('172', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551573538', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('173', '您的问题已有抢单', '5', '2', null, '您的问题<测试退款2>已有抢单', '0', '1551573631', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('174', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551575484', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('175', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '0', '1551575507', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('176', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551575620', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('177', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '1', '1551575656', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('178', '您的问题已有抢单', '31', '2', null, '您的问题<david9.13>已有抢单', '1', '1551575672', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('179', '你已被选为回答者，请及时答复', '5', '2', null, '你已被选为回答者，请及时答复', '0', '1551576047', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('180', '你已被选为回答者，请及时答复', '5', '2', null, '你已被选为回答者，请及时答复', '0', '1551576370', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('181', '您的问题已有抢单', '31', '2', null, '您的问题<david9.35>已有抢单', '0', '1551577005', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('182', '您的问题已有抢单', '31', '2', null, '您的问题<david9.35>已有抢单', '0', '1551577024', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('183', '你已被选为回答者，请及时答复', '5', '2', null, '你已被选为回答者，请及时答复', '0', '1551577790', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('184', '您的问题已有抢单', '33', '2', null, '您的问题<鹏>已有抢单', '0', '1551578271', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('185', '您的问题已有抢单', '33', '2', null, '您的问题<鹏>已有抢单', '0', '1551578283', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('186', '您的问题已有抢单', '14', '2', null, '您的问题<Fog测试>已有抢单', '1', '1551581049', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('187', '你已被选为回答者，请及时答复', '31', '2', null, '咨询问题：Fog测试', '0', '1551586024', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('188', '您的问题已有抢单', '14', '2', null, '您的问题<Fog测试>已有抢单', '1', '1551586183', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('189', '您的问题已有抢单', '14', '2', null, '您的问题<Fog测试>已有抢单', '1', '1551586292', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('190', '您的问题已有抢单', '31', '2', null, '您的问题<david 9.27>已有抢单', '0', '1551597402', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('191', '您的问题已有抢单', '4', '2', null, '您的问题<咯www>已有抢单', '0', '1551664804', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('192', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：Fog测试', '0', '1551672679', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('193', '您的问题已有抢单', '14', '2', null, '您的问题<www测试0304>已有抢单', '1', '1551672814', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('194', '您的问题已有抢单', '14', '2', null, '您的问题<测试>已有抢单', '1', '1551672977', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('195', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：www测试0304', '0', '1551673001', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('196', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：测试', '0', '1551673085', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('197', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：测试', '1', '1551673149', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('198', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：测试', '0', '1551673195', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('199', '您的问题已有抢单', '14', '2', null, '您的问题<，机器人>已有抢单', '1', '1551679712', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('200', '您的问题已有抢单', '14', '2', null, '您的问题<测试推送>已有抢单', '1', '1551681111', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('201', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：测试推送', '0', '1551681136', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('202', '应用场景', null, '1', null, '<p><img src=\"/upload/default/20190304/e04aee4531544cc8612e4171a5160c99.png\" title=\"应用场景.png\" alt=\"应用场景.png\" width=\"368\" height=\"2055\" style=\"width: 368px; height: 2055px;\"/></p>', '1', null, null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('203', '关于我们', null, '1', null, '<p style=\"text-align: center;\"><img src=\"/upload/default/20190304/a73d40d9c88504c2d83a18d00bf55f96.png\" title=\"关于我们.png\" alt=\"关于我们.png\" width=\"368\" height=\"700\" style=\"width: 368px; height: 700px;\"/></p>', '1', null, null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('204', '使用指导', null, '1', null, '<p><img src=\"/upload/default/20190304/b488cf10729b37507eadcc53fdb59434.png\" title=\"使用演示.png\" alt=\"使用演示.png\" width=\"368\" height=\"600\" style=\"width: 368px; height: 600px;\"/></p>', '1', null, null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('205', '您的问题已有抢单', '20', '2', null, '您的问题<吐吐沫>已有抢单', '0', '1551696912', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('206', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：测试', '0', '1551699760', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('207', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：流量', '0', '1551699941', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('208', '您的问题已有抢单', '31', '2', null, '您的问题<david>已有抢单', '0', '1551706338', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('209', '你已被选为回答者，请及时答复', '14', '2', null, '咨询问题：三后两节课', '1', '1551707310', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('210', '您的问题已有抢单', '14', '2', null, '您的问题<油漆配方>已有抢单', '1', '1551745224', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('211', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：jjnnbvvvxdd ', '0', '1551748188', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('212', '你已被选为回答者，请及时答复', '14', '2', null, '咨询问题：测试', '1', '1551753216', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('213', '您的问题已有抢单', '5', '2', null, '您的问题<测试车>已有抢单', '0', '1551754143', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('214', '你已被选为回答者，请及时答复', '5', '2', null, '咨询问题：ewra', '0', '1551774542', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('215', '您的问题已有抢单', '20', '2', null, '您的问题<拉法几十块>已有抢单', '0', '1551774753', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('216', '您的问题已有抢单', '20', '2', null, '您的问题<完美世界>已有抢单', '0', '1551774841', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('217', '你已被选为回答者，请及时答复', '9', '2', null, '咨询问题：完美世界', '0', '1551777015', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('218', '您的问题已有抢单', '20', '2', null, '您的问题<测试支付>已有抢单', '0', '1551790228', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('219', '您的问题已有抢单', '22', '2', null, '您的问题<都会发的>已有抢单', '1', '1551830216', null, '0', '0');
INSERT INTO `cmf_gxzh_msg` VALUES ('220', '测试', null, '1', null, '这是祟拜你写的<audio controls=\"controls\" style=\"display: none;\"></audio>', '1', null, null, '0', '1000');
INSERT INTO `cmf_gxzh_msg` VALUES ('221', '再测试', null, '1', null, '这是又一次的测试<audio controls=\"controls\" style=\"display: none;\"></audio>', '1', null, null, '0', '1000');

-- ----------------------------
-- Table structure for cmf_gxzh_order
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_order`;
CREATE TABLE `cmf_gxzh_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `out_trade_no` varchar(255) NOT NULL COMMENT '订单id',
  `wechat_trade_no` varchar(32) DEFAULT NULL COMMENT '微信订单号',
  `alipay_trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝订单号',
  `money` double(11,2) NOT NULL COMMENT '支付金额',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态  0:未支付   1:已支付',
  `pay_type` varchar(255) NOT NULL COMMENT '支付方式   wechat:微信   alipay:支付宝  balance余额支付',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNo` (`out_trade_no`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of cmf_gxzh_order
-- ----------------------------
INSERT INTO `cmf_gxzh_order` VALUES ('5', '9', '0', 'pitchon_72_1550807723', null, null, '25.00', '72', '0', 'alipay', '1550807723', null);
INSERT INTO `cmf_gxzh_order` VALUES ('6', '9', '0', 'pitchon_72_1550808102', null, null, '25.00', '72', '0', 'alipay', '1550808102', null);
INSERT INTO `cmf_gxzh_order` VALUES ('7', '9', '0', 'pitchon_72_1550808141', null, null, '25.00', '72', '0', 'alipay', '1550808141', null);
INSERT INTO `cmf_gxzh_order` VALUES ('8', '9', '0', 'pitchon_72_1550808171', null, null, '25.00', '72', '0', 'alipay', '1550808171', null);
INSERT INTO `cmf_gxzh_order` VALUES ('9', '9', '0', 'pitchon_72_1550808225', null, null, '25.00', '72', '0', 'alipay', '1550808225', null);
INSERT INTO `cmf_gxzh_order` VALUES ('10', '9', '0', 'pitchon_72_1550808334', null, null, '25.00', '72', '0', 'alipay', '1550808334', null);
INSERT INTO `cmf_gxzh_order` VALUES ('11', '4', '0', 'pitchon_73_1550808412', null, null, '25.00', '73', '0', 'alipay', '1550808412', null);
INSERT INTO `cmf_gxzh_order` VALUES ('12', '4', '0', 'pitchon_73_1550808444', null, null, '25.00', '73', '0', 'alipay', '1550808444', null);
INSERT INTO `cmf_gxzh_order` VALUES ('13', '4', '0', 'pitchon_73_1550808503', null, null, '25.00', '73', '0', 'alipay', '1550808503', null);
INSERT INTO `cmf_gxzh_order` VALUES ('14', '9', '0', 'pitchon_72_1550808594', null, null, '25.00', '72', '0', 'wechat', '1550808594', null);
INSERT INTO `cmf_gxzh_order` VALUES ('15', '4', '0', 'pitchon_73_1550809317', null, null, '25.00', '73', '0', 'wechat', '1550809317', null);
INSERT INTO `cmf_gxzh_order` VALUES ('16', '4', '0', 'pitchon_73_1550809560', null, null, '25.00', '73', '0', 'wechat', '1550809560', null);
INSERT INTO `cmf_gxzh_order` VALUES ('17', '4', '0', 'pitchon_73_1550809768', null, null, '25.00', '73', '0', 'wechat', '1550809768', null);
INSERT INTO `cmf_gxzh_order` VALUES ('18', '4', '0', 'pitchon_73_1550809903', null, null, '25.00', '73', '0', 'wechat', '1550809903', null);
INSERT INTO `cmf_gxzh_order` VALUES ('19', '4', '0', 'pitchon_73_1550809967', null, null, '25.00', '73', '0', 'wechat', '1550809967', null);
INSERT INTO `cmf_gxzh_order` VALUES ('20', '4', '0', 'pitchon_73_1550810025', null, null, '25.00', '73', '0', 'wechat', '1550810025', null);
INSERT INTO `cmf_gxzh_order` VALUES ('21', '4', '0', 'pitchon_73_1550810058', null, null, '25.00', '73', '0', 'wechat', '1550810058', null);
INSERT INTO `cmf_gxzh_order` VALUES ('22', '9', '0', 'pitchon_72_1550810350', null, null, '25.00', '72', '0', 'wechat', '1550810350', null);
INSERT INTO `cmf_gxzh_order` VALUES ('23', '9', '0', 'pitchon_72_1550810383', null, null, '25.00', '72', '0', 'wechat', '1550810383', null);
INSERT INTO `cmf_gxzh_order` VALUES ('24', '9', '0', 'pitchon_72_1550810564', null, null, '25.00', '72', '0', 'wechat', '1550810564', null);
INSERT INTO `cmf_gxzh_order` VALUES ('25', '9', '0', 'pitchon_72_1550810681', null, null, '25.00', '72', '0', 'wechat', '1550810681', null);
INSERT INTO `cmf_gxzh_order` VALUES ('26', '9', '0', 'pitchon_72_1550810718', null, null, '25.00', '72', '0', 'wechat', '1550810718', null);
INSERT INTO `cmf_gxzh_order` VALUES ('27', '9', '0', 'pitchon_72_1550810795', null, null, '25.00', '72', '0', 'alipay', '1550810795', null);
INSERT INTO `cmf_gxzh_order` VALUES ('28', '9', '0', 'pitchon_72_1550812732', null, null, '25.00', '72', '0', 'alipay', '1550812732', null);
INSERT INTO `cmf_gxzh_order` VALUES ('29', '9', '0', 'pitchon_72_1550812914', null, null, '25.00', '72', '0', 'alipay', '1550812914', null);
INSERT INTO `cmf_gxzh_order` VALUES ('30', '9', '0', 'pitchon_72_1550812988', null, null, '25.00', '72', '0', 'alipay', '1550812988', null);
INSERT INTO `cmf_gxzh_order` VALUES ('31', '9', '0', 'pitchon_72_1550813078', null, null, '25.00', '72', '0', 'alipay', '1550813078', null);
INSERT INTO `cmf_gxzh_order` VALUES ('32', '9', '0', 'pitchon_72_1550813139', null, null, '25.00', '72', '0', 'wechat', '1550813139', null);
INSERT INTO `cmf_gxzh_order` VALUES ('33', '9', '0', 'pitchon_72_1550813160', null, null, '25.00', '72', '0', 'alipay', '1550813160', null);
INSERT INTO `cmf_gxzh_order` VALUES ('34', '9', '0', 'pitchon_72_1550813184', null, null, '25.00', '72', '0', 'wechat', '1550813184', null);
INSERT INTO `cmf_gxzh_order` VALUES ('35', '9', '0', 'pitchon_72_1550813215', null, null, '25.00', '72', '0', 'wechat', '1550813215', null);
INSERT INTO `cmf_gxzh_order` VALUES ('36', '9', '0', 'pitchon_72_1550813272', null, null, '25.00', '72', '0', 'alipay', '1550813272', null);
INSERT INTO `cmf_gxzh_order` VALUES ('37', '9', '0', 'pitchon_72_1550813410', null, null, '25.00', '72', '0', 'alipay', '1550813410', null);
INSERT INTO `cmf_gxzh_order` VALUES ('38', '9', '0', 'pitchon_74_1550815008', null, null, '66.00', '74', '0', 'wechat', '1550815008', null);
INSERT INTO `cmf_gxzh_order` VALUES ('39', '9', '0', 'pitchon_74_1550815137', null, null, '66.00', '74', '0', 'alipay', '1550815137', null);
INSERT INTO `cmf_gxzh_order` VALUES ('40', '5', '0', 'pitchon_75_1550817997', null, null, '100.00', '75', '0', 'balance', '1550817997', null);
INSERT INTO `cmf_gxzh_order` VALUES ('41', '9', null, 'recharge_9_1550821885', null, null, '73.00', null, '0', 'alipay', '1550821885', null);
INSERT INTO `cmf_gxzh_order` VALUES ('42', '4', null, 'recharge_4_1550822104', null, null, '73.00', null, '0', 'alipay', '1550822104', null);
INSERT INTO `cmf_gxzh_order` VALUES ('43', '4', null, 'recharge_4_1550822189', null, null, '0.00', null, '0', 'alipay', '1550822189', null);
INSERT INTO `cmf_gxzh_order` VALUES ('44', '4', null, 'recharge_4_1550822225', null, null, '0.00', null, '0', 'alipay', '1550822225', null);
INSERT INTO `cmf_gxzh_order` VALUES ('45', '4', null, 'recharge_4_1550822242', null, null, '0.00', null, '0', 'wechat', '1550822242', null);
INSERT INTO `cmf_gxzh_order` VALUES ('46', '4', null, 'recharge_4_1550822243', null, null, '0.00', null, '0', 'wechat', '1550822243', null);
INSERT INTO `cmf_gxzh_order` VALUES ('47', '4', null, 'recharge_4_1550822244', null, null, '0.00', null, '0', 'wechat', '1550822244', null);
INSERT INTO `cmf_gxzh_order` VALUES ('48', '4', null, 'recharge_4_1550822245', null, null, '0.00', null, '0', 'wechat', '1550822245', null);
INSERT INTO `cmf_gxzh_order` VALUES ('50', '9', null, 'recharge_9_1550822799', null, null, '0.01', null, '0', 'wechat', '1550822799', null);
INSERT INTO `cmf_gxzh_order` VALUES ('51', '4', null, 'recharge_4_1550822859', null, null, '0.00', null, '0', 'alipay', '1550822859', null);
INSERT INTO `cmf_gxzh_order` VALUES ('52', '4', null, 'recharge_4_1550822883', null, null, '0.00', null, '0', 'alipay', '1550822883', null);
INSERT INTO `cmf_gxzh_order` VALUES ('53', '4', null, 'recharge_4_1550822923', null, null, '1.00', null, '0', 'alipay', '1550822923', null);
INSERT INTO `cmf_gxzh_order` VALUES ('54', '4', null, 'recharge_4_1550822941', null, null, '1.00', null, '0', 'wechat', '1550822941', null);
INSERT INTO `cmf_gxzh_order` VALUES ('55', '4', null, 'recharge_4_1550822997', null, null, '1.00', null, '0', 'wechat', '1550822997', null);
INSERT INTO `cmf_gxzh_order` VALUES ('56', '4', null, 'recharge_4_1550823026', null, null, '1.00', null, '0', 'wechat', '1550823026', null);
INSERT INTO `cmf_gxzh_order` VALUES ('57', '9', '0', 'pitchon_74_1550832622', null, null, '66.00', '74', '0', 'wechat', '1550832622', null);
INSERT INTO `cmf_gxzh_order` VALUES ('58', '2', null, 'recharge_2_1550836743', null, '2019022222001493961022439674', '0.01', null, '1', 'alipay', '1550836743', '1550837616');
INSERT INTO `cmf_gxzh_order` VALUES ('59', '2', null, 'recharge_2_1550837393', '4200000241201902228990005698', null, '0.01', null, '1', 'wechat', '1550837393', '1550837641');
INSERT INTO `cmf_gxzh_order` VALUES ('60', '4', '2', 'pitchon_73_1550902199', null, null, '24.00', '73', '0', 'alipay', '1550902199', null);
INSERT INTO `cmf_gxzh_order` VALUES ('61', '5', '0', 'pitchon_76_1550905178', null, null, '20.00', '76', '0', 'balance', '1550905178', null);
INSERT INTO `cmf_gxzh_order` VALUES ('62', '2', '0', 'pitchon_78_1550912594', null, '2019022322001493961022552159', '0.01', '78', '1', 'alipay', '1550912594', '1550913430');
INSERT INTO `cmf_gxzh_order` VALUES ('63', '5', '0', 'pitchon_79_1550913214', null, null, '0.20', '79', '0', 'alipay', '1550913214', null);
INSERT INTO `cmf_gxzh_order` VALUES ('64', '2', '0', 'pitchon_80_1550913257', '4200000246201902239631034300', null, '0.01', '80', '1', 'wechat', '1550913257', '1550913265');
INSERT INTO `cmf_gxzh_order` VALUES ('65', '5', '0', 'pitchon_79_1550913379', null, null, '0.20', '79', '0', 'wechat', '1550913379', null);
INSERT INTO `cmf_gxzh_order` VALUES ('66', '5', '0', 'pitchon_79_1550913382', null, '2019022322001487041018210037', '0.20', '79', '1', 'alipay', '1550913382', '1550913408');
INSERT INTO `cmf_gxzh_order` VALUES ('67', '5', '0', 'pitchon_81_1550921127', null, null, '0.03', '81', '0', 'balance', '1550921127', null);
INSERT INTO `cmf_gxzh_order` VALUES ('68', '5', '0', 'pitchon_82_1550922216', null, null, '20.00', '82', '0', 'wechat', '1550922216', null);
INSERT INTO `cmf_gxzh_order` VALUES ('69', '5', '0', 'pitchon_83_1550922679', null, null, '0.10', '83', '0', 'wechat', '1550922679', null);
INSERT INTO `cmf_gxzh_order` VALUES ('70', '5', '0', 'pitchon_84_1550922731', '4200000256201902230202000686', null, '0.10', '84', '1', 'wechat', '1550922731', '1550922744');
INSERT INTO `cmf_gxzh_order` VALUES ('71', '5', '0', 'pitchon_85_1550922887', '4200000243201902235525772654', null, '0.10', '85', '1', 'wechat', '1550922887', '1550922896');
INSERT INTO `cmf_gxzh_order` VALUES ('72', '5', '0', 'pitchon_86_1550961162', null, null, '0.30', '86', '0', 'balance', '1550961162', null);
INSERT INTO `cmf_gxzh_order` VALUES ('73', '5', '0', 'pitchon_87_1550961798', null, null, '36.00', '87', '0', 'balance', '1550961798', null);
INSERT INTO `cmf_gxzh_order` VALUES ('74', '5', '0', 'pitchon_93_1551090669', null, null, '8.00', '93', '0', 'wechat', '1551090669', null);
INSERT INTO `cmf_gxzh_order` VALUES ('75', '5', '0', 'pitchon_93_1551090739', null, null, '8.00', '93', '0', 'balance', '1551090739', null);
INSERT INTO `cmf_gxzh_order` VALUES ('76', '14', '0', 'pitchon_95_1551091054', null, null, '10.00', '95', '0', 'alipay', '1551091054', null);
INSERT INTO `cmf_gxzh_order` VALUES ('77', '5', '0', 'pitchon_96_1551091371', null, null, '0.10', '96', '0', 'balance', '1551091371', null);
INSERT INTO `cmf_gxzh_order` VALUES ('78', '5', '0', 'pitchon_97_1551092212', null, null, '0.10', '97', '0', 'balance', '1551092212', null);
INSERT INTO `cmf_gxzh_order` VALUES ('79', '5', '0', 'pitchon_98_1551092999', null, null, '0.10', '98', '0', 'balance', '1551092999', null);
INSERT INTO `cmf_gxzh_order` VALUES ('80', '5', '0', 'pitchon_102_1551102959', null, null, '12.00', '102', '0', 'balance', '1551102959', null);
INSERT INTO `cmf_gxzh_order` VALUES ('81', '5', '0', 'pitchon_103_1551150061', null, null, '1.00', '103', '0', 'balance', '1551150061', null);
INSERT INTO `cmf_gxzh_order` VALUES ('82', '5', '0', 'pitchon_103_1551150103', null, null, '1.00', '103', '0', 'balance', '1551150103', null);
INSERT INTO `cmf_gxzh_order` VALUES ('83', '5', '0', 'pitchon_104_1551150125', null, null, '0.50', '104', '0', 'balance', '1551150125', null);
INSERT INTO `cmf_gxzh_order` VALUES ('84', '5', '0', 'pitchon_105_1551150303', null, null, '0.10', '105', '0', 'balance', '1551150303', null);
INSERT INTO `cmf_gxzh_order` VALUES ('85', '7', '0', 'pitchon_106_1551183211', null, null, '1.00', '106', '0', 'balance', '1551183211', null);
INSERT INTO `cmf_gxzh_order` VALUES ('86', '5', '0', 'pitchon_88_1551265840', null, null, '5.00', '88', '0', 'balance', '1551265840', null);
INSERT INTO `cmf_gxzh_order` VALUES ('87', '5', '0', 'pitchon_109_1551271846', null, null, '1.00', '109', '0', 'balance', '1551271846', null);
INSERT INTO `cmf_gxzh_order` VALUES ('88', '5', '0', 'pitchon_109_1551271849', null, null, '1.00', '109', '0', 'balance', '1551271849', null);
INSERT INTO `cmf_gxzh_order` VALUES ('89', '5', '0', 'pitchon_111_1551272314', null, null, '1.00', '111', '0', 'balance', '1551272314', null);
INSERT INTO `cmf_gxzh_order` VALUES ('90', '5', '0', 'pitchon_112_1551272764', null, null, '1.00', '112', '0', 'balance', '1551272764', null);
INSERT INTO `cmf_gxzh_order` VALUES ('91', '5', '0', 'pitchon_113_1551273756', null, null, '0.10', '113', '0', 'wechat', '1551273756', null);
INSERT INTO `cmf_gxzh_order` VALUES ('92', '5', '0', 'pitchon_113_1551273761', null, null, '0.10', '113', '0', 'alipay', '1551273761', null);
INSERT INTO `cmf_gxzh_order` VALUES ('93', '5', '0', 'pitchon_113_1551273847', '4200000258201902275104603484', null, '0.10', '113', '1', 'wechat', '1551273847', '1551273868');
INSERT INTO `cmf_gxzh_order` VALUES ('94', '5', '0', 'pitchon_114_1551274122', '4200000253201902278868888171', null, '0.01', '114', '1', 'wechat', '1551274122', '1551274132');
INSERT INTO `cmf_gxzh_order` VALUES ('95', '5', '0', 'pitchon_116_1551340839', null, null, '100.00', '116', '0', 'balance', '1551340839', null);
INSERT INTO `cmf_gxzh_order` VALUES ('96', '5', '0', 'pitchon_119_1551351169', null, null, '100.00', '119', '0', 'balance', '1551351169', null);
INSERT INTO `cmf_gxzh_order` VALUES ('97', '5', '0', 'pitchon_120_1551351568', null, null, '0.10', '120', '0', 'alipay', '1551351568', null);
INSERT INTO `cmf_gxzh_order` VALUES ('98', '5', '0', 'pitchon_121_1551351859', null, null, '0.10', '121', '0', 'balance', '1551351859', null);
INSERT INTO `cmf_gxzh_order` VALUES ('99', '5', '0', 'pitchon_122_1551352046', null, null, '0.10', '122', '0', 'balance', '1551352046', null);
INSERT INTO `cmf_gxzh_order` VALUES ('100', '4', '0', 'pitchon_127_1551408538', null, null, '55559.00', '127', '0', 'balance', '1551408538', null);
INSERT INTO `cmf_gxzh_order` VALUES ('101', '2', '0', 'pitchon_129_1551416387', null, null, '0.01', '129', '0', 'balance', '1551416387', null);
INSERT INTO `cmf_gxzh_order` VALUES ('102', '23', '0', 'pitchon_128_1551416727', null, null, '0.01', '128', '0', 'balance', '1551416727', null);
INSERT INTO `cmf_gxzh_order` VALUES ('103', '9', '0', 'pitchon_130_1551442388', null, null, '588.00', '130', '0', 'balance', '1551442388', null);
INSERT INTO `cmf_gxzh_order` VALUES ('104', '9', '0', 'pitchon_131_1551444931', null, null, '55.00', '131', '0', 'balance', '1551444931', null);
INSERT INTO `cmf_gxzh_order` VALUES ('105', '27', null, 'recharge_27_1551448070', '4200000246201903015005389188', null, '1.00', null, '1', 'wechat', '1551448070', '1551448079');
INSERT INTO `cmf_gxzh_order` VALUES ('106', '5', '0', 'pitchon_132_1551449738', null, null, '100.00', '132', '0', 'balance', '1551449738', null);
INSERT INTO `cmf_gxzh_order` VALUES ('107', '5', '0', 'pitchon_132_1551451565', null, null, '100.00', '132', '0', 'balance', '1551451565', null);
INSERT INTO `cmf_gxzh_order` VALUES ('108', '5', '0', 'pitchon_133_1551451593', null, null, '150.00', '133', '0', 'balance', '1551451593', null);
INSERT INTO `cmf_gxzh_order` VALUES ('109', '14', '0', 'pitchon_134_1551492464', null, null, '1.00', '134', '0', 'balance', '1551492464', null);
INSERT INTO `cmf_gxzh_order` VALUES ('110', '14', '0', 'pitchon_135_1551495554', null, null, '99.00', '135', '0', 'balance', '1551495554', null);
INSERT INTO `cmf_gxzh_order` VALUES ('111', '2', '1', 'pitchon_136_1551496189', null, null, '0.01', '136', '0', 'alipay', '1551496189', null);
INSERT INTO `cmf_gxzh_order` VALUES ('112', '2', '1', 'pitchon_136_1551496274', null, null, '0.01', '136', '0', 'alipay', '1551496274', null);
INSERT INTO `cmf_gxzh_order` VALUES ('113', '2', '0', 'pitchon_136_1551496330', null, null, '5.01', '136', '0', 'wechat', '1551496330', null);
INSERT INTO `cmf_gxzh_order` VALUES ('114', '2', '0', 'pitchon_136_1551496367', null, null, '5.01', '136', '0', 'alipay', '1551496367', null);
INSERT INTO `cmf_gxzh_order` VALUES ('115', '2', '1', 'pitchon_136_1551496728', null, null, '0.01', '136', '0', 'alipay', '1551496728', null);
INSERT INTO `cmf_gxzh_order` VALUES ('116', '2', '0', 'pitchon_136_1551497027', null, null, '5.01', '136', '0', 'wechat', '1551497027', null);
INSERT INTO `cmf_gxzh_order` VALUES ('117', '2', '0', 'pitchon_136_1551497463', null, null, '5.01', '136', '0', 'alipay', '1551497463', null);
INSERT INTO `cmf_gxzh_order` VALUES ('118', '2', '1', 'pitchon_136_1551497608', null, null, '0.01', '136', '0', 'alipay', '1551497608', null);
INSERT INTO `cmf_gxzh_order` VALUES ('119', '2', '1', 'pitchon_136_1551497663', null, null, '0.01', '136', '0', 'wechat', '1551497663', null);
INSERT INTO `cmf_gxzh_order` VALUES ('120', '2', '1', 'pitchon_136_1551498294', '4200000255201903020337315151', null, '0.01', '136', '1', 'wechat', '1551498294', '1551498302');
INSERT INTO `cmf_gxzh_order` VALUES ('121', '2', '4', 'pitchon_137_1551498497', null, '2019030222001493961023722778', '0.01', '137', '1', 'alipay', '1551498497', '1551498506');
INSERT INTO `cmf_gxzh_order` VALUES ('122', '9', null, 'recharge_9_1551516853', null, null, '15.00', null, '0', 'wechat', '1551516853', null);
INSERT INTO `cmf_gxzh_order` VALUES ('123', '4', null, 'recharge_4_1551517392', null, null, '234.00', null, '0', 'wechat', '1551517392', null);
INSERT INTO `cmf_gxzh_order` VALUES ('124', '4', null, 'recharge_4_1551517640', null, null, '12.00', null, '0', 'wechat', '1551517640', null);
INSERT INTO `cmf_gxzh_order` VALUES ('125', '4', null, 'recharge_4_1551517991', null, null, '123.00', null, '0', 'wechat', '1551517991', null);
INSERT INTO `cmf_gxzh_order` VALUES ('126', '4', null, 'recharge_4_1551518385', null, null, '25.00', null, '0', 'wechat', '1551518385', null);
INSERT INTO `cmf_gxzh_order` VALUES ('127', '4', null, 'recharge_4_1551518411', null, null, '25.00', null, '0', 'wechat', '1551518411', null);
INSERT INTO `cmf_gxzh_order` VALUES ('128', '4', null, 'recharge_4_1551518485', null, null, '25.00', null, '0', 'wechat', '1551518485', null);
INSERT INTO `cmf_gxzh_order` VALUES ('129', '4', null, 'recharge_4_1551518510', null, null, '25.00', null, '0', 'wechat', '1551518510', null);
INSERT INTO `cmf_gxzh_order` VALUES ('130', '4', null, 'recharge_4_1551518844', null, null, '25.00', null, '0', 'wechat', '1551518844', null);
INSERT INTO `cmf_gxzh_order` VALUES ('131', '4', null, 'recharge_4_1551518964', null, null, '25.00', null, '0', 'wechat', '1551518964', null);
INSERT INTO `cmf_gxzh_order` VALUES ('132', '4', null, 'recharge_4_1551519057', null, null, '25.00', null, '0', 'wechat', '1551519057', null);
INSERT INTO `cmf_gxzh_order` VALUES ('133', '4', null, 'recharge_4_1551521004', null, null, '25.00', null, '0', 'miniapp', '1551521004', null);
INSERT INTO `cmf_gxzh_order` VALUES ('134', '4', null, 'recharge_4_1551521040', null, null, '25.00', null, '0', 'miniapp', '1551521040', null);
INSERT INTO `cmf_gxzh_order` VALUES ('135', '4', null, 'recharge_4_1551521092', null, null, '253.00', null, '0', 'miniapp', '1551521092', null);
INSERT INTO `cmf_gxzh_order` VALUES ('136', '4', null, 'recharge_4_1551521135', null, null, '588.00', null, '0', 'miniapp', '1551521135', null);
INSERT INTO `cmf_gxzh_order` VALUES ('137', '4', null, 'recharge_4_1551521218', null, null, '58.00', null, '0', 'miniapp', '1551521218', null);
INSERT INTO `cmf_gxzh_order` VALUES ('138', '31', '0', 'pitchon_144_1551528669', null, null, '10.00', '144', '0', 'wechat', '1551528669', null);
INSERT INTO `cmf_gxzh_order` VALUES ('139', '31', '0', 'pitchon_142_1551529911', '4200000253201903026099354711', null, '0.01', '142', '1', 'wechat', '1551529911', '1551529936');
INSERT INTO `cmf_gxzh_order` VALUES ('140', '5', '0', 'pitchon_148_1551572982', null, null, '0.10', '148', '0', 'balance', '1551572982', null);
INSERT INTO `cmf_gxzh_order` VALUES ('141', '15', '0', 'pitchon_100_1551573400', '4200000258201903036458995242', null, '0.10', '100', '1', 'wechat', '1551573400', '1551573409');
INSERT INTO `cmf_gxzh_order` VALUES ('142', '31', '0', 'pitchon_155_1551576035', '4200000257201903035840464533', null, '0.01', '155', '1', 'wechat', '1551576035', '1551576047');
INSERT INTO `cmf_gxzh_order` VALUES ('143', '31', '0', 'pitchon_152_1551576362', '4200000248201903031043299792', null, '0.02', '152', '1', 'wechat', '1551576362', '1551576370');
INSERT INTO `cmf_gxzh_order` VALUES ('144', '31', '0', 'pitchon_157_1551577778', '4200000243201903037108247444', null, '0.02', '157', '1', 'wechat', '1551577778', '1551577790');
INSERT INTO `cmf_gxzh_order` VALUES ('145', '33', '0', 'pitchon_158_1551577807', null, null, '100.00', '158', '0', 'alipay', '1551577807', null);
INSERT INTO `cmf_gxzh_order` VALUES ('146', '14', '0', 'pitchon_161_1551586024', null, null, '1.50', '161', '0', 'balance', '1551586024', null);
INSERT INTO `cmf_gxzh_order` VALUES ('147', '4', '0', 'pitchon_165_1551664812', null, null, '258.00', '165', '0', 'wechat', '1551664812', null);
INSERT INTO `cmf_gxzh_order` VALUES ('148', '14', '0', 'pitchon_163_1551672679', null, null, '1.00', '163', '0', 'balance', '1551672679', null);
INSERT INTO `cmf_gxzh_order` VALUES ('149', '14', '0', 'pitchon_166_1551673001', null, null, '105.00', '166', '0', 'balance', '1551673001', null);
INSERT INTO `cmf_gxzh_order` VALUES ('150', '14', '0', 'pitchon_169_1551673085', null, null, '10.00', '169', '0', 'balance', '1551673085', null);
INSERT INTO `cmf_gxzh_order` VALUES ('151', '14', '0', 'pitchon_170_1551673149', null, null, '10.00', '170', '0', 'balance', '1551673149', null);
INSERT INTO `cmf_gxzh_order` VALUES ('152', '14', '0', 'pitchon_171_1551673195', null, null, '10.00', '171', '0', 'balance', '1551673195', null);
INSERT INTO `cmf_gxzh_order` VALUES ('153', '14', '0', 'pitchon_173_1551681136', null, null, '1.00', '173', '0', 'balance', '1551681136', null);
INSERT INTO `cmf_gxzh_order` VALUES ('154', '14', '0', 'pitchon_179_1551699760', null, null, '10.00', '179', '0', 'balance', '1551699760', null);
INSERT INTO `cmf_gxzh_order` VALUES ('155', '14', '0', 'pitchon_180_1551699941', null, null, '10.00', '180', '0', 'balance', '1551699941', null);
INSERT INTO `cmf_gxzh_order` VALUES ('156', '5', '0', 'pitchon_182_1551707310', null, null, '0.10', '182', '0', 'balance', '1551707310', null);
INSERT INTO `cmf_gxzh_order` VALUES ('157', '9', '0', 'pitchon_184_1551748188', null, null, '100.00', '184', '0', 'balance', '1551748188', null);
INSERT INTO `cmf_gxzh_order` VALUES ('158', '5', '0', 'pitchon_185_1551753216', null, null, '0.10', '185', '0', 'balance', '1551753216', null);
INSERT INTO `cmf_gxzh_order` VALUES ('159', '4', '0', 'pitchon_191_1551774528', null, null, '100.00', '191', '0', 'alipay', '1551774528', null);
INSERT INTO `cmf_gxzh_order` VALUES ('160', '4', '0', 'pitchon_191_1551774542', null, null, '100.00', '191', '0', 'balance', '1551774542', null);
INSERT INTO `cmf_gxzh_order` VALUES ('161', '20', '0', 'pitchon_193_1551774859', null, null, '6652.00', '193', '0', 'alipay', '1551774859', null);
INSERT INTO `cmf_gxzh_order` VALUES ('162', '20', '0', 'pitchon_193_1551775068', null, null, '6652.00', '193', '0', 'alipay', '1551775068', null);
INSERT INTO `cmf_gxzh_order` VALUES ('163', '20', '0', 'pitchon_193_1551775190', null, null, '6652.00', '193', '0', 'wechat', '1551775190', null);
INSERT INTO `cmf_gxzh_order` VALUES ('164', '20', '0', 'pitchon_193_1551775242', null, null, '6652.00', '193', '0', 'wechat', '1551775242', null);
INSERT INTO `cmf_gxzh_order` VALUES ('165', '20', '0', 'pitchon_193_1551775315', null, null, '6652.00', '193', '0', 'wechat', '1551775315', null);
INSERT INTO `cmf_gxzh_order` VALUES ('166', '20', '0', 'pitchon_193_1551775536', null, null, '6652.00', '193', '0', 'wechat', '1551775536', null);
INSERT INTO `cmf_gxzh_order` VALUES ('167', '20', '0', 'pitchon_193_1551777015', null, null, '6652.00', '193', '0', 'balance', '1551777015', null);
INSERT INTO `cmf_gxzh_order` VALUES ('168', '20', '0', 'pitchon_192_1551789996', null, null, '55.00', '192', '0', 'wechat', '1551789996', null);
INSERT INTO `cmf_gxzh_order` VALUES ('169', '20', '0', 'pitchon_192_1551790070', null, null, '55.00', '192', '0', 'wechat', '1551790070', null);
INSERT INTO `cmf_gxzh_order` VALUES ('170', '20', '0', 'pitchon_192_1551790105', null, null, '55.00', '192', '0', 'wechat', '1551790105', null);
INSERT INTO `cmf_gxzh_order` VALUES ('171', '20', '0', 'pitchon_192_1551790139', null, null, '55.00', '192', '0', 'wechat', '1551790139', null);
INSERT INTO `cmf_gxzh_order` VALUES ('172', '20', '0', 'pitchon_192_1551790179', null, null, '55.00', '192', '0', 'wechat', '1551790179', null);
INSERT INTO `cmf_gxzh_order` VALUES ('173', '20', '0', 'pitchon_194_1551790235', null, null, '0.10', '194', '0', 'wechat', '1551790235', null);
INSERT INTO `cmf_gxzh_order` VALUES ('174', '20', '0', 'pitchon_194_1551790422', null, null, '0.10', '194', '0', 'wechat', '1551790422', null);
INSERT INTO `cmf_gxzh_order` VALUES ('175', '4', '0', 'pitchon_2_1551796360', null, null, '25.00', '2', '0', 'wechat', '1551796360', null);
INSERT INTO `cmf_gxzh_order` VALUES ('176', '4', '0', 'pitchon_2_1551796364', null, null, '25.00', '2', '0', 'wechat', '1551796364', null);
INSERT INTO `cmf_gxzh_order` VALUES ('177', '4', null, 'recharge_4_1551796465', null, null, '25.00', null, '0', 'miniapp', '1551796465', null);
INSERT INTO `cmf_gxzh_order` VALUES ('178', '4', null, 'recharge_4_1551796469', null, null, '25.00', null, '0', 'miniapp', '1551796469', null);

-- ----------------------------
-- Table structure for cmf_gxzh_question
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_question`;
CREATE TABLE `cmf_gxzh_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `service_id` int(11) NOT NULL DEFAULT '0' COMMENT '定向提问服务id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `money` decimal(10,2) NOT NULL COMMENT '预算金额',
  `content` text NOT NULL COMMENT '描述',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `imgs` text COMMENT '图片json',
  `dept1` int(11) DEFAULT NULL COMMENT '科室一级',
  `dept2` varchar(255) DEFAULT NULL COMMENT '科室二级',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0未解决 1已解决 2撤销',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_question
-- ----------------------------
INSERT INTO `cmf_gxzh_question` VALUES ('1', '2', '0', '问题2', '1.00', 'z', null, null, null, null, null, '2', null, null);
INSERT INTO `cmf_gxzh_question` VALUES ('2', '4', '0', '发布问题', '25.00', '本噢噢噢哦哦', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-664f4dcf.jpg,/storage/emulated/0/UZMap/A6092656150793/picture/p-665b274e.jpg', '0', '0', '0', '1550301847', null);
INSERT INTO `cmf_gxzh_question` VALUES ('3', '4', '0', '5656', '36.00', '本末', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-682baf8c.jpg,/storage/emulated/0/UZMap/A6092656150793/picture/p-682d9b12.jpg', '24', '56', '0', '1550301971', null);
INSERT INTO `cmf_gxzh_question` VALUES ('4', '4', '0', '缺乏维生素', '58.00', 'common', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-8dab7a3a.jpg,/storage/emulated/0/UZMap/A6092656150793/picture/p-8db8a53d.jpg', '24', '57', '0', '1550302064', null);
INSERT INTO `cmf_gxzh_question` VALUES ('5', '4', '0', '其他地市', '21.00', '啦啦啦啦啦', '340000', '340800', '/storage/emulated/0/UZMap/A6092656150793/picture/p-99d306dc.jpg', '24', '0', '2', '1550302787', null);
INSERT INTO `cmf_gxzh_question` VALUES ('6', '4', '0', '来一个提问', '12.00', '来咯噢耶', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-c2acf805.jpg,/storage/emulated/0/UZMap/A6092656150793/picture/p-c2b92be0.jpg', '23', '50', '0', '1550303081', null);
INSERT INTO `cmf_gxzh_question` VALUES ('7', '4', '0', '完美世界', '12.00', '他用', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-c62358da.jpg', '23', '51', '0', '1550303278', null);
INSERT INTO `cmf_gxzh_question` VALUES ('8', '4', '0', '无论他在干什么', '25.00', 'know突来', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-ffe19d14.jpg', '3', '34', '2', '1550304527', null);
INSERT INTO `cmf_gxzh_question` VALUES ('9', '4', '0', '第一个', '25.00', '你在郑州考虑考虑', '410000', '410100', '/storage/emulated/0/UZMap/A6092656150793/picture/p-36a69561.jpg', '7', '0', '2', '1550305659', null);
INSERT INTO `cmf_gxzh_question` VALUES ('10', '4', '0', '第2个', '25.00', '安monk', '410000', '410100', '/upload/gxzh/20190216/524908ba7daef15c3727c22550dbd19c.jpg', '3', '33', '2', '1550306071', null);
INSERT INTO `cmf_gxzh_question` VALUES ('11', '4', '0', '第三个', '36.00', '有空', '410000', '410100', '/upload/gxzh/20190216/61fd042c2d67d9737749c37db52cbb21.jpg,/upload/gxzh/20190216/745410ee631fa023a3660082042de1e3.jpg,/upload/gxzh/20190216/5695fc0d2de3dca68c3c330e4eefeb9b.jpg,/upload/gxzh/20190216/c9272c92a51b17ad50452a9f6e53d42d.jpg', '2', '22', '2', '1550306852', null);
INSERT INTO `cmf_gxzh_question` VALUES ('12', '4', '0', '1种', '1.00', '请您', '410000', '410100', '/upload/gxzh/20190216/ab00f4be194c15aa55e310d3f967ed51.jpg', '7', '8', '2', '1550307636', null);
INSERT INTO `cmf_gxzh_question` VALUES ('13', '4', '0', '刚刚回来', '12.00', '556655', '410000', '410100', '/upload/gxzh/20190217/e47346da33bb47d8cbedb4dd58e748d7.jpg', '7', '0', '2', '1550351382', null);
INSERT INTO `cmf_gxzh_question` VALUES ('14', '4', '0', '翡翠城', '28.00', '吃v吃vvGV', '410000', '410100', '', '7', '27', '2', '1550464338', null);
INSERT INTO `cmf_gxzh_question` VALUES ('15', '2', '0', '翡翠城', '28.00', '吃v吃vvGV', '410000', '410100', '', '7', '27,9', '2', '1550464538', null);
INSERT INTO `cmf_gxzh_question` VALUES ('16', '4', '0', '哈哈哈', '36.00', '好吧', '410000', '410100', '/upload/gxzh/20190218/82ed9a0a6ff2ea2a8a7e75d407a30e2e.jpg', '7', '27,9', '2', '1550469062', null);
INSERT INTO `cmf_gxzh_question` VALUES ('17', '4', '1', '他厉害个快', '36.00', '急哭了', '410000', '410100', '/upload/gxzh/20190218/0763cb97a164c03d417d731fc6eae07a.jpg', '0', '', '0', '1550473971', null);
INSERT INTO `cmf_gxzh_question` VALUES ('18', '4', '1', '图纸中冷', '36.00', '图里河', '410000', '410100', '', '0', '', '0', '1550474066', null);
INSERT INTO `cmf_gxzh_question` VALUES ('19', '4', '1', '恶魔眼', '36.00', '记录贴', '410000', '410100', '', '0', '', '0', '1550474258', null);
INSERT INTO `cmf_gxzh_question` VALUES ('20', '4', '1', '啦啊呀呀', '36.00', '噜噜噜', '410000', '410100', '', '0', '', '0', '1550474336', null);
INSERT INTO `cmf_gxzh_question` VALUES ('21', '4', '1', 'now语录JJ', '36.00', '萝莉控', '410000', '410100', '', '0', '', '0', '1550474399', null);
INSERT INTO `cmf_gxzh_question` VALUES ('22', '4', '1', '哦哦哦', '36.00', '考虑考虑', '410000', '410100', '', '0', '', '0', '1550476438', null);
INSERT INTO `cmf_gxzh_question` VALUES ('23', '4', '1', '酒徒', '36.00', '那就看快啦', '410000', '410100', '', '0', '', '0', '1550476474', null);
INSERT INTO `cmf_gxzh_question` VALUES ('24', '4', '1', '旅途', '36.00', '铝土矿', '410000', '410100', '', '0', '', '0', '1550476633', null);
INSERT INTO `cmf_gxzh_question` VALUES ('25', '4', '1', '哦哦噢噢噢哦哦', '36.00', '具体来啦', '410000', '410100', '', '0', '', '0', '1550476743', null);
INSERT INTO `cmf_gxzh_question` VALUES ('26', '4', '1', '阿东造型', '36.00', '考虑考虑', '410000', '410100', '', '0', '', '0', '1550476804', null);
INSERT INTO `cmf_gxzh_question` VALUES ('27', '4', '1', '暖足贴', '36.00', '考虑考虑', '410000', '410100', '', '0', '', '0', '1550476879', null);
INSERT INTO `cmf_gxzh_question` VALUES ('28', '4', '1', '特殊教育', '36.00', '可发咯6咯up', '410000', '410100', '', '0', '', '0', '1550476908', null);
INSERT INTO `cmf_gxzh_question` VALUES ('29', '4', '1', '抹抹药', '36.00', '兔兔哦哦哦', '410000', '410100', '', '0', '', '0', '1550476937', null);
INSERT INTO `cmf_gxzh_question` VALUES ('30', '4', '1', '暖足贴', '36.00', '暖足贴', '410000', '410100', '', '0', '', '0', '1550477073', null);
INSERT INTO `cmf_gxzh_question` VALUES ('31', '4', '1', '考虑考虑', '36.00', '噢噢噢哦哦', '410000', '410100', '', '0', '', '0', '1550477311', null);
INSERT INTO `cmf_gxzh_question` VALUES ('32', '4', '1', '哦玉兔UK', '36.00', 'monk', '410000', '410100', '', '0', '', '0', '1550477540', null);
INSERT INTO `cmf_gxzh_question` VALUES ('33', '4', '1', '魔装学园', '36.00', '具体来啦', '410000', '410100', '', '0', '', '0', '1550477568', null);
INSERT INTO `cmf_gxzh_question` VALUES ('34', '4', '0', '那我的', '23.00', '他用', '410000', '410100', '/upload/gxzh/20190218/c43c7958b2963859153f9605d0adbab2.jpg', '7', '27,9', '2', '1550477832', null);
INSERT INTO `cmf_gxzh_question` VALUES ('35', '4', '1', '下雨天', '36.00', '困得', '410000', '410100', '', '0', '', '0', '1550477924', null);
INSERT INTO `cmf_gxzh_question` VALUES ('36', '4', '1', '6666666', '36.00', '旅途', '410000', '410100', '', '0', '', '0', '1550478011', null);
INSERT INTO `cmf_gxzh_question` VALUES ('37', '4', '1', '11', '36.00', '11', '410000', '410100', '', '0', '', '0', '1550478140', null);
INSERT INTO `cmf_gxzh_question` VALUES ('38', '4', '1', '我也这样想', '36.00', '你需要', '410000', '410100', '', '0', '', '0', '1550478170', null);
INSERT INTO `cmf_gxzh_question` VALUES ('39', '4', '1', 'now语录JJ', '36.00', '噜噜噜', '410000', '410100', '', '0', '', '0', '1550478240', null);
INSERT INTO `cmf_gxzh_question` VALUES ('40', '4', '1', 'now语录JJ', '36.00', '萝莉控', '410000', '410100', '', '0', '', '0', '1550478382', null);
INSERT INTO `cmf_gxzh_question` VALUES ('41', '4', '1', '起来不愿做奴隶的人民', '36.00', '啦咯就来咯额', '410000', '410100', '', '0', '', '0', '1550478404', null);
INSERT INTO `cmf_gxzh_question` VALUES ('42', '4', '1', '头疼', '36.00', '恶魔', '410000', '410100', '', '0', '', '0', '1550478454', null);
INSERT INTO `cmf_gxzh_question` VALUES ('43', '4', '1', 'mooed', '36.00', '溃烂', '410000', '410100', '', '0', '', '0', '1550478899', null);
INSERT INTO `cmf_gxzh_question` VALUES ('44', '4', '1', '玉兔', '36.00', '考虑考虑', '410000', '410100', '', '0', '', '0', '1550479124', null);
INSERT INTO `cmf_gxzh_question` VALUES ('45', '4', '1', '噢噢噢哦哦', '36.00', '旅途', '410000', '410100', '', '0', '', '0', '1550479196', null);
INSERT INTO `cmf_gxzh_question` VALUES ('46', '4', '1', '函数图', '36.00', '哦哦噢噢噢哦哦', '410000', '410100', '', '0', '', '0', '1550479210', null);
INSERT INTO `cmf_gxzh_question` VALUES ('47', '4', '1', '哦now', '36.00', '刘咯', '410000', '410100', '', '0', '', '0', '1550479266', null);
INSERT INTO `cmf_gxzh_question` VALUES ('48', '4', '1', '来PK哦要', '36.00', '继续', '410000', '410100', '', '0', '', '0', '1550479284', null);
INSERT INTO `cmf_gxzh_question` VALUES ('49', '4', '1', '莫有样在真转', '36.00', '考虑考虑', '410000', '410100', '', '0', '', '0', '1550479443', null);
INSERT INTO `cmf_gxzh_question` VALUES ('50', '4', '1', '考虑图示', '36.00', '魔装学园', '410000', '410100', '', '0', '', '0', '1550479454', null);
INSERT INTO `cmf_gxzh_question` VALUES ('51', '4', '1', '马路杀手', '36.00', 'fox图', '410000', '410100', '', '0', '', '0', '1550479575', null);
INSERT INTO `cmf_gxzh_question` VALUES ('52', '4', '1', '66841566', '36.00', '考虑兔兔', '410000', '410100', '', '0', '', '0', '1550479684', null);
INSERT INTO `cmf_gxzh_question` VALUES ('53', '4', '1', '谈得上', '36.00', '来了佛系', '410000', '410100', '', '0', '', '0', '1550480268', null);
INSERT INTO `cmf_gxzh_question` VALUES ('54', '4', '1', '海陆空', '36.00', '魔装学园', '410000', '410100', '', '0', '', '0', '1550480280', null);
INSERT INTO `cmf_gxzh_question` VALUES ('55', '4', '1', '急哭了', '36.00', '魔装学园', '410000', '410100', '', '0', '', '0', '1550480389', null);
INSERT INTO `cmf_gxzh_question` VALUES ('56', '4', '1', '漂亮', '36.00', '来找我吧', '410000', '410100', '', '0', '', '0', '1550480409', null);
INSERT INTO `cmf_gxzh_question` VALUES ('57', '4', '1', '小咯哦哦啦啊', '36.00', '欧拉啊', '410000', '410100', '', '0', '', '0', '1550480455', null);
INSERT INTO `cmf_gxzh_question` VALUES ('58', '4', '1', '去咯无卡', '36.00', '么法low', '410000', '410100', '', '0', '', '0', '1550480468', null);
INSERT INTO `cmf_gxzh_question` VALUES ('59', '4', '1', '去咯无卡', '36.00', '么法low', '410000', '410100', '', '0', '', '0', '1550480469', null);
INSERT INTO `cmf_gxzh_question` VALUES ('60', '4', '1', '特逗', '36.00', '噜噜噜', '410000', '410100', '', '0', '', '0', '1550480723', null);
INSERT INTO `cmf_gxzh_question` VALUES ('61', '4', '1', '好女哦旅途', '36.00', '来咯下午', '410000', '410100', '', '0', '', '1', '1550480845', null);
INSERT INTO `cmf_gxzh_question` VALUES ('62', '4', '1', '15699哦信誉图', '36.00', 'knot然鹅', '410000', '410100', '', '0', '', '0', '1550480905', null);
INSERT INTO `cmf_gxzh_question` VALUES ('63', '2', '0', '测试开始', '36.00', '退咯哦么', '410000', '410100', '/upload/gxzh/20190218/7d317a8b76aec0bb8cce52a3433a6513.jpg,/upload/gxzh/20190218/866fbbcaf0f2e3c482577f3d59cc3c32.jpg,/upload/gxzh/20190218/96e019f609fd67cab0e85583e56e0aff.jpg', '7', '27,9', '0', '1550482603', null);
INSERT INTO `cmf_gxzh_question` VALUES ('64', '2', '0', '111', '69.00', '脱模', '410000', '410100', '', '7', '27', '2', '1550483102', null);
INSERT INTO `cmf_gxzh_question` VALUES ('65', '2', '0', '第一个', '111.00', '兔子牙', '410000', '410100', '/upload/gxzh/20190218/f10bbb42201212df92bb71a022a11d20.jpg,/upload/gxzh/20190218/c504e578c7915c95c83870c323f32e1e.jpg,/upload/gxzh/20190218/0ce0e5380f71c9e29531961038376f61.jpg', '7', '27,9', '2', '1550483315', null);
INSERT INTO `cmf_gxzh_question` VALUES ('66', '2', '0', '第二个', '33.00', '驱魔www我', '410000', '410100', '', '24', '56', '0', '1550483391', null);
INSERT INTO `cmf_gxzh_question` VALUES ('67', '2', '1', '向特定专家提问', '36.00', '算了魔芋用我的', '410000', '410100', '/upload/gxzh/20190218/5269b5dadb4d2bea00f810ae1ef860fc.jpg,/upload/gxzh/20190218/cefd5d1217adfba3290bab257166052d.jpg', '0', '', '0', '1550483929', null);
INSERT INTO `cmf_gxzh_question` VALUES ('68', '2', '0', '第五个', '69.00', '升龙', '410000', '410100', '', '7', '9', '0', '1550484105', null);
INSERT INTO `cmf_gxzh_question` VALUES ('69', '2', '0', '第六个', '65.00', '退咯默默', '410000', '410100', '/upload/gxzh/20190218/56b63726176dbbe752013cf608901f29.jpg', '24', '56', '0', '1550484362', null);
INSERT INTO `cmf_gxzh_question` VALUES ('70', '4', '0', '测试发布问题', '26.00', '干活呢宝宝vv吃', '410000', '410100', '', '7', '26', '0', '1550484535', null);
INSERT INTO `cmf_gxzh_question` VALUES ('71', '2', '1', '7777', '36.00', '88888', '410000', '410100', '', '0', '', '0', '1550489381', null);
INSERT INTO `cmf_gxzh_question` VALUES ('72', '5', '0', 'sfff', '1.00', '847fnm', '410000', '410100', '/upload/gxzh/20190218/385443b98431c10121a711aaee1e1d8d.jpg', '7', '31,27,9,26,8', '0', '1550499273', null);
INSERT INTO `cmf_gxzh_question` VALUES ('73', '5', '1', 'dfggg', '36.00', 'vbnbbbv', '410000', '410100', '/upload/gxzh/20190218/102aa1da3aba89e29a460baa57c51417.jpg', '0', '', '0', '1550501446', null);
INSERT INTO `cmf_gxzh_question` VALUES ('74', '5', '1', 'fdsff', '36.00', 'cvbbhh', '410000', '410100', '/upload/gxzh/20190218/00c3c797e0c07ac7059e6c8b6ac40f10.jpg', '0', '', '0', '1550501654', null);
INSERT INTO `cmf_gxzh_question` VALUES ('75', '5', '0', 'wghg', '1.00', 'dbbx', '410000', '410100', '/upload/gxzh/20190219/3b373ced7940448505e18a173caae3dc.jpg', '7', '9', '2', '1550538848', null);
INSERT INTO `cmf_gxzh_question` VALUES ('76', '5', '1', 'dndndn', '36.00', 'ejeje', '410000', '410100', '/upload/gxzh/20190219/c448aa3c9a73cae6f13cabdb413292b6.jpg', '0', '', '0', '1550539201', null);
INSERT INTO `cmf_gxzh_question` VALUES ('77', '5', '1', 'nxjdj', '36.00', 'ndnx', '410000', '410100', '', '0', '', '1', '1550539237', null);
INSERT INTO `cmf_gxzh_question` VALUES ('78', '9', '0', 'v京津冀', '69.00', 'v好斤斤计较', '410000', '410100', '/upload/gxzh/20190219/42d857cc9f9dff3fa3b917bf921b156a.jpg', '7', '27,9', '0', '1550541926', null);
INSERT INTO `cmf_gxzh_question` VALUES ('79', '4', '0', 'OK兔兔', '89.00', 'UK摩擦', '410000', '410100', '/upload/gxzh/20190219/b28146ad15223a60029ebb622e23a860.jpg,/upload/gxzh/20190219/d42487b032678941b30bbc1e49c539f2.jpg', '2', '44,43', '0', '1550541991', null);
INSERT INTO `cmf_gxzh_question` VALUES ('80', '9', '0', '不斤斤计较', '86.00', '不会精绝古城', '410000', '410100', '', '24', '56', '0', '1550554657', null);
INSERT INTO `cmf_gxzh_question` VALUES ('81', '5', '0', 'Fog测试1', '100.00', '测试聊天', '410000', '410100', '/upload/gxzh/20190219/cc7f6f53177f0eec2e2134c9bf113b61.jpg', '7', '', '1', '1550564274', null);
INSERT INTO `cmf_gxzh_question` VALUES ('82', '5', '0', '回来了', '1.00', '图片', '410000', '410100', '/upload/gxzh/20190219/4a2dadb55a28fee583a8945f029f9c3f.jpg', '20', '', '0', '1550586809', null);
INSERT INTO `cmf_gxzh_question` VALUES ('83', '9', '0', '音频', '36.00', '干活不不不', '410000', '410100', '', '7', '8', '2', '1550633421', null);
INSERT INTO `cmf_gxzh_question` VALUES ('84', '9', '0', '规律不会', '25.00', '还不能呢', '410000', '410100', '', '7', '9', '1', '1550643032', null);
INSERT INTO `cmf_gxzh_question` VALUES ('85', '2', '1', '太可怜了', '36.00', '寂寞', '410000', '410100', '', '0', '', '1', '1550663761', null);
INSERT INTO `cmf_gxzh_question` VALUES ('86', '5', '0', '测试', '1.00', '沟通一下', '410000', '410100', '/upload/gxzh/20190221/e21094f78f44faf628403f7b633b8679.jpg', '20', '', '1', '1550714739', null);
INSERT INTO `cmf_gxzh_question` VALUES ('87', '9', '0', '好纠结宝宝', '25.00', 'VB金鸡胶囊宝宝', '410000', '410100', '', '7', '8,26', '1', '1550804372', null);
INSERT INTO `cmf_gxzh_question` VALUES ('88', '4', '0', '无影无踪', '25.00', '循序渐进', '410000', '410100', '', '7', '26,27', '1', '1550808387', null);
INSERT INTO `cmf_gxzh_question` VALUES ('89', '5', '0', 'A片', '10.00', '回我话', '320000', '320600', '', '20', '', '1', '1550808628', null);
INSERT INTO `cmf_gxzh_question` VALUES ('90', '9', '0', '盖好被被', '26.00', '宝贝计划方法v', '410000', '410100', '', '7', '8,9', '1', '1550814983', null);
INSERT INTO `cmf_gxzh_question` VALUES ('91', '5', '0', '鹤立鸡群', '10.00', '口语', '320000', '320600', '/upload/gxzh/20190222/000ec39c1adfa5d4e1fa819227e184d8.jpg', '7', '', '2', '1550835561', null);
INSERT INTO `cmf_gxzh_question` VALUES ('92', '7', '0', '111', '1111.00', '急急急', '320000', '320600', '', '20', '', '0', '1550836540', null);
INSERT INTO `cmf_gxzh_question` VALUES ('93', '5', '0', '好了', '10.00', '4566', '320000', '320600', '/upload/gxzh/20190223/ad976980c224cc38da93f63d2964d5af.jpg', '7', '', '2', '1550879531', null);
INSERT INTO `cmf_gxzh_question` VALUES ('94', '5', '0', '必读DJ咳咳头呢头诺头木木女魔头偷摸土木某通途欧诺通透女', '185.00', '\n莫咯摸摸摸我现在执着无图无真相中央音乐学院YY呜呜呜呜提醒我一下我下午嘻嘻嘻嘻嘻下午嘻嘻嘻嘻嘻YY知我者谓我心忧', '320000', '320600', '/upload/gxzh/20190223/d9f03f1538fd3c55086fd38390c81d1b.jpg,/upload/gxzh/20190223/bba679d06d978f15bf7cf5c4f0cae9f3.jpg,/upload/gxzh/20190223/7a20252ae112f59969c65701c3c6c53f.jpg', '7', '', '2', '1550879631', null);
INSERT INTO `cmf_gxzh_question` VALUES ('95', '4', '0', '哈喽', '25.00', '循序渐进', '410000', '410100', '', '2', '15,28', '0', '1550885471', null);
INSERT INTO `cmf_gxzh_question` VALUES ('96', '5', '1', '测试', '20.00', '咯咯啦啦啦', '320000', '320600', '/upload/gxzh/20190223/17f56f9e021353f7a1ce2458ae951bea.jpg', '0', '', '0', '1550905174', null);
INSERT INTO `cmf_gxzh_question` VALUES ('97', '13', '0', '测试测试', '0.01', 'qq', '410000', '410100', '/upload/gxzh/20190223/09408158325a06394720ddce667ee3c4.jpg', '24', '58,57,56', '0', '1550909385', null);
INSERT INTO `cmf_gxzh_question` VALUES ('98', '5', '0', '测试支付宝支付', '0.20', '64测试支付宝', '320000', '320600', '/upload/gxzh/20190223/8d16aab2928b3615ca8835d79104cbdb.jpg', '7', '', '0', '1550910440', null);
INSERT INTO `cmf_gxzh_question` VALUES ('99', '2', '0', '测测', '0.01', '111', '410000', '410100', '', '23', '', '0', '1550911795', null);
INSERT INTO `cmf_gxzh_question` VALUES ('100', '2', '2', '看看', '0.01', 'no', '410000', '410100', '', '0', '', '1', '1550913253', null);
INSERT INTO `cmf_gxzh_question` VALUES ('101', '5', '0', '测试快速提问1', '0.10', '测试快速提问板块的问题', '320000', '320600', '/upload/gxzh/20190223/262fde6f7b06eb34c5ab5b2380d8e7fd.jpg', '7', '', '1', '1550920460', null);
INSERT INTO `cmf_gxzh_question` VALUES ('102', '5', '1', '后两节课扣扣', '20.00', '跳舞兔兔', '320000', '320600', '/upload/gxzh/20190223/3b79e7b5d6044de275080b2f6eac3149.jpg', '0', '', '0', '1550922209', null);
INSERT INTO `cmf_gxzh_question` VALUES ('103', '5', '1', '测试找专家', '0.10', '明敏明', '320000', '320600', '', '0', '', '0', '1550922674', null);
INSERT INTO `cmf_gxzh_question` VALUES ('104', '5', '1', '测试找专家', '0.10', '仔仔细细', '320000', '320600', '', '0', '', '0', '1550922727', null);
INSERT INTO `cmf_gxzh_question` VALUES ('105', '5', '1', '测试微信付款', '0.10', '轰轰轰', '320000', '320600', '', '0', '', '0', '1550922883', null);
INSERT INTO `cmf_gxzh_question` VALUES ('106', '5', '0', '测试快速提问流程', '0.10', '哦将计就计轰轰轰摸摸摸摸OK', '320000', '320600', '', '7', '', '2', '1550961514', null);
INSERT INTO `cmf_gxzh_question` VALUES ('107', '5', '1', '紧急集合', '36.00', '家里哈哈哈哈', '320000', '320600', '', '0', '', '0', '1550961794', null);
INSERT INTO `cmf_gxzh_question` VALUES ('108', '15', '0', '自走棋', '1.00', '满人口最佳阵容是什么', '320000', '320600', '', '7', '9', '1', '1550995529', null);
INSERT INTO `cmf_gxzh_question` VALUES ('109', '5', '0', '色谱', '10.00', '222', '320000', '320600', '', '24', '58', '2', '1550995711', null);
INSERT INTO `cmf_gxzh_question` VALUES ('110', '5', '1', '啊啊啊', '10.00', '啊啊啊啊', '320000', '320600', '', '0', '', '0', '1550998897', null);
INSERT INTO `cmf_gxzh_question` VALUES ('111', '4', '0', '咯哦YY', '25.00', '图我摸', '410000', '410100', '', '7', '8', '0', '1551068619', null);
INSERT INTO `cmf_gxzh_question` VALUES ('112', '4', '0', '莫有样在真转', '69.00', '退咯哦哦哦YY', '410000', '410100', '', '7', '', '0', '1551068641', null);
INSERT INTO `cmf_gxzh_question` VALUES ('113', '4', '0', '测测', '0.01', '2222', '410000', '410100', '', '7', '', '0', '1551069397', null);
INSERT INTO `cmf_gxzh_question` VALUES ('114', '5', '0', '农药残留检测', '10.00', 'hplc', '320000', '320600', '', '7', '', '1', '1551090073', null);
INSERT INTO `cmf_gxzh_question` VALUES ('115', '5', '0', '农药残留检测', '10.00', 'hplc', '320000', '320600', '', '7', '', '1', '1551090080', null);
INSERT INTO `cmf_gxzh_question` VALUES ('116', '14', '1', 'ttt', '10.00', 'ceshi', '320000', '320600', '', '0', '', '0', '1551090981', null);
INSERT INTO `cmf_gxzh_question` VALUES ('117', '14', '1', 'ttt', '10.00', 'ceshi', '320000', '320600', '', '0', '', '0', '1551091045', null);
INSERT INTO `cmf_gxzh_question` VALUES ('118', '5', '1', 'yyy', '0.10', 'rrr', '320000', '320600', '', '0', '', '0', '1551091365', null);
INSERT INTO `cmf_gxzh_question` VALUES ('119', '5', '1', '11111', '0.10', '22222', '320000', '320600', '', '0', '', '0', '1551092208', null);
INSERT INTO `cmf_gxzh_question` VALUES ('120', '5', '1', 'qqq', '0.10', 'eee', '320000', '320600', '', '0', '', '0', '1551092995', null);
INSERT INTO `cmf_gxzh_question` VALUES ('121', '5', '0', 'fff', '111.00', '\n222', '320000', '320600', '', '7', '', '2', '1551093252', null);
INSERT INTO `cmf_gxzh_question` VALUES ('122', '5', '1', 'xx', '0.10', 'dd', '320000', '320600', '', '0', '', '0', '1551094063', null);
INSERT INTO `cmf_gxzh_question` VALUES ('123', '15', '0', '你要测试啥呀', '1.00', '就是想问问', '320000', '320600', '', '7', '8', '0', '1551099232', null);
INSERT INTO `cmf_gxzh_question` VALUES ('124', '5', '0', '测试抢单完成后，其余用户抢单列表中是否消失', '1.00', '4664649494', '320000', '320600', '', '7', '', '1', '1551149325', null);
INSERT INTO `cmf_gxzh_question` VALUES ('125', '5', '1', '测试找专家', '0.10', '我去洗澡', '320000', '320600', '', '0', '', '0', '1551150300', null);
INSERT INTO `cmf_gxzh_question` VALUES ('126', '9', '0', '还不能女包好几块见见你呢', '25.00', 'VB不能弄', '410000', '410100', '/upload/gxzh/20190226/dcd8db5ae5565fa41137f7d092e759ea.jpg,/upload/gxzh/20190226/ce36f09e3e28c628a27260ee429e8193.jpg', '7', '9,27', '0', '1551175757', null);
INSERT INTO `cmf_gxzh_question` VALUES ('127', '9', '0', '纪念币本报北京就会', '86.00', '不急看看那你呢好多地方v', '410000', '410100', '/upload/gxzh/20190226/09db3df085561124909ab29db443eb08.jpg', '2', '14', '0', '1551175835', null);
INSERT INTO `cmf_gxzh_question` VALUES ('128', '7', '0', '测试推送', '1.00', '我去洗澡', '320000', '320600', '', '7', '', '0', '1551183157', null);
INSERT INTO `cmf_gxzh_question` VALUES ('129', '5', '0', '好了', '1.00', '同乐\n', '320000', '320600', '', '7', '', '0', '1551185045', null);
INSERT INTO `cmf_gxzh_question` VALUES ('130', '5', '0', '测试图标出数字', '1.00', '6764646', '320000', '320600', '', '7', '', '0', '1551240912', null);
INSERT INTO `cmf_gxzh_question` VALUES ('131', '5', '0', '会议', '1.00', '求赞求赞求赞', '320000', '320600', '', '7', '', '0', '1551266082', null);
INSERT INTO `cmf_gxzh_question` VALUES ('132', '5', '0', '测试推送', '1.00', '仔仔细细', '320000', '320600', '', '7', '', '0', '1551272261', null);
INSERT INTO `cmf_gxzh_question` VALUES ('133', '5', '0', '测试推送', '1.00', '去了', '320000', '320600', '', '7', '', '0', '1551272668', null);
INSERT INTO `cmf_gxzh_question` VALUES ('134', '5', '0', '测试订单收入', '0.10', '前一阵子', '320000', '320600', '', '7', '', '0', '1551273714', null);
INSERT INTO `cmf_gxzh_question` VALUES ('135', '5', '0', '测试付款后是否跳转', '0.01', 'ing嘻嘻', '320000', '320600', '', '7', '', '0', '1551274006', null);
INSERT INTO `cmf_gxzh_question` VALUES ('136', '5', '0', '哪儿有1**下载', '1.00', '明年', '320000', '320600', '', '7', '', '0', '1551332839', null);
INSERT INTO `cmf_gxzh_question` VALUES ('137', '5', '0', 'A  片', '1.00', '**下载', '320000', '320600', '', '7', '', '0', '1551332928', null);
INSERT INTO `cmf_gxzh_question` VALUES ('138', '5', '0', '测试退款1，回答者的余额会不会减少', '100.00', '刚洗完澡', '320000', '320600', '', '7', '', '0', '1551340787', null);
INSERT INTO `cmf_gxzh_question` VALUES ('139', '9', '2', '小程序向指定专家提问', '88.00', '来来来聪明的小孩', '410000', '410100', '/upload/gxzh/20190228/b802fcfa36d0b074825000582a8143b5.jpg,/upload/gxzh/20190228/fd611dd8d2a56971de9cb245dff5c379.jpg', '0', '', '0', '1551347517', null);
INSERT INTO `cmf_gxzh_question` VALUES ('140', '9', '2', '第一册从小程序提问', '88.00', '奥德赛发放十点多', '410000', '410100', '/upload/gxzh/20190228/86f0251acc9aaa5b5229d4a4d6268eb5.jpg,/upload/gxzh/20190228/577be330ceed819b9279b21453996a27.jpg', '0', '', '1', '1551347721', null);
INSERT INTO `cmf_gxzh_question` VALUES ('141', '5', '0', '测试退款2', '100.00', '9694949', '320000', '320600', '', '7', '8', '0', '1551351113', null);
INSERT INTO `cmf_gxzh_question` VALUES ('142', '5', '1', '测试付款退款', '0.10', '我是庸人自扰之', '320000', '320600', '', '0', '', '0', '1551351562', null);
INSERT INTO `cmf_gxzh_question` VALUES ('143', '5', '1', '回来了', '0.10', '去兔兔', '320000', '320600', '', '0', '', '0', '1551351855', null);
INSERT INTO `cmf_gxzh_question` VALUES ('144', '5', '1', '测试找专家', '0.10', '轰轰轰', '320000', '320600', '', '0', '', '0', '1551352043', null);
INSERT INTO `cmf_gxzh_question` VALUES ('145', '9', '2', '发打发第三方阿斯蒂芬的阿萨德', '88.00', '大发送到', '410000', '410100', '', '0', '', '0', '1551402719', null);
INSERT INTO `cmf_gxzh_question` VALUES ('146', '9', '2', '打发第三方是的', '88.00', '阿斯顿发打发斯蒂芬是的发生的阿萨德', '410000', '410100', '', '0', '', '1', '1551402776', null);
INSERT INTO `cmf_gxzh_question` VALUES ('147', '9', '2', '想指定专家提问', '88.00', '爱的色放撒旦分', '410000', '410100', '', '0', '', '0', '1551406663', null);
INSERT INTO `cmf_gxzh_question` VALUES ('148', '9', '0', '快速提问111', '34234234.00', '多少发的说法', '410000', '410100', '', '7', '8', '0', '1551406808', null);
INSERT INTO `cmf_gxzh_question` VALUES ('149', '9', '0', '速度发大水', '234.00', '地方大的时候', '410000', '410100', '', '7', '26', '2', '1551407197', null);
INSERT INTO `cmf_gxzh_question` VALUES ('150', '9', '0', '跳转到我的咨询里', '234.00', '速度发发呆', '410000', '410100', '', '7', '8,26', '0', '1551407329', null);
INSERT INTO `cmf_gxzh_question` VALUES ('151', '4', '0', '卡恩农业', '25.00', '橘子洲', '410000', '410100', '', '7', '9', '1', '1551407433', null);
INSERT INTO `cmf_gxzh_question` VALUES ('152', '2', '0', '测测123', '1.00', '123', '410000', '410100', '', '7', '', '2', '1551407496', null);
INSERT INTO `cmf_gxzh_question` VALUES ('153', '4', '0', '童模', '89.00', '来咯哦我摸', '410000', '410100', '', '7', '9,26', '0', '1551408485', null);
INSERT INTO `cmf_gxzh_question` VALUES ('154', '23', '0', '测测111', '0.01', 'QQ', '410000', '410100', '', '7', '', '0', '1551414863', null);
INSERT INTO `cmf_gxzh_question` VALUES ('155', '2', '1', '得得', '0.01', '看看', '410000', '410100', '', '0', '', '0', '1551416375', null);
INSERT INTO `cmf_gxzh_question` VALUES ('156', '9', '0', 'hbbbb', '25.00', 'bbbbv魔装学园', '410000', '410100', '', '2', '14,28', '1', '1551442362', null);
INSERT INTO `cmf_gxzh_question` VALUES ('157', '9', '0', 'town我', '55.00', '控制', '410000', '410100', '', '7', '8', '0', '1551444855', null);
INSERT INTO `cmf_gxzh_question` VALUES ('158', '9', '0', '哦哟下午', '55.00', '咯牙用我的', '410000', '410100', '', '2', '15,14', '0', '1551444910', null);
INSERT INTO `cmf_gxzh_question` VALUES ('159', '27', '0', '鸡眼', '10.00', '鸡眼去除的办法有哪些速效去除的方法？', '410000', '410100', '', '61', '', '0', '1551448188', null);
INSERT INTO `cmf_gxzh_question` VALUES ('160', '5', '0', '测试付款逻辑', '100.00', '公公\n', '320000', '320600', '', '7', '', '0', '1551449683', null);
INSERT INTO `cmf_gxzh_question` VALUES ('161', '5', '0', '测试付款延迟', '150.00', '太可怜了', '320000', '320600', '', '7', '', '0', '1551451493', null);
INSERT INTO `cmf_gxzh_question` VALUES ('162', '14', '0', '测试快速提问', '1.00', '咯拒绝了我', '320000', '320600', '', '7', '', '0', '1551491563', null);
INSERT INTO `cmf_gxzh_question` VALUES ('163', '14', '0', '测试快速提问2', '100.00', '测试', '320000', '320600', '/upload/gxzh/20190302/9f74351338dbaa95f00d6bfeedbecdc1.jpg', '7', '', '0', '1551492214', null);
INSERT INTO `cmf_gxzh_question` VALUES ('164', '2', '0', '得得得', '0.01', '图兔兔', '410000', '410100', '', '23', '', '0', '1551496088', null);
INSERT INTO `cmf_gxzh_question` VALUES ('165', '2', '0', '噢噢噢', '0.01', '来来来', '410000', '410100', '', '23', '', '0', '1551498400', null);
INSERT INTO `cmf_gxzh_question` VALUES ('166', '14', '0', '测试问题在不同账号显示是否一致', '20.00', '明细账', '320000', '320600', '', '7', '', '0', '1551500316', null);
INSERT INTO `cmf_gxzh_question` VALUES ('167', '5', '0', '1.3版本测试快速提问', '100.00', '测试', '320000', '320600', '/upload/gxzh/20190302/841b08da9a03edc14c73ee899a4ba7dc.jpg', '7', '', '0', '1551514149', null);
INSERT INTO `cmf_gxzh_question` VALUES ('168', '29', '0', '怎样才能发财？', '0.10', '怎样才能发财。。。\n', '320000', '320600', '', '7', '27', '0', '1551521037', null);
INSERT INTO `cmf_gxzh_question` VALUES ('169', '31', '0', '焊接技术', '0.10', '电焊电流控制', '320000', '320600', '', '7', '8', '1', '1551524994', null);
INSERT INTO `cmf_gxzh_question` VALUES ('170', '31', '2', '种植技术', '500.00', '蓝莓什么时候施肥', '320000', '320600', '/upload/gxzh/20190302/74923eb988741161b18628fb4cbbac36.jpg', '0', '', '1', '1551525102', null);
INSERT INTO `cmf_gxzh_question` VALUES ('171', '31', '0', 'david', '0.01', '生活服务\n', '320000', '320600', '/upload/gxzh/20190302/2214d38498084ea124f89d5ead6fd215.jpg', '7', '8', '2', '1551528586', null);
INSERT INTO `cmf_gxzh_question` VALUES ('172', '31', '0', 'david', '0.01', '生活服务\n', '320000', '320600', '/upload/gxzh/20190302/2214d38498084ea124f89d5ead6fd215.jpg', '7', '8', '0', '1551528587', null);
INSERT INTO `cmf_gxzh_question` VALUES ('173', '31', '1', 'david', '10.00', '蓝莓好种植吗？', '320000', '320600', '/upload/gxzh/20190302/6814ada7247fe7a4a510d30ccda22c4c.jpg', '0', '', '1', '1551528654', null);
INSERT INTO `cmf_gxzh_question` VALUES ('174', '31', '0', 'david好好', '0.01', '医院', '320000', '320600', '', '61', '', '0', '1551528721', null);
INSERT INTO `cmf_gxzh_question` VALUES ('175', '5', '1', '测试找专家', '0.10', '是嘻嘻嘻嘻嘻', '320000', '320600', '/upload/gxzh/20190303/438ab0728c035b8832ae963bfeba26d8.jpg', '0', '', '0', '1551572979', null);
INSERT INTO `cmf_gxzh_question` VALUES ('176', '15', '0', '你在干嘛', '100.00', '在哪儿', '320000', '320600', '/upload/gxzh/20190303/05b551198bc799803284bef417e1501d.jpg', '7', '9', '2', '1551573338', null);
INSERT INTO `cmf_gxzh_question` VALUES ('177', '14', '0', '测试推送', '1.00', '通讯录扣扣', '320000', '320600', '/upload/gxzh/20190303/b54e9392d0ae154551584515e1338626.jpg', '7', '', '0', '1551575056', null);
INSERT INTO `cmf_gxzh_question` VALUES ('178', '31', '0', 'david', '0.01', '钓鱼用什么\n', '320000', '320600', '', '7', '', '0', '1551575192', null);
INSERT INTO `cmf_gxzh_question` VALUES ('179', '31', '0', 'david', '0.01', 'nnnnnn\n', '320000', '320600', '', '7', '', '0', '1551575215', null);
INSERT INTO `cmf_gxzh_question` VALUES ('180', '31', '0', 'david', '0.01', 'yyyyyyyy', '320000', '320600', '', '7', '', '0', '1551575243', null);
INSERT INTO `cmf_gxzh_question` VALUES ('181', '31', '0', 'david', '0.01', '9.08', '320000', '320600', '', '7', '', '0', '1551575327', null);
INSERT INTO `cmf_gxzh_question` VALUES ('182', '31', '0', 'david', '0.01', '9.09', '320000', '320600', '', '7', '', '0', '1551575347', null);
INSERT INTO `cmf_gxzh_question` VALUES ('183', '31', '0', 'david9.13', '0.01', 'cccc', '320000', '320600', '', '7', '', '0', '1551575646', null);
INSERT INTO `cmf_gxzh_question` VALUES ('184', '31', '0', 'david 9.27', '0.10', 'cvghhhh', '320000', '320600', '', '7', '', '0', '1551576495', null);
INSERT INTO `cmf_gxzh_question` VALUES ('185', '31', '0', 'david9.35', '0.01', 'llllll', '320000', '320600', '', '7', '', '0', '1551576947', null);
INSERT INTO `cmf_gxzh_question` VALUES ('186', '33', '2', '55587', '100.00', '8552687', '320000', '320600', '', '0', '', '0', '1551577794', null);
INSERT INTO `cmf_gxzh_question` VALUES ('187', '33', '0', '鹏', '1.00', '老葛吃饭啦', '320000', '320600', '', '7', '9', '0', '1551578196', null);
INSERT INTO `cmf_gxzh_question` VALUES ('188', '14', '0', 'Fog测试', '1.00', '测试推送', '320000', '320600', '', '7', '', '1', '1551580748', null);
INSERT INTO `cmf_gxzh_question` VALUES ('189', '4', '0', '咯www', '25.00', 'lz五他', '410000', '410100', '', '7', '8', '0', '1551664789', null);
INSERT INTO `cmf_gxzh_question` VALUES ('190', '14', '0', 'www测试0304', '100.00', '测试', '320000', '320600', '/upload/gxzh/20190304/4ed335ebe86baa2fa1efc31fb7a4f248.jpg', '7', '', '0', '1551672769', null);
INSERT INTO `cmf_gxzh_question` VALUES ('191', '14', '0', '测试', '50.00', '明年', '320000', '320600', '', '7', '', '0', '1551672953', null);
INSERT INTO `cmf_gxzh_question` VALUES ('192', '14', '1', '测试找专家', '10.00', '哦婆婆go', '320000', '320600', '', '0', '', '0', '1551673046', null);
INSERT INTO `cmf_gxzh_question` VALUES ('193', '14', '1', '测试', '10.00', '只希望', '320000', '320600', '', '0', '', '0', '1551673083', null);
INSERT INTO `cmf_gxzh_question` VALUES ('194', '14', '1', '测试', '10.00', '行行行', '320000', '320600', '', '0', '', '0', '1551673147', null);
INSERT INTO `cmf_gxzh_question` VALUES ('195', '14', '1', '测试', '10.00', '陪你玩', '320000', '320600', '', '0', '', '0', '1551673190', null);
INSERT INTO `cmf_gxzh_question` VALUES ('196', '14', '0', '测试推送', '1.00', '5555', '320000', '320600', '', '7', '', '0', '1551678954', null);
INSERT INTO `cmf_gxzh_question` VALUES ('197', '14', '0', '，机器人', '1.00', '骨头', '320000', '320600', '', '7', '', '0', '1551679227', null);
INSERT INTO `cmf_gxzh_question` VALUES ('198', '20', '0', '啊都退了', '58.00', '知我者谓我心忧', '410000', '410100', '', '7', '9', '2', '1551691537', null);
INSERT INTO `cmf_gxzh_question` VALUES ('199', '20', '0', '摸摸兔兔', '288.00', '我OK路UK莫得', '410000', '410100', '', '7', '8,9', '0', '1551691694', null);
INSERT INTO `cmf_gxzh_question` VALUES ('200', '20', '0', '来咯某', '155.00', 'too么得KKKKKK', '410000', '410100', '/upload/gxzh/20190304/56e17ae9a6359ea6e2fa9a15ec71be05.jpg', '7', '8,26', '2', '1551692037', null);
INSERT INTO `cmf_gxzh_question` VALUES ('201', '20', '0', '吐吐沫', '155.00', '吐了肯旅途', '410000', '410100', '/upload/gxzh/20190304/ddbee8dab71df5473b330dbb77a07c63.jpg', '7', '27,26', '0', '1551692140', null);
INSERT INTO `cmf_gxzh_question` VALUES ('202', '14', '0', '李敏', '1.00', '仔仔细细', '320000', '320600', '', '23', '', '0', '1551695069', null);
INSERT INTO `cmf_gxzh_question` VALUES ('203', '4', '0', 'jjbvv ', '25.00', 'bbjjj ', '410000', '410100', '', '7', '8,9', '0', '1551695077', null);
INSERT INTO `cmf_gxzh_question` VALUES ('204', '4', '0', 'bbbbw ', '8566.00', 'hbvvvg ', '410000', '410100', '', '23', '53,52', '0', '1551695100', null);
INSERT INTO `cmf_gxzh_question` VALUES ('205', '4', '1', 'gh ', '10.00', 'CGI ', '410000', '410100', '', '0', '', '0', '1551695116', null);
INSERT INTO `cmf_gxzh_question` VALUES ('206', '14', '0', '你住', '1.00', '我去洗澡澡', '320000', '320600', '', '23', '52,53', '0', '1551695125', null);
INSERT INTO `cmf_gxzh_question` VALUES ('207', '2', '0', '扣扣里咯啦咯', '1.00', '看看', '410000', '410100', '', '23', '52,53', '0', '1551695152', null);
INSERT INTO `cmf_gxzh_question` VALUES ('208', '4', '0', 'bbbbb ', '25.00', 'bbjjjbbv ', '410000', '410100', '', '7', '26,8', '0', '1551695559', null);
INSERT INTO `cmf_gxzh_question` VALUES ('209', '2', '0', '扣扣里咯啦咯', '1.00', '看看', '410000', '410100', '', '23', '53,52', '0', '1551695865', null);
INSERT INTO `cmf_gxzh_question` VALUES ('210', '2', '0', '快乐快乐', '2.00', '看看', '410000', '410100', '', '23', '52,54', '0', '1551696748', null);
INSERT INTO `cmf_gxzh_question` VALUES ('211', '9', '2', '脱节了', '2.00', '图KKK喇叭', '410000', '410100', '', '0', '', '0', '1551697245', null);
INSERT INTO `cmf_gxzh_question` VALUES ('212', '9', '2', '中', '2.00', '图KKK喇叭', '410000', '410100', '', '0', '', '0', '1551697268', null);
INSERT INTO `cmf_gxzh_question` VALUES ('213', '9', '2', '某吐了嗯', '2.00', '算了吧哦哟五十', '410000', '410100', '', '0', '', '0', '1551697359', null);
INSERT INTO `cmf_gxzh_question` VALUES ('214', '14', '1', '测试', '10.00', '红皮鞋', '320000', '320600', '', '0', '', '0', '1551699757', null);
INSERT INTO `cmf_gxzh_question` VALUES ('215', '14', '1', '流量', '10.00', '喝醉', '320000', '320600', '', '0', '', '0', '1551699938', null);
INSERT INTO `cmf_gxzh_question` VALUES ('216', '5', '1', '三后两节课', '0.10', '好咯扣扣', '320000', '320600', '', '0', '', '0', '1551707297', null);
INSERT INTO `cmf_gxzh_question` VALUES ('217', '14', '0', '油漆配方', '1000.00', '你明明', '320000', '320600', '/upload/gxzh/20190305/8e63632224aa68d49439ab446e5094ce.jpg', '7', '', '0', '1551745158', null);
INSERT INTO `cmf_gxzh_question` VALUES ('218', '9', '0', 'bnjjjjbvc ', '36.00', 'vbhhhyggf ', '410000', '410100', '', '7', '9', '0', '1551748159', null);
INSERT INTO `cmf_gxzh_question` VALUES ('219', '9', '2', 'jjnnbvvvxdd ', '100.00', 'jjnnnbb ggp ', '410000', '410100', '', '0', '', '0', '1551748185', null);
INSERT INTO `cmf_gxzh_question` VALUES ('220', '4', '0', '那你呢不不不', '25.00', '不将就不过分', '410000', '410100', '', '7', '9', '2', '1551750582', null);
INSERT INTO `cmf_gxzh_question` VALUES ('221', '5', '1', '测试', '0.10', '仔仔细细', '320000', '320600', '', '0', '', '0', '1551753213', null);
INSERT INTO `cmf_gxzh_question` VALUES ('222', '5', '0', '测试车', '1.00', '766669', '320000', '320600', '/upload/gxzh/20190305/85d85574280504dec8942806af66bc20.jpg', '7', '', '0', '1551754072', null);
INSERT INTO `cmf_gxzh_question` VALUES ('223', '34', '0', '刚刚好', '111.00', '结婚vv', '110000', '110100', '', '23', '54,52', '0', '1551762220', null);
INSERT INTO `cmf_gxzh_question` VALUES ('224', '34', '2', '哈哈v', '100.00', 'vvv', '110000', '110100', '', '0', '', '0', '1551762279', null);
INSERT INTO `cmf_gxzh_question` VALUES ('225', '4', '2', 'afsdsaf', '100.00', 'sdf ', '410000', '410100', '', '0', '', '0', '1551774301', null);
INSERT INTO `cmf_gxzh_question` VALUES ('226', '4', '2', 'asd', '100.00', 'asd ', '410000', '410100', '', '0', '', '0', '1551774413', null);
INSERT INTO `cmf_gxzh_question` VALUES ('227', '4', '2', 'asd', '100.00', 'asd ', '410000', '410100', '', '0', '', '0', '1551774414', null);
INSERT INTO `cmf_gxzh_question` VALUES ('228', '4', '2', 'ewra', '100.00', 'ad', '410000', '410100', '', '0', '', '0', '1551774516', null);
INSERT INTO `cmf_gxzh_question` VALUES ('229', '20', '0', '拉法几十块', '334.00', 'ad防守打法是的', '410000', '410100', '', '7', '8,26', '0', '1551774736', null);
INSERT INTO `cmf_gxzh_question` VALUES ('230', '20', '0', '完美世界', '123.00', '发的发发呆', '410000', '410100', '', '7', '26', '0', '1551774816', null);
INSERT INTO `cmf_gxzh_question` VALUES ('231', '20', '0', '测试支付', '0.10', '的是的发送到是的s是的', '410000', '410100', '', '7', '8', '0', '1551790213', null);
INSERT INTO `cmf_gxzh_question` VALUES ('232', '34', '1', '回合肥', '36.00', '不和好', '110000', '110100', '', '0', '', '0', '1551796201', null);
INSERT INTO `cmf_gxzh_question` VALUES ('233', '22', '0', '都会发的', '1.00', '都很幸福', '320000', '320600', '', '7', '', '0', '1551830185', null);

-- ----------------------------
-- Table structure for cmf_gxzh_redpack
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_redpack`;
CREATE TABLE `cmf_gxzh_redpack` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trade_sn` varchar(100) NOT NULL,
  `from_uid` int(10) NOT NULL,
  `to_uid` int(10) NOT NULL,
  `money` decimal(8,2) NOT NULL,
  `out_trade_no` varchar(100) NOT NULL,
  `created_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='红包记录';

-- ----------------------------
-- Records of cmf_gxzh_redpack
-- ----------------------------
INSERT INTO `cmf_gxzh_redpack` VALUES ('1', 'redpack_1550826451', '4', '2', '12.00', '', '1550826451');
INSERT INTO `cmf_gxzh_redpack` VALUES ('2', 'redpack_1550826524', '4', '4', '12.00', '', '1550826524');
INSERT INTO `cmf_gxzh_redpack` VALUES ('3', 'redpack_1550826595', '4', '4', '12.00', '', '1550826595');
INSERT INTO `cmf_gxzh_redpack` VALUES ('4', 'redpack_1550826843', '4', '4', '15.00', '', '1550826843');
INSERT INTO `cmf_gxzh_redpack` VALUES ('5', 'redpack_1550827063', '4', '4', '25.00', '', '1550827063');
INSERT INTO `cmf_gxzh_redpack` VALUES ('6', 'redpack_1550827173', '9', '4', '15.00', '', '1550827173');
INSERT INTO `cmf_gxzh_redpack` VALUES ('7', 'redpack_1550827318', '9', '4', '15.00', '', '1550827318');
INSERT INTO `cmf_gxzh_redpack` VALUES ('8', 'redpack_1550827344', '9', '4', '25.00', '', '1550827344');
INSERT INTO `cmf_gxzh_redpack` VALUES ('9', 'redpack_1550827756', '9', '4', '55.00', '', '1550827756');
INSERT INTO `cmf_gxzh_redpack` VALUES ('10', 'redpack_1550828107', '9', '4', '69.00', '', '1550828107');
INSERT INTO `cmf_gxzh_redpack` VALUES ('11', 'redpack_1550828266', '4', '9', '25.00', '', '1550828266');
INSERT INTO `cmf_gxzh_redpack` VALUES ('12', 'redpack_1550828661', '9', '4', '78.00', '', '1550828661');
INSERT INTO `cmf_gxzh_redpack` VALUES ('13', 'redpack_1550829180', '9', '4', '58.00', '', '1550829180');
INSERT INTO `cmf_gxzh_redpack` VALUES ('14', 'redpack_1550830440', '9', '4', '55.00', '', '1550830440');
INSERT INTO `cmf_gxzh_redpack` VALUES ('15', 'redpack_1550830480', '9', '4', '55.00', '', '1550830480');
INSERT INTO `cmf_gxzh_redpack` VALUES ('16', 'redpack_1550830508', '9', '4', '26.00', '', '1550830508');
INSERT INTO `cmf_gxzh_redpack` VALUES ('17', 'redpack_1550830587', '9', '4', '69.00', '', '1550830587');
INSERT INTO `cmf_gxzh_redpack` VALUES ('18', 'redpack_1550830638', '9', '4', '66.00', '', '1550830638');
INSERT INTO `cmf_gxzh_redpack` VALUES ('19', 'redpack_1550830712', '9', '4', '55.00', '', '1550830712');
INSERT INTO `cmf_gxzh_redpack` VALUES ('20', 'redpack_1550830813', '9', '4', '66.00', '', '1550830813');
INSERT INTO `cmf_gxzh_redpack` VALUES ('21', 'redpack_1550830904', '9', '4', '36.00', '', '1550830904');
INSERT INTO `cmf_gxzh_redpack` VALUES ('22', 'redpack_1550830952', '9', '4', '66.00', '', '1550830952');
INSERT INTO `cmf_gxzh_redpack` VALUES ('23', 'redpack_1550830993', '9', '4', '36.00', '', '1550830993');
INSERT INTO `cmf_gxzh_redpack` VALUES ('24', 'redpack_1550831068', '9', '4', '55.00', '', '1550831068');
INSERT INTO `cmf_gxzh_redpack` VALUES ('25', 'redpack_1550831120', '9', '4', '26.00', '', '1550831120');
INSERT INTO `cmf_gxzh_redpack` VALUES ('26', 'redpack_1550831181', '9', '4', '58.00', '', '1550831181');
INSERT INTO `cmf_gxzh_redpack` VALUES ('27', 'redpack_1550831268', '9', '4', '55.00', '', '1550831268');
INSERT INTO `cmf_gxzh_redpack` VALUES ('28', 'redpack_1550831670', '9', '4', '66.00', '', '1550831670');
INSERT INTO `cmf_gxzh_redpack` VALUES ('29', 'redpack_1550831697', '4', '9', '69.00', '', '1550831697');
INSERT INTO `cmf_gxzh_redpack` VALUES ('30', 'redpack_1550832056', '9', '4', '63.00', '', '1550832056');
INSERT INTO `cmf_gxzh_redpack` VALUES ('31', 'redpack_1550835700', '4', '9', '59.00', '', '1550835700');
INSERT INTO `cmf_gxzh_redpack` VALUES ('32', 'redpack_1550836743', '7', '9', '1.00', '', '1550836743');
INSERT INTO `cmf_gxzh_redpack` VALUES ('33', 'redpack_1550913322', '2', '13', '1.00', '', '1550913322');
INSERT INTO `cmf_gxzh_redpack` VALUES ('34', 'redpack_1550921182', '5', '7', '1.00', '', '1550921182');
INSERT INTO `cmf_gxzh_redpack` VALUES ('35', 'redpack_1550921220', '5', '7', '2000.00', '', '1550921220');
INSERT INTO `cmf_gxzh_redpack` VALUES ('36', 'redpack_1550921230', '5', '7', '5000.00', '', '1550921230');
INSERT INTO `cmf_gxzh_redpack` VALUES ('37', 'redpack_1550923027', '5', '7', '50.00', '', '1550923027');
INSERT INTO `cmf_gxzh_redpack` VALUES ('38', 'redpack_1550991863', '4', '2', '58.00', '', '1550991863');
INSERT INTO `cmf_gxzh_redpack` VALUES ('39', 'redpack_1551007361', '4', '2', '28.00', '', '1551007361');
INSERT INTO `cmf_gxzh_redpack` VALUES ('40', 'redpack_1551498936', '9', '4', '55.00', 'pitchon_131_1551444931', '1551498936');
INSERT INTO `cmf_gxzh_redpack` VALUES ('41', 'redpack_1551532061', '5', '7', '100.00', 'pitchon_85_1550922887', '1551532061');
INSERT INTO `cmf_gxzh_redpack` VALUES ('42', 'redpack_1551532082', '5', '7', '300.00', 'pitchon_85_1550922887', '1551532082');
INSERT INTO `cmf_gxzh_redpack` VALUES ('43', 'redpack_1551599653', '4', '4', '669.00', 'pitchon_48', '1551599653');
INSERT INTO `cmf_gxzh_redpack` VALUES ('44', 'redpack_1551669955', '2', '4', '1.00', 'pitchon_137_1551498497', '1551669955');
INSERT INTO `cmf_gxzh_redpack` VALUES ('45', 'redpack_1551673581', '14', '5', '10.00', 'pitchon_170_1551673149', '1551673581');
INSERT INTO `cmf_gxzh_redpack` VALUES ('46', 'redpack_1551684009', '9', '4', '25.00', 'pitchon_131_1551444931', '1551684009');
INSERT INTO `cmf_gxzh_redpack` VALUES ('47', 'redpack_1551684123', '9', '4', '36.00', 'pitchon_131_1551444931', '1551684123');
INSERT INTO `cmf_gxzh_redpack` VALUES ('48', 'redpack_1551684307', '9', '4', '28.00', 'pitchon_131_1551444931', '1551684307');
INSERT INTO `cmf_gxzh_redpack` VALUES ('49', 'redpack_1551684394', '9', '4', '88.00', 'pitchon_131_1551444931', '1551684394');
INSERT INTO `cmf_gxzh_redpack` VALUES ('50', 'redpack_1551684565', '9', '4', '85.00', 'pitchon_131_1551444931', '1551684565');
INSERT INTO `cmf_gxzh_redpack` VALUES ('51', 'redpack_1551684590', '9', '4', '85.00', 'pitchon_131_1551444931', '1551684590');
INSERT INTO `cmf_gxzh_redpack` VALUES ('52', 'redpack_1551684692', '9', '4', '25.00', 'pitchon_131_1551444931', '1551684692');
INSERT INTO `cmf_gxzh_redpack` VALUES ('53', 'redpack_1551684857', '9', '4', '69.00', 'pitchon_131_1551444931', '1551684857');
INSERT INTO `cmf_gxzh_redpack` VALUES ('54', 'redpack_1551685014', '9', '4', '66.00', 'pitchon_131_1551444931', '1551685014');
INSERT INTO `cmf_gxzh_redpack` VALUES ('55', 'redpack_1551745556', '14', '5', '5.00', 'pitchon_179_1551699760', '1551745556');
INSERT INTO `cmf_gxzh_redpack` VALUES ('56', 'redpack_1551752336', '14', '5', '1.00', 'pitchon_173_1551681136', '1551752336');
INSERT INTO `cmf_gxzh_redpack` VALUES ('57', 'redpack_1551777975', '20', '9', '45.00', 'pitchon_193_1551777015', '1551777975');
INSERT INTO `cmf_gxzh_redpack` VALUES ('58', 'redpack_1551780950', '20', '9', '20.00', 'pitchon_193_1551777015', '1551780950');
INSERT INTO `cmf_gxzh_redpack` VALUES ('59', 'redpack_1551780972', '20', '9', '56.00', 'pitchon_193_1551777015', '1551780972');
INSERT INTO `cmf_gxzh_redpack` VALUES ('60', 'redpack_1551781098', '20', '9', '455.00', 'pitchon_193_1551777015', '1551781098');
INSERT INTO `cmf_gxzh_redpack` VALUES ('61', 'redpack_1551783217', '4', '9', '58.00', 'pitchon_127_1551408538', '1551783217');
INSERT INTO `cmf_gxzh_redpack` VALUES ('62', 'redpack_1551791440', '20', '9', '34.00', 'pitchon_193_1551777015', '1551791440');
INSERT INTO `cmf_gxzh_redpack` VALUES ('63', 'redpack_1551791550', '20', '9', '23.00', 'pitchon_193_1551777015', '1551791550');

-- ----------------------------
-- Table structure for cmf_gxzh_refund
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_refund`;
CREATE TABLE `cmf_gxzh_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` varchar(255) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `money` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因',
  `imgs` text NOT NULL,
  `out_trade_no` varchar(100) NOT NULL DEFAULT '' COMMENT '关联订单号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0待审核  1审核通过  2驳回',
  `reject` varchar(255) NOT NULL DEFAULT '' COMMENT '驳回理由',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='退款表';

-- ----------------------------
-- Records of cmf_gxzh_refund
-- ----------------------------
INSERT INTO `cmf_gxzh_refund` VALUES ('1', 'refund_4_20190222160450', '4', '1.00', '发v好解决那你好好', '', '', '0', '', '1550822690', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('2', 'refund_4_20190222160548', '4', '123.00', 'VB好好补补', '', '', '0', '', '1550822748', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('3', 'refund_4_20190222160643', '4', '1.00', 'VB不别扭', '', '', '0', '', '1550822803', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('4', 'refund_4_20190222160731', '4', '11.00', '哥还好吧', '', '', '1', '', '1550822851', '1550837680');
INSERT INTO `cmf_gxzh_refund` VALUES ('5', 'refund_2_20190222201346', '2', '1.00', '111', '', '', '1', '', '1550837626', '1550837644');
INSERT INTO `cmf_gxzh_refund` VALUES ('6', 'refund_7_20190222201809', '7', '12.00', '测试', '', '', '1', '', '1550837889', '1550837899');
INSERT INTO `cmf_gxzh_refund` VALUES ('7', 'refund_7_20190222202128', '7', '100.00', '宏图街聚源路站', '', '', '2', '你的理由不成立', '1550838088', '1550838113');
INSERT INTO `cmf_gxzh_refund` VALUES ('8', 'refund_5_20190225193007', '5', '1.00', '4444', '', '', '0', '', '1551094207', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('9', 'refund_9_20190226175648', '9', '25.00', '进步个', '/upload/gxzh/20190226/e3eea50ed45a909c7d8aaae10fe7c49a.jpg,/upload/gxzh/20190226/5925b3b2c1ceffe03d9f99b144d7d7ae.jpg,/upload/gxzh/20190226/632375746f3290519fbed5888d21f448.jpg,/upload/gxzh/20190226/879514b9ea6d93f4610249fdf3368a9b.jpg', '', '0', '', '1551175008', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('10', 'refund_9_20190226175859', '9', '555.00', '不能女宝宝白白净净', '/upload/gxzh/20190226/cdd7931a71b41beb1080d940228d0e9b.jpg,/upload/gxzh/20190226/d3b80bd491e0097cbe060e116b844a8d.jpg,/upload/gxzh/20190226/94b40227be968f59a6e74f0ccaf056c7.jpg,/upload/gxzh/20190226/58efb37eeb04112a0816a90d5f34cc7e.jpg', '', '0', '', '1551175139', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('11', 'refund_9_20190226180128', '9', '39.00', '宝宝不管还会不会v吃饭过后', '/upload/gxzh/20190226/e7479826024336e5a176797c4354485b.jpg', '', '0', '', '1551175288', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('12', 'refund_9_20190226180209', '9', '699.00', 'v就拜拜vvv', '/upload/gxzh/20190226/8315341ced38530ff8d8acb706249f9d.jpg', '', '0', '', '1551175329', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('13', 'refund_9_20190226180339', '9', '669.00', '你那边vvv', '', '', '0', '', '1551175419', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('14', 'refund_9_20190226180412', '9', '566.00', '不不不那就', '', '', '0', '', '1551175452', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('15', 'refund_9_20190226180511', '9', '66999.00', '哈哈牛逼', '', '', '0', '', '1551175511', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('16', 'refund_9_20190226180838', '9', '9999.00', '规律宝宝你姐姐', '', '', '0', '', '1551175718', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('17', 'refund_9_20190227174132', '9', '5696.00', '他现在也在做', '/upload/gxzh/20190227/4b34dbdc9d0bb372d8aba573043c139d.jpg', 'pitchon_69', '0', '', '1551260492', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('18', 'refund_2_20190227185355', '2', '1.00', '1', '', 'pitchon_70', '2', '驳回', '1551264835', '1551265447');
INSERT INTO `cmf_gxzh_refund` VALUES ('19', 'refund_5_20190227191129', '5', '2.00', '9494949', '/upload/gxzh/20190227/e239559ca58cb71b7796a39b1b2ca692.jpg', 'pitchon_88_1551265840', '0', '', '1551265889', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('20', 'refund_5_20190227204429', '5', '10.00', '455555555', '/upload/gxzh/20190227/2dd28a083c3f9e049743b7d232dce036.jpg', 'pitchon_79_1550913382', '0', '', '1551271469', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('21', 'refund_5_20190227204607', '5', '12.00', '回来就睡了', '/upload/gxzh/20190227/1d1527a38edd47668457897243275bec.jpg', 'pitchon_79_1550913382', '0', '', '1551271567', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('22', 'refund_5_20190228160221', '5', '100.00', '8测试', '', 'pitchon_116_1551340839', '1', '', '1551340941', '1551340964');
INSERT INTO `cmf_gxzh_refund` VALUES ('23', 'refund_2_20190228173810', '2', '11.00', '，，', '', 'pitchon_70', '1', '', '1551346690', '1551346872');
INSERT INTO `cmf_gxzh_refund` VALUES ('25', 'refund_5_20190228185446', '5', '100.00', '464646', '', 'pitchon_119_1551351169', '1', '', '1551351286', '1551351415');
INSERT INTO `cmf_gxzh_refund` VALUES ('26', 'refund_5_20190228201553', '5', '100.00', '46575', '', 'pitchon_121_1551351859', '0', '', '1551356153', null);
INSERT INTO `cmf_gxzh_refund` VALUES ('27', 'refund_2_20190301131144', '2', '0.01', '哦哦哦', '', 'pitchon_129_1551416387', '2', '222', '1551417104', '1551418954');
INSERT INTO `cmf_gxzh_refund` VALUES ('28', 'refund_23_20190301131210', '23', '0.01', '刚刚', '', 'pitchon_128_1551416727', '2', '222', '1551417130', '1551418946');
INSERT INTO `cmf_gxzh_refund` VALUES ('29', 'refund_14_20190302110000', '14', '50.00', '768899', '/upload/gxzh/20190302/f59f6579e9a68f66f223090be7f8681b.jpg', 'pitchon_135_1551495554', '1', '', '1551495600', '1551495681');

-- ----------------------------
-- Table structure for cmf_gxzh_relation
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_relation`;
CREATE TABLE `cmf_gxzh_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '1 用户 2问题',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题id',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领域id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_relation
-- ----------------------------
INSERT INTO `cmf_gxzh_relation` VALUES ('3', '2', '0', '87', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('4', '2', '0', '87', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('27', '2', '0', '88', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('28', '2', '0', '88', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('33', '2', '0', '90', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('34', '2', '0', '90', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('43', '2', '0', '95', '15');
INSERT INTO `cmf_gxzh_relation` VALUES ('44', '2', '0', '95', '28');
INSERT INTO `cmf_gxzh_relation` VALUES ('49', '2', '0', '97', '58');
INSERT INTO `cmf_gxzh_relation` VALUES ('50', '2', '0', '97', '57');
INSERT INTO `cmf_gxzh_relation` VALUES ('51', '2', '0', '97', '56');
INSERT INTO `cmf_gxzh_relation` VALUES ('54', '2', '0', '108', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('55', '2', '0', '109', '58');
INSERT INTO `cmf_gxzh_relation` VALUES ('71', '1', '16', '0', '32');
INSERT INTO `cmf_gxzh_relation` VALUES ('79', '2', '0', '111', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('80', '2', '0', '123', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('91', '1', '15', '0', '0');
INSERT INTO `cmf_gxzh_relation` VALUES ('92', '1', '15', '0', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('93', '1', '15', '0', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('94', '1', '15', '0', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('95', '1', '15', '0', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('96', '1', '15', '0', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('97', '1', '15', '0', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('98', '1', '15', '0', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('99', '1', '15', '0', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('103', '2', '0', '126', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('104', '2', '0', '126', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('105', '2', '0', '127', '14');
INSERT INTO `cmf_gxzh_relation` VALUES ('106', '2', '0', '141', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('107', '2', '0', '148', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('108', '2', '0', '149', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('109', '2', '0', '150', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('110', '2', '0', '150', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('111', '2', '0', '151', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('119', '2', '0', '153', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('120', '2', '0', '153', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('121', '2', '0', '156', '14');
INSERT INTO `cmf_gxzh_relation` VALUES ('122', '2', '0', '156', '28');
INSERT INTO `cmf_gxzh_relation` VALUES ('123', '2', '0', '157', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('124', '2', '0', '158', '15');
INSERT INTO `cmf_gxzh_relation` VALUES ('125', '2', '0', '158', '14');
INSERT INTO `cmf_gxzh_relation` VALUES ('126', '2', '0', '168', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('127', '2', '0', '169', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('128', '2', '0', '171', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('129', '2', '0', '172', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('135', '2', '0', '176', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('148', '1', '33', '0', '0');
INSERT INTO `cmf_gxzh_relation` VALUES ('149', '1', '33', '0', '37');
INSERT INTO `cmf_gxzh_relation` VALUES ('150', '1', '33', '0', '41');
INSERT INTO `cmf_gxzh_relation` VALUES ('151', '1', '33', '0', '40');
INSERT INTO `cmf_gxzh_relation` VALUES ('152', '1', '33', '0', '35');
INSERT INTO `cmf_gxzh_relation` VALUES ('153', '1', '33', '0', '47');
INSERT INTO `cmf_gxzh_relation` VALUES ('154', '1', '33', '0', '36');
INSERT INTO `cmf_gxzh_relation` VALUES ('155', '1', '33', '0', '38');
INSERT INTO `cmf_gxzh_relation` VALUES ('156', '1', '33', '0', '39');
INSERT INTO `cmf_gxzh_relation` VALUES ('157', '1', '33', '0', '46');
INSERT INTO `cmf_gxzh_relation` VALUES ('158', '1', '33', '0', '45');
INSERT INTO `cmf_gxzh_relation` VALUES ('159', '1', '33', '0', '42');
INSERT INTO `cmf_gxzh_relation` VALUES ('160', '1', '33', '0', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('161', '1', '33', '0', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('162', '1', '33', '0', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('163', '1', '33', '0', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('164', '2', '0', '187', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('170', '2', '0', '189', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('171', '2', '0', '198', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('172', '2', '0', '199', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('173', '2', '0', '199', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('174', '2', '0', '200', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('175', '2', '0', '200', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('176', '2', '0', '201', '27');
INSERT INTO `cmf_gxzh_relation` VALUES ('177', '2', '0', '201', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('178', '1', '34', '0', '0');
INSERT INTO `cmf_gxzh_relation` VALUES ('179', '1', '34', '0', '53');
INSERT INTO `cmf_gxzh_relation` VALUES ('180', '1', '34', '0', '54');
INSERT INTO `cmf_gxzh_relation` VALUES ('181', '1', '34', '0', '50');
INSERT INTO `cmf_gxzh_relation` VALUES ('182', '1', '34', '0', '49');
INSERT INTO `cmf_gxzh_relation` VALUES ('183', '1', '34', '0', '48');
INSERT INTO `cmf_gxzh_relation` VALUES ('184', '2', '0', '203', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('185', '2', '0', '203', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('186', '2', '0', '204', '53');
INSERT INTO `cmf_gxzh_relation` VALUES ('187', '2', '0', '204', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('188', '2', '0', '206', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('189', '2', '0', '206', '53');
INSERT INTO `cmf_gxzh_relation` VALUES ('190', '2', '0', '207', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('191', '2', '0', '207', '53');
INSERT INTO `cmf_gxzh_relation` VALUES ('192', '2', '0', '208', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('193', '2', '0', '208', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('194', '2', '0', '209', '53');
INSERT INTO `cmf_gxzh_relation` VALUES ('195', '2', '0', '209', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('196', '2', '0', '210', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('197', '2', '0', '210', '54');
INSERT INTO `cmf_gxzh_relation` VALUES ('198', '2', '0', '218', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('199', '2', '0', '220', '9');
INSERT INTO `cmf_gxzh_relation` VALUES ('204', '2', '0', '223', '54');
INSERT INTO `cmf_gxzh_relation` VALUES ('205', '2', '0', '223', '52');
INSERT INTO `cmf_gxzh_relation` VALUES ('214', '2', '0', '229', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('215', '2', '0', '229', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('216', '2', '0', '230', '26');
INSERT INTO `cmf_gxzh_relation` VALUES ('217', '2', '0', '231', '8');
INSERT INTO `cmf_gxzh_relation` VALUES ('218', '1', '4', '0', '0');
INSERT INTO `cmf_gxzh_relation` VALUES ('219', '1', '4', '0', '13');
INSERT INTO `cmf_gxzh_relation` VALUES ('220', '1', '4', '0', '14');
INSERT INTO `cmf_gxzh_relation` VALUES ('221', '1', '4', '0', '15');

-- ----------------------------
-- Table structure for cmf_gxzh_service
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_service`;
CREATE TABLE `cmf_gxzh_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户',
  `service` varchar(20) NOT NULL COMMENT '服务类型',
  `price` decimal(6,2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_gxzh_service
-- ----------------------------
INSERT INTO `cmf_gxzh_service` VALUES ('3', '6', '1', '36.00');
INSERT INTO `cmf_gxzh_service` VALUES ('33', '13', '1', '0.01');
INSERT INTO `cmf_gxzh_service` VALUES ('34', '13', '2', '0.01');
INSERT INTO `cmf_gxzh_service` VALUES ('35', '7', '1', '0.10');
INSERT INTO `cmf_gxzh_service` VALUES ('52', '15', '1', '1000.00');
INSERT INTO `cmf_gxzh_service` VALUES ('53', '15', '2', '1.00');
INSERT INTO `cmf_gxzh_service` VALUES ('63', '23', '1', '0.01');
INSERT INTO `cmf_gxzh_service` VALUES ('64', '23', '2', '0.01');
INSERT INTO `cmf_gxzh_service` VALUES ('72', '2', '2', '2.00');
INSERT INTO `cmf_gxzh_service` VALUES ('73', '4', '1', '36.00');
INSERT INTO `cmf_gxzh_service` VALUES ('74', '4', '2', '88.00');
INSERT INTO `cmf_gxzh_service` VALUES ('77', '33', '1', '1.00');
INSERT INTO `cmf_gxzh_service` VALUES ('78', '33', '2', '1.00');
INSERT INTO `cmf_gxzh_service` VALUES ('81', '14', '1', '0.10');
INSERT INTO `cmf_gxzh_service` VALUES ('84', '5', '1', '10.00');
INSERT INTO `cmf_gxzh_service` VALUES ('85', '5', '2', '100.00');
INSERT INTO `cmf_gxzh_service` VALUES ('86', '9', '1', '88.00');

-- ----------------------------
-- Table structure for cmf_gxzh_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gxzh_withdraw`;
CREATE TABLE `cmf_gxzh_withdraw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` varchar(255) NOT NULL COMMENT '提现订单号',
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `withdraw_realname` varchar(200) NOT NULL COMMENT '提现姓名',
  `withdraw_account` varchar(200) NOT NULL COMMENT '提现账号',
  `money` double(11,2) DEFAULT '0.00' COMMENT '提现原金额',
  `balance` double(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `fee` double(11,2) DEFAULT '0.00' COMMENT '手续费',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0待审核  1审核通过  2驳回',
  `reject` varchar(255) DEFAULT NULL COMMENT '驳回理由',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='提现表';

-- ----------------------------
-- Records of cmf_gxzh_withdraw
-- ----------------------------
INSERT INTO `cmf_gxzh_withdraw` VALUES ('1', 'withdraw_4_20190215095010', '4', 'nihao', '1512336666', '2.00', '1.80', '0.20', '0', null, '提现2元,手续费0.2元,手续比例0.1', '1550195410', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('2', 'withdraw_2_20190219174716', '2', '，，', '，，', '1.00', '0.90', '0.10', '1', '', '提现1元,手续费0.1元,手续比例0.1', '1550569636', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('3', 'withdraw_2_20190219174825', '2', '，，，', '。。。', '2.00', '1.80', '0.20', '2', 'asdad', '提现2元,手续费0.2元,手续比例0.1', '1550569705', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('4', 'withdraw_5_20190226203735', '5', 'LOL', '咯哦', '90.00', '81.00', '9.00', '1', '', '提现90元,手续费9元,手续比例0.1', '1551184655', '1551184673');
INSERT INTO `cmf_gxzh_withdraw` VALUES ('5', 'withdraw_5_20190226203843', '5', '1225', '红', '60.00', '54.00', '6.00', '2', '你的进而不够', '提现60元,手续费6元,手续比例0.1', '1551184723', '1551184743');
INSERT INTO `cmf_gxzh_withdraw` VALUES ('6', 'withdraw_5_20190226204044', '5', '啥意思', '积极', '50.00', '45.00', '5.00', '2', '发育发育发育', '提现50元,手续费5元,手续比例0.1', '1551184844', '1551184965');
INSERT INTO `cmf_gxzh_withdraw` VALUES ('7', 'withdraw_5_20190226204110', '5', '啥意思', '积极', '300.00', '270.00', '30.00', '1', '', '提现300元,手续费30元,手续比例0.1', '1551184870', '1551184927');
INSERT INTO `cmf_gxzh_withdraw` VALUES ('8', 'withdraw_5_20190302141601', '5', '给你一张', '会议', '50.00', '45.00', '5.00', '0', null, '提现50元,手续费5元,手续比例0.1', '1551507361', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('9', 'withdraw_4_20190302180114', '4', '4sfas', '165445465', '504.00', '453.60', '50.40', '0', null, '提现504元,手续费50.4元,手续比例0.1', '1551520874', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('10', 'withdraw_4_20190302180120', '4', '4sfas', '165445465', '50.00', '45.00', '5.00', '0', null, '提现50元,手续费5元,手续比例0.1', '1551520880', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('11', 'withdraw_4_20190302180126', '4', 'wer', 'wer', '50.00', '45.00', '5.00', '0', null, '提现50元,手续费5元,手续比例0.1', '1551520886', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('12', 'withdraw_5_20190303083445', '5', '9494949', '4949499', '100.00', '80.00', '20.00', '0', null, '提现100元,手续费20元,手续比例0.2', '1551573285', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('13', 'withdraw_9_20190304112033', '9', 'bbjj ', '15236688886', '680.00', '612.00', '68.00', '0', null, '提现680元,手续费68元,手续比例0.1', '1551669633', null);
INSERT INTO `cmf_gxzh_withdraw` VALUES ('14', 'withdraw_14_20190304122846', '14', '测试用户名', '123345665', '50.00', '45.00', '5.00', '0', null, '提现50元,手续费5元,手续比例0.1', '1551673726', null);

-- ----------------------------
-- Table structure for cmf_hook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
INSERT INTO `cmf_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `cmf_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `cmf_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `cmf_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `cmf_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `cmf_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `cmf_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `cmf_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO `cmf_hook` VALUES ('36', '1', '1', '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO `cmf_hook` VALUES ('37', '2', '1', '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO `cmf_hook` VALUES ('38', '2', '1', '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO `cmf_hook` VALUES ('39', '2', '1', '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO `cmf_hook` VALUES ('40', '2', '1', '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO `cmf_hook` VALUES ('41', '2', '1', '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO `cmf_hook` VALUES ('42', '2', '1', '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO `cmf_hook` VALUES ('43', '2', '1', '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO `cmf_hook` VALUES ('44', '2', '1', '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO `cmf_hook` VALUES ('45', '2', '1', '门户后台文章管理列表界面', 'portal_admin_article_index_view', 'portal', '门户后台文章管理列表界面');
INSERT INTO `cmf_hook` VALUES ('46', '2', '1', '门户后台文章分类管理列表界面', 'portal_admin_category_index_view', 'portal', '门户后台文章分类管理列表界面');
INSERT INTO `cmf_hook` VALUES ('47', '2', '1', '门户后台页面管理列表界面', 'portal_admin_page_index_view', 'portal', '门户后台页面管理列表界面');
INSERT INTO `cmf_hook` VALUES ('48', '2', '1', '门户后台文章标签管理列表界面', 'portal_admin_tag_index_view', 'portal', '门户后台文章标签管理列表界面');
INSERT INTO `cmf_hook` VALUES ('49', '2', '1', '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO `cmf_hook` VALUES ('50', '2', '1', '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO `cmf_hook` VALUES ('51', '2', '1', '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO `cmf_hook` VALUES ('52', '2', '1', '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO `cmf_hook` VALUES ('53', '2', '1', '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO `cmf_hook` VALUES ('54', '2', '1', '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO `cmf_hook` VALUES ('55', '2', '1', '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO `cmf_hook` VALUES ('56', '4', '0', '门户后台文章添加编辑界面右侧栏', 'portal_admin_article_edit_view_right_sidebar', 'portal', '门户后台文章添加编辑界面右侧栏');
INSERT INTO `cmf_hook` VALUES ('57', '4', '0', '门户后台文章添加编辑界面主要内容', 'portal_admin_article_edit_view_main', 'portal', '门户后台文章添加编辑界面主要内容');
INSERT INTO `cmf_hook` VALUES ('58', '2', '1', '门户后台文章添加界面', 'portal_admin_article_add_view', 'portal', '门户后台文章添加界面');
INSERT INTO `cmf_hook` VALUES ('59', '2', '1', '门户后台文章编辑界面', 'portal_admin_article_edit_view', 'portal', '门户后台文章编辑界面');
INSERT INTO `cmf_hook` VALUES ('60', '2', '1', '门户后台文章分类添加界面', 'portal_admin_category_add_view', 'portal', '门户后台文章分类添加界面');
INSERT INTO `cmf_hook` VALUES ('61', '2', '1', '门户后台文章分类编辑界面', 'portal_admin_category_edit_view', 'portal', '门户后台文章分类编辑界面');
INSERT INTO `cmf_hook` VALUES ('62', '2', '1', '门户后台页面添加界面', 'portal_admin_page_add_view', 'portal', '门户后台页面添加界面');
INSERT INTO `cmf_hook` VALUES ('63', '2', '1', '门户后台页面编辑界面', 'portal_admin_page_edit_view', 'portal', '门户后台页面编辑界面');
INSERT INTO `cmf_hook` VALUES ('64', '2', '1', '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO `cmf_hook` VALUES ('65', '2', '1', '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO `cmf_hook` VALUES ('66', '2', '1', '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO `cmf_hook` VALUES ('67', '2', '1', '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO `cmf_hook` VALUES ('68', '2', '1', '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO `cmf_hook` VALUES ('69', '2', '1', '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO `cmf_hook` VALUES ('70', '2', '1', '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO `cmf_hook` VALUES ('71', '2', '1', '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');

-- ----------------------------
-- Table structure for cmf_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cmf_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_link
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_link
-- ----------------------------
INSERT INTO `cmf_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `cmf_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for cmf_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of cmf_nav_menu
-- ----------------------------
INSERT INTO `cmf_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for cmf_option
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
INSERT INTO `cmf_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"Admin\",\"site_seo_title\":\"Admin\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}');
INSERT INTO `cmf_option` VALUES ('2', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `cmf_option` VALUES ('3', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `cmf_option` VALUES ('4', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}');

-- ----------------------------
-- Table structure for cmf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------
INSERT INTO `cmf_portal_category` VALUES ('1', '0', '0', '1', '0', '10000', '1', '', '0-1', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_portal_category` VALUES ('2', '1', '0', '1', '0', '10000', '2', '', '0-1-2', '', '', '', 'list', 'article', '{\"thumbnail\":\"portal\\/20190210\\/24f7894ce16fb39d5f4174dfb144ab28.png\"}');

-- ----------------------------
-- Table structure for cmf_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------
INSERT INTO `cmf_portal_category_post` VALUES ('1', '1', '1', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('2', '2', '1', '10000', '1');

-- ----------------------------
-- Table structure for cmf_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------
INSERT INTO `cmf_portal_post` VALUES ('1', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1551927309', '1551927309', '1551927293', '0', '围绕变为爱他', '热天威威', '而特殊人员', 'sertraline', '', '而是瑞特瑞特也爱&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;\n', null, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('2', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1551935832', '1551935832', '1551935821', '0', '为各位', '', '', '', '', null, null, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');

-- ----------------------------
-- Table structure for cmf_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of cmf_portal_tag
-- ----------------------------
INSERT INTO `cmf_portal_tag` VALUES ('1', '1', '0', '0', '热天威威');

-- ----------------------------
-- Table structure for cmf_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of cmf_portal_tag_post
-- ----------------------------
INSERT INTO `cmf_portal_tag_post` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for cmf_province
-- ----------------------------
DROP TABLE IF EXISTS `cmf_province`;
CREATE TABLE `cmf_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `province` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_province
-- ----------------------------
INSERT INTO `cmf_province` VALUES ('1', '110000', '北京市');
INSERT INTO `cmf_province` VALUES ('2', '120000', '天津市');
INSERT INTO `cmf_province` VALUES ('3', '130000', '河北省');
INSERT INTO `cmf_province` VALUES ('4', '140000', '山西省');
INSERT INTO `cmf_province` VALUES ('5', '150000', '内蒙古自治区');
INSERT INTO `cmf_province` VALUES ('6', '210000', '辽宁省');
INSERT INTO `cmf_province` VALUES ('7', '220000', '吉林省');
INSERT INTO `cmf_province` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `cmf_province` VALUES ('9', '310000', '上海市');
INSERT INTO `cmf_province` VALUES ('10', '320000', '江苏省');
INSERT INTO `cmf_province` VALUES ('11', '330000', '浙江省');
INSERT INTO `cmf_province` VALUES ('12', '340000', '安徽省');
INSERT INTO `cmf_province` VALUES ('13', '350000', '福建省');
INSERT INTO `cmf_province` VALUES ('14', '360000', '江西省');
INSERT INTO `cmf_province` VALUES ('15', '370000', '山东省');
INSERT INTO `cmf_province` VALUES ('16', '410000', '河南省');
INSERT INTO `cmf_province` VALUES ('17', '420000', '湖北省');
INSERT INTO `cmf_province` VALUES ('18', '430000', '湖南省');
INSERT INTO `cmf_province` VALUES ('19', '440000', '广东省');
INSERT INTO `cmf_province` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `cmf_province` VALUES ('21', '460000', '海南省');
INSERT INTO `cmf_province` VALUES ('22', '500000', '重庆市');
INSERT INTO `cmf_province` VALUES ('23', '510000', '四川省');
INSERT INTO `cmf_province` VALUES ('24', '520000', '贵州省');
INSERT INTO `cmf_province` VALUES ('25', '530000', '云南省');
INSERT INTO `cmf_province` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `cmf_province` VALUES ('27', '610000', '陕西省');
INSERT INTO `cmf_province` VALUES ('28', '620000', '甘肃省');
INSERT INTO `cmf_province` VALUES ('29', '630000', '青海省');
INSERT INTO `cmf_province` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `cmf_province` VALUES ('31', '650000', '新疆维吾尔自治区');
INSERT INTO `cmf_province` VALUES ('32', '710000', '台湾省');
INSERT INTO `cmf_province` VALUES ('33', '810000', '香港特别行政区');
INSERT INTO `cmf_province` VALUES ('34', '820000', '澳门特别行政区');

-- ----------------------------
-- Table structure for cmf_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of cmf_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cmf_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');
INSERT INTO `cmf_role` VALUES ('3', '0', '1', '0', '0', '0', '管理付款', '');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------
INSERT INTO `cmf_role_user` VALUES ('1', '2', '3');

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('1', '1', '0', '轮播1', '');
INSERT INTO `cmf_slide` VALUES ('2', '1', '0', '轮播2', '');

-- ----------------------------
-- Table structure for cmf_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cmf_slide_item
-- ----------------------------
INSERT INTO `cmf_slide_item` VALUES ('1', '1', '1', '10000', '又添新成员了', 'admin/20190304/0be06d024acdd8b0c0a46371850aaee8.png', '1', '', '', '', null);
INSERT INTO `cmf_slide_item` VALUES ('2', '1', '1', '10000', '应用场景', 'admin/20190304/2482ce982de4ba9adef4dbc6495e3911.png', '202', '', '', '', null);
INSERT INTO `cmf_slide_item` VALUES ('3', '2', '1', '10000', '关于我们', 'admin/20190304/0fb1098d050993b5724ad4842f409a8f.png', '203', '', '关于我们', '', null);
INSERT INTO `cmf_slide_item` VALUES ('4', '2', '1', '10000', '使用指导', 'admin/20190304/51528f371f3b615653f95e44f6faca26.png', '204', '', '', '', null);

-- ----------------------------
-- Table structure for cmf_theme
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
INSERT INTO `cmf_theme` VALUES ('1', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for cmf_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------
INSERT INTO `cmf_theme_file` VALUES ('1', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('2', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('3', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('4', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('5', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('6', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('7', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO `cmf_theme_file` VALUES ('8', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);

-- ----------------------------
-- Table structure for cmf_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_third_party_user
-- ----------------------------
INSERT INTO `cmf_third_party_user` VALUES ('1', '4', '1551498662', '0', '1550832867', '40', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '221.15.192.198', '', 'oI4dy1iyya2owuCmEh5zf61SHrBQ', 'obAAX1kAm3GfVAzj2OJb_-7XO2ds', '{\"openid\":\"oI4dy1iyya2owuCmEh5zf61SHrBQ\",\"nickname\":\"zz\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"\",\"privilege\":[],\"unionid\":\"obAAX1kAm3GfVAzj2OJb_-7XO2ds\"}');
INSERT INTO `cmf_third_party_user` VALUES ('2', '5', '1551582160', '0', '1550880055', '10', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '223.106.128.132', '', 'oI4dy1lxCSDUyh4GNHcG8mORZS3A', 'obAAX1sjmkDdc_y4TPI1bHxyp7v8', '{\"openid\":\"oI4dy1lxCSDUyh4GNHcG8mORZS3A\",\"nickname\":\"\\u4e00\\u5b9a\\u4f1a\\u6210\\u529f\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"\",\"privilege\":[],\"unionid\":\"obAAX1sjmkDdc_y4TPI1bHxyp7v8\"}');
INSERT INTO `cmf_third_party_user` VALUES ('3', '2', '1551708464', '0', '1550888565', '29', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '123.14.86.185', '', 'oI4dy1hmyZvAN8NjD7lE5TaHok8c', 'obAAX1gE0DT9oFrvRcJEPsaFwDXI', '{\"openid\":\"oI4dy1hmyZvAN8NjD7lE5TaHok8c\",\"nickname\":\"\\u5b50\\u6654\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\\u6cfd\\u897f\\u5c9b\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/DYAIOgq83eqdkfZqxYPYRHvjiaEJjRiamckzAFsEUNRc2U4Qq1YfP4aPKcTBGWVhiccF5DkBkGSXv4icOzlUKHkebQ\\/132\",\"privilege\":[],\"unionid\":\"obAAX1gE0DT9oFrvRcJEPsaFwDXI\"}');
INSERT INTO `cmf_third_party_user` VALUES ('4', '15', '1551101804', '0', '1550986130', '4', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '49.92.91.105', '', 'oI4dy1vJM36j-g8DOga4GzDgymio', 'obAAX1gWyXWWE6PP4LTW1Cak7MFQ', '{\"openid\":\"oI4dy1vJM36j-g8DOga4GzDgymio\",\"nickname\":\"\\u552f\\u5229\\u662f\\u56fe\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u514b\\u62c9\\u739b\\u4f9d\",\"province\":\"\\u65b0\\u7586\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTK71NIq9ia1Xrricp37Arqw8Xwp6W0mJLf6njRXxOlex35aOBstyMm8dIC7btQjRp4f2Y4tYDca1oEQ\\/132\",\"privilege\":[],\"unionid\":\"obAAX1gWyXWWE6PP4LTW1Cak7MFQ\"}');
INSERT INTO `cmf_third_party_user` VALUES ('5', '0', '1551520728', '0', '1551006337', '4', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '222.184.191.228', '', 'oI4dy1n0WRF2JRUzHrrnmN4W6GTQ', 'obAAX1rzV4OCV6Ywq3QCVjfpmeSc', '{\"openid\":\"oI4dy1n0WRF2JRUzHrrnmN4W6GTQ\",\"nickname\":\"Frank\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u5357\\u901a\",\"province\":\"\\u6c5f\\u82cf\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTK4EO6RJxZgZZqpdPXox7c3X9j4G0PUibXCKBqPuTQKpOSfic4yOOAnZpRv99XnyKoV14lHqXakGVQg\\/132\",\"privilege\":[],\"unionid\":\"obAAX1rzV4OCV6Ywq3QCVjfpmeSc\"}');
INSERT INTO `cmf_third_party_user` VALUES ('6', '0', '1551598073', '0', '1551069587', '17', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '39.149.3.253', '', 'oI4dy1t-S36DFhTnKBj5jdjKoJZs', 'obAAX1pv1eNpi9jSJ3W9mfawQGm4', '{\"openid\":\"oI4dy1t-S36DFhTnKBj5jdjKoJZs\",\"nickname\":\"\\u9759\\u601d\\u96e8\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u90d1\\u5dde\",\"province\":\"\\u6cb3\\u5357\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTLBZaPaZM5zxKUmFrJPS3WicVEb6Qics6qhN6prMJhXAmGdWLCg3piajuaIIbdzUribCBvaooorLjWhHg\\/132\",\"privilege\":[],\"unionid\":\"obAAX1pv1eNpi9jSJ3W9mfawQGm4\"}');
INSERT INTO `cmf_third_party_user` VALUES ('7', '0', '1551087186', '0', '1551087186', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '175.188.159.122', '', 'oI4dy1mNYNqgvP27keNjRUAdNPf0', 'obAAX1tOWm5KzZrJoc3WvX0HUe4o', '{\"openid\":\"oI4dy1mNYNqgvP27keNjRUAdNPf0\",\"nickname\":\"\\u548c\\u8c10\\u53f7\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/X2tHBOWMmOSfFwcI8ADL156YZMt8ib4O0rDCddVcfZsh3ZKOib0S8hFv0tk5qbf9ibWuQOaicQVKGMeUSxcxYKBEibw\\/132\",\"privilege\":[],\"unionid\":\"obAAX1tOWm5KzZrJoc3WvX0HUe4o\"}');
INSERT INTO `cmf_third_party_user` VALUES ('8', '0', '1551669803', '0', '1551087511', '2', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '218.28.21.226', '', 'oI4dy1iPYBSEf3_jeFdoFAQYcIzs', 'obAAX1rYlcL-jvzQP2y85KQr29rI', '{\"openid\":\"oI4dy1iPYBSEf3_jeFdoFAQYcIzs\",\"nickname\":\"Foobar\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\\u6cfd\\u897f\\u5c9b\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTInlOF1J21KB3n2v7a7NsiaxRqPZQMTicYRHP6rdOOUD5SBLJFQWHAosfOaTbr5Q9HIvtH6rTlkMX1Q\\/132\",\"privilege\":[],\"unionid\":\"obAAX1rYlcL-jvzQP2y85KQr29rI\"}');
INSERT INTO `cmf_third_party_user` VALUES ('10', '0', '1551351502', '0', '1551351502', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '221.15.196.153', '', 'oI4dy1jA3rCemDwBW2utIM5c4feo', 'obAAX1uECfuGPW4ekjflTwwn6A78', '{\"openid\":\"oI4dy1jA3rCemDwBW2utIM5c4feo\",\"nickname\":\"\\u7a81\\u5982\\u5176\\u6765\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/aYWVYGuFt8WaIryrzfTdR1y5A6tFFZnribibfuTpiaN2dT1QT9eradWqNM1niafIMbX92y5fTW8C5uBjPpf59X7TYQ\\/132\",\"privilege\":[],\"unionid\":\"obAAX1uECfuGPW4ekjflTwwn6A78\"}');
INSERT INTO `cmf_third_party_user` VALUES ('11', '0', '1551396728', '0', '1551396728', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '106.34.141.114', '', 'oI4dy1gIFFRHuogIcbGD8trDBZHc', 'obAAX1qXOjKf4Iwh6j8t3awaUYW4', '{\"openid\":\"oI4dy1gIFFRHuogIcbGD8trDBZHc\",\"nickname\":\"\\u667a\\u80fd\\u624b\\u673aapp\\u5f00\\u53d1\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u90d1\\u5dde\",\"province\":\"\\u6cb3\\u5357\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/PiajxSqBRaEKrw7FkB02bXIDjM2icoOsVHVpEhluQia5JHdYcJnS5BZLJyrx76eicNHWIe2rwqj1TdYRY0I8W888bA\\/132\",\"privilege\":[],\"unionid\":\"obAAX1qXOjKf4Iwh6j8t3awaUYW4\"}');
INSERT INTO `cmf_third_party_user` VALUES ('12', '0', '1551524733', '0', '1551524733', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '117.136.46.87', '', 'oI4dy1rbljnB48KOGjhSMQwDk-JI', 'obAAX1he3qIissTrgi6DsZLs-oqY', '{\"openid\":\"oI4dy1rbljnB48KOGjhSMQwDk-JI\",\"nickname\":\"David\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u5357\\u901a\",\"province\":\"\\u6c5f\\u82cf\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/DYAIOgq83erTxyBgqxZZ5hzCdseib3vtr10bcfyLqltRia2Vic4rpXmibcFvkoicnXFRqSASYW5ZlA6LvJUFMVujcZA\\/132\",\"privilege\":[],\"unionid\":\"obAAX1he3qIissTrgi6DsZLs-oqY\"}');
INSERT INTO `cmf_third_party_user` VALUES ('13', '33', '1551577436', '0', '1551577181', '3', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '49.79.168.154', '', 'oI4dy1hHf85Kk68sE1FBiF11t1IQ', 'obAAX1kEh3qYZQTc9nZBHMHIQzHo', '{\"openid\":\"oI4dy1hHf85Kk68sE1FBiF11t1IQ\",\"nickname\":\"\\u9648\\u9e4f\",\"sex\":1,\"language\":\"zh_CN\",\"city\":\"\\u5357\\u901a\",\"province\":\"\\u6c5f\\u82cf\",\"country\":\"\\u4e2d\\u56fd\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTLibujnsgZvU7Q1LDNSX3dBo3T9bxbfH9fqP7OQfsY0Nzhd1ibnkl6uahG43hoDtkHNbLwqrwqr0cXA\\/132\",\"privilege\":[],\"unionid\":\"obAAX1kEh3qYZQTc9nZBHMHIQzHo\"}');
INSERT INTO `cmf_third_party_user` VALUES ('14', '0', '1551582251', '0', '1551582251', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '223.106.128.132', '', 'oI4dy1pFP3yk8NMVmbgtYfpO954k', 'obAAX1pOW5dVZrbsFzBYvyeuxCM0', '{\"openid\":\"oI4dy1pFP3yk8NMVmbgtYfpO954k\",\"nickname\":\"insistcn -Fog\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"\",\"privilege\":[],\"unionid\":\"obAAX1pOW5dVZrbsFzBYvyeuxCM0\"}');
INSERT INTO `cmf_third_party_user` VALUES ('15', '0', '1551693387', '0', '1551693387', '1', '1', '', 'wxapp', 'wxc0b70061a6718ec6', '182.200.23.143', '', 'oI4dy1lAfzZpjJ3F3Dn52sgQWH_Y', 'obAAX1ovlIKAGKY9ZYcPhueIV7Sk', '{\"openid\":\"oI4dy1lAfzZpjJ3F3Dn52sgQWH_Y\",\"nickname\":\"\\u68a6\\u60f3\\u4fa0\",\"sex\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"headimgurl\":\"http:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/f25He2nUol0VlxUGz6BUPhDXE8ZnFk67W5ZnyWib6f3n4Bq0rqy4fkZu4icAvwkXR5UGHs3JGAKrhOfx7icbnqg1g\\/132\",\"privilege\":[],\"unionid\":\"obAAX1ovlIKAGKY9ZYcPhueIV7Sk\"}');

-- ----------------------------
-- Table structure for cmf_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `token` varchar(64) DEFAULT NULL COMMENT 'api-token',
  `invite_code` varchar(6) DEFAULT NULL COMMENT '邀请码',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `longitude` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '经度',
  `latitude` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '纬度',
  `province` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `dept1` varchar(255) NOT NULL DEFAULT '' COMMENT '科室领域一级',
  `dept2` varchar(255) NOT NULL DEFAULT '' COMMENT '科室领域二级',
  `organization` varchar(100) NOT NULL DEFAULT '' COMMENT '工作单位',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '职称',
  `star` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '星级评分',
  `max` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大价格',
  `min` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最小价格',
  `good_at` varchar(100) NOT NULL DEFAULT '' COMMENT '擅长',
  `auth_identity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '身份认证',
  `auth_title` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '职称认证',
  `auth_work` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工作认证',
  `auth_other1` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '其他认证1',
  `auth_other2` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '其他认证2',
  `idcard` varchar(18) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '身份证号',
  `idcard_pic1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '身份证正面',
  `idcard_pic2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '身份证反面',
  `work_year` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '工作年限',
  `title_pic1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '职称照片1',
  `title_pic2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '职称照片2',
  `other1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明1',
  `other1_pic1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明1图片',
  `other1_pic2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明1图片',
  `other2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明2',
  `other2_pic1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明2图片',
  `other2_pic2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '其他证明2图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
INSERT INTO `cmf_user` VALUES ('1', '1', '0', '0', '1552092587', '1', '1', '0.00', '1549089382', '1', 'admin', '###122f64241af8f3844a8a92bd3ece606c', 'admin', 'admin@admin.com', '', '', '', '127.0.0.1', '', '', null, null, 'asdasd', '0', '0.000000', '0.000000', '0', '0', '0', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('2', '2', '1', '0', '1551708464', '0', '0', '0.00', '1549599673', '1', '5wQ2O8', '###140a886dc18f0ee88648095c1e85612d', '你好', '', '', '', 'ABC', '', '', '18637169332', null, '951f1df0509888ec522e39afc95913704f5c413c2b68422cf757d44a514712cd', 'asdA1', '0', '113.725690', '34.776156', '410000', '410100', '7', '', '1', '3', '3.00', '2.00', '2.00', '呵呵', '1', '2', '2', '2', '2', '222222', '/upload/gxzh/20190222/42f9a4a6b0bc20f73614e3931e706943.jpg', '/upload/gxzh/20190222/9d3910aee9222fcf6db8714a0777fc5e.jpg', '10', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('3', '1', '0', '0', '1551776250', '0', '0', '0.00', '0', '1', 'gxzh', '###608d027970e76ad12061af3e1b38c4ff', '', 'gxzh@admin.com', '', '', '', '125.41.131.126', '', '', null, null, null, '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('4', '2', '2', '0', '1551834769', '0', '0', '0.00', '1549952546', '1', '哈喽有', '###ccda535e704a3d41ae10bbaa8786718f', '李惨森', '', '', '/upload/gxzh/20190219/9c3bd0f575b7077df20dca561e29caf8.jpg', '从业18年，业内专家', '', '', '15138916255', null, 'a9750a9037b41ceaf9657595be7be8065b94243e76b911a5c496f383e00f2bc1', '5wQ24', '0', '113.725755', '34.776203', '410000', '410100', '2', ',13,14,15', '郑大一附院', '4', '4.00', '88.00', '36.00', '京津冀,djkasjdf k', '2', '1', '1', '1', '1', '411421198803122536', '/upload/gxzh/20190302/057d631555db95c0a64ce1f24c0d3f9a.jpg', '/upload/gxzh/20190217/e41ce4157556f259643b79c7e74e6eb2.jpg', '1', '/upload/gxzh/20190222/ca8d9447f70812ee080163d658978a47.jpg', '/upload/gxzh/20190222/8b7ff286f7fdb2693990c0367332c26d.jpg', '投资', '/upload/gxzh/20190222/d38f7476c2c6cc068c5f05f3e4d7b93e.jpg', '/upload/gxzh/20190222/db09d5d6bf0593b21c7ec8eebbaab633.jpg', 'low', '/upload/gxzh/20190222/b52ebc494160a8f185dafe9a69142155.jpg', '/upload/gxzh/20190222/0b286d1a3607569406b0c8497a7aae5e.jpg');
INSERT INTO `cmf_user` VALUES ('5', '2', '1', '0', '1551753179', '0', '0', '0.00', '1550058489', '1', '4e9HSu', '###140a886dc18f0ee88648095c1e85612d', 'Fog', '', '', '/upload/gxzh/20190218/894b788ad5c89bd20b513acd355693d5.jpg', '你嘻嘻嘻只有一张嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻有史以来陪', '', '', '15151328536', null, '4b4c08b95af2f52b778bc1fb225d9f63dec824a198ec8209824a095cae2c5784', '4e9HSu', '4', '121.221780', '32.323609', '310000', '310100', '7', '', '上海明敏明敏有限公司', '1', '5.00', '100.00', '10.00', '工程管理,机械安装维修', '1', '1', '2', '2', '2', '320536195313281983', '/upload/gxzh/20190222/ceeb74f55df101cb8fb4734ba4677496.jpg', '/upload/gxzh/20190222/b35ff381290c170a0fe55ac5368b0a9a.jpg', '10', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('6', '2', '1', '0', '0', '0', '0', '0.00', '1550308070', '1', 'n4SNOj', '###122f64241af8f3844a8a92bd3ece606c', '李浩', '', '', '/upload/gxzh/20190216/32c7a36d87d574146989508979dde110.jpg', '', '', '', '13271571224', null, '744746c2476ba91d747f4ccc88c58242de0507ba36151a55c9c36e8315a55fcb', 'n4SNOj', '0', '113.725668', '34.776147', '150000', '150100', '7', '9,26', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('7', '2', '1', '0', '1551586468', '0', '0', '0.00', '1550405220', '1', 'XRoFV3', '###ce5ee015d378e8cbc2cd784d6af2e42c', '宇爷爷', '', '', '/upload/gxzh/20190219/2c70c6af226a4c838f714a99fa158ae4.jpg', '\n', '', '', '17157424979', null, 'e43e9840e90917b4fa9b313095212ab0b125683762e67fc9ac398cfca54d5917', 'XRoFV3', '0', '121.048131', '32.384355', '320000', '320600', '7', '', '', '0', '4.75', '0.10', '0.10', '', '0', '1', '2', '2', '2', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('9', '2', '1', '0', '1551789912', '0', '0', '0.00', '1549952546', '1', '5wQ2O8', '###122f64241af8f3844a8a92bd3ece606c', '张华', '', '', '/upload/gxzh/20190219/7bb19c2b601b41c77f04b832217873e7.jpg', '从业18年，业内专家', '', '', '15138916258', null, 'a816f32fc51fca1a8976b19824a4d561aa69e4a1040ccc96d5f1fff915a20f54', '5wQ23', '0', '113.725735', '34.776202', '410000', '410100', '7', '', '郑大一附院', '4', '0.00', '88.00', '88.00', '你啊,京津冀', '0', '1', '2', '0', '2', '411421198803122536', '/upload/gxzh/20190217/dbaaa2bfb20286c213439eca19b439f2.jpg', '/upload/gxzh/20190217/e41ce4157556f259643b79c7e74e6eb2.jpg', '1', '/upload/gxzh/20190219/821978f03ffa3dcd4c687d605eb981da.jpg', '/upload/gxzh/20190219/471c3d06629c04952fcb0bef3a278028.jpg', '证明1', '/upload/gxzh/20190219/6ea3fa0ce3352464677ff3f7dc43f84f.jpg', '/upload/gxzh/20190219/116c632e159598e1ace19fa63a618ce7.jpg', '传说', '/upload/gxzh/20190219/0c79fd9654edc90c15b4e32f39fc3ac0.jpg', '/upload/gxzh/20190219/bfe6267eadc13223dcdfb3bb4dca4937.jpg');
INSERT INTO `cmf_user` VALUES ('10', '2', '0', '0', '0', '0', '0', '0.00', '1550627132', '1', 'hiAl4R', '###52201cd55a9f8898b1dfd09550586e16', 'dgdfgdfg', '', '', '', '', '', '', '13231389002', null, '265e90f5a37a59c383587ee72bb49e70151e44741c0579bb2b7e6ca15ef51a6d', 'hiAl4R', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('11', '2', '0', '0', '0', '0', '0', '0.00', '1550627194', '1', 'ucntMx', '###52201cd55a9f8898b1dfd09550586e16', 'htrth', '', '', '', '', '', '', '18801462840', null, '334397259725c45e684d3186bfdb46d46c2aa9e252458c964be9189849fe4505', 'ucntMx', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('12', '2', '0', '0', '0', '0', '0', '0.00', '1550714284', '1', '5MSsXj', '###0de5db15deafeca8424ba8392a440fab', 'hjkhj', '', '', '', '', '', '', '15106289508', null, '683b9130a8792fb5f9a8c4f3a8fe60c87c3dad1882b9cb1ac0eab156ada09d3b', '5MSsXj', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('13', '2', '0', '0', '0', '0', '0', '0.00', '1550836611', '1', 'JMDN1i', '###d596d54e0280108d401755c9ccae8d87', 'asf', '', '', '', 'www', '', '', '13453856838', null, '511e9d6cfd98aeff01ffb3818bb2f1a960639eb7e6e9e98e8f90ff1a29580f12', 'JMDN1i', '0', '0.000000', '0.000000', '410000', '410100', '23', '', '', '0', '4.00', '0.01', '0.01', ',dd', '0', '2', '2', '2', '2', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('14', '2', '2', '0', '1551527288', '0', '0', '0.00', '1550960878', '1', 'pB0Nfn', '###ce5ee015d378e8cbc2cd784d6af2e42c', 'www', '', '', '', '轰轰轰\n', '', '', '18451035553', null, '5305ffdbbba22e428277203deef464dcc504cbaf53889c271efc05029ee5300f', 'pB0Nfn', '0', '121.047989', '32.384240', '0', '0', '7', '', '', '4', '5.00', '0.10', '0.10', '', '0', '2', '2', '2', '2', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('15', '2', '0', '0', '0', '0', '0', '0.00', '1550986162', '1', 'jXRbiF', '###122f64241af8f3844a8a92bd3ece606c', 'jXRbiF', '', '', '', '', '', '', '17778735701', null, '7424b4750b72f92d1f21887a9744007505ecc49b96bbb1e2e940bb29374491c4', 'jXRbiF', '0', '121.065338', '32.388106', '0', '0', '7', ',8,26,9,27,8,26,9,27', '', '0', '0.00', '1000.00', '1.00', ',最接近神的人，宇宙万物，无所不知', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('16', '2', '0', '0', '0', '0', '0', '0.00', '1551060778', '1', 'Om10Vc', '###7d2aebdc11723ce8158e277cfe3ec1f3', 'Om10Vc', '', '', '', '', '', '', '13106404052', null, '639c3f08c13922e588f4083f63430be614b3fd67d9276b7bb3a041884548b598', 'Om10Vc', '0', '113.725741', '34.776173', '0', '0', '3', '32', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('17', '2', '0', '0', '1551700665', '0', '0', '0.00', '1551080515', '1', '2IbymF', '###140a886dc18f0ee88648095c1e85612d', '老李', '', '', '', '', '', '', '15722512212', null, '0900048ff961300cf833d939468b5681e9b3908834d44b015890b9fe9fce4ba6', '2IbymF', '0', '121.170989', '32.334104', '0', '0', '7', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('18', '2', '0', '0', '0', '0', '0', '0.00', '1551082374', '1', 'l4zkva', '###122f64241af8f3844a8a92bd3ece606c', 'l4zkva', '', '', '', '', '', '', '13271571225', null, '9d8321e5341327f62b867f9ed220761f02524a7c1293251f7d945d917381bde2', 'l4zkva', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('19', '2', '0', '0', '0', '0', '0', '0.00', '1551082556', '1', 'pCdmko', '###122f64241af8f3844a8a92bd3ece606c', 'pCdmko', '', '', '', '', '', '', '13271571226', null, '893a4a2f1453f2a70d63da2d67207c3787519b3fae5fe1e15442771d68dffc2a', 'pCdmko', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('20', '2', '1', '0', '1551834831', '0', '0', '0.00', '1551082795', '1', 'MBYnSq', '###122f64241af8f3844a8a92bd3ece606c', '小程序', '', '', '', '', '', '', '13071571223', null, '36d891fd59a2860b873c0354b4b5efe53cf066914f8cb86e3ca8c34f3a72292f', 'MBYnSq', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('21', '2', '0', '0', '0', '0', '0', '0.00', '1551087222', '1', 'dQ1TJO', '###122f64241af8f3844a8a92bd3ece606c', 'dQ1TJO', '', '', '', '', '', '', '13526443969', null, 'e6567389c73015901f8c1b375f784238baee48521da16984883dad88d30c4684', 'dQ1TJO', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('22', '2', '1', '0', '1551830141', '0', '0', '0.00', '1551139320', '1', '3EGAt6', '###140a886dc18f0ee88648095c1e85612d', '小顾', '', '', '', '', '', '', '18862951397', null, '737d112578b9ef3316f27aadb69636962ed3d3afe887918af8be57c8bc7bad96', '3EGAt6', '0', '121.169756', '32.332615', '0', '0', '7', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('23', '2', '0', '0', '1551413602', '0', '0', '0.00', '1551248416', '1', 'XxozdR', '###140a886dc18f0ee88648095c1e85612d', 'XxozdR', '', '', '', 'uuuu', '', '', '18637169333', null, 'd3482f2c7441cd7a06f82a540184519f87dc43140cbc4f014df360efba67f114', 'XxozdR', '2', '113.725728', '34.776200', '410000', '410100', '7', '', '', '0', '3.00', '0.01', '0.01', '22', '0', '2', '2', '2', '2', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('24', '2', '0', '0', '0', '0', '0', '0.00', '1551262684', '1', '19ysfW', '###140a886dc18f0ee88648095c1e85612d', '19ysfW', '', '', '', '', '', '', '13862796768', null, '586793817736413477d18267317ee2df6e2a0b01bb832d8a3fa4e41ae1b82b30', '19ysfW', '0', '0.000000', '0.000000', '0', '0', '7', '', '', '0', '3.50', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('25', '2', '0', '0', '0', '0', '0', '0.00', '1551327591', '1', 'y7Trhi', '###122f64241af8f3844a8a92bd3ece606c', 'y7Trhi', '', '', '', '', '', '', '15138916255', null, '4c939f8114006fde1eb8145b2fe74c55e39f22b852e06baa7546d49ccedbf81b', 'y7Trhi', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('26', '2', '0', '0', '0', '0', '0', '0.00', '1551332751', '1', 'BUjDot', '###122f64241af8f3844a8a92bd3ece606c', 'BUjDot', '', '', '', '', '', '', '15138916259', null, '658b6dce7300b2f91e14e5b11d7bdfbec2ce77b0d824a4e1847eb6264e708730', 'BUjDot', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('27', '2', '0', '0', '0', '0', '0', '0.00', '1551396720', '1', 'hUoFKI', '###d314ebcc9de963b6fa27332f7413915e', 'hUoFKI', '', '', '', '', '', '', '17788132083', null, '69d9ef25c35d297d28ba200aee9ab5eef7b06f7ff1ecebae318d9984e105dc7a', 'hjgh', '0', '113.725744', '34.776174', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('28', '2', '0', '0', '0', '0', '0', '0.00', '1551400254', '1', 'PJXlwK', '###122f64241af8f3844a8a92bd3ece606c', 'PJXlwK', '', '', '', '', '', '', '15722512885', null, 'b41d8339915088b037ee85fe3a6bb0d95b2abf39a27607b22f017943d3deadb1', 'dfhdhf', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('29', '2', '0', '0', '0', '0', '0', '0.00', '1551520758', '1', 'gejc91', '###122f64241af8f3844a8a92bd3ece606c', 'gejc91', '', '', '', '', '', '', '18936206159', null, '7daf15675f003ca58c423174840e4559d1744cd1083cb2877e65bae89e6b0729', 'gejc91', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('30', '2', '0', '0', '0', '0', '0', '0.00', '1551522798', '1', 'x61r4t', '###122f64241af8f3844a8a92bd3ece606c', 'x61r4t', '', '', '', '', '', '', '18751365253', null, '12246ecdbab2ae4c5ad170e873e28a0591ba91c5e879f1e49289cb850d29bcef', 'x61r4t', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('31', '2', '1', '0', '0', '0', '0', '0.00', '1551524829', '1', '8do9bp', '###f11e76a13198d24c64ffb56c2b2a7b89', '8do9bp', '', '', '', '', '', '', '15996641011', null, '442f5d8d93dae3508f322740e4080c22b55e5f498b21ada93124e8cc7ca355cd', '8do9bp', '0', '0.000000', '0.000000', '0', '0', '7', '', '', '0', '5.00', '0.00', '0.00', '售后服务', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('32', '2', '0', '0', '0', '0', '0', '0.00', '1551534246', '1', 'zlwpy4', '###32d3a929dc8a284f8537fa4a787d6376', 'zlwpy4', '', '', '', '', '', '', '13511599952', null, '93106d840af1739e537b27708b69921f69098393f545cb3faadb827bb1fb3149', 'zlwpy4', '31', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('33', '2', '0', '0', '1551577500', '0', '0', '0.00', '1551577217', '1', 'vqkx1z', '###f6fc0b795bee8b22f5e59f37db727eeb', 'vqkx1z', '', '', '', '', '', '', '15950249876', null, '7df2136420d457cf63dd9d330ca0594b85139d722f86756f55079dd82b188939', 'vqkx1z', '0', '0.000000', '0.000000', '0', '0', '7', ',37,41,40,35,47,36,38,39,46,45,42,8,26,9,27', '', '0', '0.00', '1.00', '1.00', '生活服务,吃喝玩乐', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('34', '2', '0', '0', '1551694341', '0', '0', '0.00', '1551694323', '1', 'judrq3', '###b83dd64c81cdf86598b718d181517b49', 'judrq3', '', '', '', '', '', '', '13322479315', null, '6065735dbd4e39d419550687b69bf8bd46d5a4e361ced0278daa0e92ceb764b2', 'judrq3', '5', '0.000000', '0.000000', '0', '0', '23', ',53,54,50,49,48', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES ('35', '2', '0', '0', '0', '0', '0', '0.00', '1552098785', '1', 'utnl38', '###122f64241af8f3844a8a92bd3ece606c', 'utnl38', '', '', '', '', '', '', '18803836298', null, 'fcb3441709a232167e3c97d2384305b27236d90964e3f108c71864106ce8bfb2', 'utnl38', '0', '0.000000', '0.000000', '0', '0', '', '', '', '0', '0.00', '0.00', '0.00', '', '0', '0', '0', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for cmf_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of cmf_user_action
-- ----------------------------
INSERT INTO `cmf_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for cmf_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_balance_log`;
CREATE TABLE `cmf_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of cmf_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorite`;
CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_like
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_like`;
CREATE TABLE `cmf_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';

-- ----------------------------
-- Records of cmf_user_like
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of cmf_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of cmf_user_score_log
-- ----------------------------
INSERT INTO `cmf_user_score_log` VALUES ('1', '1', '1549786122', 'login', '1', '1');

-- ----------------------------
-- Table structure for cmf_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------
INSERT INTO `cmf_user_token` VALUES ('1', '1', '1564641412', '1549089412', '757e74ed05286357e4b084cf23c6a27c12fc55ececb3c9731da8bea72c491652', 'web');
INSERT INTO `cmf_user_token` VALUES ('2', '3', '1565426657', '1549874657', '2b07288d31c34608937c2431bd18f2122135a8b7efc52ccd8c7006a94824c3ae', 'web');

-- ----------------------------
-- Table structure for cmf_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cmf_verification_code
-- ----------------------------
INSERT INTO `cmf_verification_code` VALUES ('1', '1', '1550888947', '1550890747', '3598', '18637169332');
INSERT INTO `cmf_verification_code` VALUES ('2', '1', '1549604449', '1549606249', '2330', '15838209657');
INSERT INTO `cmf_verification_code` VALUES ('3', '1', '1551773007', '1551774807', '1494', '15138916256');
INSERT INTO `cmf_verification_code` VALUES ('4', '2', '1550030763', '1550032563', '7495', '15138946256');
INSERT INTO `cmf_verification_code` VALUES ('5', '1', '1551409233', '1551411033', '9059', '15151328536');
INSERT INTO `cmf_verification_code` VALUES ('6', '1', '1551690866', '1551692666', '6094', '13271571223');
INSERT INTO `cmf_verification_code` VALUES ('7', '1', '1550405192', '1550406992', '7082', '17157424979');
INSERT INTO `cmf_verification_code` VALUES ('8', '1', '1550626948', '1550628748', '2889', '13231389002');
INSERT INTO `cmf_verification_code` VALUES ('9', '1', '1550627153', '1550628953', '4047', '18801462840');
INSERT INTO `cmf_verification_code` VALUES ('10', '1', '1550714266', '1550716066', '4884', '15106289508');
INSERT INTO `cmf_verification_code` VALUES ('11', '1', '1550836583', '1550838383', '2004', '13453856838');
INSERT INTO `cmf_verification_code` VALUES ('12', '1', '1550960857', '1550962657', '6073', '18451035553');
INSERT INTO `cmf_verification_code` VALUES ('13', '1', '1551102215', '1551104015', '1514', '17778735701');
INSERT INTO `cmf_verification_code` VALUES ('14', '3', '1551063355', '1551065155', '8989', '13106404052');
INSERT INTO `cmf_verification_code` VALUES ('15', '1', '1551080480', '1551082280', '6107', '15722512212');
INSERT INTO `cmf_verification_code` VALUES ('16', '1', '1551087191', '1551088991', '4405', '13526443969');
INSERT INTO `cmf_verification_code` VALUES ('17', '1', '1551139303', '1551141103', '9005', '18862951397');
INSERT INTO `cmf_verification_code` VALUES ('18', '1', '1551248350', '1551250150', '5345', '18637169333');
INSERT INTO `cmf_verification_code` VALUES ('19', '1', '1551262655', '1551264455', '6501', '13862796768');
INSERT INTO `cmf_verification_code` VALUES ('20', '1', '1551323556', '1551325356', '8244', '15138913256');
INSERT INTO `cmf_verification_code` VALUES ('21', '2', '1551327521', '1551329321', '6789', '15138916255');
INSERT INTO `cmf_verification_code` VALUES ('22', '2', '1551333973', '1551335773', '6021', '15138916259');
INSERT INTO `cmf_verification_code` VALUES ('23', '1', '1551396692', '1551398492', '2736', '17788132083');
INSERT INTO `cmf_verification_code` VALUES ('24', '1', '1551396740', '1551398540', '8542', '17788132208');
INSERT INTO `cmf_verification_code` VALUES ('25', '1', '1551400207', '1551402007', '3575', '15722512885');
INSERT INTO `cmf_verification_code` VALUES ('26', '1', '1551520738', '1551522538', '4049', '18936206159');
INSERT INTO `cmf_verification_code` VALUES ('27', '2', '1551522700', '1551524500', '3162', '18751365253');
INSERT INTO `cmf_verification_code` VALUES ('28', '1', '1551524741', '1551526541', '2689', '15996641011');
INSERT INTO `cmf_verification_code` VALUES ('29', '1', '1551534221', '1551536021', '5036', '13511599952');
INSERT INTO `cmf_verification_code` VALUES ('30', '2', '1551577411', '1551579211', '2157', '15950249876');
INSERT INTO `cmf_verification_code` VALUES ('31', '4', '1551694274', '1551696074', '7048', '13322479315');
INSERT INTO `cmf_verification_code` VALUES ('32', '3', '1552103235', '1552105035', '5330', '18803836298');

-- ----------------------------
-- Table structure for cmf_ylt_appointment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ylt_appointment`;
CREATE TABLE `cmf_ylt_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '礼堂名称',
  `hold_user` varchar(255) DEFAULT NULL COMMENT '举办人',
  `link_man` varchar(255) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `status` varchar(255) DEFAULT NULL COMMENT '申请状态',
  `apply_reason` varchar(255) DEFAULT NULL COMMENT '申请理由',
  `refuse_reason` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_ylt_appointment
-- ----------------------------
INSERT INTO `cmf_ylt_appointment` VALUES ('1', '测试礼堂', '李奥强', '李大强', '18803836298', '0', '像举办一个演唱会', '诗歌史上', '2019-03-27 16:12:36', '2019-03-29 16:12:39', null, '1552037417');
INSERT INTO `cmf_ylt_appointment` VALUES ('3', '驱蚊器', '请问', '请问', '1803836298', '0', '我去恶趣味', '', null, null, '1552037176', '1552037384');
INSERT INTO `cmf_ylt_appointment` VALUES ('2', '驱蚊器', '请问', '请问', '1803836298', '0', '我去恶趣味', '', null, null, '1552037176', '1552037384');
INSERT INTO `cmf_ylt_appointment` VALUES ('4', '驱蚊器', '请问', '请问', '1803836298', '0', '我去恶趣味', '', null, null, '1552037176', '1552037384');
INSERT INTO `cmf_ylt_appointment` VALUES ('5', '驱蚊器', '请问', '请问', '1803836298', '0', '我去恶趣味', '', null, null, '1552037176', '1552037384');
INSERT INTO `cmf_ylt_appointment` VALUES ('6', '驱蚊器', '请问', '请问', '1803836298', '0', '我去恶趣味', '', null, null, '1552037176', '1552037384');

-- ----------------------------
-- Table structure for cmf_ylt_article
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ylt_article`;
CREATE TABLE `cmf_ylt_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `comment_id` int(11) DEFAULT NULL,
  `support_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hall_type` varchar(255) DEFAULT NULL,
  `information_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_ylt_article
-- ----------------------------
INSERT INTO `cmf_ylt_article` VALUES ('2', '1', null, null, '礼堂', '路北街道', null, 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', 'admin/20190308/1565d7d45748ecdfd433ef47a5d93d3f.png', '', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？&lt;audio controls=&quot;controls&quot; style=&quot;display: none;&quot;&gt;&lt;/audio&gt;', '1552010858', '1552010858');
INSERT INTO `cmf_ylt_article` VALUES ('3', '1', null, null, '资讯', null, '娱乐', 'thinkcmf5导航模板里边，$level和$menu是从哪里传过来的？', '色人格人格虽然', 'admin/20190308/1565d7d45748ecdfd433ef47a5d93d3f.png', null, '色人格人格虽然色人格人格虽然色人格人格虽然色人格人格虽然色人格人格虽然色人格人格虽然<audio controls=\"controls\" style=\"display: none;\"></audio>', '1552011712', '1552011712');
INSERT INTO `cmf_ylt_article` VALUES ('4', '1', null, null, '机构团体', null, null, '分为氛围发给我', 'groupgroup', 'admin/20190308/1a7273c515181c47f4260e3cc7ecc350.png', null, '<p>分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我分为氛围发给我</p>', '1552014254', '1552014254');

-- ----------------------------
-- Table structure for cmf_ylt_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ylt_comment`;
CREATE TABLE `cmf_ylt_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) DEFAULT NULL COMMENT '礼堂id',
  `user_id` int(11) DEFAULT NULL COMMENT '发表评论的人id',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_ylt_comment
-- ----------------------------
INSERT INTO `cmf_ylt_comment` VALUES ('1', '9', '2', '测试回复', null, null);

-- ----------------------------
-- Table structure for cmf_ylt_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ylt_third_party_user`;
CREATE TABLE `cmf_ylt_third_party_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `expire_time` int(10) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `access_token` varchar(512) DEFAULT NULL,
  `openid` varchar(40) DEFAULT NULL,
  `union_id` varchar(64) DEFAULT NULL,
  `more` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_ylt_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_ylt_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ylt_user`;
CREATE TABLE `cmf_ylt_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT '' COMMENT '昵称',
  `account` varchar(255) DEFAULT '' COMMENT '账号',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_ylt_user
-- ----------------------------
