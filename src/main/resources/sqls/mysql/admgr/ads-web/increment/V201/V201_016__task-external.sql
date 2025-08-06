-- DROP TABLE IF EXISTS task_ad_detail_external_creative;

CREATE TABLE task_ad_detail_external_creative
(
    uuid                VARCHAR(64) NOT NULL COMMENT 'id',
    owner_task_uuid        VARCHAR(64)         NOT NULL COMMENT '所属任务主键ID',
    owner_task_detail_uuid VARCHAR(64)  NOT NULL COMMENT '所属任务明细主键ID  与广告一一映射，唯一索引',

    person_id              VARCHAR(64)  NOT NULL COMMENT '个号ID',
    account_id             VARCHAR(64)  NOT NULL COMMENT '广告账户ID',

    asset_kinds            VARCHAR(32)  NOT NULL COMMENT '广告创意素材格式枚举：灵活、单图片或视频、轮播',
    name                   VARCHAR(256) NOT NULL COMMENT '创意名',
    result                 VARCHAR(32)  NULL COMMENT '任务结果：成功、失败',

    creative_id            VARCHAR(64)  NULL COMMENT 'facebook 创建成功返回的创意ID',
    asset_task_uuid_list   TEXT         NOT NULL COMMENT '关联的素材任务主键ID 列表',

    created                datetime DEFAULT CURRENT_TIMESTAMP,
    updated                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (uuid)
) ENGINE = INNODB COMMENT = '广告任务明细扩展：广告创意';

-- 唯一索引
ALTER TABLE task_ad_detail_external_creative
    ADD UNIQUE INDEX uni_uuid (owner_task_detail_uuid) USING BTREE;


-- DROP TABLE IF EXISTS task_ad_detail_external_asset;

CREATE TABLE task_ad_detail_external_asset
(
    uuid          varchar(64)   NOT NULL COMMENT 'id',
    owner_task_uuid varchar(64) NOT NULL COMMENT '所属任务主键ID',
    person_id     VARCHAR(64)   NOT NULL COMMENT '个号ID',
    account_id    VARCHAR(64)   NOT NULL COMMENT '广告账户ID',

    asset_id      BIGINT        NOT NULL COMMENT '对应 fb_asset 表中的主键ID，当前只有 FACEBOOK',
    type          VARCHAR(32)   NOT NULL COMMENT '素材类型：图片、视频',
    name          VARCHAR(256)  NOT NULL COMMENT '素材文件名',

    asset_url     VARCHAR(1000) NOT NULL COMMENT '素材存储路径，绝对路径，非http 的url。',
    cover_url     VARCHAR(1000) NULL COMMENT '视频封面图片存储路径，绝对路径，非http 的url。',

    image_hash    VARCHAR(64)   NULL COMMENT 'facebook 上传成功之后的图片hash（如果是视频，则为封面图片）。',
    image_url     VARCHAR(4000) NULL COMMENT 'facebook 上传成功之后的图片url（如果是视频，则为封面图片）',
    video_id      VARCHAR(64)   NULL COMMENT 'facebook 上传成功之后的视频id',
    video_status  VARCHAR(128)  NULL COMMENT '视频上传结果状态',

    result        VARCHAR(32)   NULL COMMENT '任务结果：成功、失败',
    result_detail   TEXT        NULL COMMENT '详细结果，成功、失败详情',

    created       datetime DEFAULT CURRENT_TIMESTAMP,
    updated       datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (uuid)
) ENGINE = INNODB COMMENT = '广告任务明细扩展：广告素材';

-- 普通索引
ALTER TABLE task_ad_detail_external_asset
    ADD INDEX idx_uuid (owner_task_uuid, account_id) USING BTREE;






