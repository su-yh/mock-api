
-- 补充原来的数据字典类型
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (51, 'sys_ads_type', 'sys_ads_type', '0', 'admin', '2024-03-19 19:13:39', '', NULL, 'sys_ads_type');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (52, 'sys_status_disable', 'sys_status_disable', '0', 'admin', '2024-03-19 19:13:59', '', NULL, 'sys_status_disable');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (53, 'sys_account_status', 'sys_account_status', '0', 'admin', '2024-03-19 19:14:19', '', NULL, 'sys_account_status');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (54, 'sys_app_type', 'sys_app_type', '0', 'admin', '2024-03-19 19:14:36', '', NULL, 'sys_app_type');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (55, 'sys_account_type', 'sys_account_type', '0', 'admin', '2024-03-19 19:14:51', '', NULL, 'sys_account_type');

-- 数据字典类型对应的数据
INSERT INTO `sys_dict_data` VALUES (100, 1, '3A', '1', 'sys_ads_type', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '3A广告');
INSERT INTO `sys_dict_data` VALUES (101, 2, 'No3A', '2', 'sys_ads_type', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (114, 3, 'web', '3', 'sys_ads_type', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');

INSERT INTO `sys_dict_data` VALUES (102, 1, '正常', '1', 'sys_status_disable', '', 'primary', 'Y', '0', 'admin', '2023-09-19 10:47:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (103, 2, '停用', '0', 'sys_status_disable', '', 'danger', 'N', '0', 'admin', '2023-09-19 10:47:48', '', NULL, '停用状态');

INSERT INTO `sys_dict_data` VALUES (104, 1, 'ACTIVE', '1', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '3A广告');
INSERT INTO `sys_dict_data` VALUES (105, 2, 'DISABLED', '2', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (106, 3, 'UNSETTLED', '3', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (107, 4, 'PENDING_RISK_REVIEW', '7', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (108, 5, 'PENDING_SETTLEMENT', '8', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (109, 6, 'IN_GRACE_PERIOD', '9', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (110, 7, 'PENDING_CLOSURE', '100', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (111, 8, 'CLOSED', '101', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (112, 9, 'ANY_ACTIVE', '201', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');
INSERT INTO `sys_dict_data` VALUES (113, 10, 'ANY_CLOSED', '202', 'sys_account_status', '', 'info', 'N', '0', 'admin', '2023-09-19 10:47:56', '', NULL, '非3A广告');

INSERT INTO `sys_dict_data` VALUES (115, 1, 'app', '1', 'sys_app_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '投放类型');
INSERT INTO `sys_dict_data` VALUES (116, 2, 'web', '2', 'sys_app_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '投放类型');

INSERT INTO `sys_dict_data` VALUES (117, 1, '正常户', '1', 'sys_account_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '账号类型');
INSERT INTO `sys_dict_data` VALUES (118, 2, '三不限户', '2', 'sys_account_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '账号类型');
INSERT INTO `sys_dict_data` VALUES (119, 3, '二不限户', '3', 'sys_account_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '账号类型');
INSERT INTO `sys_dict_data` VALUES (120, 4, '其他户', '4', 'sys_account_type', '', 'info', 'N', '0', 'admin', '2023-11-16 10:47:56', '', NULL, '账号类型');
