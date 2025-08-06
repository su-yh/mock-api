
DROP TABLE if EXISTS ad_advertiser;
CREATE TABLE ad_advertiser  (
    id BIGSERIAL PRIMARY KEY,
    name varchar(255)  NOT NULL ,
    sys_user_id bigint NOT NULL,
    channel varchar(255)  NULL ,
    source varchar(255)  NULL ,
    created timestamp NULL DEFAULT NULL ,
    updated timestamp NULL DEFAULT NULL ,
    keywords varchar(255)  NOT NULL DEFAULT '' ,
    single_pn int NULL DEFAULT NULL,
    project_ids varchar(100)  NULL DEFAULT NULL
);

CREATE UNIQUE INDEX uni_ad_advertiser_tb_advertiser_name_unique ON ad_advertiser (name);

COMMENT ON TABLE ad_advertiser IS '投放方';

comment on column ad_advertiser.name is '投放方名称';
comment on column ad_advertiser.sys_user_id is '创建用户id';
comment on column ad_advertiser.source is '投放平台';
comment on column ad_advertiser.keywords is '关键字（,号隔开）';
comment on column ad_advertiser.single_pn is '【0 多个pn | 1 单个pn】所属于单独一个pn的投放方,用于方便投放日报的查询逻辑';
comment on column ad_advertiser.project_ids is '关联的project_ids[]';




DROP TABLE if EXISTS ad_advertiser_campaign;

CREATE TABLE ad_advertiser_campaign  (
    id BIGSERIAL PRIMARY KEY,
    advertiser_id bigint NOT NULL DEFAULT 0 ,
    campaign_id varchar(255)  NULL DEFAULT NULL,
    channel varchar(50)  NULL ,
    pn varchar(50)  NULL ,
    created timestamp NULL ,
    updated timestamp NULL
);

CREATE UNIQUE INDEX uni_ad_advertiser_campaign_pk ON ad_advertiser_campaign (advertiser_id, campaign_id);
-- 遗漏了索引
CREATE INDEX ad_advertiser_campaign_campaign_id_index ON ad_advertiser_campaign USING btree (campaign_id);
