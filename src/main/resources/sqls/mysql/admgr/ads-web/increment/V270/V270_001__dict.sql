
-- 修改广告目标：销量 变成可用
UPDATE sys_dict_data SET list_class = 'primary',dict_sort = 0 WHERE dict_code = 503;

-- 销量枚举
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (525, 0, '销量广告', 'NORMAL', 'ad_sales_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '销量广告');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (526, 0, '进阶赋能型销量广告', 'ADVANCED', 'ad_sales_category', '', 'primary', 'N', '0', 'admin', now(), '', now(), '进阶赋能型销量广告');

-- 增加销量的成效目标枚举
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (408, 0, '转化量最大化', 'VALUE_OFFSITE_CONVERSIONS', 'outcome_goals', '', 'primary', 'N', '0', 'admin', '2025-01-07 14:05:27', '', '2025-01-07 14:05:27', '成效目标:转化量最大化');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (409, 1, '转化价值最大化', 'VALUE_VALUE', 'outcome_goals', '', 'primary', 'N', '0', 'admin', '2025-01-07 14:05:27', '', '2025-01-07 14:05:27', '成效目标:转化价值最大化');

-- 创意枚举
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (381, 3, '灵活', 'FLEXIBLE', 'ad_creative_asset_kinds', '', 'primary', 'N', '0', 'admin', '2025-01-09 10:19:56', '', '2025-01-09 10:19:56', '灵活');

-- 修改转化目标枚举
UPDATE sys_dict_data SET dict_sort = 1, dict_label = '网站', dict_value = 'VALUE_WEBSITE', dict_type = 'conversion_position', css_class = '', list_class = 'primary', is_default = 'N', status = '0', create_by = 'admin', create_time = '2024-08-09 16:07:21', update_by = '', update_time = '2024-08-09 16:07:21', remark = '转化发生位置:网站' WHERE dict_code = 385;

-- 修改枚举分组
UPDATE sys_dict_data_mapping SET dict_code = 401, dict_sort = 1, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标最大限度地提升应用安装量(应用推广)', created = '2024-08-13 11:45:16', updated = '2024-08-13 12:24:23' WHERE id = 1;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标链接点击量最大化(应用推广)', created = '2024-08-13 11:45:33', updated = '2024-08-13 12:25:15' WHERE id = 2;
UPDATE sys_dict_data_mapping SET dict_code = 403, dict_sort = 3, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标应用事件数量最大化(应用推广)', created = '2024-08-13 11:45:42', updated = '2024-08-13 12:26:04' WHERE id = 3;
UPDATE sys_dict_data_mapping SET dict_code = 401, dict_sort = 1, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标最大限度地提升应用安装量(应用推广)', created = '2024-08-13 11:45:16', updated = '2024-08-13 12:24:23' WHERE id = 4;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标链接点击量最大化(应用推广)', created = '2024-08-13 11:45:33', updated = '2024-08-13 12:25:15' WHERE id = 5;
UPDATE sys_dict_data_mapping SET dict_code = 403, dict_sort = 3, group_key = 'VALUE_APP|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标应用事件数量最大化(应用推广)', created = '2024-08-13 11:45:42', updated = '2024-08-13 12:26:04' WHERE id = 6;
UPDATE sys_dict_data_mapping SET dict_code = 401, dict_sort = 1, group_key = 'VALUE_APP|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标最大限度地提升应用安装量(应用推广)', created = '2024-08-13 11:45:16', updated = '2024-08-13 12:24:23' WHERE id = 7;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_APP|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标链接点击量最大化(应用推广)', created = '2024-08-13 11:45:33', updated = '2024-08-13 12:25:15' WHERE id = 8;
UPDATE sys_dict_data_mapping SET dict_code = 403, dict_sort = 3, group_key = 'VALUE_APP|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标应用事件数量最大化(应用推广)', created = '2024-08-13 11:45:42', updated = '2024-08-13 12:26:04' WHERE id = 9;
UPDATE sys_dict_data_mapping SET dict_code = 404, dict_sort = 1, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标落地页浏览量最大化(流量)', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 11;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标链接点击量最大化（默认）(流量)', created = '2024-08-13 11:45:33', updated = '2024-08-13 11:45:33' WHERE id = 12;
UPDATE sys_dict_data_mapping SET dict_code = 405, dict_sort = 3, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标单日独立覆盖人数最大化(流量)', created = '2024-08-13 11:45:42', updated = '2024-08-13 11:45:44' WHERE id = 13;
UPDATE sys_dict_data_mapping SET dict_code = 407, dict_sort = 5, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITHOUT_CAP', group_description = '最高数量关联成效目标目标展示次数最大化(流量)', created = '2024-08-13 11:46:00', updated = '2024-08-13 11:46:03' WHERE id = 15;
UPDATE sys_dict_data_mapping SET dict_code = 404, dict_sort = 1, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标落地页浏览量最大化(流量)', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 16;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标链接点击量最大化（默认）(流量)', created = '2024-08-13 11:45:33', updated = '2024-08-13 11:45:33' WHERE id = 17;
UPDATE sys_dict_data_mapping SET dict_code = 405, dict_sort = 3, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标单日独立覆盖人数最大化(流量)', created = '2024-08-13 11:45:42', updated = '2024-08-13 11:45:44' WHERE id = 18;
UPDATE sys_dict_data_mapping SET dict_code = 407, dict_sort = 5, group_key = 'VALUE_WEBSITE|VALUE_LOWEST_COST_WITH_BID_CAP', group_description = '竞价上限关联成效目标目标展示次数最大化(流量)', created = '2024-08-13 11:46:00', updated = '2024-08-13 11:46:03' WHERE id = 20;
UPDATE sys_dict_data_mapping SET dict_code = 404, dict_sort = 1, group_key = 'VALUE_WEBSITE|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标落地页浏览量最大化(流量)', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 21;
UPDATE sys_dict_data_mapping SET dict_code = 402, dict_sort = 2, group_key = 'VALUE_WEBSITE|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标链接点击量最大化（默认）(流量)', created = '2024-08-13 11:45:33', updated = '2024-08-13 11:45:33' WHERE id = 22;
UPDATE sys_dict_data_mapping SET dict_code = 405, dict_sort = 3, group_key = 'VALUE_WEBSITE|VALUE_COST_CAP', group_description = '单次成效费用关联成效目标单日独立覆盖人数最大化(流量)', created = '2024-08-13 11:45:42', updated = '2024-08-13 11:45:44' WHERE id = 23;
UPDATE sys_dict_data_mapping SET dict_code = 421, dict_sort = 1, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '立即安装', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 24;
UPDATE sys_dict_data_mapping SET dict_code = 422, dict_sort = 2, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '详细了解', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 25;
UPDATE sys_dict_data_mapping SET dict_code = 423, dict_sort = 3, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '去逛逛', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 26;
UPDATE sys_dict_data_mapping SET dict_code = 424, dict_sort = 4, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '玩游戏', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 27;
UPDATE sys_dict_data_mapping SET dict_code = 425, dict_sort = 5, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '订阅', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 28;
UPDATE sys_dict_data_mapping SET dict_code = 426, dict_sort = 6, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '更多视频', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 29;
UPDATE sys_dict_data_mapping SET dict_code = 427, dict_sort = 7, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '立即订购', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 30;
UPDATE sys_dict_data_mapping SET dict_code = 428, dict_sort = 8, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '立即预订', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 31;
UPDATE sys_dict_data_mapping SET dict_code = 429, dict_sort = 9, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '下载', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 32;
UPDATE sys_dict_data_mapping SET dict_code = 430, dict_sort = 10, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '立即收听', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 33;
UPDATE sys_dict_data_mapping SET dict_code = 431, dict_sort = 11, group_key = 'VALUE_APP|BEHAVIOR_ACTION', group_description = '立即注册', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 34;
UPDATE sys_dict_data_mapping SET dict_code = 432, dict_sort = 1, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即申请', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 35;
UPDATE sys_dict_data_mapping SET dict_code = 428, dict_sort = 2, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即预订', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 36;
UPDATE sys_dict_data_mapping SET dict_code = 433, dict_sort = 3, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即拨打', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 37;
UPDATE sys_dict_data_mapping SET dict_code = 434, dict_sort = 4, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '联系我们', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 38;
UPDATE sys_dict_data_mapping SET dict_code = 435, dict_sort = 5, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即捐款', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 39;
UPDATE sys_dict_data_mapping SET dict_code = 429, dict_sort = 6, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '下载', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 40;
UPDATE sys_dict_data_mapping SET dict_code = 436, dict_sort = 7, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '领取优惠', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 41;
UPDATE sys_dict_data_mapping SET dict_code = 437, dict_sort = 8, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即询价', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 42;
UPDATE sys_dict_data_mapping SET dict_code = 438, dict_sort = 9, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '查看场次', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 43;
UPDATE sys_dict_data_mapping SET dict_code = 422, dict_sort = 10, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '详细了解', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 44;
UPDATE sys_dict_data_mapping SET dict_code = 430, dict_sort = 11, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即收听', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 45;
UPDATE sys_dict_data_mapping SET dict_code = 427, dict_sort = 12, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即订购', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 46;
UPDATE sys_dict_data_mapping SET dict_code = 439, dict_sort = 13, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '预约时间', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 47;
UPDATE sys_dict_data_mapping SET dict_code = 441, dict_sort = 15, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '去逛逛', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 49;
UPDATE sys_dict_data_mapping SET dict_code = 431, dict_sort = 16, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '立即注册', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 50;
UPDATE sys_dict_data_mapping SET dict_code = 425, dict_sort = 17, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '订阅', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 51;
UPDATE sys_dict_data_mapping SET dict_code = 442, dict_sort = 18, group_key = 'VALUE_WEBSITE|BEHAVIOR_ACTION', group_description = '更多视频', created = '2024-08-13 11:45:16', updated = '2024-08-13 11:45:16' WHERE id = 52;

-- 增加销量专属成效目标
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (53, 408, 1, 'VALUE_OUTCOME_SALES|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标转化量最大化（销量）（默认）', '2025-01-07 11:45:16', '2025-01-07 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (54, 409, 2, 'VALUE_OUTCOME_SALES|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标转化价值最大化（销量）', '2025-01-07 11:45:16', '2025-01-07 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (55, 408, 1, 'VALUE_OUTCOME_SALES|VALUE_COST_CAP', '单次成效费用关联成效目标转化量最大化（销量）（默认）', '2025-01-07 11:45:16', '2025-01-07 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (56, 408, 1, 'VALUE_OUTCOME_SALES|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标转化量最大化（销量）（默认）', '2025-01-07 11:45:16', '2025-01-07 11:45:16');

-- 修改归因枚举
UPDATE sys_dict_data SET dict_sort = 1, dict_label = '点击后一天内', dict_value = 'CLICK_ONE_DAY', dict_type = 'click_attribution_config', css_class = '', list_class = 'primary', is_default = 'N', status = '0', create_by = 'admin', create_time = '2024-07-31 09:53:40', update_by = '', update_time = '2024-07-31 09:53:40', remark = '点击后一天内' WHERE dict_code = 272;

-- 添加归因枚举
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (273, 2, '点击后七天内', 'CLICK_SEVEN_DAY', 'click_attribution_config', '', 'primary', 'N', '0', 'admin', '2025-01-08 17:24:02', '', '2025-01-08 17:24:02', '点击后七天内');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (274, 1, '互动观看后一天内', 'INTERACTIVE_VIEW_ONE_DAY', 'interactive_view_attribution_config', '', 'primary', 'N', '0', 'admin', '2025-01-08 17:24:03', '', '2025-01-08 17:24:03', '互动观看后一天内');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (276, 1, '浏览后一天内', 'BROWSE_ONE_DAY', 'browse_attribution_config', '', 'primary', 'N', '0', 'admin', '2025-01-08 17:24:03', '', '2025-01-08 17:24:03', '浏览后一天内');
