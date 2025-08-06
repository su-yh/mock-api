-- 数据库名:ads2

-- fb_app_account;

create table fb_app_account
(
    id                  bigint auto_increment
        primary key,
    ad_channel          varchar(20)      null comment '广告投放渠道',
    app_id              varchar(20)      null comment '应用id',
    personal_account_id varchar(20)      null comment '个户id',
    team                varchar(20)      null comment '项目组',
    type                int(4) default 1 not null comment '账户类别(1:正常户,2:三不限,3:二不限，4:其他)',
    account_id          varchar(20)      null comment '账号id',
    page_no             int              null comment '主页编码',
    balance             decimal(20, 4)   null comment '账户余额',
    enable              int              null comment '是否启用',
    status              int    default 1 null comment '状态,1 = ACTIVE 2 = DISABLED 3 = UNSETTLED 7 = PENDING_RISK_REVIEW 8 = PENDING_SETTLEMENT 9 = IN_GRACE_PERIOD 100 = PENDING_CLOSURE 101 = CLOSED 201 = ANY_ACTIVE 202 = ANY_CLOSED',
    disabled_time       timestamp        null comment '账号被禁用时间',
    created             timestamp        null comment '创建时间',
    updated             timestamp        null comment '修改时间',
    dates               int              null comment '创建日期'
)
    comment 'meta 应用账号关系表';



-- fb_app;

create table fb_app
(
    id         bigint auto_increment comment '主键'
        primary key,
    ad_channel varchar(20) null comment '投放渠道',
    type       int(4)      null comment '投放类型(1:app,2:web)',
    app_id     varchar(50) null comment '应用id',
    app_secret varchar(50) null comment '应用密钥',
    status     int         null comment '状态',
    dates      int         null comment '日期',
    created    timestamp   null comment '创建时间',
    updated    timestamp   null comment '创建时间'
)
    comment 'fb应用关系';




-- fb_adjust_app_token;

create table fb_adjust_app_token
(
    id         bigint auto_increment comment '主键'
        primary key,
    ad_channel varchar(20)  null comment '投放渠道',
    channel    varchar(20)  null comment '渠道',
    pkg        varchar(150) null comment '包名',
    app_token  varchar(50)  null comment '应用token',
    status     int          null comment '应用状态',
    time_zone  varchar(50)  null comment '时区',
    dates      int          null comment '创建日期',
    created    timestamp    null comment '创建时间',
    updated    timestamp    null comment '修改时间',
    created_by varchar(50)  null comment '创建人',
    updated_by varchar(50)  null comment '修改人'
)
    comment 'fb应用密钥管理';

create index unidx_fb_app_token__index
    on fb_adjust_app_token (app_token);




-- fb_app_token;
create table fb_app_token
(
    id                  bigint auto_increment comment '主键'
        primary key,
    ad_channel          varchar(20)  null comment '广告投放渠道',
    app_id              varchar(20)  null comment '应用id',
    personal_account_id varchar(20)  null comment '个户ID',
    token               text         null comment '长期token，有效期60天',
    status              int          null comment '状态',
    name                varchar(250) null comment '商店包名称',
    store_url           varchar(250) null comment '商店地址',
    expir_date          int          null comment '过去日期',
    created             timestamp    null comment '创建时间',
    updated             timestamp    null comment '修改时间',
    dates               int          null comment '创建日期'
)
    comment 'meta 应用token表';


-- suyh - 冲突了，表字段不匹配，暂时没有添加数据进去。
-- fb_app
INSERT INTO fb_app (ad_channel, type, app_id, app_secret, status, dates, created, updated) VALUES ( '123456', 1, '36985214789646', '56789090', 1, 20231116, '2023-11-17 00:28:48', '2023-11-20 19:41:32');
INSERT INTO fb_app (ad_channel, type, app_id, app_secret, status, dates, created, updated) VALUES ( '678904577', 2, '345567888', '666667777', 1, 20231116, '2023-11-17 05:29:13', '2023-11-20 19:41:24');
INSERT INTO fb_app (ad_channel, type, app_id, app_secret, status, dates, created, updated) VALUES ( '23512', 2, '123455662', '333333333456', 1, 20231120, '2023-11-20 17:46:37', '2023-11-20 19:52:50');
INSERT INTO fb_app (ad_channel, type, app_id, app_secret, status, dates, created, updated) VALUES ( '12345', 2, '123123', '123123', 1, 20231121, '2023-11-21 15:55:25', '2023-11-21 15:55:25');

-- fb_app_token
INSERT INTO fb_app_token (ad_channel, app_id, personal_account_id, token, status, name, store_url, expir_date, created, updated, dates) VALUES ('123456', '36985214789646', '123456798789', 'EAAJqZA6BZCyTgBO2DsHSPRgfxLlcc2jb4ZBivQyWLqTs9uFO2DpRWqg3SJe1CS7D3gJ7ZBGRtO5IssilK5mzTsbk9VpEYn8kKjkXEGNfcmmwZC3GbXYFPLZACXSS3IdLYixXxUSF2wtBY2Ytvfg1ZBIKTCKCs2YB3tbW3vsSWxw9YI7znnhKqdPNef0', 1, 'DiceZenith', 'http://play.google.com/store/apps/details?id=xxx.xx.xxx', 20231203, '2023-10-05 19:57:52', '2023-10-05 19:57:52', 20231005);


-- fb_app_account
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '308292928588896', 996.000000, 26, 0, 2, '2023-10-19 16:30:00', '2023-10-19 16:20:01', '2023-10-19 16:30:00', 20231019);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '698574505507544', 997.000000, 26, 0, 2, '2023-10-19 16:30:00', '2023-10-19 16:20:01', '2023-10-19 16:30:00', 20231019);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '731221588840367', 998.000000, 26, 0, 2, '2023-10-19 16:30:00', '2023-10-19 16:20:01', '2023-10-19 16:30:00', 20231019);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '891270339005340', 996.000000, 26, 0, 2, '2023-10-19 16:30:00', '2023-10-19 16:20:01', '2023-10-19 16:30:00', 20231019);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '860516695388206', 996.000000, 26, 0, 2, '2023-10-19 16:30:00', '2023-10-19 16:20:01', '2023-10-19 16:30:00', 20231019);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '1010486983498621', 1708.000000, 100, 0, 2, '2023-11-16 14:30:00', '2023-11-10 20:50:16', '2023-11-16 14:30:00', 20231110);
INSERT INTO fb_app_account ( ad_channel, app_id, personal_account_id, team, account_id, balance, page_no, enable, status, disabled_time, created, updated, dates) VALUES ( '123456', '36985214789646', '100092238266311', 'xxx', '3487846318122899', 955.000000, 100, 0, 2, '2023-11-11 07:00:00', '2023-11-11 09:20:16', '2023-11-30 20:03:42', 20231110);

