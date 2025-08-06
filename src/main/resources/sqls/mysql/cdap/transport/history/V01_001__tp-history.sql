
-- 数据库名：transport
-- transport
-- auto-generated definition
create table app_authorization_info
(
    id            bigint auto_increment comment '主键'
        primary key,
    app_token     varchar(255) null comment '应用token',
    authorization varchar(255) null comment '安全码',
    pkg           varchar(255) null comment '包',
    channel_id    varchar(255) null comment '渠道号',
    created_date  timestamp    null comment '创建时间',
    created_by    varchar(150) null comment '创建人',
    updated_date  timestamp    null comment '修改时间',
    updated_by    varchar(150) null comment '修改人'
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;


-- auto-generated definition
create table app_event_mapping_info
(
    id                  bigint auto_increment comment '主键'
        primary key,
    app_token           varchar(255)                       null comment '应用token',
    app_name            varchar(255)                       null comment '应用名',
    event_token         varchar(255)                       null comment '事件token',
    event_name          varchar(255)                       null comment '事件名',
    type                int                                null comment '类型[1:recharge,2:r-recharge,3:提现]',
    created_date        timestamp                          null comment '创建时间',
    created_by          varchar(150)                       null comment '创建人',
    updated_date        timestamp                          null comment '修改时间',
    updated_by          varchar(150)                       null comment '修改人',
    report_amount       decimal(20, 2)                     null comment '事件上报开始金额',
    channel             varchar(150)                       null comment '渠道',
    rate_limit          decimal(10, 4)      default 1.0000 null comment '上报比例',
    platform_type       tinyint(1) unsigned default 1      null comment '平台类型[1-Adjust | 2-Firebase]',
    firebase_api_secret varchar(100)                       null comment 'firebase_api_secret',
    firebase_app_id     varchar(100)                       null comment 'firebase_app_id',
    constraint app_event_mapping_info_aet
        unique (app_token, event_token, type)
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;


-- auto-generated definition
create table transport_config_info
(
    id           bigint auto_increment comment '主键'
        primary key,
    pkg          varchar(255)   not null comment '包',
    channel_id   varchar(150)   not null comment '渠道号',
    app_token    varchar(255)   null comment 'app Token',
    report_type  varchar(255)   null comment '上行类型(多个以逗号隔开)',
    app_type     int default 1  not null comment '应用类型[1:APK-gaid,2:APK-ADID,3:H5,4:Webview-APK,5:Webview-Web]',
    report_way   int            null comment '上行方式[0:adjust,1:SDK]',
    enable       int            null comment '是否生效[0:无效,1:有效]',
    policy       int            null comment '策略[1:直接上报;2:首次充值开始24小时内数据上报;3:首次登录开始24小时内数据上报;4:限制金额上报]',
    `limit`      decimal(10, 2) null comment '金额限制[策略4生效]',
    r_limit      decimal(10, 2) null comment '大R金额限制[超过即为大R,策略4生效]',
    created_date timestamp      null comment '创建时间',
    created_by   varchar(150)   null comment '创建人',
    updated_date timestamp      null comment '修改时间',
    updated_by   varchar(150)   null comment '修改人',
    fb_rate      decimal(20, 4) null comment 'fb金额比例',
    origin       int            null comment '来源[1:原始，2:圣魂]',
    constraint transport_config_info_pkg_channel
        unique (pkg, channel_id, enable, policy)
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;

