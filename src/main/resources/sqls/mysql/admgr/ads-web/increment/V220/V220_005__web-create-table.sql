-- DROP TABLE IF EXISTS fb_personal_account_plus;
-- DROP TABLE IF EXISTS fb_advertising_account;
-- DROP TABLE IF EXISTS fb_data_scope;
-- DROP TABLE IF EXISTS fb_public_page;
-- DROP TABLE IF EXISTS fb_personal_advertising_mapping;
-- DROP TABLE IF EXISTS fb_personal_page_mapping;
-- DROP TABLE IF EXISTS fb_business_management_platform;
-- DROP TABLE IF EXISTS ad_promotional_link;
-- DROP TABLE IF EXISTS fb_promotion_app;
-- DROP TABLE IF EXISTS fb_advertising_app_mapping;
-- DROP TABLE IF EXISTS fb_sync_auth_record;

CREATE TABLE fb_personal_account_plus
(
    id                      BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    personal_account_id     VARCHAR(32)  NOT NULL COMMENT '个人账户ID',
    personal_account_name   VARCHAR(255) NOT NULL COMMENT '个人账户名称',
    personal_account_avatar TEXT COMMENT '个人账户头像URL',
    status                  VARCHAR(16)  NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    visible_range           VARCHAR(16)  NOT NULL DEFAULT 'ONESELF' COMMENT '可见范围枚举 ONESELF, TEAM',
    access_token            TEXT COMMENT 'token',
    token_status            VARCHAR(16)  NOT NULL DEFAULT 'VALID' COMMENT 'Token状态枚举 VALID, EXPIRED',
    granted_scopes          TEXT COMMENT '授予的权限',
    authorizer_id           BIGINT       NOT NULL COMMENT '授权人ID',
    last_auth_time          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    token_expiry_time       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权过期时间',
    created_by_id           BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id            BIGINT                DEFAULT NULL COMMENT '修改者ID',
    created_at              DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at              DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT 'FB个人账号管理表';

-- 唯一索引
ALTER TABLE fb_personal_account_plus
    ADD UNIQUE INDEX uni_p_a_id(personal_account_id, authorizer_id) USING BTREE;

-- 普通索引
ALTER TABLE fb_personal_account_plus
    ADD INDEX idx_status(status) USING BTREE;


CREATE TABLE fb_advertising_account
(
    id                       BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id   VARCHAR(32)  NOT NULL COMMENT '广告账户ID',
    advertising_account_name VARCHAR(255) NOT NULL COMMENT '广告账户名称',
    time_zone                VARCHAR(64)           DEFAULT NULL COMMENT '时区',
    currency                 VARCHAR(16)           DEFAULT NULL COMMENT '币种',
    account_status           VARCHAR(32)  NOT NULL COMMENT '广告账户状态枚举 AdAccountStatusEnums',
    disable_reason           VARCHAR(64)           DEFAULT NULL COMMENT '禁用原因',
    last_auth_time           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id            BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id             BIGINT                DEFAULT NULL COMMENT '修改者ID',
    created_at               DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at               DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT 'FB广告账号管理表';

-- 唯一索引
ALTER TABLE fb_advertising_account
    ADD UNIQUE INDEX uni_p_a_id(advertising_account_id) USING BTREE;

-- 普通索引
ALTER TABLE fb_advertising_account
    ADD INDEX idx_a_a_s(advertising_account_id, account_status) USING BTREE;


CREATE TABLE fb_public_page
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    page_id           VARCHAR(32)  NOT NULL COMMENT 'Facebook主页ID',
    page_name         VARCHAR(255) NOT NULL COMMENT '主页名称',
    page_type         VARCHAR(64)  NOT NULL COMMENT '主页类型',
    page_introduction VARCHAR(512) COMMENT '主页简介',
    page_avatar       TEXT COMMENT '主页头像URL',
    top_count         BIGINT                DEFAULT NULL COMMENT '点赞数',
    followers_count   BIGINT                DEFAULT NULL COMMENT '粉丝数',
    last_auth_time    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id     BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id      BIGINT                DEFAULT NULL COMMENT '修改者ID',
    created_at        DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at        DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT 'FB公共主页管理表';

-- 唯一索引
ALTER TABLE fb_public_page
    ADD UNIQUE INDEX uni_p_a_id(page_id) USING BTREE;

CREATE TABLE fb_personal_advertising_mapping
(
    id                 BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id   BIGINT NOT NULL COMMENT '个号数据库ID',
    ad_account_data_id BIGINT NOT NULL COMMENT '广告账数据库ID',
    created_by_id      BIGINT NOT NULL COMMENT '创建者ID'
) COMMENT 'FB个号和广告账号关联表';
-- 唯一索引
ALTER TABLE fb_personal_advertising_mapping
    ADD UNIQUE INDEX uni_p_a_id(personal_data_id, ad_account_data_id) USING BTREE;


CREATE TABLE fb_personal_page_mapping
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id BIGINT NOT NULL COMMENT '个号数据库ID',
    page_data_id     BIGINT NOT NULL COMMENT '主页数据库ID',
    created_by_id    BIGINT NOT NULL COMMENT '创建者ID'
) COMMENT 'FB个号和主页关联表';
-- 唯一索引
ALTER TABLE fb_personal_page_mapping
    ADD UNIQUE INDEX uni_p_p_id(personal_data_id, page_data_id) USING BTREE;



CREATE TABLE fb_data_scope
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    data_id       BIGINT      NOT NULL COMMENT '数据ID',
    permission_id BIGINT      NOT NULL COMMENT '角色权限id',
    source_table  VARCHAR(32) NOT NULL COMMENT '数据来源枚举',
    created_by_id BIGINT      NOT NULL COMMENT '创建者ID',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT 'FB数据权限表';

-- 唯一索引
ALTER TABLE fb_data_scope
    ADD UNIQUE INDEX uni_d_p_s(data_id, permission_id, source_table) USING BTREE;

CREATE TABLE fb_business_management_platform
(
    id                       BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    resource_id              BIGINT      NOT NULL COMMENT '资源ID',
    resource_type            VARCHAR(32) NOT NULL COMMENT '资源类型枚举 PERSONAL_ACCOUNT, ADVERTISING_ACCOUNT, PUBLIC_PAGE',
    business_management_id   VARCHAR(64) COMMENT '商务管理平台ID',
    business_management_name VARCHAR(255) COMMENT '商务管理平台名称',
    business_management_logo TEXT COMMENT '商务管理平台 Logo URL',
    authorizer_id            BIGINT      NOT NULL COMMENT '授权人ID',
    last_auth_time           DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id            BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id             BIGINT               DEFAULT NULL COMMENT '修改者ID',
    created_at               DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at               DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB商务管理平台';

-- 唯一索引
ALTER TABLE fb_business_management_platform
    ADD UNIQUE INDEX uni_r_r_b_id(resource_id, resource_type, business_management_id) USING BTREE;

CREATE TABLE ad_promotional_link
(
    id                       BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    link_name                VARCHAR(50) NOT NULL COMMENT '链接名称',
    link_type                VARCHAR(255) COMMENT '链接类型',
    link                     TEXT NOT NULL COMMENT '链接',
    ad_packages_id           BIGINT NOT NULL COMMENT '投放包',
    remark                   TEXT COMMENT '备注',
    visible_range            VARCHAR(50) NOT NULL COMMENT '可见范围',
    authorizer_id            BIGINT NOT NULL COMMENT '授权人ID',
    status                   VARCHAR(16)  NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    created_by_id            BIGINT NOT NULL COMMENT '创建者ID',
    created_at               DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at               DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB推广链接';

-- 普通索引
ALTER TABLE ad_promotional_link
    ADD INDEX idx_status(status) USING BTREE;

CREATE TABLE fb_promotion_app
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    app_id            VARCHAR(32)  NOT NULL COMMENT '推广应用Id',
    app_name          VARCHAR(256) NOT NULL COMMENT '推广应用名称',
    app_avatar        TEXT COMMENT '应用头像URL',
    app_store_details TEXT COMMENT '推广应用商店详情',
    last_auth_time    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    package_data_id   BIGINT                DEFAULT NULL COMMENT '投放包数据id',
    created_by_id     BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id      BIGINT                DEFAULT NULL COMMENT '修改者ID',
    created_at        DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at        DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB推广应用';

-- 唯一索引
ALTER TABLE fb_promotion_app
    ADD UNIQUE INDEX uni_app_id(app_id) USING BTREE;


CREATE TABLE fb_advertising_app_mapping
(
    id                 BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    ad_account_data_id BIGINT NOT NULL COMMENT '广告账号数据id',
    app_data_id        BIGINT NOT NULL COMMENT '推广应用数据id',
    created_by_id      BIGINT NOT NULL COMMENT '创建者ID'
)COMMENT 'FB广告账号和推广应用关联表';

-- 唯一索引
ALTER TABLE fb_advertising_app_mapping
    ADD UNIQUE INDEX uni_a_a_id(ad_account_data_id, app_data_id) USING BTREE;


CREATE TABLE fb_sync_auth_record
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    sign_uuid     VARCHAR(64) NOT NULL COMMENT '标志uuid',
    user_id       BIGINT      NOT NULL COMMENT '用户ID',
    type          VARCHAR(32) NOT NULL COMMENT '类型: 授权(授权或者新增授权), 手动(单条或者批量), 半自动批量(页面间隔1小时触发和手动点击刷新), 全自动(每天零点触发)',
    impact_scope  VARCHAR(32) NOT NULL DEFAULT 'PERSONAL' COMMENT '影响范围: 全局 GLOBAL 或者个人 PERSONAL',
    status        VARCHAR(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    meta_data     TEXT COMMENT '元数据',
    start_time    datetime NULL COMMENT '任务开始时间',
    finished_time datetime NULL COMMENT '任务结束时间',
    created_by_id BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id  BIGINT   DEFAULT NULL COMMENT '修改者ID',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB授权认证记录表';

-- 唯一索引
ALTER TABLE fb_sync_auth_record
    ADD UNIQUE INDEX uni_s_uuid(sign_uuid) USING BTREE;