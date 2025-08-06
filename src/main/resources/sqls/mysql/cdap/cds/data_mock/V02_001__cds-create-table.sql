
-- -- 这里跟 ad_advertiser_campaign 有些重复的地方，但是它那边没有广告系列名称。
-- -- 所以以这张表中的数据为准，同时同步到 ad_advertiser_campaign 表中。
-- -- drop table if exists data_mock_ads_info;
-- create table data_mock_ads_info
-- (
--     id         bigint auto_increment comment '主键' primary key,
--     key_value      varchar(128)  null comment 'key',
--     campaign_id      varchar(64)  null comment '广告系列ID',
--     campaign_name      varchar(64)  null comment '广告系列名称',
--     ad_group_id      varchar(64) null comment '',
--     ad_id      varchar(128) null comment '',
--     advertiser_id    bigint  null comment '所属投放方ID',
--     channel    varchar(128)  null ,
--     pn    varchar(128)  null ,
--     source_plat  varchar(16) not null comment '源平台：FB、GG'
-- ) engine=innodb    comment '测试数据表，广告系列基础数据';
--
--
-- ALTER TABLE data_mock_ads_info
--     ADD UNIQUE INDEX index_key(campaign_id, ad_group_id, ad_id) USING BTREE;
--
-- ALTER TABLE data_mock_ads_info
--     ADD INDEX index_source(source_plat) USING BTREE;







