
-- FB广告系列
ALTER TABLE fb_created_campaign
    ADD COLUMN key_value varchar(128) NULL;


ALTER TABLE fb_created_campaign
    MODIFY COLUMN campaign_id varchar(64) COMMENT '广告系列ID';

