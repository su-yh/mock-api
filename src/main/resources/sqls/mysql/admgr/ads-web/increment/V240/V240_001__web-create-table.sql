DROP TABLE IF EXISTS fb_ad_material_resource;
DROP TABLE IF EXISTS fb_material_detail_resource;
DROP TABLE IF EXISTS ad_material;
DROP TABLE IF EXISTS ad_material_folders;
DROP TABLE IF EXISTS fb_ad_material_relation;

-- fb素材指标
CREATE TABLE fb_ad_material_resource
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id     VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    ad_id                      VARCHAR(32) NOT NULL COMMENT '广告Id',
    type                       VARCHAR(32) NOT NULL COMMENT '素材类型',
    hash                       VARCHAR(32) NOT NULL COMMENT '素材hash',
    video_id                   VARCHAR(60) NULL COMMENT '视频Id',

    quality_ranking            VARCHAR(32) NULL comment '质量排名',
    engagement_rate_ranking    VARCHAR(32) NULL comment '互动率排名',
    conversion_rate_ranking    VARCHAR(32) NULL comment '转化率排名',

    spend                      DECIMAL(20,8) NULL comment '花费金额',
    impressions                INT NULL COMMENT '展示次数',
    reach                      INT NULL COMMENT '覆盖人数',
    clicks                     INT NULL COMMENT '点击量（全部）',
    ctr                        DECIMAL(20,8) NULL COMMENT '点击率（全部）',
    cpc                        DECIMAL(20,8) NULL COMMENT '单次点击费用（全部）',
    cpm                        DECIMAL(20,8) NULL COMMENT '千次展示费用',

    inline_link_clicks         INT NULL COMMENT '链接点击量',
    inline_link_click_ctr      DECIMAL(20,8) NULL COMMENT '链接点击率',
    frequency                  DECIMAL(20,8) NULL COMMENT '频次',
    cost_per_inline_link_click DECIMAL(20,8) NULL COMMENT '单次链接点击费用',
    landing_page_view          INT NULL COMMENT '落地页浏览量',
    effect                     VARCHAR(32) NULL COMMENT '成效',
    cost_per_effect            DECIMAL(20,8) NULL COMMENT '单次成效费用',

    created_at                 DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '广告素材表';


-- fb素材
CREATE TABLE fb_material_detail_resource
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id     VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    material_id                VARCHAR(60) NULL COMMENT '素材Id',
    name                       TEXT        NULL COMMENT '素材名',
    type                       VARCHAR(32) NOT NULL COMMENT '素材类型',
    hash                       VARCHAR(32) NOT NULL COMMENT '素材hash',
    permalink_url              TEXT        NULL COMMENT 'url',
    cover_image                TEXT        NULL COMMENT '封面图片',
    height                     INT(32)     NULL COMMENT '高',
    width                      INT(32)     NULL COMMENT '宽',
    original_height            INT(32)     NULL COMMENT '最初上传的图像的高度',
    original_width             INT(32)     NULL COMMENT '最初上传的图像的宽度',
    material_status            VARCHAR(32) NULL COMMENT '图像状态',
    created_at                 DATETIME   COMMENT '创建时间',
    updated_at                 DATETIME   COMMENT '更新时间'
) COMMENT '广告素材表详情';

-- 唯一索引
ALTER TABLE fb_material_detail_resource
    ADD UNIQUE INDEX uni_c_id(advertising_account_id,hash) USING BTREE;


-- 广告账户表添加状态字段
ALTER TABLE fb_advertising_account
    ADD COLUMN status VARCHAR(50) NOT NULL DEFAULT 'ENABLED' COMMENT '用户拉取数据开关状态' AFTER advertising_account_name;

-- 广告账户表添加状态字段
ALTER TABLE fb_ad_resource
    ADD COLUMN cover_image TEXT NULL COMMENT '封面' AFTER status;

-- 本地素材文件表
CREATE TABLE ad_material_folders
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    name                       VARCHAR(255)       NOT NULL COMMENT '文件夹名',
    parent_id                  BIGINT             COMMENT '父级文件夹ID（根文件夹为NULL）',
    level                      BIGINT             COMMENT '级数',
    created_by_id              BIGINT     NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT     DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (parent_id) REFERENCES ad_material_folders(id),
    CONSTRAINT fk_parent FOREIGN KEY (parent_id) REFERENCES ad_material_folders(id) ON DELETE CASCADE
) COMMENT '素材文件夹表';

-- 本地素材表
CREATE TABLE ad_material
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    name                       VARCHAR(255)       NOT NULL COMMENT '素材名',
    prefix                     VARCHAR(255)       COMMENT '前缀',
    url                        TEXT               NOT NULL COMMENT '路径',
    type                       VARCHAR(50)        COMMENT '素材类型',
    hash                       VARCHAR(255)       COMMENT '素材hash',
    size                       DECIMAL(30, 2)     COMMENT '素材大小（单位：B）',
    width                      BIGINT             COMMENT '素材宽',
    height                     BIGINT             COMMENT '素材高',
    designer                   VARCHAR(255)       COMMENT '设计师',
    duration                   DECIMAL(5, 2)      COMMENT '时长（单位：秒）',
    description                TEXT               COMMENT '素材描述',
    folder_id                  BIGINT             COMMENT '素材文件夹ID（关联ad_material_folders表）',
    permissions                VARCHAR(50)        COMMENT '权限',
    created_by_id              BIGINT             NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT             DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (folder_id) REFERENCES ad_material_folders(id)
) COMMENT '素材表';


-- 本地素材 和 广告 关系表
CREATE TABLE fb_ad_material_relation
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    material_id                BIGINT             COMMENT '素材id',
    ad_id                      VARCHAR(255)       COMMENT '广告id',
    created_by_id              BIGINT             NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT             DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '本地素材和广告关系表';


ALTER TABLE task_ad_detail_external_asset MODIFY COLUMN asset_id BIGINT NULL COMMENT '对应 fb_asset 表中的主键ID，当前只有 FACEBOOK';
