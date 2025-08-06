

INSERT INTO `sys_config` VALUES (2, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');



-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'shezhi', 9, 1);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1, 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2, 1);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3, 1);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (31, 0, '渠道管理', 'pg/channel', 'api:channel:list,api:channel:save,api:channel:update,api:channel:delete,api:channel:info,api:subchannel:list,api:subchannel:save,api:subchannel:savelist,api:subchannel:update,api:subchannel:delete,api:subchannel:info,api:apkinfo:list,api:apkinfo:upload,api:channelproportion:save,api:subchannel:build,api:channelcode:create,api:subchannel:check', 1, 'channel', 8, 1);
INSERT INTO `sys_menu` VALUES (33, 0, '收入结算', 'pg/income', 'api:channel:list,api:dailyreport:list', 1, 'income', 6, 1);
INSERT INTO `sys_menu` VALUES (34, 0, '数据概要', 'pg/dailyreport', 'api:dailyreport:list,api:channel:list', 1, 'datainfo', 0, 1);
INSERT INTO `sys_menu` VALUES (35, 0, '渠道统计', 'pg/channelreport', 'api:dailyreport:list,api:channel:list', 1, 'channelreport', 1, 1);
INSERT INTO `sys_menu` VALUES (36, 0, '推广数据', 'pg/adjuststat', 'api:channel:list,api:adjuststat:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:group,api:adjuststat:creative,api:adjuststat:source,api:subchannel:list', 1, 'promotion', 3, 1);
INSERT INTO `sys_menu` VALUES (37, 0, '权限管理', 'pg/permission', 'sys:menu:list,api:channel:list,api:subchannel:list,api:subchannel:channellist,api:permission:save,api:permission:update,api:permission:list,api:permission:info', 1, 'sys', 10, 1);
INSERT INTO `sys_menu` VALUES (39, 0, '推广详细数据', 'pg/adjuststatdetail', 'api:channel:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:creative,api:adjuststat:group,api:adjuststat:source,/api/adjuststatdetail/list,api:adjuststatdetail:list', 1, 'tuiguang', 3, 1);
INSERT INTO `sys_menu` VALUES (40, 0, 'LTV数据', 'pg/channeldetail', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu` VALUES (41, 0, '留存数据', 'pg/retention', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 1, 1);
INSERT INTO `sys_menu` VALUES (42, 0, '结算中心', 'pg/incomecenter', 'api:channel:list', 1, 'income', 7, 1);
INSERT INTO `sys_menu` VALUES (43, 0, '生成结算单', 'pg/incomelist', 'api:channel:list', 1, '', 7, 1);
INSERT INTO `sys_menu` VALUES (44, 0, '付费用户留存', 'pg/recharge-retention', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 2, 1);
INSERT INTO `sys_menu` VALUES (45, 0, 'ROI趋势(同期群)', 'pg/roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 3, 1);
INSERT INTO `sys_menu` VALUES (46, 0, 'ROAS趋势(同期群)', 'pg/roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 3, 1);
INSERT INTO `sys_menu` VALUES (47, 0, '项目分成', 'pg/roas-trend-platform-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu` VALUES (48, 0, '配置项', 'pg/roas-trend-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu` VALUES (49, 0, '实时曲线', 'pg/real-time-curve', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'channel', 5, 1);
INSERT INTO `sys_menu` VALUES (50, 0, 'LTV数据(充值)', 'pg/channeldetailRecharge', 'api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu` VALUES (51, 0, '上报配置', 'pg/transport-conf', 'api:transport:list,api:subchannel:list,api:channel:list', 1, 'shezhi', 6, 1);
INSERT INTO `sys_menu` VALUES (52, 0, 'ROI预测', 'pg/roi-campaign-predict', 'api:channel:list', 1, 'tubiao', 2, 1);
INSERT INTO `sys_menu` VALUES (53, 0, '投放日报', 'pg/advertising-daily', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 2, 1);
INSERT INTO `sys_menu` VALUES (54, 0, '投放方配置', 'pg/advertiser-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 1, 1);
INSERT INTO `sys_menu` VALUES (55, 0, '广告系列效果分析', 'pg/campaign-analysis', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 5, 1);
INSERT INTO `sys_menu` VALUES (56, 0, '渠道ROI趋势(同期群)', 'pg/cohort-channel-roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 3, 1);
INSERT INTO `sys_menu` VALUES (57, 0, '渠道ROAS趋势(同期群)', 'pg/cohort-channel-roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 3, 1);




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
INSERT INTO `sys_menu_pre` VALUES (33, 0, '收入结算', 'pg/income', 'api:channel:list,api:dailyreport:list', 1, 'income', 6, 0);
INSERT INTO `sys_menu_pre` VALUES (34, 0, '数据概要', 'pg/dailyreport', 'api:dailyreport:list,api:channel:list', 1, 'datainfo', 0, 1);
INSERT INTO `sys_menu_pre` VALUES (35, 0, '渠道统计', 'pg/channelreport', 'api:dailyreport:list,api:channel:list', 1, 'channelreport', 1, 1);
INSERT INTO `sys_menu_pre` VALUES (36, 0, '推广数据', 'pg/adjuststat', 'api:channel:list,api:adjuststat:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:group,api:adjuststat:creative,api:adjuststat:source,api:subchannel:list', 1, 'promotion', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (37, 0, '权限管理', 'pg/permission', 'sys:menu:list,api:channel:list,api:subchannel:list,api:subchannel:channellist,api:permission:save,api:permission:update,api:permission:list,api:permission:info', 1, 'sys', 10, 1);
INSERT INTO `sys_menu_pre` VALUES (39, 0, '推广详细数据', 'pg/adjuststatdetail', 'api:channel:list,api:subchannel:userchannellist,api:adjuststat:campaign,api:adjuststat:creative,api:adjuststat:group,api:adjuststat:source,/api/adjuststatdetail/list,api:adjuststatdetail:list', 1, 'tuiguang', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (40, 0, 'LTV数据', 'pg/channeldetail', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (41, 0, '留存数据', 'pg/retention', 'api:channel:list,api:subchannel:list,api:subchannel:list,api:adjuststatdetail:list', 1, '', 1, 1);
INSERT INTO `sys_menu_pre` VALUES (42, 0, '结算中心', 'pg/incomecenter', 'api:channel:list', 1, 'income', 7, 0);
INSERT INTO `sys_menu_pre` VALUES (43, 0, '生成结算单', 'pg/incomelist', 'api:channel:list', 1, '', 7, 1);
INSERT INTO `sys_menu_pre` VALUES (44, 0, '付费用户留存', 'pg/recharge-retention', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (45, 0, 'ROI趋势(同期群)', 'pg/roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (46, 0, 'ROAS趋势(同期群)', 'pg/roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (47, 0, '项目分成', 'pg/roas-trend-platform-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu_pre` VALUES (48, 0, '配置项', 'pg/roas-trend-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, '', 8, 1);
INSERT INTO `sys_menu_pre` VALUES (49, 0, '实时曲线', 'pg/real-time-curve', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'channel', 5, 1);
INSERT INTO `sys_menu_pre` VALUES (50, 0, 'LTV数据(充值)', 'pg/channeldetailRecharge', 'api:adjuststatdetail:list', 1, '', 2, 1);
INSERT INTO `sys_menu_pre` VALUES (51, 0, 'ROI预测', 'pg/roi-campaign-predict', '', 1, '', 8, 0);
INSERT INTO `sys_menu_pre` VALUES (54, 0, '上报配置', 'pg/transport-conf', 'api:transport:list', 1, 'shezhi', 6, 1);
INSERT INTO `sys_menu_pre` VALUES (55, 0, 'ROI 盘', 'pg/roi-pn-all', 'api:channel:list', 1, 'tubiao', 100, 1);
INSERT INTO `sys_menu_pre` VALUES (56, 0, '投放日报', 'pg/advertising-daily', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (57, 0, '投放方配置', 'pg/advertiser-configure', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 4, 1);
INSERT INTO `sys_menu_pre` VALUES (58, 0, '广告系列效果分析', 'pg/campaign-analysis', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 5, 1);
INSERT INTO `sys_menu_pre` VALUES (59, 0, '渠道ROI趋势(同期群)', 'pg/cohort-channel-roi-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 3, 1);
INSERT INTO `sys_menu_pre` VALUES (60, 0, '渠道ROAS趋势(同期群)', 'pg/cohort-channel-roas-trend', 'api:adjuststat:list,api:adjuststat:source,api:adjuststatdetail:list,api:adjuststatdetail:roaslist,api:adjuststatdetail:roilist,api:channel:list,api:retention:list,api:subchannel:list', 1, 'tubiao', 3, 1);








-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io1', '13612345678', 1, 1, '2016-11-11 11:11:11', 1, 228944823088869404, 'NTKLRVLUPEMMMGAV');


