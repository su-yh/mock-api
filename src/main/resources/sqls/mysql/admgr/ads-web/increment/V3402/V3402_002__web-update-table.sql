-- 如果有历史数据请执行这条sql
-- TRUNCATE TABLE parent_team_group_config;

-- 1. 删除索引
ALTER TABLE parent_team_group_config DROP INDEX uniq_channel;

-- 2. 添加字段 & 修改字段名和备注
ALTER TABLE parent_team_group_config
    CHANGE COLUMN group_keys group_key VARCHAR(20) COMMENT '群组（对应cds-pg中time_report_channel_conf.group_key）';
ALTER TABLE parent_team_group_config
    ADD COLUMN tg_token VARCHAR(100) COMMENT 'TG Token' AFTER group_key,
    ADD COLUMN chat_id VARCHAR(100) COMMENT 'Chat ID' AFTER tg_token,
    ADD COLUMN is_test_group TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是测试分组，0-否，1-是' AFTER chat_id;
ALTER TABLE parent_team_group_config
    MODIFY COLUMN parent_team_id BIGINT(20) NULL COMMENT '投放方ID';
-- 3. 添加索引
ALTER TABLE parent_team_group_config
    ADD UNIQUE INDEX uniq_parent_team_group_key (group_key);

select * from parent_team_group_config
