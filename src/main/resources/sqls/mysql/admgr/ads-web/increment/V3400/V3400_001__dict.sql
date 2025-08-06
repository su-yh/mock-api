-- XxlJobStatusEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (199, '调度任务：执行结果', 'xxl_job_status', '0', 'admin', now(), '', now(), '调度中心api-XxlJobStatusEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (695, 0, '未返回', '0', 'xxl_job_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '调度任务：执行结果');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (696, 1, '成功', '200', 'xxl_job_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '调度任务：执行结果');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (697, 2, '失败', '500', 'xxl_job_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '调度任务：执行结果');

-- 报表
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (200, '调度任务：报表', 'xxl_job_report', '0', 'admin', now(), '', now(), '调度中心:报表');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (700, 1, 'FB导出时报(reportRealTimeExcel)', 'reportRealTimeExcel', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), '');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (701, 2, 'GG导出时报(reportRealTimeExcelGG)', 'reportRealTimeExcelGG', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), '');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (708, 8, 'FB批量导出时报(reportRealTimeExcelChannelRange)', 'reportRealTimeExcelChannelRange', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,endDate');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (702, 3, 'GG批量导出时报(reportRealTimeExcelChannelGGRange)', 'reportRealTimeExcelChannelGGRange', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,groupKey,date,endDate');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (703, 4, 'Applivoe导出时报(reportRealTimeExcelApplovin)', 'reportRealTimeExcelApplovin', 'xxl_job_report', '', 'primary', 'N', '1', 'admin', now(), '', now(), '');

-- 路由
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2081, '调度任务', 2057, 0, 'scheduleJob', 'toolbar/schedule-job/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:schedule-outlined', 'admin', '2025-06-12 12:27:09', 'admin', '2025-06-16 10:23:35', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2082, '调度任务列表', 2081, 0, '', null, null, 1, 0, 'F', '0', '0', 'toolbar:scheduleJob:jobList', '#', 'admin', '2025-06-16 11:00:30', '', '2025-06-16 11:00:30', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2083, '时报渠道配置', 2081, 2, '', null, null, 1, 0, 'F', '0', '0', 'toolbar:scheduleJob:timeReportChannelConfig', '#', 'admin', '2025-06-16 11:00:54', 'admin', '2025-06-17 15:27:02', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2084, '执行日志', 2081, 1, '', null, null, 1, 0, 'F', '0', '0', 'toolbar:scheduleJob:jobLogs', '#', 'admin', '2025-06-16 11:01:23', 'admin', '2025-06-17 15:27:06', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2086, '渠道-类型配置', 2081, 3, '', null, null, 1, 0, 'F', '0', '0', 'toolbar:scheduleJob:channelTypeConfig', '#', 'admin', '2025-06-17 15:27:24', '', '2025-06-17 15:27:24', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2087, '投放方-分组配置', 2081, 4, '', null, null, 1, 0, 'F', '0', '0', 'toolbar:scheduleJob:deliverGroupConfig', '#', 'admin', '2025-06-17 15:28:41', 'admin', '2025-06-17 15:28:47', '');

UPDATE sys_menu SET menu_name = '广告创建任务' WHERE id = 2050;

-- 增加 是否推荐给管理员
ALTER TABLE sys_menu
    ADD COLUMN is_recommend TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否推荐给管理员：0-否（默认），1-是' AFTER status;

-- 设置推荐给管理员路由
update sys_menu set is_recommend = 1 where id in (100,101,102,108,2042,2025,2068,2069,2087,2086)

