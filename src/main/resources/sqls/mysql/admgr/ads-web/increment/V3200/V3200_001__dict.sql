-- SourcePlatforms
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (191, '爬取:平台', 'reptile_source_platforms', '0', 'admin', now(), '', now(), '爬取api-SourcePlatforms');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (660, 0, 'App Growing', 'APP_GROWING', 'reptile_source_platforms', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:平台-APP_GROWING');

-- OperationType
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (192, '爬取:爬取方式', 'reptile_operation_type', '0', 'admin', now(), '', now(), '爬取api-OperationType');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (665, 0, '仅本次', 'ONLY_ONCE', 'reptile_operation_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取方式-仅本次');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (666, 1, '定时执行', 'SCHEDULED', 'reptile_operation_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取方式-定时执行');

-- TaskStatus
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (193, '爬取:爬取状态', 'reptile_task_status', '0', 'admin', now(), '', now(), '爬取api-TaskStatus');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (670, 0, '空闲', 'IDLE', 'reptile_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-空闲');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (671, 1, '进行中', 'RUNNING', 'reptile_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-进行中');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (672, 2, '成功', 'SUCCESS', 'reptile_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-成功');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (673, 3, '失败', 'FAILED', 'reptile_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-失败');

-- CredentialStatus
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (194, '爬取:凭证状态', 'reptile_credential_status', '0', 'admin', now(), '', now(), '爬取api-CredentialStatus');

INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (195, '启用禁用(Y/N)', 'sys_normal_yes_or_no', '0', 'admin', now(), '', now(), '启用禁用(Y/N)');

-- DateRangeType
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (196, '日期筛选', 'date_range_type', '0', 'admin', now(), '', now(), '日期筛选项');


INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (675, 0, '有效', 'VALID', 'reptile_credential_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-有效');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (676, 1, '无效', 'INVALID', 'reptile_credential_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取:爬取状态-无效');

INSERT INTO sys_dict_data(id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (677, 1, '正常', 'Y', 'sys_normal_yes_or_no', '', 'primary', 'Y', '0', 'admin', now(), '', now(), '正常状态'),
       (678, 2, '停用', 'N', 'sys_normal_yes_or_no', '', 'danger', 'N', '0', 'admin', now(), '', now(), '停用状态');


INSERT INTO sys_dict_data(id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (680, 1, '近7天', 'LAST_7_DAYS', 'date_range_type', '', 'primary', 'Y', '0', 'admin', now(), '', now(), '近7天'),
       (681, 2, '近30天', 'LAST_30_DAYS', 'date_range_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '近30天'),
       (682, 3, '近180天', 'LAST_180_DAYS', 'date_range_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '近180天'),
       (683, 4, '近356天', 'LAST_365_DAYS', 'date_range_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '近356天'),
       (684, 5, '全部', 'ALL_DAYS', 'date_range_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '全部');

-- TaskExecutionStatus
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (197, '爬取日志状态', 'crawl_log_status', '0', 'admin', now(), '', now(), '爬取api-TaskExecutionStatus');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (685, 0, '部分成功', 'PARTIAL_SUCCESS', 'crawl_log_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取日志状态-部分成功');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (686, 1, '进行中', 'RUNNING', 'crawl_log_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取日志状态-进行中');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (687, 2, '成功', 'SUCCESS', 'crawl_log_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取日志状态-成功');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (688, 3, '失败', 'FAILED', 'crawl_log_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '爬取日志状态-失败');

-- 增加路由
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2076, '热门素材库', 2070, 2, 'hot-material-library', 'aigc/hot-material-library/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:folder-open-twotone', 'admin', '2025-05-16 02:43:43', 'admin', '2025-05-16 02:45:24', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2077, '热门素材', 2076, 0, '', null, null, 1, 0, 'F', '0', '0', 'system:hotMaterial:material', '#', 'admin', '2025-05-16 02:47:33', '', '2025-05-16 02:47:33', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2078, '抓取配置', 2076, 1, '', null, null, 1, 0, 'F', '0', '0', 'system:hotMaterial:crawlConfig', '#', 'admin', '2025-05-16 02:48:56', '', '2025-05-16 02:48:56', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2079, '凭证管理', 2076, 2, '', null, null, 1, 0, 'F', '0', '0', 'system:hotMaterial:credential', '#', 'admin', '2025-05-16 02:51:10', '', '2025-05-16 02:51:10', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2080, '爬取日志', 2076, 4, '', null, null, 1, 0, 'F', '0', '0', 'system:hotMaterial:crawlLog', '#', 'admin', '2025-05-16 02:51:32', '', '2025-05-16 02:51:32', '');

-- 补充枚举 广告投放状态枚举

REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (465, 0, '投放中', 'ACTIVE', 'fb_ad_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (466, 0, '待审核', 'PENDING_REVIEW', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '待审核');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (467, 0, '处理中', 'IN_PROCESS', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (468, 0, '准备中', 'PREAPPROVED', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '准备中');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (469, 0, '待处理账单信息', 'PENDING_BILLING_INFO', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '待处理账单信息');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (470, 0, '存在问题', 'WITH_ISSUES', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (471, 0, '已被拒', 'DISAPPROVED', 'fb_ad_delivery_status', '', 'error', 'N', '0', 'admin', now(), '', now(), '已被拒');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (472, 0, '已暂停', 'PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (473, 0, '广告系列已暂停', 'CAMPAIGN_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告系列已暂停');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (474, 0, '广告组已暂停', 'ADSET_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告组已暂停');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (475, 0, '已归档', 'ARCHIVED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
REPLACE INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (476, 0, '已删除', 'DELETED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');
