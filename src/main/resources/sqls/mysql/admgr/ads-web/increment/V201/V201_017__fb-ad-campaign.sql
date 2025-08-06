-- DROP TABLE IF EXISTS fb_ad_campaign;

create table fb_ad_campaign
(
    id               bigint auto_increment comment '主键'
        primary key,
    ad_channel       varchar(20)    null comment '投放渠道',
    team             varchar(20)    null comment '投放团队',
    account_id       varchar(20)    null comment '账号ID',
    keywords         varchar(20)    null comment '关键字',
    campaign_id      varchar(20)    null comment '广告系列ID',
    campaign_name    varchar(255)   null comment '广告系列名称',
    campaign_type    varchar(255)   null comment '广告系列类型',
    type             int            null comment '广告系列类[1:3A,2:非3A]',
    status           varchar(50)    null comment '广告系列状态',
    account_status   int            null comment '广告账户状态',
    created          timestamp      null comment '创建时间',
    created_id       int            null comment '创建者用户ID',
    created_name     varchar(20)    null comment '创建者',
    updated          timestamp      null comment '修改时间',
    updated_id       int            null comment '修改者用户ID',
    updated_name     varchar(20)    null comment '修改人',
    dates            int            null comment '日期',
    team_id          int            null comment '项目团队ID'
)ENGINE = INNODB COMMENT = '创建的FB广告系列v2';

