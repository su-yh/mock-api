/*
 Navicat Premium Dump SQL

 Source Server         : cds-mysql-b
 Source Server Type    : MySQL
 Source Server Version : 50733 (5.7.33-log)
 Source Host           : 172.31.25.76:3306
 Source Schema         : cds

 Target Server Type    : MySQL
 Target Server Version : 50733 (5.7.33-log)
 File Encoding         : 65001

 Date: 20/12/2024 15:29:02
*/

-- 2024-12-20 与线上环境同步表结构，直接将原表删除重新建表
-- ----------------------------
-- Table structure for sys_menu_pre
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_pre`;
CREATE TABLE `sys_menu_pre`  (
    `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
    `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
    `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
    `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
    `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
    `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
    `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
    `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
    `enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用【0-禁用 ｜ 1-启用】 默认启用',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of sys_menu_pre
-- ----------------------------
INSERT INTO `sys_menu_pre` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'shezhi', 9, 1);
INSERT INTO `sys_menu_pre` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1, 1);
INSERT INTO `sys_menu_pre` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu_pre` VALUES (31, 0, '渠道管理', 'pg/channel', 'api:channel:list,api:channel:save,api:channel:update,api:channel:delete,api:channel:info,api:subchannel:list,api:subchannel:save,api:subchannel:savelist,api:subchannel:update,api:subchannel:delete,api:subchannel:info,api:apkinfo:list,api:apkinfo:upload,api:channelproportion:save,api:subchannel:build,api:channelcode:create,api:subchannel:check', 1, 'channel', 8, 1);
INSERT INTO `sys_menu_pre` VALUES (33, 0, '收入结算', 'pg/income', 'api:channel:list,api:dailyreport:list', 1, 'income', 10, 0);
INSERT INTO `sys_menu_pre` VALUES (34, 0, '数据概要', 'pg/dailyreport', 'api:dailyreport:list,api:channel:list', 1, 'datainfo', 0, 1);
INSERT INTO `sys_menu_pre` VALUES (35, 0, '渠道统计', 'pg/channelreport', 'api:dailyreport:list,api:channel:list', 1, 'channelreport', 1, 1);
INSERT INTO `sys_menu_pre` VALUES (36, 108, '推广数据', 'pg/adjuststat', 'api:channel:list,api:adjuststat:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:group,api:adjuststat:creative,api:adjuststat:source,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (37, 0, '权限管理', 'pg/permission', 'sys:menu:list,api:channel:list,api:subchannel:list,api:subchannel:channellist,api:permission:save,api:permission:update,api:permission:list,api:permission:info', 1, 'sys', 10, 1);
INSERT INTO `sys_menu_pre` VALUES (39, 108, '推广详细数据', 'pg/adjuststatdetail', 'api:channel:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:creative,api:adjuststat:group,api:adjuststat:source,/api/adjuststatdetail/list,api:adjuststatdetail:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (40, 0, 'LTV数据', 'pg/channeldetail', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (41, 0, '留存数据', 'pg/retention', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 1, 1);
INSERT INTO `sys_menu_pre` VALUES (42, 0, '结算中心', 'pg/incomecenter', 'api:channel:list', 1, 'income', 11, 0);
INSERT INTO `sys_menu_pre` VALUES (43, 0, '生成结算单', 'pg/incomelist', 'api:channel:list', 1, '', 11, 0);
INSERT INTO `sys_menu_pre` VALUES (44, 0, '付费用户留存', 'pg/recharge-retention', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (45, 108, 'ROI趋势(同期群)', 'pg/roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (46, 108, 'ROAS趋势(同期群)', 'pg/roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (47, 0, '项目分成', 'pg/roas-trend-platform-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu_pre` VALUES (48, 0, '配置项', 'pg/roas-trend-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu_pre` VALUES (49, 0, '实时曲线', 'pg/real-time-curve', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'channel', 10, 0);
INSERT INTO `sys_menu_pre` VALUES (50, 0, 'LTV数据(充值)', 'pg/channeldetailRecharge', 'api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (51, 0, '上报配置', 'pg/transport-conf', 'api:transport:list', 0, 'shezhi', 6, 1);
INSERT INTO `sys_menu_pre` VALUES (52, 0, 'ROI预测', 'pg/roi-campaign-predict', 'api:channel:list', 1, 'tubiao', 11, 0);
INSERT INTO `sys_menu_pre` VALUES (56, 108, '投放日报', 'pg/advertising-daily', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (57, 108, '投放方配置', 'pg/advertiser-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 4, 1);
INSERT INTO `sys_menu_pre` VALUES (58, 108, '广告系列效果分析', 'pg/campaign-analysis', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (59, 108, '渠道ROI趋势(同期群)', 'pg/cohort-channel-roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (60, 108, '渠道ROAS趋势(同期群)', 'pg/cohort-channel-roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, NULL, 3, 1);
INSERT INTO `sys_menu_pre` VALUES (101, 0, '重复率报表', '', '', 0, 'tubiao', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (102, 101, '重复率报表（渠道）', 'pg/report-form/index', '', 1, '', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (103, 101, '重复率报表（投放方）', 'pg/report-form/advertiser-sift', '', 1, '', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (104, 101, '重复率报表（广告系列）', 'pg/report-form/campaign-sift', '', 1, '', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (105, 0, '实时趋势报表', 'pg/statistics/index', '', 1, 'tubiao', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (106, 51, 'Adjust | Firebase', 'pg/transport-conf', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);
INSERT INTO `sys_menu_pre` VALUES (107, 51, 'Google Ads', 'pg/transport-conf-google-ads', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);
INSERT INTO `sys_menu_pre` VALUES (108, 0, '推广详情', '', '', 0, 'promotion', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (109, 0, '充值提现趋势', 'pg/recharge-withdraw-trend', '', 1, 'mudedi', 0, 1);
INSERT INTO `sys_menu_pre` VALUES (110, 0, '项目优先级配置', 'sys/prioritization-config', '', 1, 'config', 9, 1);


