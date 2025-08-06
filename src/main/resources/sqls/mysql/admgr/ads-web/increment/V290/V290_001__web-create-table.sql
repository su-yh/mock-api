-- DROP TABLE IF EXISTS fb_account_collect;


-- 广告账户收藏表
CREATE TABLE fb_account_collect
(
    id                      BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id  VARCHAR(32)  NOT NULL COMMENT '广告账户ID',
    user_id                 BIGINT  NOT NULL COMMENT '用户id',
    collection_time         DATETIME   DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
    CONSTRAINT unique_ad_account_user UNIQUE (advertising_account_id, user_id)
) COMMENT 'FB广告账户收藏表';

-- 任务中心增加版本号
ALTER TABLE task_management_ad
    ADD COLUMN version DECIMAL(10, 2) DEFAULT 1.0 COMMENT '版本号' after create_by_nick;
