
-- AdAppCategoryEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (111, '枚举：应用广告 | 进阶赋能型应用广告', 'ad_app_category', '0', 'admin', now(), '', now(), 'AdAppCategoryEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (211, 0, '应用广告', 'NORMAL', 'ad_app_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '应用广告');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (212, 0, '进阶赋能型应用广告', 'ADVANCED', 'ad_app_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '进阶赋能型应用广告');



-- AdvertiseTypeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (113, '枚举：广告系列投放类型', 'advertise_type', '0', 'admin', now(), '', now(), 'AdvertiseTypeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (215, 0, '标准', 'NORMAL', 'advertise_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '标准');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (216, 0, '加速', 'FAST', 'advertise_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '加速');

-- BehaviorActionEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (114, '枚举：行动号召', 'behavior_action', '0', 'admin', now(), '', now(), 'BehaviorActionEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (217, 0, '立即安装', 'INSTALL_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '立即安装');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (218, 0, '详细了解', 'DETAIL', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '详细了解');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (219, 0, '去逛逛', 'STROLLING', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '去逛逛');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (220, 0, '玩游戏', 'PLAY_GAMING', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '玩游戏');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (221, 0, '订阅', 'SUBSCRIPTION', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '订阅');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (222, 0, '更多视频', 'MORE_VIDEOS', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '更多视频');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (223, 0, '立即订购', 'ORDER_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '立即订购');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (224, 0, '立即预订', 'BOOK_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '立即预订');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (225, 0, '下载', 'DOWNLOAD', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '下载');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (226, 0, '立即收听', 'LISTEN_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '立即收听');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (227, 0, '立即注册', 'REGISTRY_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', now(), '', now(), '立即注册');

-- BudgetCategoryEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (115, '枚举：预算分类', 'budget_category', '0', 'admin', now(), '', now(), 'BudgetCategoryEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (228, 0, '每日预算', 'DAILY_BUDGET', 'budget_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '每日预算');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (229, 0, '总预算', 'LIFETIME_BUDGET', 'budget_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '总预算');

-- OpenCloseEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (116, '枚举：开/关', 'open_close', '0', 'admin', now(), '', now(), 'OpenCloseEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (230, 0, '开', 'OPEN', 'open_close', '', 'primary', 'N', '0', 'admin', now(), '', now(), '开');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (231, 0, '关', 'CLOSE', 'open_close', '', 'primary', 'N', '0', 'admin', now(), '', now(), '关');


