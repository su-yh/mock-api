





-- DROP TABLE IF EXISTS task_management_ad;

CREATE TABLE task_management_ad
(
    uuid                VARCHAR(64) NOT NULL COMMENT 'id',
    source              varchar(32) NOT NULL COMMENT '平台：FB、GG 等',

    ad_app_category     varchar(32) NOT NULL COMMENT 'NORMAL：应用广告 | ADVANCED: 进阶赋能型应用广告',

    template_preview_id BIGINT      NOT NULL COMMENT '对应模板提交预览主键ID',

    ad_channel          VARCHAR(128) NOT NULL COMMENT '投放渠道',
    app_id              VARCHAR(64) NOT NULL COMMENT '推广应用id',
    app_name            VARCHAR(64) NULL COMMENT '推广应用名称',

    status              VARCHAR(32) NOT NULL COMMENT '任务状态：未开始、进行中、完成等..',
    result              VARCHAR(32) NULL COMMENT '任务结果：成功、失败',

    start_time          datetime NULL COMMENT '任务开始时间',
    finished_time       datetime NULL COMMENT '任务结束时间',

    create_by_id        BIGINT      NOT NULL COMMENT '创建者ID',
    create_by_nick      VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    created             datetime DEFAULT CURRENT_TIMESTAMP,
    updated             datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (uuid)
) ENGINE = INNODB COMMENT = '广告任务中心';

-- 唯一索引
ALTER TABLE task_management_ad
    ADD UNIQUE INDEX uni_tpid(template_preview_id) USING BTREE;
-- 索引
ALTER TABLE task_management_ad
    ADD INDEX idx_ssr(source, status, result) USING BTREE;
-- 索引
ALTER TABLE task_management_ad
    ADD INDEX idx_status(status) USING BTREE;


-- DROP TABLE IF EXISTS task_ad_detail;

CREATE TABLE task_ad_detail
(
    uuid                VARCHAR(64)  NOT NULL COMMENT 'uuid',
    parent_uuid         VARCHAR(64)  NULL DEFAULT '' COMMENT '父ID，这里主要是因为广告组的创建必须要有广告系列ID，广告的创建必须要有广告组。',
    task_uuid           VARCHAR(64)  NOT NULL COMMENT '对应广告任务中心的主键ID',

    person_id           VARCHAR(64)  NOT NULL COMMENT '个号ID',
    account_id          VARCHAR(64)  NOT NULL COMMENT '广告账号ID',
    page_id             VARCHAR(2000) NOT NULL COMMENT '主页ID',

    kinds               VARCHAR(32)  NOT NULL COMMENT '分类：广告系列、广告组、广告',
    source              VARCHAR(32)  NOT NULL COMMENT '平台：FB、GG 等',

    parent_campaign_id  VARCHAR(128) NULL COMMENT '所属广告系列ID，当kinds 为广告组和广告时有效',
    parent_ad_set_id    VARCHAR(128) NULL COMMENT '所属广告组ID，当kinds 为广告时有效',
    instance_id         VARCHAR(128) NULL COMMENT '调用平台返回的ID(广告系列ID、广告组ID、广告ID)',
    instance_name       VARCHAR(256) NOT NULL COMMENT '广告系列名|广告组名|广告名',
    instance_properties TEXT NULL COMMENT '实例属性',
    status              VARCHAR(32)  NULL COMMENT '状态：未开始、进行中、已完成',
    result              VARCHAR(32)  NULL COMMENT '结果：成功、失败',
    result_detail       TEXT         NULL COMMENT '详细结果，成功、失败详情',

    created             datetime DEFAULT CURRENT_TIMESTAMP,
    updated             datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (uuid)
) ENGINE = INNODB COMMENT = '广告任务中心，明细';

-- 索引
ALTER TABLE task_ad_detail
    ADD INDEX idx_task(task_uuid) USING BTREE;




