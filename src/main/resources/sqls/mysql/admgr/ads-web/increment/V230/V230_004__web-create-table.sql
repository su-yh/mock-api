-- DROP TABLE IF EXISTS fb_ad_campaign_resource;
-- DROP TABLE IF EXISTS fb_ad_campaign_relation;
-- DROP TABLE IF EXISTS fb_ad_set_resource;
-- DROP TABLE IF EXISTS fb_ad_creative_resource;
-- DROP TABLE IF EXISTS fb_ad_resource;
-- delete from flyway_schema_history where installed_rank = '59';

CREATE TABLE fb_ad_campaign_resource
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    campaign_id                VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    campaign_name              TEXT        NOT NULL COMMENT '广告系列名称',
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    effective_status           VARCHAR(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    objective                  VARCHAR(64) NOT NULL COMMENT '广告目标',
    daily_budget               DECIMAL(20, 8) NULL comment '单日预算',
    lifetime_budget            DECIMAL(20, 8) NULL comment '总预算',

    bid_strategy               VARCHAR(64) NULL COMMENT '竞价策略',
    start_time                 DATETIME NULL COMMENT '排期开始时间',
    end_time                   DATETIME NULL COMMENT '排期结束时间',
    attribution_config         VARCHAR(128) NULL COMMENT '归因设置',

    spend                      DECIMAL(20, 8) NULL comment '花费金额',
    impressions                INT NULL COMMENT '展示次数',
    reach                      INT NULL COMMENT '覆盖人数',
    clicks                     INT NULL COMMENT '点击量',
    ctr                        DECIMAL(20, 8) NULL COMMENT '点击率',
    cpc                        DECIMAL(20, 8) NULL COMMENT '单次链接点击费用(全部)',
    cpm                        DECIMAL(20, 8) NULL COMMENT '千次展示费用',

    inline_link_clicks         INT NULL COMMENT '链接点击量',
    inline_link_click_ctr      DECIMAL(20,8) NULL COMMENT '链接点击率',
    frequency                  DECIMAL(20,8) NULL COMMENT '频次',
    cost_per_inline_link_click DECIMAL(20,8) NULL COMMENT '单次链接点击费用',
    landing_page_view          INT NULL COMMENT '落地页浏览量',
    effect                     VARCHAR(32) NULL COMMENT '成效',
    cost_per_effect            DECIMAL(20, 8) NULL COMMENT '单次成效费用',

    campaign_properties        TEXT        NOT NULL COMMENT '广告系列属性',

    campaign_created_at        DATETIME COMMENT '广告系列创建日期',
    campaign_updated_at        DATETIME COMMENT '广告系列修改日期',
    created_by_id              BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT               DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告系列资源表';


-- 唯一索引
ALTER TABLE fb_ad_campaign_resource
    ADD UNIQUE INDEX uni_c_id(campaign_id) USING BTREE;

CREATE TABLE fb_ad_campaign_relation
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    personal_data_id BIGINT      NOT NULL COMMENT '个号数据Id',
    campaign_id      VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    package_data_id  BIGINT NULL COMMENT '投放包数据Id',
    team_id          BIGINT NULL COMMENT '项目团队Id',
    delete_flag      BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    created_by_id    BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id     BIGINT   DEFAULT NULL COMMENT '修改者ID',
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at       DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告系列关联表';

-- 唯一索引
ALTER TABLE fb_ad_campaign_relation
    ADD UNIQUE INDEX uni_c_id(personal_data_id,campaign_id) USING BTREE;

CREATE TABLE fb_ad_set_resource
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    ad_set_id                  VARCHAR(32) NOT NULL COMMENT '广告组Id',
    campaign_id                VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    ad_set_name                TEXT        NOT NULL COMMENT '广告组名称',
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    effective_status           VARCHAR(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    objective                  VARCHAR(64) NOT NULL COMMENT '广告目标',
    start_time                 DATETIME NULL COMMENT '排期开始时间',
    end_time                   DATETIME NULL COMMENT '排期结束时间',
    daily_budget               DECIMAL(20, 8) NULL comment '单日预算',
    lifetime_budget            DECIMAL(20, 8) NULL comment '总预算',
    bid_strategy               VARCHAR(64) NULL COMMENT '竞价策略',

    spend                      DECIMAL(20, 8) NULL comment '花费金额',
    impressions                INT NULL COMMENT '展示次数',
    reach                      INT NULL COMMENT '覆盖人数',
    clicks                     INT NULL COMMENT '点击量',
    ctr                        DECIMAL(20, 8) NULL COMMENT '点击率',
    cpc                        DECIMAL(20, 8) NULL COMMENT '单次链接点击费用(全部)',
    cpm                        DECIMAL(20, 8) NULL COMMENT '千次展示费用',

    inline_link_clicks         INT NULL COMMENT '链接点击量',
    inline_link_click_ctr      DECIMAL(20,8) NULL COMMENT '链接点击率',
    frequency                  DECIMAL(20,8) NULL COMMENT '频次',
    cost_per_inline_link_click DECIMAL(20,8) NULL COMMENT '单次链接点击费用',
    landing_page_view          INT NULL COMMENT '落地页浏览量',
    effect                     VARCHAR(32) NULL COMMENT '成效',
    cost_per_effect            DECIMAL(20, 8) COMMENT '单次成效费用',


    destination_type           VARCHAR(32) NULL COMMENT '转化发生位置',
    region_group_list          TEXT NULL COMMENT '地区组详情列表，以json 格式存储',
    targeting_list             TEXT NULL COMMENT '定向包详情列表，以json 格式存储',
    advertise_content          TEXT NULL COMMENT '投放内容',
    budget_advanced            TEXT NULL COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal              TEXT NULL COMMENT '出价与预算(应用广告)',
    placement_properties       TEXT NULL COMMENT '版位',

    ad_set_created_at          DATETIME COMMENT '广告组创建日期',
    ad_set_updated_at          DATETIME COMMENT '广告组修改日期',
    created_by_id              BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT               DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告组资源表';

-- 唯一索引
ALTER TABLE fb_ad_set_resource
    ADD UNIQUE INDEX uni_c_id(ad_set_id) USING BTREE;

CREATE TABLE fb_ad_resource
(
    id                         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    ad_id                      VARCHAR(32) NOT NULL COMMENT '广告创意Id',
    ad_name                    TEXT        NOT NULL COMMENT '广告创意名称',
    ad_set_id                  VARCHAR(32) NOT NULL COMMENT '广告组Id',
    campaign_id                VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用枚举 ENABLED, DISABLED',
    effective_status           VARCHAR(32) NOT NULL COMMENT '投放状态 Facebook 枚举 EnumEffectiveStatus',
    advertising_account_id     VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    objective                  VARCHAR(64) NOT NULL COMMENT '广告目标',
    link                       TEXT NULL COMMENT '链接',

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

    creative_properties        TEXT NULL COMMENT '创意设置',
    creative_group_list        TEXT NULL COMMENT '创意组',

    ad_created_at              DATETIME COMMENT '广告创建日期',
    ad_updated_at              DATETIME COMMENT '广告修改日期',
    created_by_id              BIGINT      NOT NULL COMMENT '创建者ID',
    update_by_id               BIGINT               DEFAULT NULL COMMENT '修改者ID',
    created_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at                 DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT 'FB广告创意资源表';

-- 唯一索引
ALTER TABLE fb_ad_resource
    ADD UNIQUE INDEX uni_c_id(ad_id) USING BTREE;
