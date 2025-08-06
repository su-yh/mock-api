-- 创建广告资源指标数据表
CREATE TABLE fb_ad_metrics_record
(
    id                      BIGINT AUTO_INCREMENT COMMENT '主键ID',
    ad_account_id           VARCHAR(32) NOT NULL COMMENT '广告账户Id',
    ad_id                   VARCHAR(32) NOT NULL COMMENT '广告Id',
    ad_set_id               VARCHAR(32) NOT NULL COMMENT '广告组Id',
    campaign_id             VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    account_currency        VARCHAR(32) NOT NULL COMMENT '币种代码',
    spend                   DECIMAL(20, 8)       DEFAULT 0.0 COMMENT '花费金额',
    impressions             INT                  DEFAULT 0 COMMENT '展示次数',
    clicks                  INT                  DEFAULT 0 COMMENT '点击量（全部）',
    conversions             int                  DEFAULT 0 COMMENT '转化数',
    downloads               int                  DEFAULT 0 COMMENT '下载数',
    omni_app_install        int                  DEFAULT 0 COMMENT '安装数',
    omni_activate_app       int                  DEFAULT 0 COMMENT '激活数',
    registrations           int                  DEFAULT 0 COMMENT '注册数',
    omni_purchase           int                  DEFAULT 0 COMMENT '付费次数',
    d1_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_1 购物转化价值',
    d7_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_7 购物转化价值',
    d28_purchase_conversion DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_28 购物转化价值',
    country                 VARCHAR(32) NOT NULL COMMENT '国家',
    dates                   INT COMMENT '日期',
    created                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '广告资源指标数据表';

CREATE UNIQUE INDEX uni_fb_ad_metrics_record ON fb_ad_metrics_record (ad_account_id, campaign_id, ad_set_id, ad_id, dates);
CREATE INDEX idx_fb_ad_metrics_record_compose_ids ON fb_ad_metrics_record (ad_account_id, campaign_id, ad_set_id, ad_id);
CREATE INDEX idx_fb_ad_metrics_record_dates ON fb_ad_metrics_record (dates);


-- FB广告组指标数据表
CREATE TABLE fb_ad_set_metrics_record
(
    id                      BIGINT AUTO_INCREMENT COMMENT '主键ID',
    ad_account_id           VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    ad_set_id               VARCHAR(32) NOT NULL COMMENT '广告组Id',
    campaign_id             VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    account_currency        VARCHAR(32) NOT NULL COMMENT '币种代码',
    spend                   DECIMAL(20, 8)       DEFAULT 0.0 COMMENT '花费金额',
    impressions             INT                  DEFAULT 0 COMMENT '展示次数',
    clicks                  INT                  DEFAULT 0 COMMENT '点击量',
    conversions             int                  DEFAULT 0 COMMENT '转化数',
    downloads               int                  DEFAULT 0 COMMENT '下载数',
    omni_app_install        int                  DEFAULT 0 COMMENT '安装数',
    omni_activate_app       int                  DEFAULT 0 COMMENT '激活数',
    registrations           int                  DEFAULT 0 COMMENT '注册数',
    omni_purchase           int                  DEFAULT 0 COMMENT '付费次数',
    d1_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_1 购物转化价值',
    d7_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_7 购物转化价值',
    d28_purchase_conversion DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_28 购物转化价值',
    country                 VARCHAR(32) NOT NULL COMMENT '国家',
    dates                   INT COMMENT '日期',
    created                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'FB广告组指标数据表';

CREATE UNIQUE INDEX uni_fb_ad_set_metrics_record ON fb_ad_set_metrics_record (ad_account_id, campaign_id, ad_set_id, dates);
CREATE INDEX idx_fb_ad_set_metrics_record_campaign__groups ON fb_ad_set_metrics_record (ad_account_id, campaign_id, ad_set_id);
CREATE INDEX idx_fb_ad_set_metrics_record_dates ON fb_ad_set_metrics_record (dates);


-- FB广告系列指标数据表
CREATE TABLE fb_ad_campaign_metrics_record
(
    id                      BIGINT(20) AUTO_INCREMENT COMMENT '主键ID',
    campaign_id             VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    ad_account_id           VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    account_currency        VARCHAR(32) NOT NULL COMMENT '币种代码',
    spend                   DECIMAL(20, 8) COMMENT '花费金额',
    impressions             INT COMMENT '展示次数',
    clicks                  INT COMMENT '点击量',
    conversions             int                  DEFAULT 0 COMMENT '转化数',
    downloads               int                  DEFAULT 0 COMMENT '下载数',
    omni_app_install        int                  DEFAULT 0 COMMENT '安装数',
    omni_activate_app       int                  DEFAULT 0 COMMENT '激活数',
    registrations           int                  DEFAULT 0 COMMENT '注册数',
    omni_purchase           int(11)              DEFAULT 0 COMMENT '付费次数',
    d1_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_1 购物转化价值',
    d7_purchase_conversion  DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_7 购物转化价值',
    d28_purchase_conversion DECIMAL(20, 8)       DEFAULT 0 COMMENT 'Day_28 购物转化价值',
    dates                   INT COMMENT '日期',
    created                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated                 DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'FB广告系列指标数据表';

CREATE UNIQUE INDEX uni_fb_ad_campaign_metrics_record ON fb_ad_campaign_metrics_record (ad_account_id, campaign_id, dates);
CREATE INDEX idx_fb_ad_campaign_metrics_record_groups ON fb_ad_campaign_metrics_record (ad_account_id, campaign_id);
CREATE INDEX idx_fb_ad_campaign_metrics_record_dates ON fb_ad_campaign_metrics_record (dates);

-- FB广告素材指标数据表
CREATE TABLE fb_ad_material_metrics_record
(
    id                    BIGINT(20) AUTO_INCREMENT COMMENT '主键ID',
    ad_account_id         VARCHAR(32) NOT NULL COMMENT '广告账户ID',
    ad_id                 VARCHAR(32) NOT NULL COMMENT '广告Id',
    ad_set_id             VARCHAR(32) NOT NULL COMMENT '广告组Id',
    campaign_id           VARCHAR(32) NOT NULL COMMENT '广告系列Id',
    creative_id           VARCHAR(32) NOT NULL COMMENT '广告创意Id',
    creative_name         VARCHAR(255) COMMENT '创意名',
    play_times            INT                  DEFAULT 0 COMMENT '播放次数',
    percent25_play_times  INT                  DEFAULT 0 COMMENT '25%播放次数',
    percent50_play_times  INT                  DEFAULT 0 COMMENT '50%播放次数',
    percent75_play_times  INT                  DEFAULT 0 COMMENT '75%播放次数',
    percent100_play_times INT                  DEFAULT 0 COMMENT '100%播放次数',
    dates                 INT COMMENT '创建日期',
    created               DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated               DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'FB广告素材指标数据表';

CREATE UNIQUE INDEX uni_fb_ad_material_metrics_record_combine ON fb_ad_material_metrics_record (ad_account_id, ad_id, creative_id, dates);
CREATE INDEX idx_fb_ad_campaign_metrics_record_groups ON fb_ad_material_metrics_record (ad_account_id, ad_id, creative_id);
CREATE INDEX idx_fb_ad_material_metrics_record_dates ON fb_ad_material_metrics_record (dates);


-- 看板指标列表
CREATE TABLE kanban_column_config
(
    id            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    column_name   varchar(100) NOT NULL COMMENT '列名',
    column_value  varchar(100) NOT NULL COMMENT '列值',
    column_types  varchar(255) NOT NULL COMMENT '列类型(DIMENSION 维度，INDICATORS 指标)',
    column_class  varchar(255) NOT NULL COMMENT '列类(DELIVERY投放，MATERIAL素材)，可以有多个如：["DELIVERY","MATERIAL"]',
    sort          int       DEFAULT '0' COMMENT '排序',
    created_by_id bigint       NOT NULL COMMENT '创建人',
    created       timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id),
    UNIQUE KEY idx_value_id (column_value)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='看板指标列表';

-- 初始化数据
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (1, '花费', 'spend', 'INDICATORS', '["DELIVERY","MATERIAL"]', 0, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (2, '展示数', 'impressions', 'INDICATORS', '["DELIVERY","MATERIAL"]', 1, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (3, '千次展示成本', 'cpm', 'INDICATORS', '["DELIVERY","MATERIAL"]', 2, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (4, '点击数', 'clicks', 'INDICATORS', '["DELIVERY","MATERIAL"]', 3, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (5, '点击成本', 'cpc', 'INDICATORS', '["DELIVERY","MATERIAL"]', 4, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (6, '点击率', 'ctr', 'INDICATORS', '["DELIVERY","MATERIAL"]', 5, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (7, '转化数', 'conversions', 'INDICATORS', '["DELIVERY","MATERIAL"]', 6, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (8, '转化成本', 'cost_per_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 7, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
# VALUES (9, '下载数', 'downloads', 'INDICATORS', '["DELIVERY","MATERIAL"]', 8, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
# INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
# VALUES (10, '下载成本', 'cost_pre_download', 'INDICATORS', '["DELIVERY","MATERIAL"]', 9, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
# INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
# VALUES (11, '下载率', 'download_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 10, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
# INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (12, '安装数', 'omni_app_install', 'INDICATORS', '["DELIVERY","MATERIAL"]', 11, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (13, '安装成本', 'cost_pre_omni_install', 'INDICATORS', '["DELIVERY","MATERIAL"]', 12, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (14, '安装率', 'omni_install_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 13, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (15, '激活数', 'omni_activate_app', 'INDICATORS', '["DELIVERY","MATERIAL"]', 14, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (16, '激活成本', 'cost_pre_activate_app', 'INDICATORS', '["DELIVERY","MATERIAL"]', 15, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (17, '激活率', 'omni_activate_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 16, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (18, '注册数', 'registrations', 'INDICATORS', '["DELIVERY","MATERIAL"]', 17, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (19, '注册成本', 'cost_pre_registration', 'INDICATORS', '["DELIVERY","MATERIAL"]', 18, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (20, '注册率', 'registration_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 19, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (21, '付费次数', 'omni_purchase', 'INDICATORS', '["DELIVERY","MATERIAL"]', 20, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (22, '付费成本', 'cost_pre_omni_purchase', 'INDICATORS', '["DELIVERY","MATERIAL"]', 21, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (23, '付费率', 'omni_purchase_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 22, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (24, 'd1_付费转化', 'd1_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 23, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (25, 'd1_ROAS', 'd1_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 24, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (26, 'd7_付费转化', 'd7_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 25, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (27, 'd7_ROAS', 'd7_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 26, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (28, 'd28_付费转化', 'd28_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 27, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (29, 'd28_ROAS', 'd28_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 28, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (30, '播放次数', 'play_times', 'INDICATORS', '["MATERIAL"]', 29, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (31, '25%播放次数', 'percent_25_play_times', 'INDICATORS', '["MATERIAL"]', 30, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (32, '25%播放率', 'percent_25_rate', 'INDICATORS', '["MATERIAL"]', 31, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (33, '50%播放次数', 'percent_50_play_times', 'INDICATORS', '["MATERIAL"]', 32, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (34, '50%播放率', 'percent_50_rate', 'INDICATORS', '["MATERIAL"]', 33, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (35, '75%播放次数', 'percent_75_play_times', 'INDICATORS', '["MATERIAL"]', 34, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (36, '75%播放率', 'percent_75_rate', 'INDICATORS', '["MATERIAL"]', 35, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (37, '100%播放次数', 'percent_100_play_times', 'INDICATORS', '["MATERIAL"]', 36, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (38, '100%播放率', 'percent_100_rate', 'INDICATORS', '["MATERIAL"]', 37, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (40, '素材', 'hash', 'DIMENSION', '["MATERIAL"]', 39, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (42, '类型', 'type', 'DIMENSION', '["MATERIAL"]', 41, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
# INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
# VALUES (43, '标签', 'material_label', 'DIMENSION','["MATERIAL"]', 42, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (44, '创意', 'creative_id', 'DIMENSION', '["DELIVERY"]', 43, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (45, '产品', 'link', 'DIMENSION', '["DELIVERY","MATERIAL"]', 44, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (46, '地区', 'country', 'DIMENSION', '["DELIVERY"]', 45, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (47, '广告系列', 'campaign_id', 'DIMENSION', '["DELIVERY","MATERIAL"]', 46, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (48, '广告账户', 'ad_account_id', 'DIMENSION', '["DELIVERY","MATERIAL"]', 47, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (49, '日期', 'dates', 'DIMENSION', '["DELIVERY"]', 48, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (50, '关键字', 'keywords', 'DIMENSION', '["DELIVERY"]', 49, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');


-- 看板指标常用列
CREATE TABLE kanban_commonly_column
(
    id                 bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    custom_column_name varchar(20)  NOT NULL COMMENT '自定义列名',
    selected_column    TEXT         NOT NULL COMMENT '已选列，json字符串',
    column_class       varchar(255) NOT NULL COMMENT '列类型(DELIVERY投放，MATERIAL素材)',
    is_default         tinyint(1)   NOT NULL DEFAULT '0' COMMENT '是否默认(0:否,1:是)',
    created_by_id      bigint       NOT NULL COMMENT '创建人',
    updated_by_id      bigint                DEFAULT NULL COMMENT '修改人',
    created            timestamp             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated            timestamp             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='看板指标常用列';

ALTER TABLE kanban_commonly_column
    ADD UNIQUE KEY uni_custom_column_creator (custom_column_name, created_by_id);
