-- transport 库 对应fourth 数据源
-- 表字段正式环境已加,预发布环境确认有无添加该字段,如无执行该sql
-- alter table transport_config_info add platform int null comment '平台(1:Android，2:IOS)';

CREATE TABLE web_ads_api_channel(
    id             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    channel        varchar(100) NOT NULL COMMENT '渠道号',
    source         varchar(20)  NOT NULL COMMENT 'Source [GG |  FB]',
    api_config_tag varchar(50)    DEFAULT NULL COMMENT 'api配置的tag (为空时默认取对应api配置的缺省配置)',
    dates          int(8) unsigned DEFAULT NULL COMMENT '日期',
    created        datetime       DEFAULT NULL COMMENT '创建时间',
    value_scale    decimal(10, 2) DEFAULT NULL COMMENT 'API渠道纬度上报值的比例',
    PRIMARY KEY (id),
    KEY              idx_channel (channel)
) ENGINE=InnoDB AUTO_INCREMENT=1  COMMENT='api_channel 配置数据';



CREATE TABLE web_ads_google_api_config(
    id                 bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    tag                varchar(100)   DEFAULT NULL COMMENT '自定义的标记',
    mcc                varchar(50)    DEFAULT NULL COMMENT 'mcc账号id信息',
    customer_id        varchar(50)    DEFAULT NULL COMMENT 'customerId账号信息',
    developer_token    varchar(50)    DEFAULT NULL COMMENT 'google ads开发者Token',
    refresh_token      varchar(255)   DEFAULT NULL COMMENT 'refresh_token',
    client_id          varchar(255)   DEFAULT NULL COMMENT 'google cloud platform clientId',
    client_secret      varchar(255)   DEFAULT NULL COMMENT 'google cloud platform clientSecret',
    install_action_id  varchar(50)    DEFAULT NULL COMMENT '安装转化id',
    paydone_action_id  varchar(50)    DEFAULT NULL COMMENT '充值转化id',
    is_primary         tinyint(1) unsigned DEFAULT NULL COMMENT '是否主要API配置',
    enable             tinyint(1) unsigned DEFAULT NULL COMMENT '是否启用',
    dates              int(8) unsigned DEFAULT NULL COMMENT '日期',
    created            datetime       DEFAULT NULL COMMENT '创建时间',
    updated            datetime       DEFAULT NULL COMMENT '更新时间',
    global_value_scale decimal(10, 2) DEFAULT '0.01' COMMENT 'API全局上报值的纬度（默认0.01）',
    PRIMARY KEY (id),
    UNIQUE KEY uni_tag (tag)
) ENGINE=InnoDB AUTO_INCREMENT=1  COMMENT='google api配置';
