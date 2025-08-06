-- 广告资源表增加创意id和创意名

ALTER TABLE fb_ad_resource
    ADD COLUMN creative_id VARCHAR(32) COMMENT '创意id' AFTER campaign_id;

ALTER TABLE fb_ad_resource
    ADD COLUMN creative_name VARCHAR(255) COMMENT '创意名' AFTER creative_id;

-- 添加联合索引
ALTER TABLE fb_ad_resource
    ADD INDEX idx_creative_creative (creative_id, creative_name);

-- 广告系列资源任务
ALTER TABLE task_campaign_record
    ADD COLUMN `category` VARCHAR(32) DEFAULT NULL COMMENT "任务记录类别";

ALTER TABLE task_campaign_detail_record
    MODIFY COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT '主键ID';

-- 更新同步任务的资源类别
UPDATE task_campaign_record
SET `category` = 'SYNC_RESOURCE'
WHERE `category` is null;

