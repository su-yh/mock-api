-- 增加任务详情，同步的广告账户
ALTER TABLE task_account_detail_record
    ADD COLUMN ad_accounts INT DEFAULT 0 COMMENT '已同步的广告账号数';

-- 添加任务元数据
ALTER TABLE task_account_detail_record
    ADD COLUMN metadata TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '任务元数据';

-- 自动定义受众名称名字
ALTER TABLE fb_custom_audience
    MODIFY COLUMN custom_audience_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义受众名称';