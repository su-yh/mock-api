-- 枚举修改将进阶赋能型版位修改为进阶赋能型版位(推荐)
update sys_dict_data set dict_label = '进阶赋能型版位（推荐）' where dict_code = '243';

-- AdvertisingObjectivesEnums
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (252, 1, '流量', 'VALUE_OUTCOME_TRAFFIC', 'advertising_objectives', '', 'primary', 'N', '0', 'admin', now(), '', now(), '广告目标:流量');


-- ConversionPositionEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (153, '转化发生位置', 'conversion_position', '0', 'admin', now(), '', now(), 'ConversionPositionEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (385, 1, '网站', 'NETWORK_STATION', 'conversion_position', '', 'primary', 'N', '0', 'admin', now(), '', now(), '转化发生位置:网站');

-- AdAppCategoryEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (154, '广告目标目标-流量', 'ad_flow_category', '0', 'admin', now(), '', now(), 'AdAppCategoryEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (390, 0, '流量广告', 'NORMAL', 'ad_flow_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '流量广告');


-- EnumDevicePlatforms
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (160, '设备', 'device_platforms', '0', 'admin', now(), '', now(), 'EnumDevicePlatforms');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (396, 1, '桌面设备', 'VALUE_DESKTOP', 'device_platforms', '', 'primary', 'N', '0', 'admin', now(), '', now(), '设备:桌面设备');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (397, 2, '移动设备', 'VALUE_MOBILE', 'device_platforms', '', 'primary', 'N', '0', 'admin', now(), '', now(), '设备:移动设备');


-- OutcomeGoalsEnums
delete from sys_dict_data where dict_code = '248';
delete from sys_dict_data where dict_code = '249';
delete from sys_dict_data where dict_code = '250';
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (401, 1, '最大限度地提升应用安装量', 'MAXIMIZE_APP_INSTALLS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:应用安装量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (402, 2, '链接点击量最大化', 'MAXIMIZE_LINK_CLICKS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:链接点击量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (403, 3, '应用事件数量最大化', 'MAXIMIZE_THE_NUMBER_OF_APPLICATION_EVENTS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:应用事件数量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (404, 4, '落地页浏览量最大化', 'VALUE_LANDING_PAGE_VIEWS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:落地页浏览量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (405, 5, '单日独立覆盖人数最大化', 'VALUE_REACH', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:单日独立覆盖人数最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (407, 7, '展示次数最大化', 'VALUE_IMPRESSIONS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:展示次数最大话');


-- AdCreationModeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (165, '发布状态', 'ad_creation_mode', '0', 'admin', now(), '', now(), 'AdCreationModeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (411, 1, '启用', 'ENABLED', 'ad_creation_mode', '', 'primary', 'N', '0', 'admin', now(), '', now(), '发布状态:启用');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (412, 2, '禁用', 'DISABLED', 'ad_creation_mode', '', 'primary', 'N', '0', 'admin', now(), '', now(), '发布状态:禁用');


-- BehaviorActionEnums
delete from sys_dict_data where dict_code = '217';
delete from sys_dict_data where dict_code = '218';
delete from sys_dict_data where dict_code = '219';
delete from sys_dict_data where dict_code = '220';
delete from sys_dict_data where dict_code = '221';
delete from sys_dict_data where dict_code = '222';
delete from sys_dict_data where dict_code = '223';
delete from sys_dict_data where dict_code = '224';
delete from sys_dict_data where dict_code = '225';
delete from sys_dict_data where dict_code = '226';
delete from sys_dict_data where dict_code = '227';

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (421, 0, '立即安装', 'INSTALL_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即安装');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (422, 0, '详细了解', 'DETAIL', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '详细了解');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (423, 0, '去逛逛', 'STROLLING', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '去逛逛');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (424, 0, '玩游戏', 'PLAY_GAMING', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '玩游戏');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (425, 0, '订阅', 'SUBSCRIPTION', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '订阅');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (426, 0, '更多视频', 'MORE_VIDEOS', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '更多视频');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (427, 0, '立即订购', 'ORDER_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即订购');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (428, 0, '立即预订', 'BOOK_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即预订');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (429, 0, '下载', 'DOWNLOAD', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '下载');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (430, 0, '立即收听', 'LISTEN_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即收听');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (431, 0, '立即注册', 'REGISTRY_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即注册');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (432, 0, '立即申请', 'APPLY_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即申请');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (433, 0, '立即拨打', 'CALL_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即拨打');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (434, 0, '联系我们', 'CONTACT_US', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '联系我们');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (435, 0, '立即捐款', 'DONATE_NOW', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即捐款');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (436, 0, '领取优惠', 'GET_OFFER', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '领取优惠');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (437, 0, '立即询价', 'GET_QUOTE', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即询价');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (438, 0, '查看场次', 'GET_SHOWTIMES', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '查看场次');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (439, 0, '预约时间', 'REQUEST_TIME', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '预约时间');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (441, 0, '去逛逛', 'VISIT_PAGES_FEED', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '去逛逛');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (442, 0, '更多视频', 'WATCH_MORE', 'behavior_action', '', 'primary', 'N', '0', 'admin', '2024-07-04 18:37:37', '', '2024-07-04 18:37:37', '立即注册');



