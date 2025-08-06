
-- CustomAudienceEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (119, '自定义', 'custom', '0', 'admin', now(), '', now(), 'CustomEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (236, 1, '不限', 'NO_LIMIT', 'custom', '', 'primary', 'N', '0', 'admin', now(), '', now(), '不限');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (237, 2, '自定义', 'CUSTOMIZE', 'custom', '', 'primary', 'N', '0', 'admin', now(), '', now(), '自定义');


-- EnumBidStrategy
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (120, '竟价策略', 'bidding_strategy', '0', 'admin', now(), '', now(), 'EnumBidStrategy');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (238, 1, '最高数量', 'VALUE_LOWEST_COST_WITHOUT_CAP', 'bidding_strategy', '', 'primary', 'N', '0', 'admin', now(), '', now(), '竟价策略:最高数量');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (239, 2, '单次成效费用目标', 'VALUE_COST_CAP', 'bidding_strategy', '', 'primary', 'N', '0', 'admin', now(), '', now(), '竟价策略:单次成效费用目标');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (240, 3, '竞价上限', 'VALUE_LOWEST_COST_WITH_BID_CAP', 'bidding_strategy', '', 'primary', 'N', '0', 'admin', now(), '', now(), '竟价策略:竞价上限');


-- DeliveryPeriodEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (121, '投放时段', 'delivery_period', '0', 'admin', now(), '', now(), 'DeliveryPeriodEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (242, 1, '全天投放广告', 'LONG_TERM_DELIVERY', 'delivery_period', '', 'primary', 'N', '0', 'admin', now(), '', now(), '投放时段:长期投放');


-- PlacementSettingsEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (122, '版位设置', 'placement_settings', '0', 'admin', now(), '', now(), 'PlacementSettingsEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (243, 1, '进阶赋能型版位', 'AUTOMATIC_PLACEMENT', 'placement_settings', '', 'primary', 'N', '0', 'admin', now(), '', now(), '版位设置:自动版位');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (244, 2, '手动版位', 'MANUAL_PLACEMENT', 'placement_settings', '', 'primary', 'N', '0', 'admin', now(), '', now(), '版位设置:手动版位');


-- ScheduleEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (123, '排期', 'schedule', '0', 'admin', now(), '', now(), 'ScheduleEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (245, 1, '现在开始', 'START_NOW', 'schedule', '', 'primary', 'N', '0', 'admin', now(), '', now(), '排期:现在开始');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (246, 2, '自定义', 'CUSTOM', 'schedule', '', 'primary', 'N', '0', 'admin', now(), '', now(), '排期:自定义');


-- AdSet.EnumBillingEvent
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (124, '计费方式', 'billing_method', '0', 'admin', now(), '', now(), 'AdSet.EnumBillingEvent');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (247, 1, '展示次数', 'VALUE_IMPRESSIONS', 'billing_method', '', 'primary', 'N', '0', 'admin', now(), '', now(), '计费方式:展示次数');


-- OutcomeGoalsEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (125, '成效目标', 'outcome_goals', '0', 'admin', now(), '', now(), 'OutcomeGoalsEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (248, 1, '最大限度地提升应用安装量', 'MAXIMIZE_APP_INSTALLS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:应用安装量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (249, 2, '链接点击量最大化', 'MAXIMIZE_LINK_CLICKS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:链接点击量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (250, 3, '应用事件数量最大化', 'MAXIMIZE_THE_NUMBER_OF_APPLICATION_EVENTS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成效目标:应用事件数量最大化');



-- DeviceOsEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (127, '移动设备和操作系统', 'device_os', '0', 'admin', now(), '', now(), 'DeviceOsEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (257, 1, '不限(所有移动设备)', 'NO_LIMIT', 'device_os', '', 'primary', 'N', '0', 'admin', now(), '', now(), '不限(所有移动设备)');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (258, 2, '安卓', 'Android', 'device_os', '', 'primary', 'N', '0', 'admin', now(), '', now(), '安卓');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (259, 3, '苹果', 'iOS', 'device_os', '', 'primary', 'N', '0', 'admin', now(), '', now(), '苹果');


-- Campaign.EnumObjective
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (126, '广告目标', 'advertising_objectives', '0', 'admin', now(), '', now(), 'Campaign.EnumObjective');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (251, 1, '应用推广', 'VALUE_OUTCOME_APP_PROMOTION', 'advertising_objectives', '', 'primary', 'N', '0', 'admin', now(), '', now(), '广告目标:应用推广');


-- SplittingRuleEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (128, '拆分规则', 'splitting_rule', '0', 'admin', now(), '', now(), 'SplittingRuleEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (255, 1, '广告系列', 'CAMPAIGN', 'splitting_rule', '', 'primary', 'N', '0', 'admin', now(), '', now(), '拆分规则:广告系列');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (256, 2, '广告组', 'AD_SET', 'splitting_rule', '', 'primary', 'N', '0', 'admin', now(), '', now(), '拆分规则:广告组');


-- CampaignCreateModeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (129, '广告系列创建模式', 'create_campaign', '0', 'admin', now(), '', now(), 'CampaignCreateModeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (260, 1, '新建广告系列', 'NEW_CAMPAIGN', 'create_campaign', '', 'primary', 'N', '0', 'admin', now(), '', now(), '新建广告系列');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (261, 2, '已有广告系列', 'OLD_CAMPAIGN', 'create_campaign', '', 'primary', 'N', '0', 'admin', now(), '', now(), '已有广告系列');


-- SucFailEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (130, '成功|失败', 'suc_fail', '0', 'admin', now(), '', now(), 'SucFailEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (263, 1, '成功', 'SUCCESS', 'suc_fail', '', 'primary', 'N', '0', 'admin', now(), '', now(), '成功');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (264, 2, '失败', 'FAIL', 'suc_fail', '', 'primary', 'N', '0', 'admin', now(), '', now(), '失败');


-- PlacementPlatformEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (131, '枚举：版位平台', 'placement_platform', '0', 'admin', now(), '', now(), 'PlacementPlatformEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (265, 1, 'FACEBOOK', 'FACEBOOK', 'placement_platform', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'FACEBOOK');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (266, 2, 'MESSENGER', 'MESSENGER', 'placement_platform', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'MESSENGER');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (267, 3, 'INSTAGRAM', 'INSTAGRAM', 'placement_platform', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'INSTAGRAM');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (268, 4, 'AUDIENCE_NETWORK', 'AUDIENCE_NETWORK', 'placement_platform', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'AUDIENCE_NETWORK');


-- AudiencesTypeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (132, '枚举：受众类型', 'audiences_type', '0', 'admin', now(), '', now(), 'AudiencesTypeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (269, 1, 'REGION_GROUP', 'REGION_GROUP', 'audiences_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '地区组');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (270, 2, 'DIRECTIONAL_PACKAGE', 'DIRECTIONAL_PACKAGE', 'audiences_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '定向包');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (271, 3, 'CREATIVE_GROUP', 'CREATIVE_GROUP', 'audiences_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '创意组');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (281, 4, 'ADVERTISING_TEMPLATE', 'ADVERTISING_TEMPLATE', 'audiences_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '广告模板');


-- AttributionConfigEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (133, '枚举：归因设置', 'attribution_config', '0', 'admin', now(), '', now(), 'AttributionConfigEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (272, 1, '点击后一天内', 'CLICK_ONE_DAY', 'attribution_config', '', 'primary', 'N', '0', 'admin', now(), '', now(), '点击后一天内');


-- DeliveryPlatformEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (134, '枚举：投放平台', 'delivery_platform', '0', 'admin', now(), '', now(), 'DeliveryPlatformEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (290, 1, 'Facebook', 'FB', 'delivery_platform', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook');




update sys_dict_data set dict_label = '默认' where  dict_code = 3;
update sys_dict_data set dict_label = 'FaceBook' where  dict_code = 203;



-- -- PlacementDynamicEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (141, '枚举：版位动态', 'placement_dynamic', '0', 'admin', now(), '', now(), 'PlacementDynamicEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (301, 1, 'Facebook 动态', 'FACEBOOK_DYNAMIC', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 动态');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (302, 1, 'Facebook 主页动态', 'FACEBOOK_HOMEPAGE_DYNAMIC', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 主页动态');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (303, 1, 'Facebook Marketplace', 'FACEBOOK_MARKETPLACE', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook Marketplace');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (304, 1, 'Facebook 视频动态', 'FACEBOOK_VIDEO_DYNAMIC', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 视频动态');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (305, 1, 'Facebook 右边栏', 'FACEBOOK_RIGHT_HAND_COLUMN', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 右边栏');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (306, 1, '发现Facebook 商家', 'FACEBOOK_EXPLORE_MERCHANTS', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), '发现Facebook 商家');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (307, 1, 'Instagram 动态', 'INSTAGRAM_DYNAMIC', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 动态');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (308, 1, 'Instagram 主页动态', 'INSTAGRAM_HOMEPAGE_DYNAMIC', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 主页动态');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (309, 1, 'Instagram 发现', 'INSTAGRAM_EXPLORE', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 发现');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (310, 1, 'Instagram 发现首页', 'INSTAGRAM_EXPLORE_HOMEPAGE', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 发现首页');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (311, 1, 'Messenger 收件箱', 'MESSENGER_INBOX', 'placement_dynamic', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Messenger 收件箱');


-- -- PlacementStoryReelsEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (142, '枚举：版位快拍和Reels', 'placement_story_reels', '0', 'admin', now(), '', now(), 'PlacementStoryReelsEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (321, 1, 'Facebook 快拍', 'FACEBOOK_STORY', 'placement_story_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 快拍');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (322, 1, 'Facebook Reels', 'FACEBOOK_REELS', 'placement_story_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook Reels');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (323, 1, 'Instagram 快拍', 'INSTAGRAM_STORY', 'placement_story_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 快拍');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (324, 1, 'Instagram Reels', 'INSTAGRAM_REELS', 'placement_story_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram Reels');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (325, 1, 'Messenger 快拍', 'MESSENGER_STORY', 'placement_story_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Messenger 快拍');


-- -- PlacementVideoReelsEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (143, '枚举：版位视频和Reels 插播广告', 'placement_video_reels', '0', 'admin', now(), '', now(), 'PlacementVideoReelsEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (331, 1, 'Facebook 视频插播位', 'FACEBOOK_VIDEO', 'placement_video_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 视频插播位');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (332, 1, 'Facebook Reels 内嵌广告', 'FACEBOOK_REELS', 'placement_video_reels', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook Reels 内嵌广告');


-- -- PlacementSearchResultEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (144, '枚举：版位-搜索结果', 'placement_search_result', '0', 'admin', now(), '', now(), 'PlacementSearchResultEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (341, 1, 'Facebook 搜索结果', 'FACEBOOK_SEARCH', 'placement_search_result', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Facebook 搜索结果');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (342, 1, 'Instagram 搜索结果', 'INSTAGRAM_SEARCH', 'placement_search_result', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Instagram 搜索结果');


-- -- PlacementMessageEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (145, '枚举：版位-消息', 'placement_message', '0', 'admin', now(), '', now(), 'PlacementMessageEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (351, 1, 'Messenger 赞助消息', 'SPONSORED_MESSAGES', 'placement_message', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Messenger 赞助消息');


-- -- PlacementAppAndWebEnums
-- INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (146, '枚举：版位-应用和网站', 'placement_app_and_web', '0', 'admin', now(), '', now(), 'PlacementAppAndWebEnums');
--
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (361, 1, 'Audience Network 原生、横幅和插屏版位', 'CLASSIC', 'placement_app_and_web', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Audience Network 原生、横幅和插屏版位');
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (362, 1, 'Audience Network 激励视频', 'REWARDED_VIDEO', 'placement_app_and_web', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'Audience Network 激励视频');

-- 删除掉上面的这些多创建出来的记录
-- DELETE FROM sys_dict_type WHERE dict_id IN (141, 142, 143, 144, 145, 146);
-- DELETE FROM sys_dict_data WHERE dict_code >= 301 AND dict_code <= 362;

-- TaskManagementStatusEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (147, '任务管理中心-状态', 'task_status', '0', 'admin', now(), '', now(), 'TaskManagementStatusEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (363, 1, '未开始', 'NO_EXECUTE', 'task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务管理中心-状态：提交');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (364, 2, '进行中', 'RUNNING', 'task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务管理中心-状态：进行中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (365, 3, '已完成', 'COMPLETE', 'task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务管理中心-状态：完成');

-- TaskDetailStatusEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (148, '任务明细-状态', 'task_detail_status', '0', 'admin', now(), '', now(), 'TaskDetailStatusEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (366, 1, '未开始', 'NO_EXECUTE', 'task_detail_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务明细-状态：默认');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (367, 2, '进行中', 'RUNNING', 'task_detail_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务明细-状态：进行中');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (368, 3, '已完成', 'COMPLETE', 'task_detail_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '任务明细-状态：完成');

-- AssetTypeEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (151, '素材文件类型：视频、图片', 'asset_type', '0', 'admin', now(), '', now(), 'AssetTypeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (371, 1, '图片', 'IMAGE', 'asset_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '素材文件-图片');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (372, 2, '视频', 'VIDEO', 'asset_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '素材文件-视频');

-- AdCreativeAssetKindsEnums
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (152, '枚举：广告创意素材格式枚举', 'ad_creative_asset_kinds', '0', 'admin', now(), '', now(), 'AdCreativeAssetKindsEnums');

-- suyh - 灵活暂时不做，同时也不返回给前端
-- INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
-- VALUES (381, 0, '灵活', 'FLEXIBLE', 'ad_creative_asset_kinds', '', 'primary', 'N', '0', 'admin', now(), '', now(), '灵活');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (382, 1, '单图片或视频', 'SINGLE_PIC_VIDEO', 'ad_creative_asset_kinds', '', 'primary', 'N', '0', 'admin', now(), '', now(), '单图片或视频');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (383, 2, '轮播', 'CAROUSEL', 'ad_creative_asset_kinds', '', 'primary', 'N', '0', 'admin', now(), '', now(), '轮播');


