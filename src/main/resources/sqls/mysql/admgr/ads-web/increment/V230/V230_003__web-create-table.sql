-- DROP TABLE IF EXISTS authorization_expiration_warning;
-- DROP TABLE IF EXISTS task_campaign_resource;
-- DROP TABLE IF EXISTS task_campaign_resource_detail;
-- DROP TABLE IF EXISTS task_account_resource_detail;
-- delete from flyway_schema_history where installed_rank = '58';

CREATE TABLE authorization_expiration_warning
(
    id                       BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    personal_account_data_id BIGINT   NOT NULL COMMENT '个人账户ID',
    authorizer_id            BIGINT   NOT NULL COMMENT '授权用户ID',
    confirm_status           tinyint  NOT NULL comment '[0:未确认,1:已确认]',
    token_expiry_time        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权过期时间',
    created_by_id            BIGINT   NOT NULL COMMENT '创建者ID',
    update_by_id             BIGINT            DEFAULT NULL COMMENT '修改者ID',
    created_at               DATETIME          DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at               DATETIME          DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '个号授权过期提示表';

-- 唯一索引
ALTER TABLE authorization_expiration_warning
    ADD UNIQUE INDEX uni_p_id(personal_account_data_id) USING BTREE;

ALTER TABLE authorization_expiration_warning
    ADD INDEX idx_c_a_id(confirm_status, authorizer_id) USING BTREE;


ALTER TABLE fb_sync_auth_record RENAME TO task_account_resource;

ALTER TABLE task_account_resource
    ADD COLUMN batch_uuid VARCHAR(32) NULL COMMENT '任务批次uuid' after sign_uuid;

ALTER TABLE task_account_resource
    ADD COLUMN result VARCHAR(32) NULL COMMENT '结果：成功、失败' after status;

CREATE TABLE task_account_resource_detail
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    batch_uuid       VARCHAR(32) NOT NULL COMMENT '任务批次uuid',
    personal_data_id BIGINT      NOT NULL COMMENT '个号数据id',
    status           VARCHAR(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result           VARCHAR(32) NULL COMMENT '结果：成功、失败',
    result_detail    TEXT NULL COMMENT '详细结果，成功、失败详情',
    start_time       datetime NULL COMMENT '任务开始时间',
    finished_time    datetime NULL COMMENT '任务结束时间',
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at       DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB账号资源同步任务明细表';


CREATE TABLE task_campaign_resource
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    sign_uuid     VARCHAR(64) NOT NULL COMMENT '标志uuid',
    batch_uuid    VARCHAR(64) NULL COMMENT '任务批次uuid',
    user_id       BIGINT      NOT NULL COMMENT '用户ID',
    type          VARCHAR(32) NOT NULL COMMENT 'RefreshTriggerType 任务类型 MANUAL:手动(单条或者批量), SEMI_AUTO:半自动批量(页面间隔1小时触发和手动点击刷新), FULL_AUTO:全自动(每天零点触发)',
    impact_scope  VARCHAR(32) NOT NULL DEFAULT 'PERSONAL' COMMENT '影响范围: 全局 GLOBAL 或者个人 PERSONAL',
    status        VARCHAR(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result        VARCHAR(32) NULL COMMENT '结果：成功、失败',
    meta_data     TEXT COMMENT '元数据',
    start_time    datetime NULL COMMENT '任务开始时间',
    finished_time datetime NULL COMMENT '任务结束时间',
    created_by_id BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id  BIGINT               DEFAULT NULL COMMENT '修改者ID',
    created_at    DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at    DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告系列资源同步任务表';


CREATE TABLE task_campaign_resource_detail
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    batch_uuid    VARCHAR(64) NULL COMMENT '任务批次uuid',
    account_id    VARCHAR(32) NOT NULL COMMENT '广告账号id',
    status        VARCHAR(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result        VARCHAR(32) NULL COMMENT '结果：成功、失败',
    result_detail TEXT NULL COMMENT '详细结果，成功、失败详情',
    start_time    datetime NULL COMMENT '任务开始时间',
    finished_time datetime NULL COMMENT '任务结束时间',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告系列资源同步任务明细表';