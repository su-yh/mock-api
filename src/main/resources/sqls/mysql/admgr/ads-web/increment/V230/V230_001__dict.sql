
-- FBDeliveryStatusEnums 投放状态：广告
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (175, '投放状态:广告', 'fb_ad_delivery_status', '0', 'admin', now(), '', now(), 'Ad.EnumEffectiveStatus');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (465, 0, '投放中', 'VALUE_ACTIVE', 'fb_ad_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (466, 0, '待审核', 'VALUE_PENDING_REVIEW', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '待审核');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (467, 0, '处理中', 'VALUE_IN_PROCESS', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (468, 0, '准备中', 'VALUE_PREAPPROVED', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '准备中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (469, 0, '待处理账单信息', 'VALUE_PENDING_BILLING_INFO', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '待处理账单信息');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (470, 0, '存在问题', 'VALUE_WITH_ISSUES', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (471, 0, '已被拒', 'VALUE_DISAPPROVED', 'fb_ad_delivery_status', '', 'error', 'N', '0', 'admin', now(), '', now(), '已被拒');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (472, 0, '已暂停', 'VALUE_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (473, 0, '广告系列已暂停', 'VALUE_CAMPAIGN_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告系列已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (474, 0, '广告组已暂停', 'VALUE_ADSET_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告组已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (475, 0, '已归档', 'VALUE_ARCHIVED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (476, 0, '已删除', 'VALUE_DELETED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');

-- 投放状态：广告组
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (176, '投放状态:广告组', 'fb_ad_set_delivery_status', '0', 'admin', now(), '', now(), 'AdSet.EnumEffectiveStatus');


INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (480, 0, '投放中', 'VALUE_ACTIVE', 'fb_ad_set_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (481, 0, '已归档', 'VALUE_ARCHIVED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (482, 0, '广告系列已暂停', 'VALUE_CAMPAIGN_PAUSED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告系列已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (483, 0, '已删除', 'VALUE_DELETED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (484, 0, '处理中', 'VALUE_IN_PROCESS', 'fb_ad_set_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (485, 0, '已暂停', 'VALUE_PAUSED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (486, 0, '存在问题', 'VALUE_WITH_ISSUES', 'fb_ad_set_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');

-- 投放状态：广告系列
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (177, '投放状态:广告系列', 'fb_campaigns_delivery_status', '0', 'admin', now(), '', now(), 'Campaign.EnumEffectiveStatus');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (490, 0, '投放中', 'VALUE_ACTIVE', 'fb_campaigns_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (491, 0, '已归档', 'VALUE_ARCHIVED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (492, 0, '已删除', 'VALUE_DELETED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (493, 0, '处理中', 'VALUE_IN_PROCESS', 'fb_campaigns_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (494, 0, '已暂停', 'VALUE_PAUSED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (495, 0, '存在问题', 'VALUE_WITH_ISSUES', 'fb_campaigns_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');


-- 增加 广告目标
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (500, 0, '知名度', 'VALUE_OUTCOME_AWARENESS', 'advertising_objectives', '', 'default', 'N', '0', 'admin', now(), '', now(), '知名度');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (501, 0, '互动', 'VALUE_OUTCOME_ENGAGEMENT', 'advertising_objectives', '', 'default', 'N', '0', 'admin', now(), '', now(), '互动');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (502, 0, '潜在客户', 'VALUE_OUTCOME_LEADS', 'advertising_objectives', '', 'default', 'N', '0', 'admin', now(), '', now(), '潜在客户');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (503, 0, '销量', 'VALUE_OUTCOME_SALES', 'advertising_objectives', '', 'default', 'N', '0', 'admin', now(), '', now(), '销量');


-- 修改任务枚举颜色
UPDATE sys_dict_data SET list_class = 'error' WHERE dict_code = 264;

-- 刷新任务类型
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (178, '刷新任务类型', 'refresh_trigger_type', '0', 'admin', now(), '', now(), '枚举: RefreshTriggerType');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (510, 0, '授权', 'AUTHORIZE', 'refresh_trigger_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '新增授权或者更新授权');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (511, 0, '手动', 'MANUAL', 'refresh_trigger_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '单条或者批量手动触发');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (512, 0, '半自动', 'SEMI_AUTO', 'refresh_trigger_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '页面间隔1小时触发(线上用户)');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (513, 0, '全自动', 'FULL_AUTO', 'refresh_trigger_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '每天零点触发');

