
-- pg 库  ad_advertiser_campaign表
alter table ad_advertiser_campaign
    add source varchar(30);
comment on column ad_advertiser_campaign.source is '投放平台';

alter table ad_advertiser_campaign
    add enable int4;
comment on column ad_advertiser_campaign.enable is '是否可用[0:不可用,1:可用]';


