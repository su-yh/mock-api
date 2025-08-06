/*
 Navicat Premium Dump SQL

 Source Server         : ad_mgr_business
 Source Server Type    : MySQL
 Source Server Version : 90200 (9.2.0)
 Source Host           : localhost:3306
 Source Schema         : ad_mgr_business

 Target Server Type    : MySQL
 Target Server Version : 90200 (9.2.0)
 File Encoding         : 65001

 Date: 11/03/2025 18:48:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad_creative_group
-- ----------------------------

CREATE TABLE ad_creative_group
(
    id                  bigint      NOT NULL AUTO_INCREMENT,
    owner_user_id       bigint      NOT NULL COMMENT '所属用户id',
    delete_flag         bigint      NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    name                varchar(64) NOT NULL COMMENT '创意名称，用户维度下唯一',
    objective           varchar(50) NOT NULL COMMENT '广告目标',
    conversion_position varchar(50) DEFAULT NULL COMMENT '转化发生位置',
    creative_properties text        NOT NULL COMMENT '整个创意信息的完整json 格式数据',
    create_by_id        bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick      varchar(64) NOT NULL COMMENT '创建者昵称',
    created             datetime    DEFAULT CURRENT_TIMESTAMP,
    updated             datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uid_name (owner_user_id, name, delete_flag) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告创意表';

-- ----------------------------
-- Table structure for ad_material
-- ----------------------------

CREATE TABLE ad_material
(
    id            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    name          varchar(255) NOT NULL COMMENT '素材名',
    prefix        varchar(255)      DEFAULT NULL COMMENT '前缀',
    url           text         NOT NULL COMMENT '路径',
    cover         varchar(255)      DEFAULT NULL COMMENT '封面',
    type          varchar(50)       DEFAULT NULL COMMENT '素材类型',
    hash          varchar(255)      DEFAULT NULL COMMENT '素材hash',
    size          decimal(30, 2)    DEFAULT NULL COMMENT '素材大小（单位：B）',
    width         bigint            DEFAULT NULL COMMENT '素材宽',
    height        bigint            DEFAULT NULL COMMENT '素材高',
    designer      varchar(255)      DEFAULT NULL COMMENT '设计师',
    duration      decimal(5, 2)     DEFAULT NULL COMMENT '时长（单位：秒）',
    description   text COMMENT '素材描述',
    folder_id     bigint            DEFAULT NULL COMMENT '素材文件夹ID（关联ad_material_folders表）',
    permissions   varchar(50)       DEFAULT NULL COMMENT '权限',
    created_by_id bigint       NOT NULL COMMENT '创建者ID',
    update_by_id  bigint            DEFAULT NULL COMMENT '修改者ID',
    created       timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY folder_id (folder_id),
    CONSTRAINT ad_material_ibfk_1 FOREIGN KEY (folder_id) REFERENCES ad_material_folders (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='素材表';

-- ----------------------------
-- Table structure for ad_material_folders
-- ----------------------------

CREATE TABLE ad_material_folders
(
    id            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    name          varchar(255) NOT NULL COMMENT '文件夹名',
    parent_id     bigint            DEFAULT NULL COMMENT '父级文件夹ID（根文件夹为NULL）',
    level         bigint            DEFAULT NULL COMMENT '级数',
    created_by_id bigint       NOT NULL COMMENT '创建者ID',
    update_by_id  bigint            DEFAULT NULL COMMENT '修改者ID',
    created       timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY fk_parent (parent_id),
    CONSTRAINT ad_material_folders_ibfk_1 FOREIGN KEY (parent_id) REFERENCES ad_material_folders (id),
    CONSTRAINT fk_parent FOREIGN KEY (parent_id) REFERENCES ad_material_folders (id) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='素材文件夹表';

-- ----------------------------
-- Table structure for ad_promotional_link
-- ----------------------------

CREATE TABLE ad_promotional_link
(
    id             bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    link_name      varchar(50) NOT NULL COMMENT '链接名称',
    link_type      varchar(255)         DEFAULT NULL COMMENT '链接类型',
    link           text        NOT NULL COMMENT '链接',
    ad_packages_id bigint      NOT NULL COMMENT '投放包',
    remark         text COMMENT '备注',
    visible_range  varchar(50) NOT NULL COMMENT '可见范围',
    authorizer_id  bigint      NOT NULL COMMENT '授权人ID',
    status         varchar(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    created_by_id  bigint      NOT NULL COMMENT '创建者ID',
    created        timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated        timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_status (status) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB推广链接';

-- ----------------------------
-- Table structure for ad_template_draft
-- ----------------------------

CREATE TABLE ad_template_draft
(
    id                       bigint      NOT NULL AUTO_INCREMENT,
    owner_user_id            bigint      NOT NULL COMMENT '所属用户id',
    team_id                  bigint      NOT NULL COMMENT '所属项目团队ID',
    region_group_list        text COMMENT '地区组详情列表，以json 格式存储',
    targeting_list           text COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list      text COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties      text COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    campaign_name            varchar(255) DEFAULT NULL COMMENT '广告系列名',
    advertise_content        text COMMENT '投放内容',
    ad_set_name              varchar(255) DEFAULT NULL COMMENT '广告组名',
    creative_properties      text COMMENT '创意设置',
    budget_advanced          text COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal            text COMMENT '出价与预算(应用广告)',
    placement_properties     text COMMENT '版位',
    splitting_rule           text COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list text COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page text COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    create_by_id             bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick           varchar(64) NOT NULL COMMENT '创建者昵称',
    created                  datetime     DEFAULT CURRENT_TIMESTAMP,
    updated                  datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uid (owner_user_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告模板草稿';

-- ----------------------------
-- Table structure for ad_template_formal
-- ----------------------------

CREATE TABLE ad_template_formal
(
    id                       bigint      NOT NULL AUTO_INCREMENT,
    owner_user_id            bigint      NOT NULL COMMENT '所属用户id',
    team_id                  bigint      NOT NULL COMMENT '所属项目团队ID',
    name                     varchar(64) NOT NULL COMMENT '模板名称',
    template_described       text COMMENT '模板描述',
    delete_flag              bigint      NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    region_group_list        text COMMENT '地区组详情列表，以json 格式存储',
    targeting_list           text COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list      text COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties      text COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    campaign_name            varchar(255) DEFAULT NULL COMMENT '广告系列名',
    advertise_content        text COMMENT '投放内容',
    ad_set_name              varchar(255) DEFAULT NULL COMMENT '广告组名',
    creative_properties      text COMMENT '创意设置',
    budget_advanced          text COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal            text COMMENT '出价与预算(应用广告)',
    placement_properties     text COMMENT '版位',
    splitting_rule           text COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list text COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page text COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    create_by_id             bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick           varchar(64) NOT NULL COMMENT '创建者昵称',
    created                  datetime     DEFAULT CURRENT_TIMESTAMP,
    updated                  datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uid_name (owner_user_id, name, delete_flag) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告模板表';

-- ----------------------------
-- Table structure for ad_template_preview
-- ----------------------------

CREATE TABLE ad_template_preview
(
    id                       bigint      NOT NULL AUTO_INCREMENT,
    owner_user_id            bigint      NOT NULL COMMENT '所属用户id',
    team_id                  bigint      NOT NULL COMMENT '所属项目团队ID',
    delete_flag              bigint      NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    region_group_list        text COMMENT '地区组详情列表，以json 格式存储',
    targeting_list           text COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list      text COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties      text COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    campaign_name            varchar(255) DEFAULT NULL COMMENT '广告系列名',
    advertise_content        text COMMENT '投放内容',
    ad_set_name              varchar(255) DEFAULT NULL COMMENT '广告组名',
    creative_properties      text COMMENT '创意设置',
    budget_advanced          text COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal            text COMMENT '出价与预算(应用广告)',
    placement_properties     text COMMENT '版位',
    splitting_rule           text COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list text COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page text COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    objective                varchar(64)  DEFAULT NULL COMMENT '广告目标：应用推广，枚举值：VALUE_OUTCOME_APP_PROMOTION 流量，枚举值: VALUE_OUTCOME_TRAFFIC',
    create_by_id             bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick           varchar(64) NOT NULL COMMENT '创建者昵称',
    created                  datetime     DEFAULT CURRENT_TIMESTAMP,
    updated                  datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    KEY idx_uid_name (owner_user_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告模板预览表';

-- ----------------------------
-- Table structure for authorization_expiration_warning
-- ----------------------------

CREATE TABLE authorization_expiration_warning
(
    id                       bigint    NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    personal_account_data_id bigint    NOT NULL COMMENT '个人账户ID',
    authorizer_id            bigint    NOT NULL COMMENT '授权用户ID',
    confirm_status           tinyint   NOT NULL COMMENT '[0:未确认,1:已确认]',
    token_expiry_time        datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权过期时间',
    created_by_id            bigint    NOT NULL COMMENT '创建者ID',
    update_by_id             bigint             DEFAULT NULL COMMENT '修改者ID',
    created                  timestamp NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                  timestamp NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_id (personal_account_data_id) USING BTREE,
    KEY idx_c_a_id (confirm_status, authorizer_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='个号授权过期提示表';

-- ----------------------------
-- Table structure for fb_account_collect
-- ----------------------------

CREATE TABLE fb_account_collect
(
    id                     bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id varchar(32) NOT NULL COMMENT '广告账户ID',
    user_id                bigint      NOT NULL COMMENT '用户id',
    collection_time        datetime         DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
    created                timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated                timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_ad_account_user (advertising_account_id, user_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告账户收藏表';

-- ----------------------------
-- Table structure for fb_account_convert_event
-- ----------------------------

CREATE TABLE fb_account_convert_event
(
    id                     bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    event_id               varchar(32)  NOT NULL COMMENT '像素Id',
    event_name             varchar(255) NOT NULL COMMENT '像素名字',
    advertising_account_id varchar(32)  NOT NULL COMMENT '广告账户ID',
    business_management_id varchar(32)       DEFAULT NULL COMMENT 'BM_ID',
    custom_event_type      varchar(32)  NOT NULL COMMENT '事件类型',
    rule                   text COMMENT '规则',
    data_sources           text COMMENT '数据来源id',
    created_by_id          bigint       NOT NULL COMMENT '创建者ID',
    update_by_id           bigint            DEFAULT NULL COMMENT '修改者ID',
    created                timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    updated                timestamp    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告账户转化事件表';

-- ----------------------------
-- Table structure for fb_account_pixel_code
-- ----------------------------

CREATE TABLE fb_account_pixel_code
(
    id                     bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    pixel_id               varchar(32)  NOT NULL COMMENT '像素Id',
    pixel_name             varchar(255) NOT NULL COMMENT '像素名字',
    advertising_account_id varchar(32)  NOT NULL COMMENT '广告账户ID',
    created_by_id          bigint       NOT NULL COMMENT '创建者ID',
    update_by_id           bigint            DEFAULT NULL COMMENT '修改者ID',
    created                timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    updated                timestamp    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告账户像素代码表';

-- ----------------------------
-- Table structure for fb_ad_campaign
-- ----------------------------

CREATE TABLE fb_ad_campaign
(
    id              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    package_data_id bigint    NOT NULL COMMENT '投放包数据id',
    team            varchar(20)    DEFAULT NULL COMMENT '投放团队',
    account_id      varchar(20)    DEFAULT NULL COMMENT '账号ID',
    keywords        varchar(20)    DEFAULT NULL COMMENT '关键字',
    campaign_id     varchar(20)    DEFAULT NULL COMMENT '广告系列ID',
    campaign_name   varchar(255)   DEFAULT NULL COMMENT '广告系列名称',
    campaign_type   varchar(255)   DEFAULT NULL COMMENT '广告系列类型',
    type            int            DEFAULT NULL COMMENT '广告系列类[1:3A,2:非3A]',
    status          varchar(50)    DEFAULT NULL COMMENT '广告系列状态',
    account_status  int            DEFAULT NULL COMMENT '广告账户状态',
    created         timestamp NULL DEFAULT NULL COMMENT '创建时间',
    created_id      int            DEFAULT NULL COMMENT '创建者用户ID',
    created_name    varchar(255)   DEFAULT NULL COMMENT '创建者',
    updated         timestamp NULL DEFAULT NULL COMMENT '修改时间',
    updated_id      int            DEFAULT NULL,
    updated_name    varchar(255)   DEFAULT NULL,
    dates           int            DEFAULT NULL COMMENT '日期',
    team_id         int            DEFAULT NULL COMMENT '项目团队ID',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='创建的FB广告系列v2';

-- ----------------------------
-- Table structure for fb_ad_campaign_relation
-- ----------------------------

CREATE TABLE fb_ad_campaign_relation
(
    id               bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id bigint      NOT NULL COMMENT '个号数据Id',
    campaign_id      varchar(32) NOT NULL COMMENT '广告系列Id',
    package_data_id  bigint           DEFAULT NULL COMMENT '投放包数据Id',
    team_id          bigint           DEFAULT NULL COMMENT '项目团队Id',
    delete_flag      bigint           DEFAULT '0',
    created_by_id    bigint      NOT NULL COMMENT '创建者ID',
    update_by_id     bigint           DEFAULT NULL COMMENT '修改者ID',
    created          timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated          timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_c_id (personal_data_id, campaign_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告系列关联表';

-- ----------------------------
-- Table structure for fb_ad_campaign_resource
-- ----------------------------

CREATE TABLE fb_ad_campaign_resource
(
    id                         bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    campaign_id                varchar(32) NOT NULL COMMENT '广告系列Id',
    campaign_name              text        NOT NULL COMMENT '广告系列名称',
    status                     varchar(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    effective_status           varchar(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     varchar(32) NOT NULL COMMENT '广告账户ID',
    objective                  varchar(64) NOT NULL COMMENT '广告目标',
    daily_budget               decimal(20, 8)       DEFAULT NULL COMMENT '单日预算',
    lifetime_budget            decimal(20, 8)       DEFAULT NULL COMMENT '总预算',
    bid_strategy               varchar(64)          DEFAULT NULL COMMENT '竞价策略',
    start_time                 datetime             DEFAULT NULL COMMENT '排期开始时间',
    end_time                   datetime             DEFAULT NULL COMMENT '排期结束时间',
    attribution_config         varchar(128)         DEFAULT NULL COMMENT '归因设置',
    spend                      decimal(20, 8)       DEFAULT NULL COMMENT '花费金额',
    impressions                int                  DEFAULT NULL COMMENT '展示次数',
    reach                      int                  DEFAULT NULL COMMENT '覆盖人数',
    clicks                     int                  DEFAULT NULL COMMENT '点击量',
    ctr                        decimal(20, 8)       DEFAULT NULL COMMENT '点击率',
    cpc                        decimal(20, 8)       DEFAULT NULL COMMENT '单次链接点击费用(全部)',
    cpm                        decimal(20, 8)       DEFAULT NULL COMMENT '千次展示费用',
    inline_link_clicks         int                  DEFAULT NULL COMMENT '链接点击量',
    inline_link_click_ctr      decimal(20, 8)       DEFAULT NULL COMMENT '链接点击率',
    frequency                  decimal(20, 8)       DEFAULT NULL COMMENT '频次',
    cost_per_inline_link_click decimal(20, 8)       DEFAULT NULL COMMENT '单次链接点击费用',
    landing_page_view          int                  DEFAULT NULL COMMENT '落地页浏览量',
    effect                     varchar(32)          DEFAULT NULL COMMENT '成效',
    cost_per_effect            decimal(20, 8)       DEFAULT NULL COMMENT '单次成效费用',
    campaign_properties        text        NOT NULL COMMENT '广告系列属性',
    campaign_created        datetime             DEFAULT NULL COMMENT '广告系列创建日期',
    campaign_updated        datetime             DEFAULT NULL COMMENT '广告系列修改日期',
    created_by_id              bigint      NOT NULL COMMENT '创建者ID',
    update_by_id               bigint               DEFAULT NULL COMMENT '修改者ID',
    created                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_c_id (campaign_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告系列资源表';

-- ----------------------------
-- Table structure for fb_ad_material_relation
-- ----------------------------

CREATE TABLE fb_ad_material_relation
(
    id                     bigint    NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    material_id            bigint         DEFAULT NULL COMMENT '素材id',
    ad_id                  varchar(255)   DEFAULT NULL COMMENT '广告id',
    advertising_account_id text COMMENT '广告账户',
    created_by_id          bigint    NOT NULL COMMENT '创建者ID',
    update_by_id           bigint         DEFAULT NULL COMMENT '修改者ID',
    created                timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated                timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='本地素材和广告关系表';

-- ----------------------------
-- Table structure for fb_ad_material_resource
-- ----------------------------

CREATE TABLE fb_ad_material_resource
(
    id                         bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id     varchar(32) NOT NULL COMMENT '广告账户ID',
    ad_id                      varchar(32) NOT NULL COMMENT '广告Id',
    type                       varchar(32) NOT NULL COMMENT '素材类型',
    hash                       varchar(32) NOT NULL COMMENT '素材hash',
    video_id                   varchar(60)      DEFAULT NULL COMMENT '视频Id',
    quality_ranking            varchar(32)      DEFAULT NULL COMMENT '质量排名',
    engagement_rate_ranking    varchar(32)      DEFAULT NULL COMMENT '互动率排名',
    conversion_rate_ranking    varchar(32)      DEFAULT NULL COMMENT '转化率排名',
    spend                      decimal(20, 8)   DEFAULT NULL COMMENT '花费金额',
    impressions                int              DEFAULT NULL COMMENT '展示次数',
    reach                      int              DEFAULT NULL COMMENT '覆盖人数',
    clicks                     int              DEFAULT NULL COMMENT '点击量（全部）',
    ctr                        decimal(20, 8)   DEFAULT NULL COMMENT '点击率（全部）',
    cpc                        decimal(20, 8)   DEFAULT NULL COMMENT '单次点击费用（全部）',
    cpm                        decimal(20, 8)   DEFAULT NULL COMMENT '千次展示费用',
    inline_link_clicks         int              DEFAULT NULL COMMENT '链接点击量',
    inline_link_click_ctr      decimal(20, 8)   DEFAULT NULL COMMENT '链接点击率',
    frequency                  decimal(20, 8)   DEFAULT NULL COMMENT '频次',
    cost_per_inline_link_click decimal(20, 8)   DEFAULT NULL COMMENT '单次链接点击费用',
    landing_page_view          int              DEFAULT NULL COMMENT '落地页浏览量',
    effect                     varchar(32)      DEFAULT NULL COMMENT '成效',
    cost_per_effect            decimal(20, 8)   DEFAULT NULL COMMENT '单次成效费用',
    created                    timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated                    timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告素材表';

-- ----------------------------
-- Table structure for fb_ad_resource
-- ----------------------------

CREATE TABLE fb_ad_resource
(
    id                         bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    ad_id                      varchar(32) NOT NULL COMMENT '广告创意Id',
    ad_name                    text        NOT NULL COMMENT '广告创意名称',
    ad_set_id                  varchar(32) NOT NULL COMMENT '广告组Id',
    campaign_id                varchar(32) NOT NULL COMMENT '广告系列Id',
    status                     varchar(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    cover_image                text COMMENT '封面',
    effective_status           varchar(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     varchar(32) NOT NULL COMMENT '广告账户ID',
    objective                  varchar(64) NOT NULL COMMENT '广告目标',
    link                       text COMMENT '链接',
    quality_ranking            varchar(32)          DEFAULT NULL COMMENT '质量排名',
    engagement_rate_ranking    varchar(32)          DEFAULT NULL COMMENT '互动率排名',
    conversion_rate_ranking    varchar(32)          DEFAULT NULL COMMENT '转化率排名',
    spend                      decimal(20, 8)       DEFAULT NULL COMMENT '花费金额',
    impressions                int                  DEFAULT NULL COMMENT '展示次数',
    reach                      int                  DEFAULT NULL COMMENT '覆盖人数',
    clicks                     int                  DEFAULT NULL COMMENT '点击量（全部）',
    ctr                        decimal(20, 8)       DEFAULT NULL COMMENT '点击率（全部）',
    cpc                        decimal(20, 8)       DEFAULT NULL COMMENT '单次点击费用（全部）',
    cpm                        decimal(20, 8)       DEFAULT NULL COMMENT '千次展示费用',
    inline_link_clicks         int                  DEFAULT NULL COMMENT '链接点击量',
    inline_link_click_ctr      decimal(20, 8)       DEFAULT NULL COMMENT '链接点击率',
    frequency                  decimal(20, 8)       DEFAULT NULL COMMENT '频次',
    cost_per_inline_link_click decimal(20, 8)       DEFAULT NULL COMMENT '单次链接点击费用',
    landing_page_view          int                  DEFAULT NULL COMMENT '落地页浏览量',
    effect                     varchar(32)          DEFAULT NULL COMMENT '成效',
    cost_per_effect            decimal(20, 8)       DEFAULT NULL COMMENT '单次成效费用',
    creative_properties        text COMMENT '创意设置',
    creative_group_list        text COMMENT '创意组',
    ad_created              datetime             DEFAULT NULL COMMENT '广告创建日期',
    ad_updated              datetime             DEFAULT NULL COMMENT '广告修改日期',
    created_by_id              bigint      NOT NULL COMMENT '创建者ID',
    update_by_id               bigint               DEFAULT NULL COMMENT '修改者ID',
    created                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_c_id (ad_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告创意资源表';

-- ----------------------------
-- Table structure for fb_ad_set_resource
-- ----------------------------

CREATE TABLE fb_ad_set_resource
(
    id                         bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    ad_set_id                  varchar(32) NOT NULL COMMENT '广告组Id',
    campaign_id                varchar(32) NOT NULL COMMENT '广告系列Id',
    ad_set_name                text        NOT NULL COMMENT '广告组名称',
    status                     varchar(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    effective_status           varchar(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     varchar(32) NOT NULL COMMENT '广告账户ID',
    objective                  varchar(64) NOT NULL COMMENT '广告目标',
    start_time                 datetime             DEFAULT NULL COMMENT '排期开始时间',
    end_time                   datetime             DEFAULT NULL COMMENT '排期结束时间',
    daily_budget               decimal(20, 8)       DEFAULT NULL COMMENT '单日预算',
    lifetime_budget            decimal(20, 8)       DEFAULT NULL COMMENT '总预算',
    bid_strategy               varchar(64)          DEFAULT NULL COMMENT '竞价策略',
    spend                      decimal(20, 8)       DEFAULT NULL COMMENT '花费金额',
    impressions                int                  DEFAULT NULL COMMENT '展示次数',
    reach                      int                  DEFAULT NULL COMMENT '覆盖人数',
    clicks                     int                  DEFAULT NULL COMMENT '点击量',
    ctr                        decimal(20, 8)       DEFAULT NULL COMMENT '点击率',
    cpc                        decimal(20, 8)       DEFAULT NULL COMMENT '单次链接点击费用(全部)',
    cpm                        decimal(20, 8)       DEFAULT NULL COMMENT '千次展示费用',
    inline_link_clicks         int                  DEFAULT NULL COMMENT '链接点击量',
    inline_link_click_ctr      decimal(20, 8)       DEFAULT NULL COMMENT '链接点击率',
    frequency                  decimal(20, 8)       DEFAULT NULL COMMENT '频次',
    cost_per_inline_link_click decimal(20, 8)       DEFAULT NULL COMMENT '单次链接点击费用',
    landing_page_view          int                  DEFAULT NULL COMMENT '落地页浏览量',
    effect                     varchar(32)          DEFAULT NULL COMMENT '成效',
    cost_per_effect            decimal(20, 8)       DEFAULT NULL COMMENT '单次成效费用',
    destination_type           varchar(32)          DEFAULT NULL COMMENT '转化发生位置',
    region_group_list          text COMMENT '地区组详情列表，以json 格式存储',
    targeting_list             text COMMENT '定向包详情列表，以json 格式存储',
    advertise_content          text COMMENT '投放内容',
    budget_advanced            text COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal              text COMMENT '出价与预算(应用广告)',
    placement_properties       text COMMENT '版位',
    ad_set_created          datetime             DEFAULT NULL COMMENT '广告组创建日期',
    ad_set_updated          datetime             DEFAULT NULL COMMENT '广告组修改日期',
    created_by_id              bigint      NOT NULL COMMENT '创建者ID',
    update_by_id               bigint               DEFAULT NULL COMMENT '修改者ID',
    created                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                    timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_c_id (ad_set_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告组资源表';

-- ----------------------------
-- Table structure for fb_advertising_account
-- ----------------------------

CREATE TABLE fb_advertising_account
(
    id                       bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id   varchar(32)  NOT NULL COMMENT '广告账户ID',
    advertising_account_name varchar(255) NOT NULL COMMENT '广告账户名称',
    status                   varchar(50)  NOT NULL DEFAULT 'ENABLED' COMMENT '用户拉取数据开关状态',
    time_zone                varchar(64)           DEFAULT NULL COMMENT '时区',
    currency                 varchar(16)           DEFAULT NULL COMMENT '币种',
    account_status           varchar(32)  NOT NULL COMMENT '广告账户状态枚举 AdAccountStatusEnums',
    disable_reason           varchar(64)           DEFAULT NULL COMMENT '禁用原因',
    last_auth_time           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id            bigint       NOT NULL COMMENT '创建者ID',
    update_by_id             bigint                DEFAULT NULL COMMENT '修改者ID',
    created               datetime              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated               datetime              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_a_id (advertising_account_id) USING BTREE,
    KEY idx_a_a_s (advertising_account_id, account_status) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告账号管理表';

-- ----------------------------
-- Table structure for fb_advertising_app_mapping
-- ----------------------------

CREATE TABLE fb_advertising_app_mapping
(
    id                 bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    ad_account_data_id bigint NOT NULL COMMENT '广告账号数据id',
    app_data_id        bigint NOT NULL COMMENT '推广应用数据id',
    created_by_id      bigint NOT NULL COMMENT '创建者ID',
    PRIMARY KEY (id),
    UNIQUE KEY uni_a_a_id (ad_account_data_id, app_data_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告账号和推广应用关联表';

-- ----------------------------
-- Table structure for fb_business_management_platform
-- ----------------------------

CREATE TABLE fb_business_management_platform
(
    id                       bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    resource_id              bigint      NOT NULL COMMENT '资源ID',
    resource_type            varchar(32) NOT NULL COMMENT '资源类型枚举 PERSONAL_ACCOUNT, ADVERTISING_ACCOUNT, PUBLIC_PAGE',
    business_management_id   varchar(64)          DEFAULT NULL COMMENT '商务管理平台ID',
    business_management_name varchar(255)         DEFAULT NULL COMMENT '商务管理平台名称',
    business_management_logo text COMMENT '商务管理平台 Logo URL',
    authorizer_id            bigint      NOT NULL COMMENT '授权人ID',
    last_auth_time           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id            bigint      NOT NULL COMMENT '创建者ID',
    update_by_id             bigint               DEFAULT NULL COMMENT '修改者ID',
    created                  timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                  timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_r_r_b_id (resource_id, resource_type, business_management_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB商务管理平台';

-- ----------------------------
-- Table structure for fb_data_scope
-- ----------------------------

CREATE TABLE fb_data_scope
(
    id            bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    data_id       bigint      NOT NULL COMMENT '数据ID',
    permission_id bigint      NOT NULL COMMENT '角色权限id',
    source_table  varchar(32) NOT NULL COMMENT '数据来源枚举',
    created_by_id bigint      NOT NULL COMMENT '创建者ID',
    created       timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_d_p_s (data_id, permission_id, source_table) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB数据权限表';

-- ----------------------------
-- Table structure for fb_directional_package_management
-- ----------------------------

CREATE TABLE fb_directional_package_management
(
    id                           bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    name                         varchar(64) NOT NULL COMMENT '定向包名称，用户维度下唯一',
    targeting_package_properties text        NOT NULL COMMENT '整个定向包的完整json 格式数据',
    owner_user_id                bigint      NOT NULL COMMENT '所属用户id',
    delete_flag                  bigint      NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    create_by_id                 bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick               varchar(64) NOT NULL COMMENT '创建者昵称',
    update_by_id                 bigint      DEFAULT NULL COMMENT '修改者ID',
    update_by_nick               varchar(64) DEFAULT NULL COMMENT '修改者昵称',
    created                      datetime    DEFAULT CURRENT_TIMESTAMP,
    updated                      datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_key_name (owner_user_id, name, delete_flag) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='定向包管理';

-- ----------------------------
-- Table structure for fb_material_detail_resource
-- ----------------------------

CREATE TABLE fb_material_detail_resource
(
    id                     bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    advertising_account_id varchar(32) NOT NULL COMMENT '广告账户ID',
    material_id            varchar(60)      DEFAULT NULL COMMENT '素材Id',
    name                   text COMMENT '素材名',
    type                   varchar(32) NOT NULL COMMENT '素材类型',
    hash                   varchar(32) NOT NULL COMMENT '素材hash',
    permalink_url          text COMMENT 'url',
    cover_image            text COMMENT '封面图片',
    height                 int              DEFAULT NULL COMMENT '高',
    width                  int              DEFAULT NULL COMMENT '宽',
    original_height        int              DEFAULT NULL COMMENT '最初上传的图像的高度',
    original_width         int              DEFAULT NULL COMMENT '最初上传的图像的宽度',
    material_status        varchar(32)      DEFAULT NULL COMMENT '图像状态',
    created                timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated                timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_c_id (advertising_account_id, hash) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告素材表';

-- ----------------------------
-- Table structure for fb_personal_account_plus
-- ----------------------------

CREATE TABLE fb_personal_account_plus
(
    id                      bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    personal_account_id     varchar(32)  NOT NULL COMMENT '个人账户ID',
    personal_account_name   varchar(255) NOT NULL COMMENT '个人账户名称',
    personal_account_avatar text COMMENT '个人账户头像URL',
    status                  varchar(16)  NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    visible_range           varchar(16)  NOT NULL DEFAULT 'ONESELF' COMMENT '可见范围枚举 ONESELF, TEAM',
    access_token            text COMMENT 'token',
    token_status            varchar(16)  NOT NULL DEFAULT 'VALID' COMMENT 'Token状态枚举 VALID, EXPIRED',
    granted_scopes          text COMMENT '授予的权限',
    authorizer_id           bigint       NOT NULL COMMENT '授权人ID',
    last_auth_time          datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    token_expiry_time       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权过期时间',
    created_by_id           bigint       NOT NULL COMMENT '创建者ID',
    update_by_id            bigint                DEFAULT NULL COMMENT '修改者ID',
    created                 timestamp    NULL     DEFAULT CURRENT_TIMESTAMP,
    updated                 timestamp    NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_a_id (personal_account_id, authorizer_id) USING BTREE,
    KEY idx_status (status) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB个人账号管理表';

-- ----------------------------
-- Table structure for fb_personal_advertising_mapping
-- ----------------------------

CREATE TABLE fb_personal_advertising_mapping
(
    id                 bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id   bigint NOT NULL COMMENT '个号数据库ID',
    ad_account_data_id bigint NOT NULL COMMENT '广告账数据库ID',
    created_by_id      bigint NOT NULL COMMENT '创建者ID',
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_a_id (personal_data_id, ad_account_data_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB个号和广告账号关联表';

-- ----------------------------
-- Table structure for fb_personal_page_mapping
-- ----------------------------

CREATE TABLE fb_personal_page_mapping
(
    id               bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id bigint NOT NULL COMMENT '个号数据库ID',
    page_data_id     bigint NOT NULL COMMENT '主页数据库ID',
    created_by_id    bigint NOT NULL COMMENT '创建者ID',
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_p_id (personal_data_id, page_data_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB个号和主页关联表';

-- ----------------------------
-- Table structure for fb_promotion_app
-- ----------------------------

CREATE TABLE fb_promotion_app
(
    id                bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    app_id            varchar(32)  NOT NULL COMMENT '推广应用Id',
    app_name          varchar(256) NOT NULL COMMENT '推广应用名称',
    app_avatar        text COMMENT '应用头像URL',
    app_store_details text COMMENT '推广应用商店详情',
    last_auth_time    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    package_data_id   bigint                DEFAULT NULL COMMENT '投放包数据id',
    created_by_id     bigint       NOT NULL COMMENT '创建者ID',
    update_by_id      bigint                DEFAULT NULL COMMENT '修改者ID',
    created           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP,
    updated           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_app_id (app_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB推广应用';

-- ----------------------------
-- Table structure for fb_public_page
-- ----------------------------

CREATE TABLE fb_public_page
(
    id                bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    page_id           varchar(32)  NOT NULL COMMENT 'Facebook主页ID',
    page_name         varchar(255) NOT NULL COMMENT '主页名称',
    page_type         varchar(64)  NOT NULL COMMENT '主页类型',
    page_introduction varchar(512)          DEFAULT NULL COMMENT '主页简介',
    page_avatar       text COMMENT '主页头像URL',
    top_count         bigint                DEFAULT NULL COMMENT '点赞数',
    followers_count   bigint                DEFAULT NULL COMMENT '粉丝数',
    last_auth_time    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    created_by_id     bigint       NOT NULL COMMENT '创建者ID',
    update_by_id      bigint                DEFAULT NULL COMMENT '修改者ID',
    created           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP,
    updated           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_p_a_id (page_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB公共主页管理表';

-- ----------------------------
-- Table structure for fb_region_group_management
-- ----------------------------

CREATE TABLE fb_region_group_management
(
    id                       bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    region_group_name        varchar(64) NOT NULL COMMENT '地区组组名',
    targeting_properties     text COMMENT '定向json',
    excluded_properties      text COMMENT '排除json',
    beneficiary              varchar(64) DEFAULT NULL COMMENT '受益方',
    payor                    varchar(64) DEFAULT NULL COMMENT '付费方',
    beneficiary_payor_status varchar(32) DEFAULT NULL COMMENT '付费方与受益方是否相同',
    owner_user_id            bigint      NOT NULL COMMENT '用户属主id',
    delete_flag              bigint      NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    create_by_id             bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick           varchar(64) NOT NULL COMMENT '创建者昵称',
    update_by_id             bigint      DEFAULT NULL COMMENT '修改者ID',
    update_by_nick           varchar(64) DEFAULT NULL COMMENT '修改者昵称',
    created                  datetime    DEFAULT CURRENT_TIMESTAMP,
    updated                  datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_key_name (owner_user_id, region_group_name, delete_flag) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB地区组管理表';

-- ----------------------------
-- Table structure for task_account_detail_record
-- ----------------------------

CREATE TABLE task_account_detail_record
(
    id               bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    batch_uuid       varchar(32) NOT NULL COMMENT '任务批次uuid',
    personal_data_id bigint      NOT NULL COMMENT '个号数据id',
    status           varchar(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result           varchar(32)      DEFAULT NULL COMMENT '结果：成功、失败',
    result_detail    text COMMENT '详细结果，成功、失败详情',
    start_time       datetime         DEFAULT NULL COMMENT '任务开始时间',
    finished_time    datetime         DEFAULT NULL COMMENT '任务结束时间',
    created          timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    updated          timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dates            int unsigned     DEFAULT '0' COMMENT '时间戳',
    PRIMARY KEY (id),
    KEY idx_dates (dates)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB账号资源同步任务明细表';

-- ----------------------------
-- Table structure for task_account_record
-- ----------------------------

CREATE TABLE task_account_record
(
    id            bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    sign_uuid     varchar(64) NOT NULL COMMENT '标志uuid',
    batch_uuid    varchar(32)          DEFAULT NULL COMMENT '任务批次uuid',
    user_id       bigint      NOT NULL COMMENT '用户ID',
    type          varchar(32) NOT NULL COMMENT '类型: 授权(授权或者新增授权), 手动(单条或者批量), 半自动批量(页面间隔1小时触发和手动点击刷新), 全自动(每天零点触发)',
    impact_scope  varchar(32) NOT NULL DEFAULT 'PERSONAL' COMMENT '影响范围: 全局 GLOBAL 或者个人 PERSONAL',
    status        varchar(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result        varchar(32)          DEFAULT NULL COMMENT '结果：成功、失败',
    meta_data     text COMMENT '元数据',
    start_time    datetime             DEFAULT NULL COMMENT '任务开始时间',
    finished_time datetime             DEFAULT NULL COMMENT '任务结束时间',
    created_by_id bigint      NOT NULL COMMENT '创建者ID',
    update_by_id  bigint               DEFAULT NULL COMMENT '修改者ID',
    created       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dates         int unsigned         DEFAULT '0' COMMENT '时间戳',
    PRIMARY KEY (id),
    UNIQUE KEY uni_s_uuid (sign_uuid) USING BTREE,
    KEY idx_dates (dates)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB授权认证记录表';

-- ----------------------------
-- Table structure for task_ad_detail
-- ----------------------------

CREATE TABLE task_ad_detail
(
    id                     bigint        NOT NULL AUTO_INCREMENT,
    uuid                   varchar(64)   NOT NULL COMMENT 'uuid',
    parent_uuid            varchar(64)  DEFAULT '' COMMENT '父ID，这里主要是因为广告组的创建必须要有广告系列ID，广告的创建必须要有广告组。',
    task_uuid              varchar(64)   NOT NULL COMMENT '对应广告任务中心的主键ID',
    person_account_data_id bigint       DEFAULT NULL,
    person_id              varchar(64)  DEFAULT NULL,
    account_id             varchar(64)   NOT NULL COMMENT '广告账号ID',
    page_id                varchar(2000) NOT NULL COMMENT '主页ID',
    kinds                  varchar(32)   NOT NULL COMMENT '分类：广告系列、广告组、广告',
    source                 varchar(32)   NOT NULL COMMENT '平台：FB、GG 等',
    parent_campaign_id     varchar(128) DEFAULT NULL COMMENT '所属广告系列ID，当kinds 为广告组和广告时有效',
    parent_ad_set_id       varchar(128) DEFAULT NULL COMMENT '所属广告组ID，当kinds 为广告时有效',
    instance_id            varchar(128) DEFAULT NULL COMMENT '调用平台返回的ID(广告系列ID、广告组ID、广告ID)',
    instance_name          varchar(256)  NOT NULL COMMENT '广告系列名|广告组名|广告名',
    instance_properties    text COMMENT '实例属性',
    status                 varchar(32)  DEFAULT NULL COMMENT '状态：未开始、进行中、已完成',
    result                 varchar(32)  DEFAULT NULL COMMENT '结果：成功、失败',
    result_detail          text COMMENT '详细结果，成功、失败详情',
    created                datetime     DEFAULT CURRENT_TIMESTAMP,
    updated                datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uuid (uuid) USING BTREE,
    KEY idx_task (task_uuid) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告任务中心，明细';

-- ----------------------------
-- Table structure for task_ad_detail_external_asset
-- ----------------------------

CREATE TABLE task_ad_detail_external_asset
(
    id                     bigint        NOT NULL AUTO_INCREMENT,
    uuid                   varchar(64)   NOT NULL COMMENT 'uuid',
    owner_task_uuid        varchar(64)   NOT NULL COMMENT '所属任务主键ID',
    person_account_data_id bigint        DEFAULT NULL,
    person_id              varchar(64)   DEFAULT NULL,
    account_id             varchar(64)   NOT NULL COMMENT '广告账户ID',
    asset_id               bigint        DEFAULT NULL COMMENT '对应 fb_asset 表中的主键ID，当前只有 FACEBOOK',
    type                   varchar(32)   NOT NULL COMMENT '素材类型：图片、视频',
    name                   varchar(256)  NOT NULL COMMENT '素材文件名',
    asset_url              varchar(1000) NOT NULL COMMENT '素材存储路径，绝对路径，非http 的url。',
    cover_url              varchar(1000) DEFAULT NULL COMMENT '视频封面图片存储路径，绝对路径，非http 的url。',
    image_hash             varchar(64)   DEFAULT NULL COMMENT 'facebook 上传成功之后的图片hash（如果是视频，则为封面图片）。',
    image_url              varchar(4000) DEFAULT NULL COMMENT 'facebook 上传成功之后的图片url（如果是视频，则为封面图片）',
    video_id               varchar(64)   DEFAULT NULL COMMENT 'facebook 上传成功之后的视频id',
    result                 varchar(32)   DEFAULT NULL COMMENT '任务结果：成功、失败',
    created                datetime      DEFAULT CURRENT_TIMESTAMP,
    updated                datetime      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    video_status           varchar(128)  DEFAULT NULL COMMENT '视频上传结果状态',
    result_detail          text COMMENT '详细结果，成功、失败详情',
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uuid (uuid) USING BTREE,
    KEY idx_uuid (owner_task_uuid, account_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告任务明细扩展：广告素材';

-- ----------------------------
-- Table structure for task_ad_detail_external_creative
-- ----------------------------

CREATE TABLE task_ad_detail_external_creative
(
    id                     bigint       NOT NULL AUTO_INCREMENT,
    uuid                   varchar(64)  NOT NULL COMMENT 'uuid',
    owner_task_uuid        varchar(64)  NOT NULL COMMENT '所属任务主键ID',
    person_account_data_id bigint      DEFAULT NULL,
    owner_task_detail_uuid varchar(64)  NOT NULL COMMENT '所属任务明细主键ID  与广告一一映射，唯一索引',
    person_id              varchar(64) DEFAULT NULL,
    account_id             varchar(64)  NOT NULL COMMENT '广告账户ID',
    asset_kinds            varchar(32)  NOT NULL COMMENT '广告创意素材格式枚举：灵活、单图片或视频、轮播',
    name                   varchar(256) NOT NULL COMMENT '创意名',
    result                 varchar(32) DEFAULT NULL COMMENT '任务结果：成功、失败',
    creative_id            varchar(64) DEFAULT NULL COMMENT 'facebook 创建成功返回的创意ID',
    asset_task_uuid_list   text         NOT NULL COMMENT '关联的素材任务主键ID 列表',
    created                datetime    DEFAULT CURRENT_TIMESTAMP,
    updated                datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uuid (uuid) USING BTREE,
    UNIQUE KEY uni_o_uuid (owner_task_detail_uuid) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告任务明细扩展：广告创意';

-- ----------------------------
-- Table structure for task_campaign_detail_record
-- ----------------------------

CREATE TABLE task_campaign_detail_record
(
    id            bigint      NOT NULL DEFAULT '0' COMMENT '主键ID',
    batch_uuid    varchar(64)          DEFAULT NULL COMMENT '任务批次uuid',
    account_id    varchar(32) NOT NULL COMMENT '广告账号id',
    status        varchar(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result        varchar(32)          DEFAULT NULL COMMENT '结果：成功、失败',
    result_detail text COMMENT '详细结果，成功、失败详情',
    start_time    datetime             DEFAULT NULL COMMENT '任务开始时间',
    finished_time datetime             DEFAULT NULL COMMENT '任务结束时间',
    created       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dates         int unsigned         DEFAULT '0' COMMENT '时间戳',
    KEY idx_dates (dates)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for task_campaign_record
-- ----------------------------

CREATE TABLE task_campaign_record
(
    id            bigint      NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    sign_uuid     varchar(64) NOT NULL COMMENT '标志uuid',
    batch_uuid    varchar(64)          DEFAULT NULL COMMENT '任务批次uuid',
    user_id       bigint      NOT NULL COMMENT '用户ID',
    type          varchar(32) NOT NULL COMMENT 'RefreshTriggerType 任务类型 MANUAL:手动(单条或者批量), SEMI_AUTO:半自动批量(页面间隔1小时触发和手动点击刷新), FULL_AUTO:全自动(每天零点触发)',
    impact_scope  varchar(32) NOT NULL DEFAULT 'PERSONAL' COMMENT '影响范围: 全局 GLOBAL 或者个人 PERSONAL',
    status        varchar(32) NOT NULL COMMENT '状态：未开始、进行中、完成等..',
    result        varchar(32)          DEFAULT NULL COMMENT '结果：成功、失败',
    meta_data     text COMMENT '元数据',
    start_time    datetime             DEFAULT NULL COMMENT '任务开始时间',
    finished_time datetime             DEFAULT NULL COMMENT '任务结束时间',
    created_by_id bigint      NOT NULL COMMENT '创建者ID',
    update_by_id  bigint               DEFAULT NULL COMMENT '修改者ID',
    created       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updated       timestamp   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dates         int unsigned         DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB广告系列资源同步任务表';

-- ----------------------------
-- Table structure for task_management_ad
-- ----------------------------

CREATE TABLE task_management_ad
(
    id                        bigint      NOT NULL AUTO_INCREMENT,
    uuid                      varchar(64) NOT NULL COMMENT 'uuid',
    source                    varchar(32) NOT NULL COMMENT '平台：FB、GG 等',
    ad_app_category           varchar(50)          DEFAULT NULL,
    type                      varchar(50) NOT NULL DEFAULT 'CREATE_AD' COMMENT '任务类型：创建广告、复制广告',
    template_preview_id       bigint               DEFAULT NULL,
    preview_detail_properties longtext COMMENT '预览明细属性',
    copy_detail_properties    longtext COMMENT '复制广告系列详细json',
    package_data_id           bigint               DEFAULT NULL,
    app_id                    varchar(64)          DEFAULT NULL,
    app_name                  varchar(64)          DEFAULT NULL,
    status                    varchar(32) NOT NULL COMMENT '任务状态：未开始、进行中、完成等..',
    result                    varchar(32)          DEFAULT NULL COMMENT '任务结果：成功、失败',
    start_time                datetime             DEFAULT NULL COMMENT '任务开始时间',
    finished_time             datetime             DEFAULT NULL COMMENT '任务结束时间',
    create_by_id              bigint      NOT NULL COMMENT '创建者ID',
    create_by_nick            varchar(64) NOT NULL COMMENT '创建者昵称',
    version                   decimal(10, 2)       DEFAULT '1.00' COMMENT '版本号',
    created                   datetime             DEFAULT CURRENT_TIMESTAMP,
    updated                   datetime             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE KEY uni_uuid (uuid) USING BTREE,
    UNIQUE KEY uni_tpid (template_preview_id) USING BTREE,
    KEY idx_ssr (source, status, result) USING BTREE,
    KEY idx_status (status) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='广告任务中心';

SET FOREIGN_KEY_CHECKS = 1;


-- 插入默认数据
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (1, '-1', '购物', '-1', '-1', 'VALUE_PURCHASE', null, -1, -1, '1970-01-01 18:06:13', '1970-01-02 10:23:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (2, '-2', '订阅', '-1', '-1', 'VALUE_SUBSCRIBE', null, -1, -1, '1970-01-01 18:07:13', '1970-01-02 10:24:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (3, '-3', '添加支付信息', '-1', '-1', 'VALUE_ADD_PAYMENT_INFO', null, -1, -1, '1970-01-01 18:08:13', '1970-01-02 10:25:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (4, '-4', '查看内容', '-1', '-1', 'VALUE_CONTENT_VIEW', null, -1, -1, '1970-01-01 18:09:13', '1970-01-02 10:26:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (5, '-5', '搜索', '-1', '-1', 'VALUE_SEARCH', null, -1, -1, '1970-01-01 18:10:13', '1970-01-02 10:27:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (6, '-6', '捐款', '-1', '-1', 'VALUE_DONATE', null, -1, -1, '1970-01-01 18:11:13', '1970-01-02 10:28:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (7, '-7', '开始试用', '-1', '-1', 'VALUE_START_TRIAL', null, -1, -1, '1970-01-01 18:12:13', '1970-01-02 10:29:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (8, '-8', '完成注册', '-1', '-1', 'VALUE_COMPLETE_REGISTRATION', null, -1, -1, '1970-01-01 18:13:13', '1970-01-02 10:30:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (9, '-9', '发起结账', '-1', '-1', 'VALUE_INITIATED_CHECKOUT', null, -1, -1, '1970-01-01 18:14:13', '1970-01-02 10:31:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (10, '-10', '加入购物车', '-1', '-1', 'VALUE_ADD_TO_CART', null, -1, -1, '1970-01-01 18:15:13', '1970-01-02 10:32:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (11, '-11', '加入心愿单', '-1', '-1', 'VALUE_ADD_TO_WISHLIST', null, -1, -1, '1970-01-01 18:16:13', '1970-01-02 10:33:59');


INSERT INTO ad_material_folders (id, name, parent_id,level, created_by_id, update_by_id, created, updated)
VALUES (1, '默认素材库', null,-1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42'),
       (2, '团队共享素材', null,-1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42');


