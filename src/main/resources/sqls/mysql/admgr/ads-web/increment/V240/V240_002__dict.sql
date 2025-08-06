
-- FBDeliveryStatusEnums 投放状态：广告
DELETE FROM sys_dict_data WHERE dict_type = 'fb_ad_delivery_status' ;

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (465, 0, '投放中', 'ACTIVE', 'fb_ad_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (466, 0, '待审核', 'PENDING_REVIEW', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '待审核');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (467, 0, '处理中', 'IN_PROCESS', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (468, 0, '准备中', 'PREAPPROVED', 'fb_ad_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '准备中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (469, 0, '待处理账单信息', 'PENDING_BILLING_INFO', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '待处理账单信息');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (470, 0, '存在问题', 'WITH_ISSUES', 'fb_ad_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (471, 0, '已被拒', 'DISAPPROVED', 'fb_ad_delivery_status', '', 'error', 'N', '0', 'admin', now(), '', now(), '已被拒');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (472, 0, '已暂停', 'PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (473, 0, '广告系列已暂停', 'CAMPAIGN_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告系列已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (474, 0, '广告组已暂停', 'ADSET_PAUSED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告组已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (475, 0, '已归档', 'ARCHIVED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (476, 0, '已删除', 'DELETED', 'fb_ad_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');

-- 投放状态：广告组
DELETE FROM sys_dict_data WHERE dict_type = 'fb_ad_set_delivery_status' ;

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (480, 0, '投放中', 'ACTIVE', 'fb_ad_set_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (481, 0, '已归档', 'ARCHIVED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (482, 0, '广告系列已暂停', 'CAMPAIGN_PAUSED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '广告系列已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (483, 0, '已删除', 'DELETED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (484, 0, '处理中', 'IN_PROCESS', 'fb_ad_set_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (485, 0, '已暂停', 'PAUSED', 'fb_ad_set_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (486, 0, '存在问题', 'WITH_ISSUES', 'fb_ad_set_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');

-- 投放状态：广告系列
DELETE FROM sys_dict_data WHERE dict_type = 'fb_campaigns_delivery_status' ;

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (490, 0, '投放中', 'ACTIVE', 'fb_campaigns_delivery_status', '', 'success', 'N', '0', 'admin', now(), '', now(), '投放中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (491, 0, '已归档', 'ARCHIVED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已归档');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (492, 0, '已删除', 'DELETED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已删除');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (493, 0, '处理中', 'IN_PROCESS', 'fb_campaigns_delivery_status', '', 'processing', 'N', '0', 'admin', now(), '', now(), '处理中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (494, 0, '已暂停', 'PAUSED', 'fb_campaigns_delivery_status', '', 'default', 'N', '0', 'admin', now(), '', now(), '已暂停');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (495, 0, '存在问题', 'WITH_ISSUES', 'fb_campaigns_delivery_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), '存在问题');

