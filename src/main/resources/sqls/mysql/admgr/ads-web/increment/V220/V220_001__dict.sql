
-- FBVisibleRangeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (170, 'FB个人账户可见范围', 'fb_account_permissions', '0', 'admin', now(), '', now(), 'FBAccountPermissionsEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (447, 0, '仅自己', 'ONESELF', 'fb_account_permissions', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'FB个人账户可见范围:仅自己');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (448, 0, '团队', 'TEAM', 'fb_account_permissions', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'FB个人账户可见范围:团队');

-- AdAccountStatusEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (173, '广告账户状态', 'ad_account_status', '0', 'admin', now(), '', now(), 'AdAccountStatusEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (452, 0, 'ACTIVE(活跃)', 'ACTIVE', 'ad_account_status', '', 'success', 'N', '0', 'admin', now(), '', now(), 'ACTIVE(活跃)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (453, 0, 'DISABLED(已禁用)', 'DISABLED', 'ad_account_status', '', 'error', 'N', '0', 'admin', now(), '', now(), 'DISABLED(已禁用)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (454, 0, 'UNSETTLED(未结算)', 'UNSETTLED', 'ad_account_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), 'UNSETTLED(未结算)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (455, 0, 'PENDING_RISK_REVIEW(待风险审核)', 'PENDING_RISK_REVIEW', 'ad_account_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), 'PENDING_RISK_REVIEW(待风险审核)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (456, 0, 'PENDING_SETTLEMENT(待结算)', 'PENDING_SETTLEMENT', 'ad_account_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), 'PENDING_SETTLEMENT(待结算)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (457, 0, 'IN_GRACE_PERIOD(宽限期内)', 'IN_GRACE_PERIOD', 'ad_account_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), 'IN_GRACE_PERIOD(宽限期内)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (458, 0, 'PENDING_CLOSURE(待关闭)', 'PENDING_CLOSURE', 'ad_account_status', '', 'warning', 'N', '0', 'admin', now(), '', now(), 'PENDING_CLOSURE(待关闭)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (459, 0, 'CLOSED(已关闭)', 'CLOSED', 'ad_account_status', '', 'error', 'N', '0', 'admin', now(), '', now(), 'CLOSED(已关闭)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (460, 0, 'ANY_ACTIVE(任何活跃)', 'ANY_ACTIVE', 'ad_account_status', '', 'success', 'N', '0', 'admin', now(), '', now(), 'ANY_ACTIVE(任何活跃)');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (461, 0, 'ANY_CLOSED(任何关闭)', 'ANY_CLOSED', 'ad_account_status', '', 'error', 'N', '0', 'admin', now(), '', now(), 'ANY_CLOSED(任何关闭)');

