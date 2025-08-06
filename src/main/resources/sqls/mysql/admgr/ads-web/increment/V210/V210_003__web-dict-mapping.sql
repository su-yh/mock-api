CREATE TABLE sys_dict_data_mapping
(
    id                INT NOT NULL COMMENT 'id',
    dict_code         bigint(20) NULL DEFAULT NULL COMMENT '字典code',
    dict_sort         int(4) NULL DEFAULT NULL COMMENT '排序',
    group_key         VARCHAR(128) NULL DEFAULT NULL COMMENT '分组',
    group_description VARCHAR(128) NULL DEFAULT NULL COMMENT '分组描述',
    created           DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated           DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = '字典表映射';




INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (1, 401, 1, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标最大限度地提升应用安装量(应用推广)', '2024-08-13 11:45:16', '2024-08-13 12:24:23');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (2, 402, 2, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标链接点击量最大化(应用推广)', '2024-08-13 11:45:33', '2024-08-13 12:25:15');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (3, 403, 3, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标应用事件数量最大化(应用推广)', '2024-08-13 11:45:42', '2024-08-13 12:26:04');

INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (4, 401, 1, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标最大限度地提升应用安装量(应用推广)', '2024-08-13 11:45:16', '2024-08-13 12:24:23');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (5, 402, 2, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标链接点击量最大化(应用推广)', '2024-08-13 11:45:33', '2024-08-13 12:25:15');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (6, 403, 3, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标应用事件数量最大化(应用推广)', '2024-08-13 11:45:42', '2024-08-13 12:26:04');


INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (7, 401, 1, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_COST_CAP', '单次成效费用关联成效目标最大限度地提升应用安装量(应用推广)', '2024-08-13 11:45:16', '2024-08-13 12:24:23');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (8, 402, 2, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_COST_CAP', '单次成效费用关联成效目标链接点击量最大化(应用推广)', '2024-08-13 11:45:33', '2024-08-13 12:25:15');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (9, 403, 3, 'VALUE_OUTCOME_APP_PROMOTION|VALUE_COST_CAP', '单次成效费用关联成效目标应用事件数量最大化(应用推广)', '2024-08-13 11:45:42', '2024-08-13 12:26:04');


INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (11, 404, 1, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标落地页浏览量最大化(流量)', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (12, 402, 2, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标链接点击量最大化（默认）(流量)', '2024-08-13 11:45:33', '2024-08-13 11:45:33');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (13, 405, 3, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标单日独立覆盖人数最大化(流量)', '2024-08-13 11:45:42', '2024-08-13 11:45:44');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (15, 407, 5, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITHOUT_CAP', '最高数量关联成效目标目标展示次数最大化(流量)', '2024-08-13 11:46:00', '2024-08-13 11:46:03');

INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (16, 404, 1, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标落地页浏览量最大化(流量)', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (17, 402, 2, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标链接点击量最大化（默认）(流量)', '2024-08-13 11:45:33', '2024-08-13 11:45:33');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (18, 405, 3, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标单日独立覆盖人数最大化(流量)', '2024-08-13 11:45:42', '2024-08-13 11:45:44');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (20, 407, 5, 'VALUE_OUTCOME_TRAFFIC|VALUE_LOWEST_COST_WITH_BID_CAP', '竞价上限关联成效目标目标展示次数最大化(流量)', '2024-08-13 11:46:00', '2024-08-13 11:46:03');

INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (21, 404, 1, 'VALUE_OUTCOME_TRAFFIC|VALUE_COST_CAP', '单次成效费用关联成效目标落地页浏览量最大化(流量)', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (22, 402, 2, 'VALUE_OUTCOME_TRAFFIC|VALUE_COST_CAP', '单次成效费用关联成效目标链接点击量最大化（默认）(流量)', '2024-08-13 11:45:33', '2024-08-13 11:45:33');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (23, 405, 3, 'VALUE_OUTCOME_TRAFFIC|VALUE_COST_CAP', '单次成效费用关联成效目标单日独立覆盖人数最大化(流量)', '2024-08-13 11:45:42', '2024-08-13 11:45:44');

INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (24, 421, 1, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '立即安装', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (25, 422, 2, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '详细了解', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (26, 423, 3, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '去逛逛', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (27, 424, 4, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '玩游戏', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (28, 425, 5, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '订阅', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (29, 426, 6, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '更多视频', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (30, 427, 7, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '立即订购', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (31, 428, 8, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '立即预订', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (32, 429, 9, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '下载', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (33, 430, 10, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '立即收听', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (34, 431, 11, 'VALUE_OUTCOME_APP_PROMOTION|BEHAVIOR_ACTION', '立即注册', '2024-08-13 11:45:16', '2024-08-13 11:45:16');

INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (35, 432, 1, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即申请', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (36, 428, 2, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即预订', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (37, 433, 3, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即拨打', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (38, 434, 4, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '联系我们', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (39, 435, 5, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即捐款', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (40, 429, 6, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '下载', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (41, 436, 7, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '领取优惠', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (42, 437, 8, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即询价', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (43, 438, 9, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '查看场次', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (44, 422, 10, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '详细了解', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (45, 430, 11, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即收听', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (46, 427, 12, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即订购', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (47, 439, 13, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '预约时间', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (49, 441, 15, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '去逛逛', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (50, 431, 16, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '立即注册', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (51, 425, 17, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '订阅', '2024-08-13 11:45:16', '2024-08-13 11:45:16');
INSERT INTO sys_dict_data_mapping (id, dict_code, dict_sort, group_key, group_description, created, updated)
VALUES (52, 442, 18, 'VALUE_OUTCOME_TRAFFIC|BEHAVIOR_ACTION', '更多视频', '2024-08-13 11:45:16', '2024-08-13 11:45:16');




