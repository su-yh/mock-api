-- adjust_ad
create table adjust_ad
(
    id            bigserial primary key,
    dates         integer,
	key           varchar(255),
    channel       varchar(30),
    pkg           varchar(255),
    app_id        varchar(50),
    app_name      varchar(150),
    app_token     varchar(30),
    tracker       varchar(30),
    click_referer varchar(255),
    network       varchar(100),
    source        varchar(20),
    campaign_id   varchar(50) default ''::character varying,
    campaign_name varchar(255),
    ad_group_id   varchar(50) default ''::character varying,
    ad_group_name varchar(255),
    ad_id         varchar(50) default ''::character varying,
    ad_name       varchar(255),
    creative_id   varchar(50) default ''::character varying,
    creative_name varchar(255),
    created       timestamp,
    updated       timestamp
);

comment on table adjust_ad is 'adjust广告数据';

comment on column adjust_ad.id is '主键';

comment on column adjust_ad.dates is '日期';

comment on column adjust_ad.channel is '渠道';

comment on column adjust_ad.pkg is '包名';

comment on column adjust_ad.app_id is 'adjust应用id';

comment on column adjust_ad.app_name is 'adjust应用名';

comment on column adjust_ad.app_token is 'adjust应用token';

comment on column adjust_ad.tracker is '追踪token';

comment on column adjust_ad.click_referer is '点击referer';

comment on column adjust_ad.network is '归因网络';

comment on column adjust_ad.source is '广告平台';

comment on column adjust_ad.campaign_id is '广告系列ID';

comment on column adjust_ad.campaign_name is '广告系列名';

comment on column adjust_ad.ad_group_id is '广告组ID';

comment on column adjust_ad.ad_group_name is '广告组名';

comment on column adjust_ad.ad_id is '广告ID';

comment on column adjust_ad.ad_name is '广告名';

comment on column adjust_ad.creative_id is '广告素材ID';

comment on column adjust_ad.creative_name is '素材名';

comment on column adjust_ad.created is '创建时间';

comment on column adjust_ad.updated is '修改时间';

comment on column adjust_ad.key is '广告关键字';


create unique index uni_adjust_ad_k
    on adjust_ad (key);

-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.oos-channelid-test_1000054-source-FB-campaign-23857233463670109-adgroup-23857233463760109-creative-23857233463710109', 'test_1000054', 'test.test.oos', '123456', 'Test App', 'jfma3gosm58g', '4ee59q1', null, 'test_FB', 'FB', '23857233463670109', 'Test-campaign-1%+1%-10%-Casino-tp-0719-3-copy22', '23857233463760109', 'Test-1%+1%-10%-Casino-tp-0705-1', '23857233463710109', '20230705+JH-(4).mp4', '', null, '2024-06-25 12:45:20.878000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.qnbz-channelid-test_1000196-source-FB-campaign-23856443128690335-adgroup-23856443128870335-creative-23856487822160335', 'test_1000196', 'test.test.qnbz', '123456', 'Test App', 'kps4p4onc9vk', '117qrhc7', null, 'test_FB', 'FB', '23856443128690335', 'Test-campaign-AEO-XS-0711', '23856443128870335', 'AEO', '23856487822160335', '6 - 广告副本', '', null, '2024-06-25 12:45:22.037000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.svzuq.aeiw-channelid-test_1000025-source-FB-campaign-23857017836760432-adgroup-23857017836670432-creative-23857017836770432', 'test_1000025', 'test.test.svzuq.aeiw', '123456', 'Test App', '61x6yt6hym0w', 'unattr', null, 'test_FB', 'FB', '23857017836760432', 'Test-campaign-NEW_tset', '23857017836670432', 'AEO', '23857017836770432', '7', '', null, '2024-06-25 12:45:22.344000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.tejys.dkvs-channelid-test_1000209-source-FB-campaign-23857577603260209-adgroup-23857577603240209-creative-23857577616020209', 'test_1000209', 'test.test.tejys.dkvs', '123456', 'Test App', 'sijbipzd0idc', 'unattr', null, 'test_FB', 'FB', '23857577603260209', 'Test-campaign-AEO-XS-0727', '23857577603240209', 'AEO', '23857577616020209', '7', '', null, '2024-06-25 12:45:22.546000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.df-channelid-test_1000484-source-FB-campaign-23856877991840600-adgroup-23856877991830600-creative-23856877991860600', 'test_1000484', 'test.test.df', '123456', 'Test App', '2rc1a2ovombk', 'unattr', null, 'test_FB', 'FB', '23856877991840600', 'Test-campaign-PUZZLE-callbreak-072708', '23856877991830600', '1845-M', '23856877991860600', 'hjh10', '', null, '2024-06-25 12:45:22.648000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.p-channelid-test_1000457-source-FB-campaign-23857022300720432-adgroup-23857022300410432-creative-23857022300460432', 'test_1000457', 'test.test.p', '123456', 'Test App', '6j7tlyuk1qio', 'unattr', null, 'test_FB', 'FB', '23857022300720432', 'Test-campaign-5-Video-0727-List(casino)-Poker-071806', '23857022300410432', '1', '23857022300460432', '1', '', null, '2024-06-25 12:45:22.756000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.mvmj.egegu-channelid-test_1000210-source-FB-campaign-23857496207040089-adgroup-23857496207030089-creative-23857496231120089', 'test_1000210', 'test.test.mvmj.egegu', '123456', 'Test App', 'ckqryd8vaj28', 'unattr', null, 'test_FB', 'FB', '23857496207040089', 'Test-campaign_01_VO_0725-2-2', '23857496207030089', '0724-V4', '23857496231120089', '0724-V4 -4', '', null, '2024-06-25 12:45:22.858000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.tests.svzuq.aeiw-channelid-test_1000025-source-FB-campaign-23857097352780472-adgroup-23857097352730472-creative-23857097352800472', 'test_1000025', 'test.test.svzuq.aeiw', '123456', 'Test App', '61x6yt6hym0w', 'unattr', null, 'test_FB', 'FB', '23857097352780472', 'Test-campaign_0629-02_BR_aeo_qjh_new_0727_4', '23857097352730472', 'all', '23857097352800472', '32025-0727-qjh-6.mov', '', null, '2024-06-25 12:45:23.001000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.dragg-channelid-test_1000224-source-GG-campaign-20399507941', 'test_1000224', 'test.test.dragg', '123456', 'Test App', 'gio3sq8dcjr4', '12gm8r29', null, 'test_GG', 'GG', '20399507941', 'Test-campaign-0725#9-pic', '151054115225', null, '', null, '', null, '2024-06-25 12:45:17.605000', null);
-- INSERT INTO adjust_ad (dates, key, channel, pkg, app_id, app_name, app_token, tracker, click_referer, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, created, updated) VALUES (20240625, 'pkg-test.test.dragg-channelid-test_1000224-source-GG-campaign-20398127006', 'test_1000224', 'test.test.dragg', '123456', 'Test App', 'gio3sq8dcjr4', '12wp5kpw', null, 'test_GG', 'GG', '20398127006', 'Test-campaign-0726#10', '151676087957', null, '', null, '', null, '2024-06-25 12:45:35.570000', null);



-- adjust_user
create table adjust_user
(
    id            bigserial primary key,
    dates         integer,
    gaid          varchar(50),
    adid          varchar(50),
    channel       varchar(30),
    pkg           varchar(255),
	key           varchar(255),
    app_id        varchar(50),
    app_name      varchar(150),
    app_token     varchar(30),
    tracker       varchar(30),
    click_referer varchar(255),
    installed_at  bigint,
    network       varchar(100),
    source        varchar(20),
    campaign_id   varchar(50) default ''::character varying,
    campaign_name varchar(255),
    ad_group_id   varchar(50) default ''::character varying,
    ad_group_name varchar(255),
    ad_id         varchar(50) default ''::character varying,
    ad_name       varchar(255),
    creative_id   varchar(50) default ''::character varying,
    creative_name varchar(255),
    ip            varchar(130),
    city          varchar(50),
    isp           varchar(255),
    language      varchar(50),
    device_name   varchar(150),
    os_version    varchar(100),
    timezone      varchar(50),
    deeplink      varchar(255),
    web_uuid      varchar(50),
    created       timestamp,
    updated       timestamp
);

comment on table adjust_user is 'adjust回传安装数据';

comment on column adjust_user.id is '主键';

comment on column adjust_user.dates is '日期';

comment on column adjust_user.gaid is 'google广告id';

comment on column adjust_user.adid is 'adjust Id';

comment on column adjust_user.channel is '渠道';

comment on column adjust_user.pkg is '包名';

comment on column adjust_user.app_id is 'adjust应用id';

comment on column adjust_user.app_name is 'adjust应用名';

comment on column adjust_user.app_token is 'adjust应用token';

comment on column adjust_user.tracker is '追踪token';

comment on column adjust_user.click_referer is '点击referer';

comment on column adjust_user.installed_at is '安装时间';

comment on column adjust_user.network is '归因网络';

comment on column adjust_user.source is '广告平台';

comment on column adjust_user.campaign_id is '广告系列ID';

comment on column adjust_user.campaign_name is '广告系列名';

comment on column adjust_user.ad_group_id is '广告组ID';

comment on column adjust_user.ad_group_name is '广告组名';

comment on column adjust_user.ad_id is '广告ID';

comment on column adjust_user.ad_name is '广告名';

comment on column adjust_user.creative_id is '广告素材ID';

comment on column adjust_user.creative_name is '素材名';

comment on column adjust_user.ip is 'IP地址';

comment on column adjust_user.city is '城市';

comment on column adjust_user.isp is '运营商';

comment on column adjust_user.language is '语言';

comment on column adjust_user.device_name is '设备名称';

comment on column adjust_user.os_version is '设备系统版本';

comment on column adjust_user.timezone is '时区';

comment on column adjust_user.deeplink is '深度链接';

comment on column adjust_user.web_uuid is '网络uuid';

comment on column adjust_user.created is '创建时间';

comment on column adjust_user.updated is '修改时间';

comment on column adjust_user.key is '广告key';


create unique index uni_adjust_user_g_p_c
    on adjust_user (gaid, pkg, channel);


-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240407, 'b672698c-dc63-4834-a075-c888555', '23862006961760524', 'test_1000484', 'test.test.df', 'pkg-test.test.df-channelid-test_1000484-source-FB-campaign-23862006880000524-adgroup-23862006880140524-creative-23862006880100524', 'test.test.df', 'Test', '2rc1a2ovombk', 'unattr', '', 1712504339, null, 'FB', '23862006880000524', 'Test_1007_1 - 广告副本', '23862006880140524', '新应用推广广告组', '23862006880100524', '9', '', null, null, null, null, 'en', null, '11', 'UTC+0000', null, null, '2024-04-07 23:38:59.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240612, '8a240d13-5e13-4561-9e98-6201136db777', '64469232e6127fecb4abd39e62553818', 'test_1001021', 'test.test.lucky', 'pkg-test.test.lucky-channelid-test_1001021-source-GG-campaign-21337132555', 'ctest.test.lucky', 'Test', 'yjpl4e8ymww0', '1cpmcky8', '', 1718178103, null, 'GG', '21337132555', 'Test-0528#1', '161643007423', null, '', null, '', null, null, null, null, 'en', null, '14', 'UTC+0000', null, null, '2024-06-12 15:41:43.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240612, '8a240d13-5e13-4561-9e98-6201136db968', '64469232e6127fecb4abd39e62553818', 'test_1001021', 'test.test.lucky', 'pkg-test.test.lucky-channelid-test_1001021-source-GG-campaign-21337132555', 'test.test.lucky', 'Test', 'yjpl4e8ymww0', '1cpmcky8', '', 1718178103, null, 'GG', '21337132555', 'Test-0528#1', '161643007423', null, '', null, '', null, null, null, null, 'en', null, '14', 'UTC+0000', null, null, '2024-06-12 15:41:43.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240612, '8a240d13-5e13-4561-9e98-6201136db969', '64469232e6127fecb4abd39e62553818', 'test_1001021', 'test.test.lucky', 'pkg-test.test.lucky-channelid-test_1001021-source-GG-campaign-21337132555', 'test.test.lucky', 'Test', 'yjpl4e8ymww0', '1cpmcky8', '', 1718178103, null, 'GG', '21337132555', 'Test-0528#1', '161643007423', null, '', null, '', null, null, null, null, 'en', null, '14', 'UTC+0000', null, null, '2024-06-12 15:41:43.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240407, 'b672698c-dc63-4834-a075-c0777777', '23862006961760524', 'test_1000484', 'test.test.df', 'pkg-test.test.df-channelid-test_1000484-source-FB-campaign-23862006880000524-adgroup-23862006880140524-creative-23862006880100524', 'test.test.df', 'Test', '2rc1a2ovombk', 'unattr', '', 1712504339, null, 'FB', '23862006880000524', 'Test_1007_1 - 广告副本', '23862006880140524', '新应用推广广告组', '23862006880100524', '9', '', null, null, null, null, 'en', null, '11', 'UTC+0000', null, null, '2024-04-07 23:38:59.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240407, 'b672698c-dc63-4834-a075-c0744e7d1c7b', '23862006961760524', 'test_1000484', 'test.test.df', 'pkg-test.test.df-channelid-test_1000484-source-FB-campaign-23862006880000524-adgroup-23862006880140524-creative-23862006880100524', 'test.test.df', 'Test', '2rc1a2ovombk', 'unattr', '', 1712504339, null, 'FB', '23862006880000524', 'Test_1007_1 - 广告副本', '23862006880140524', '新应用推广广告组', '23862006880100524', '9', '', null, null, null, null, 'en', null, '11', 'UTC+0000', null, null, '2024-04-07 23:38:59.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240221, '9b730bb8-c8d3-4969-b9c8-335596caed77', '487fbe0ef684721e462f005f1dd85c02', 'test_1000053', 'test.test.l', 'pkg-test.test.l-channelid-test1000053-source-GG-campaign-20685311927', 'test.test.l', 'Test', 'zxayq4qipkw0', '19tx22tw', '', 1708506208, null, 'GG', '20685311927', 'Test-231013 #2', '161464901514', null, '', null, '', null, null, null, null, 'en', null, '11', 'UTC+0000', null, null, '2024-02-21 17:03:28.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240510, '7dc6fd0c-6d70-4dd3-8c01-23eb5cb38263', 'f048412a661f1dd2bd4600e1a4cfcbb7', 'test_1000484', 'test.test.df', 'pkg-test.test.df-channelid-test_1000484', 'test.test.df', 'Test', '2rc1a2ovombk', '1cbhz7cz', '', 1715279464, null, 'Organic', '', null, '', null, '', null, '', null, '152.59.192.201', 'Hyderabad', 'Jio', 'en', 'NordCE3Lite', '13', 'UTC+0530', null, null, '2024-05-10 02:31:04.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240510, '57722b8d-4d87-413f-a929-778555', '34280a4a0fcffc5b89cc89b46aade7f8', 'test_1000473', 'test.test.child', 'pkg-test.test.user.child-channelid-test_1000473', 'test.test.user', 'Test', '16g6vc341k9s', '1afb6l03', '', 1715279484, null, 'Organic', '', null, '', null, '', null, '', null, '152.58.101.110', 'Jaipur', 'Jio', 'en', 'NordCE3Lite', '14', 'UTC+0530', null, null, '2024-05-10 02:31:24.000000', null);
-- INSERT INTO adjust_user (dates, gaid, adid, channel, pkg, key, app_id, app_name, app_token, tracker, click_referer, installed_at, network, source, campaign_id, campaign_name, ad_group_id, ad_group_name, ad_id, ad_name, creative_id, creative_name, ip, city, isp, language, device_name, os_version, timezone, deeplink, web_uuid, created, updated) VALUES (20240612, '8a240d13-5e13-4561-9e98-6201136dbb01', '64469232e6127fecb4abd39e62553818', 'test_1001021', 'test.test.lucky', 'pkg-test.test.lucky-channelid-test_1001021-source-GG-campaign-21337132555', 'test.test.lucky', 'Test', 'yjpl4e8ymww0', '1cpmcky8', '', 1718178103, null, 'GG', '21337132555', 'Test-0528#1', '161643007423', null, '', null, '', null, null, null, null, 'en', null, '14', 'UTC+0000', null, null, '2024-06-12 15:41:43.000000', null);




-- adjust_user_history
create table adjust_user_history
(
    id            bigserial
            primary key,
    dates         integer,
    gaid          varchar(50),
    adid          varchar(50),
    channel       varchar(30),
    pkg           varchar(255),
	key           varchar(255),
    app_id        varchar(50),
    app_name      varchar(150),
    app_token     varchar(30),
    tracker       varchar(30),
    click_referer varchar(255),
    installed_at  bigint,
    network       varchar(100),
    source        varchar(20),
    campaign_id   varchar(50),
    campaign_name varchar(255),
    ad_group_id   varchar(50),
    ad_group_name varchar(100),
    ad_id         varchar(50),
    ad_name       varchar(100),
    creative_id   varchar(50),
    creative_name varchar(255),
    ip            varchar(130),
    city          varchar(50),
    isp           varchar(255),
    language      varchar(50),
    device_name   varchar(150),
    os_version    varchar(100),
    timezone      varchar(50),
    deeplink      varchar(255),
    web_uuid      varchar(50),
    params        text,
    created       timestamp,
    updated       timestamp
);

comment on table adjust_user_history is 'adjust回传安装数据';

comment on column adjust_user_history.id is '主键';

comment on column adjust_user_history.dates is '日期';

comment on column adjust_user_history.gaid is 'google广告id';

comment on column adjust_user_history.adid is 'adjust Id';

comment on column adjust_user_history.channel is '渠道';

comment on column adjust_user_history.pkg is '包名';

comment on column adjust_user_history.app_id is 'adjust应用id';

comment on column adjust_user_history.app_name is 'adjust应用名';

comment on column adjust_user_history.app_token is 'adjust应用token';

comment on column adjust_user_history.tracker is '追踪token';

comment on column adjust_user_history.click_referer is '点击referer';

comment on column adjust_user_history.installed_at is '安装时间';

comment on column adjust_user_history.network is '归因网络';

comment on column adjust_user_history.source is '广告平台';

comment on column adjust_user_history.campaign_id is '广告系列ID';

comment on column adjust_user_history.campaign_name is '广告系列名';

comment on column adjust_user_history.ad_group_id is '广告组ID';

comment on column adjust_user_history.ad_group_name is '广告组名';

comment on column adjust_user_history.ad_id is '广告ID';

comment on column adjust_user_history.ad_name is '广告名';

comment on column adjust_user_history.creative_id is '广告素材ID';

comment on column adjust_user_history.creative_name is '素材名';

comment on column adjust_user_history.ip is 'IP地址';

comment on column adjust_user_history.city is '城市';

comment on column adjust_user_history.isp is '运营商';

comment on column adjust_user_history.language is '语言';

comment on column adjust_user_history.device_name is '设备名称';

comment on column adjust_user_history.os_version is '设备系统版本';

comment on column adjust_user_history.timezone is '时区';

comment on column adjust_user_history.deeplink is '深度链接';

comment on column adjust_user_history.web_uuid is '网络uuid';

comment on column adjust_user_history.params is '参数数据';

comment on column adjust_user_history.created is '创建时间';

comment on column adjust_user_history.updated is '修改时间';

comment on column adjust_user_history.key is '广告key';



-- 花费表
create table adjust_cost_record
(
    id          bigserial
            primary key,
    dates       integer,
    channel     varchar(30),
    pkg         varchar(255),
	key         varchar(255),
    app_token   varchar(30),
    source      varchar(20),
    cost        numeric(18, 2),
    campaign_id varchar(50) default ''::character varying,
    ad_group_id varchar(50) default ''::character varying,
    ad_id       varchar(50) default ''::character varying,
    created     timestamp,
    updated     timestamp
);

comment on table adjust_cost_record is 'adjust拉取的花费';

comment on column adjust_cost_record.id is '主键';

comment on column adjust_cost_record.dates is '日期';

comment on column adjust_cost_record.channel is '渠道号';

comment on column adjust_cost_record.pkg is '包名';

comment on column adjust_cost_record.app_token is 'adjust应用token';

comment on column adjust_cost_record.source is '广告投放平台';

comment on column adjust_cost_record.cost is '花费';

comment on column adjust_cost_record.campaign_id is '广告系列ID';

comment on column adjust_cost_record.ad_group_id is '广告组ID';

comment on column adjust_cost_record.ad_id is '广告ID';

comment on column adjust_cost_record.created is '创建时间';

comment on column adjust_cost_record.updated is '修改时间';

comment on column adjust_cost_record.key is '广告key';



create unique index uni_adjust_cost_record_d_c_k
    on adjust_cost_record (dates, channel, key);


-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120208904756930065-adgroup-120208904756990065-creative-120208904757330065', 'g81zzvb4xeyo', 'FB', 19.12, '120208904756930065', '120208904756990065', '120208904757330065', '2024-05-29 19:41:21.264000', '2024-05-29 19:41:21.169000', '1358188454858552', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120210786839550484-adgroup-120210786839560484-creative-120210786940450484', 'g81zzvb4xeyo', 'FB', 32.42, '120210786839550484', '120210786839560484', '120210786940450484', '2024-05-29 19:41:21.455000', '2024-05-29 19:41:21.360000', '333295253121774', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120208904756930065-adgroup-120208904756990065-creative-120208904757020065', 'g81zzvb4xeyo', 'FB', 4396.09, '120208904756930065', '120208904756990065', '120208904757020065', '2024-05-29 19:41:21.648000', '2024-05-29 19:41:21.552000', '1358188454858552', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120208354756100125-adgroup-120208354756370125-creative-120208354838080125', 'g81zzvb4xeyo', 'FB', 127.19, '120208354756100125', '120208354756370125', '120208354838080125', '2024-05-29 19:41:21.838000', '2024-05-29 19:41:21.743000', '333377443120088', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120209944045730713-adgroup-120209944045790713-creative-120209944046160713', 'g81zzvb4xeyo', 'FB', 0.00, '120209944045730713', '120209944045790713', '120209944046160713', '2024-05-29 19:41:22.028000', '2024-05-29 19:41:21.933000', '1007066937507420', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-FB-campaign-120210591651450496-adgroup-120210591651490496-creative-120210591676030496', 'g81zzvb4xeyo', 'FB', 0.00, '120210591651450496', '120210591651490496', '120210591676030496', '2024-05-29 19:41:22.219000', '2024-05-29 19:41:22.124000', '1516761165945394', 'facebook');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-GG-campaign-21282545518-adgroup-162323631339', 'g81zzvb4xeyo', 'GG', 0.00, '21282545518', '162323631339', '', '2024-05-29 19:41:22.410000', '2024-05-29 19:41:22.316000', '9383722837', 'adwords');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-GG-campaign-21246276476-adgroup-161911324779', 'g81zzvb4xeyo', 'GG', 0.00, '21246276476', '161911324779', '', '2024-05-29 19:41:22.791000', '2024-05-29 19:41:22.697000', '7074537891', 'adwords');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-GG-campaign-21272101896-adgroup-165051870711', 'g81zzvb4xeyo', 'GG', 0.00, '21272101896', '165051870711', '', '2024-05-29 19:41:22.984000', '2024-05-29 19:41:22.888000', '9383722837', 'adwords');
-- INSERT INTO adjust_cost_record (dates, channel, pkg, key, app_token, source, cost, campaign_id, ad_group_id, ad_id, created, updated, ad_account_id, partner) VALUES (20240529, 'test_1001133', 'test.test.tLRLPLuLh', 'pkg-test.test.tLRLPLuLh-channelid-test_1001133-source-GG-campaign-21246276446-adgroup-162761982458', 'g81zzvb4xeyo', 'GG', 0.00, '21246276446', '162761982458', '', '2024-05-29 19:41:22.601000', '2024-05-29 19:41:23.080000', '7074537891', 'adwords');





-- 同 mysql 原 cohort_cost_calculate_trend 表

-- suyh - 在前面创建过了，以当前表为准。
drop table cohort_cost_calculate_trend;

create table cohort_cost_calculate_trend
(
    id                 bigserial
            primary key,
    dates              integer,
    bdates             integer,
    cohort             bigint,
    pn                 varchar(10),
    channel            varchar(20),
	key                varchar(255),
    source             varchar(20),
    campaign_id        varchar(50),
    ad_group_id        varchar(50),
    ad_id              varchar(50),
    active             bigint,
    day_recharge       numeric(18, 2),
    day_recharge_count bigint,
    day_withdraw       numeric(18, 2),
    created            timestamp,
    updated            timestamp
);

comment on table cohort_cost_calculate_trend is '同期广告详细数据';

comment on column cohort_cost_calculate_trend.id is '主键';

comment on column cohort_cost_calculate_trend.dates is '注册日期';

comment on column cohort_cost_calculate_trend.bdates is '行为日期';

comment on column cohort_cost_calculate_trend.cohort is '同期值';

comment on column cohort_cost_calculate_trend.pn is '项目';

comment on column cohort_cost_calculate_trend.channel is '渠道';

comment on column cohort_cost_calculate_trend.source is '投放平台';

comment on column cohort_cost_calculate_trend.campaign_id is '广告系列ID';

comment on column cohort_cost_calculate_trend.ad_group_id is '广告组ID';

comment on column cohort_cost_calculate_trend.ad_id is '广告ID';

comment on column cohort_cost_calculate_trend.active is '新增/活跃';

comment on column cohort_cost_calculate_trend.day_recharge is '充值金额';

comment on column cohort_cost_calculate_trend.day_recharge_count is '充值人数';

comment on column cohort_cost_calculate_trend.day_withdraw is '提现金额';

comment on column cohort_cost_calculate_trend.created is '创建时间';

comment on column cohort_cost_calculate_trend.updated is '修改日期';

comment on column cohort_cost_calculate_trend.key is '广告key';


create unique index uni_cohort_detail_record_d_b_c_c_k
    on cohort_cost_calculate_trend (dates, bdates, cohort, channel, key);


-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'Organic', 'Organic', null, null, null, 0, 3000.00, 7, 900.00, '2023-08-04 08:20:51.000000', '2023-08-04 08:20:51.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001', 'Organic', null, null, null, 0, 4600.00, 1, 0.00, '2023-08-04 08:22:02.000000', '2023-08-04 08:22:02.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23851187044940260-adgroup-23851187044950260-creative-23851187044930260', 'FB', '23851187044940260', '23851187044950260', '23851187044930260', 0, 300.00, 1, 0.00, '2023-08-04 08:20:52.000000', '2023-08-04 08:20:52.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852053721590680-adgroup-23852053721600680-creative-23852053721690680', 'FB', '23852053721590680', '23852053721600680', '23852053721690680', 0, 300.00, 1, 0.00, '2023-08-04 08:20:59.000000', '2023-08-04 08:20:59.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852159825620529-adgroup-23852159825640529-creative-23852159825650529', 'FB', '23852159825620529', '23852159825640529', '23852159825650529', 0, 800.00, 1, 500.00, '2023-08-04 08:21:46.000000', '2023-08-04 08:21:46.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852173717760281-adgroup-23852173717710281-creative-23852173717690281', 'FB', '23852173717760281', '23852173717710281', '23852173717690281', 0, 1000.00, 1, 300.00, '2023-08-04 08:21:48.000000', '2023-08-04 08:21:48.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852330314090778-adgroup-23852330314080778-creative-23852330314100778', 'FB', '23852330314090778', '23852330314080778', '23852330314100778', 0, 0.00, 0, 300.00, '2023-08-04 08:21:41.000000', '2023-08-04 08:21:41.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852372602620202-adgroup-23852372602670202-creative-23852372602820202', 'FB', '23852372602620202', '23852372602670202', '23852372602820202', 0, 0.00, 0, 0.00, '2023-08-04 08:21:49.000000', '2023-08-04 08:21:49.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852528762010659-adgroup-23852528761990659-creative-23852528762070659', 'FB', '23852528762010659', '23852528761990659', '23852528762070659', 0, 0.00, 0, 0.00, '2023-08-04 08:21:42.000000', '2023-08-04 08:21:42.000000');
-- INSERT INTO cohort_cost_calculate_trend (dates, bdates, cohort, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, day_recharge, day_recharge_count, day_withdraw, created, updated) VALUES (20240401, 20240403, 2, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-23852535196670503-adgroup-23852535196660503-creative-23852535196720503', 'FB', '23852535196670503', '23852535196660503', '23852535196720503', 0, 300.00, 1, 0.00, '2023-08-04 08:21:42.000000', '2023-08-04 08:21:42.000000');




create table cohort_recharge_retention
(
    id                     bigserial
            primary key,
    dates                  integer,
    bdates                 integer,
	pn                     varchar(30),
    channel                varchar(30),
	key                    varchar(255),
    source                 varchar(30),
    campaign_id            varchar(50) default ''::character varying,
    ad_group_id            varchar(50) default ''::character varying,
    ad_id                  varchar(50) default ''::character varying,
    active                 bigint,
    retention              integer,
    day_recharge           numeric(20, 2),
    day_recharge_count     bigint,
    day_withdrawal         numeric(20, 2),
    new_rehcarge           numeric(20, 2),
    new_recharge_count     bigint,
    new_recharge_retention integer,
    created                timestamp,
    updated                timestamp
);

comment on table cohort_recharge_retention is '充值留存';

comment on column cohort_recharge_retention.id is '主键';

comment on column cohort_recharge_retention.dates is '新增日期';

comment on column cohort_recharge_retention.bdates is '行为日期';

comment on column cohort_recharge_retention.channel is '渠道';

comment on column cohort_recharge_retention.pn is '项目';

comment on column cohort_recharge_retention.source is '投放平台';

comment on column cohort_recharge_retention.campaign_id is '广告系列ID';

comment on column cohort_recharge_retention.ad_group_id is '广告组id';

comment on column cohort_recharge_retention.ad_id is '广告ID';

comment on column cohort_recharge_retention.active is '新增';

comment on column cohort_recharge_retention.retention is '留存';

comment on column cohort_recharge_retention.day_recharge is '充值金额';

comment on column cohort_recharge_retention.day_recharge_count is '充值人数';

comment on column cohort_recharge_retention.day_withdrawal is '提现金额';

comment on column cohort_recharge_retention.new_rehcarge is '新增充值';

comment on column cohort_recharge_retention.new_recharge_count is '新增付费人数';

comment on column cohort_recharge_retention.new_recharge_retention is '新增付费留存';

comment on column cohort_recharge_retention.created is '创建时间';

comment on column cohort_recharge_retention.updated is '修改时间';

comment on column cohort_recharge_retention.key is '广告key';


create unique index uni_cohort_recharge_retention_d_b_c_k
    on cohort_recharge_retention (dates, bdates, channel, key);


-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240330, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-Organic', 'Organic', '', '', '', 1, 0, 200.00, 1, 315.00, 0.00, 0, 7, '2023-05-10 16:32:27.000000', '2023-05-10 16:32:27.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240330, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-19732251091', 'GG', '19732251091', '146938288059', '', 1, 0, 300.00, 1, 0.00, 0.00, 0, 1, '2023-05-10 16:32:26.000000', '2023-05-10 16:32:26.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240330, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-20019882188', 'GG', '20019882188', '150117137682', '', 1, 0, 0.00, 0, 0.00, 0.00, 0, 1, '2023-05-10 16:32:21.000000', '2023-05-10 16:32:21.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240330, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-20022926775', 'GG', '20022926775', '148771654256', '', 1, 0, 0.00, 0, 0.00, 0.00, 0, 1, '2023-05-10 16:32:23.000000', '2023-05-10 16:32:23.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240331, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-Organic', 'Organic', '', '', '', 1, 0, 0.00, 0, 1500.00, 0.00, 0, 10, '2023-05-10 16:32:26.000000', '2023-05-10 16:32:26.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240331, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-19732336715', 'GG', '19732336715', '146164288253', '', 1, 0, 0.00, 0, 0.00, 0.00, 0, 1, '2023-05-10 16:32:28.000000', '2023-05-10 16:32:28.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240331, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-20019882188', 'GG', '20019882188', '150117137682', '', 1, 0, 0.00, 0, 0.00, 0.00, 0, 1, '2023-05-10 16:32:23.000000', '2023-05-10 16:32:23.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240331, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-GG-campaign-20090842540', 'GG', '20090842540', '154496360811', '', 1, 0, 0.00, 0, 0.00, 0.00, 0, 1, '2023-05-10 16:32:24.000000', '2023-05-10 16:32:24.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240401, 20240401, 'test', 'test_1000001', 'Organic', 'Organic', '', '', '', 1, 0, 1300.00, 4, 0.00, 1300.00, 4, 0, '2023-05-10 11:27:16.000000', '2023-05-10 11:27:16.000000');
-- INSERT INTO cohort_recharge_retention (dates, bdates, pn, channel, key, source, campaign_id, ad_group_id, ad_id, active, retention, day_recharge, day_recharge_count, day_withdrawal, new_rehcarge, new_recharge_count, new_recharge_retention, created, updated) VALUES (20240401, 20240401, 'test', 'test_1000001', 'pkg-test.test.test-channelid-test_1000001-source-FB-campaign-1966088039155254-adgroup-145536660629456-creative-14553666062988856', 'FB', '1966088039155254', '145536660629456', '14553666062988856', 1, 0, 500.00, 1, 0.00, 0.00, 0, 2, '2023-05-10 16:32:23.000000', '2023-05-10 16:32:23.000000');


create table flink_adjust_stat
(
    id                            bigserial
            primary key,
    dates                         integer,
    pn                            varchar(30),
    channel                       varchar(30),
    pkg                           varchar(255),
	key                           varchar(255),
    active                        integer,
    dau                           integer,
    retention                     integer,
    new_recharge                  numeric(20, 2),
    new_recharge_count            integer,
    new_recharge_rate             numeric(14, 4),
    all_recharge                  numeric(20, 2),
    all_recharge_count            integer,
    all_recharge_rate             numeric(14, 4),
    arppu                         numeric(14, 2),
    arpu                          numeric(14, 2),
    all_withdraw                  numeric(20, 2),
    all_income                    numeric(20, 2),
    all_gross_profit               numeric(20, 2),
    all_net_profit                 numeric(20, 2),
    cost                          numeric(20, 2),
    all_cost                      numeric(20, 2),
    day_roi                       numeric(14, 2),
    all_roi                       numeric(14, 2),
    source                        varchar(30),
    campaign_id                   varchar(50),
    ad_group_id                   varchar(50),
    ad_id                         varchar(50),
    total_recharge                numeric(20, 2),
    final_total_recharge          numeric(20, 2),
    final_total_withdraw          numeric(20, 2),
    final_day_recharge            numeric(20, 2),
    final_day_withdraw            numeric(20, 2),
    day_fission_revenue           numeric(20, 2),
    day_sharing_fission_revenue   numeric(20, 2),
    day_delivery_revenue          numeric(20, 2),
    final_day_delivery_revenue    numeric(20, 2),
    day_revenue                   numeric(20, 2),
    final_day_revenue             numeric(20, 2),
    final_dnu_recharge            numeric(20, 2),
    final_arppu                   numeric(20, 2),
    final_arpu                    numeric(20, 2),
    final_day_roi                 numeric(14, 2),
    final_total_roi               numeric(14, 2),
    total_delivery_revenue        numeric(20, 2),
    final_total_delivery_revenue  numeric(20, 2),
    total_revenue                 numeric(20, 2),
    final_total_revenue           numeric(20, 2),
    total_sharing_fission_revenue numeric(20, 2),
    calculate_rate                numeric(14, 2),
    day_withdraw_rate             numeric(14, 2),
    rebate_to_agent               numeric(20, 2),
    final_day_roas                numeric(14, 2),
    remark                        text,
    created                       timestamp,
    updated                       timestamp
);

comment on table flink_adjust_stat is 'adjust统计结果表';

comment on column flink_adjust_stat.id is '主键';

comment on column flink_adjust_stat.dates is '日期';

comment on column flink_adjust_stat.channel is '渠道';

comment on column flink_adjust_stat.pkg is '包名';

comment on column flink_adjust_stat.active is '新增人数';

comment on column flink_adjust_stat.dau is '活跃人数';

comment on column flink_adjust_stat.retention is '次留';

comment on column flink_adjust_stat.new_recharge is '新增充值金额';

comment on column flink_adjust_stat.new_recharge_count is '新增充值人数';

comment on column flink_adjust_stat.new_recharge_rate is '新增充值率';

comment on column flink_adjust_stat.all_recharge is '总充值';

comment on column flink_adjust_stat.all_recharge_count is '总充值人数';

comment on column flink_adjust_stat.all_recharge_rate is '总充值率';

comment on column flink_adjust_stat.arppu is 'arppu';

comment on column flink_adjust_stat.arpu is 'arpu';

comment on column flink_adjust_stat.all_withdraw is '总提现';

comment on column flink_adjust_stat.all_income is '总收入';

comment on column flink_adjust_stat.all_gross_profit is '毛利';

comment on column flink_adjust_stat.all_net_profit is '净利';

comment on column flink_adjust_stat.cost is '花费';

comment on column flink_adjust_stat.all_cost is '累计花费(至dates)';

comment on column flink_adjust_stat.day_roi is 'roi';

comment on column flink_adjust_stat.all_roi is '总roi';

comment on column flink_adjust_stat.remark is '备注';

comment on column flink_adjust_stat.source is '投放平台';

comment on column flink_adjust_stat.campaign_id is '广告系列ID';

comment on column flink_adjust_stat.ad_group_id is '广告组ID';

comment on column flink_adjust_stat.ad_id is '广告ID';

comment on column flink_adjust_stat.total_recharge is '总充值';

comment on column flink_adjust_stat.final_total_recharge is '最终总充值';

comment on column flink_adjust_stat.final_total_withdraw is '最终总提现';

comment on column flink_adjust_stat.final_day_recharge is '最终日充值';

comment on column flink_adjust_stat.final_day_withdraw is '最终日提现';

comment on column flink_adjust_stat.day_fission_revenue is '日裂变收入';

comment on column flink_adjust_stat.day_sharing_fission_revenue is '分享裂变收入';

comment on column flink_adjust_stat.day_delivery_revenue is '交付收入';

comment on column flink_adjust_stat.final_day_delivery_revenue is '最终交付收入';

comment on column flink_adjust_stat.day_revenue is '日收入';

comment on column flink_adjust_stat.final_day_revenue is '最终日收入';

comment on column flink_adjust_stat.final_dnu_recharge is '最总首次充值';

comment on column flink_adjust_stat.final_arppu is 'arppu';

comment on column flink_adjust_stat.final_arpu is 'arpu';

comment on column flink_adjust_stat.final_day_roi is '最终roi';

comment on column flink_adjust_stat.final_total_roi is '总roi';

comment on column flink_adjust_stat.total_delivery_revenue is '总交付收入';

comment on column flink_adjust_stat.final_total_delivery_revenue is '最终总交付收入';

comment on column flink_adjust_stat.total_revenue is '总收入';

comment on column flink_adjust_stat.final_total_revenue is '最终总收入';

comment on column flink_adjust_stat.total_sharing_fission_revenue is '总分享返利收入';

comment on column flink_adjust_stat.day_withdraw_rate is '提现率';

comment on column flink_adjust_stat.rebate_to_agent is '返利';

comment on column flink_adjust_stat.final_day_roas is 'roas';

comment on column flink_adjust_stat.created is '创建时间';

comment on column flink_adjust_stat.updated is '修改时间';

comment on column flink_adjust_stat.key is '广告key';


create unique index uni_flink_adjust_stat_d_c_k
    on flink_adjust_stat (dates, channel, key);


-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496-adgroup-120210591651490496-creative-120210591676030496', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'FB', '120210591651450496', '120210591651490496', '120210591676030496', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518-adgroup-162323631339', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'GG', '21282545518', '162323631339', '', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496789-adgroup-120210591651490496789-creative-120210591676030496789', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'FB', '120210591651450496789', '120210591651490496789', '120210591676030496789', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496456-adgroup-120210591651490496456-creative-120210591676030496456', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'FB', '120210591651450496456', '120210591651490496456', '120210591676030496456', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496741-adgroup-120210591651490496123-creative-120210591676030496785', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'FB', '120210591651450496741', '120210591651490496123', '120210591676030496785', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496852-adgroup-120210591651490496741-creative-120210591676030496745', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'FB', '120210591651450496852', '120210591651490496741', '120210591676030496745', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518123-adgroup-162323631339123', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'GG', '21282545518123', '162323631339123', '', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518234-adgroup-162323631339333', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'GG', '21282545518234', '162323631339333', '', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518456-adgroup-162323631339222', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'GG', '21282545518456', '162323631339222', '', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');
-- INSERT INTO flink_adjust_stat (dates, pn, channel, pkg, key, active, dau, retention, new_recharge, new_recharge_count, new_recharge_rate, all_recharge, all_recharge_count, all_recharge_rate, arppu, arpu, all_withdraw, all_income, all_gross_profit, all_net_profit, cost, all_cost, day_roi, all_roi, source, campaign_id, ad_group_id, ad_id, total_recharge, final_total_recharge, final_total_withdraw, final_day_recharge, final_day_withdraw, day_fission_revenue, day_sharing_fission_revenue, day_delivery_revenue, final_day_delivery_revenue, day_revenue, final_day_revenue, final_dnu_recharge, final_arppu, final_arpu, final_day_roi, final_total_roi, total_delivery_revenue, final_total_delivery_revenue, total_revenue, final_total_revenue, total_sharing_fission_revenue, calculate_rate, day_withdraw_rate, rebate_to_agent, final_day_roas, remark, created, updated) VALUES (20240401, 'test', 'test_1001133', 'test.test.test', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518567-adgroup-162323631339111', 50, 10, 10, 1000.00, 5, 0.5000, 10000.00, 20, 0.4000, 100.00, 100.00, 20000.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'GG', '21282545518567', '162323631339111', '', 1000.00, 100.00, 1000.00, 100.00, 100.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 10.00, 10.00, 10.00, 10.00, 0.00, 0.00, 10.00, 0.00, 'FB', '2024-04-02 11:46:00.000000', '2024-04-02 11:46:00.000000');



create table flink_adjust_stat_detail
(
    id                          bigserial
            primary key,
    dates                       integer,
    active                      integer,
    bdates                      integer,
    pn                            varchar(30),
    channel                     varchar(30),
	key                         varchar(255),
    campaign_id                 varchar(50),
    ad_group_id                 varchar(50),
    ad_id                       varchar(50),
    source                      varchar(20),
    day_retention               integer,
    all_retention               integer,
    day_recharge                numeric(20, 2),
    all_recharge                numeric(20, 2),
    day_recharge_count          integer,
    all_recharge_count          integer,
    day_withdraw                numeric(20, 2),
    all_withdraw                numeric(20, 2),
    day_income                  numeric(20, 2),
    all_income                  numeric(20, 2),
    day_gross_profit             numeric(20, 2),
    all_gross_profit             numeric(20, 2),
    day_net_profit               numeric(20, 2),
    all_net_profit               numeric(20, 2),
    day_cost                    numeric(20, 2),
    all_cost                    numeric(20, 2),
    all_roi                     numeric(14, 2),
    final_day_recharge          numeric(20, 2),
    final_day_withdraw          numeric(20, 2),
    day_delivery_revenue        numeric(20, 2),
    final_delivery_revenue      numeric(20, 2),
    day_fission_revenue         numeric(20, 2),
    day_sharing_fission_revenue numeric(20, 2),
    day_revenue                 numeric(20, 2),
    final_day_revenue           numeric(20, 2),
    final_all_roi               numeric(20, 2),
    final_all_revenue           numeric(20, 2),
    rebate_to_agent             numeric(20, 2),
    final_all_recharge          numeric(20, 2),
    final_all_roas              numeric(14, 2),
	remark                      varchar(255),
    created                     timestamp,
	updated                     timestamp
);

comment on column flink_adjust_stat_detail.id is '主键';

comment on column flink_adjust_stat_detail.dates is '日期';

comment on column flink_adjust_stat_detail.active is '新增';

comment on column flink_adjust_stat_detail.bdates is '行为日期';

comment on column flink_adjust_stat_detail.channel is '渠道';

comment on column flink_adjust_stat_detail.campaign_id is '广告系列ID';

comment on column flink_adjust_stat_detail.ad_group_id is '广告组ID';

comment on column flink_adjust_stat_detail.ad_id is '广告ID';

comment on column flink_adjust_stat_detail.source is '投放平台';

comment on column flink_adjust_stat_detail.day_retention is '日留存';

comment on column flink_adjust_stat_detail.all_retention is '总留存';

comment on column flink_adjust_stat_detail.day_recharge is '日充值';

comment on column flink_adjust_stat_detail.all_recharge is '总充值';

comment on column flink_adjust_stat_detail.day_recharge_count is '日充值人数';

comment on column flink_adjust_stat_detail.all_recharge_count is '总充值人数';

comment on column flink_adjust_stat_detail.day_withdraw is '日提现';

comment on column flink_adjust_stat_detail.all_withdraw is '总提现';

comment on column flink_adjust_stat_detail.day_income is '日收入';

comment on column flink_adjust_stat_detail.all_income is '总收入';

comment on column flink_adjust_stat_detail.day_gross_profit is '日毛利';

comment on column flink_adjust_stat_detail.all_gross_profit is '总毛利';

comment on column flink_adjust_stat_detail.day_net_profit is '日净利';

comment on column flink_adjust_stat_detail.all_net_profit is '总净利';

comment on column flink_adjust_stat_detail.day_cost is '花费';

comment on column flink_adjust_stat_detail.all_cost is '总花费';

comment on column flink_adjust_stat_detail.all_roi is '总ROI';

comment on column flink_adjust_stat_detail.final_day_recharge is '最终总充值';

comment on column flink_adjust_stat_detail.final_day_withdraw is '最终总提现';

comment on column flink_adjust_stat_detail.day_delivery_revenue is '日交付收入';

comment on column flink_adjust_stat_detail.final_delivery_revenue is '最终交付收入';

comment on column flink_adjust_stat_detail.day_fission_revenue is '日裂变收入';

comment on column flink_adjust_stat_detail.day_sharing_fission_revenue is '日分享裂变收入';

comment on column flink_adjust_stat_detail.day_revenue is '日收入';

comment on column flink_adjust_stat_detail.final_day_revenue is '最终日收入';

comment on column flink_adjust_stat_detail.final_all_roi is '最终总roi';

comment on column flink_adjust_stat_detail.final_all_revenue is '最终总收入';

comment on column flink_adjust_stat_detail.updated is '修改日期';

comment on column flink_adjust_stat_detail.remark is '注释';

comment on column flink_adjust_stat_detail.rebate_to_agent is '代理返利';

comment on column flink_adjust_stat_detail.final_all_recharge is '最终总充值';

comment on column flink_adjust_stat_detail.final_all_roas is '最终总roas';

comment on column flink_adjust_stat_detail.created is '创建时间';

comment on column flink_adjust_stat_detail.key is '广告key';


create unique index uni_flink_adjust_stat_detail_d_b_c_k
    on flink_adjust_stat_detail (dates, bdates, channel, key);


-- INSERT INTO flink_adjust_stat_detail (dates, active, bdates, pn, channel, key, campaign_id, ad_group_id, ad_id, source, day_retention, all_retention, day_recharge, all_recharge, day_recharge_count, all_recharge_count, day_withdraw, all_withdraw, day_income, all_income, day_gross_profit, all_gross_profit, day_net_profit, all_net_profit, day_cost, all_cost, all_roi, final_day_recharge, final_day_withdraw, day_delivery_revenue, final_delivery_revenue, day_fission_revenue, day_sharing_fission_revenue, day_revenue, final_day_revenue, final_all_roi, final_all_revenue, updated, remark, rebate_to_agent, final_all_recharge, final_all_roas, created) VALUES (20230812, 1, 20230810, 'test', 'test_1001133', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120210591651450496-adgroup-120210591651490496-creative-120210591676030496', '120210591651450496', '120210591651490496', '120210591676030496', 'FB', 1, 1, 321.00, 32.00, 1, 1, 123.00, 3213.00, 100.00, 200.00, 10.00, 20.00, 10.00, 20.00, 20.00, 30.00, 0.20, 100.00, 50.00, 10.00, 20.00, 10.00, 20.00, 30.00, 10.00, 0.10, 200.00, '1970-01-01 00:00:00.000000', 'test', 20.00, 100.00, 0.50, '1970-01-01 00:00:00.000000');
-- INSERT INTO flink_adjust_stat_detail (dates, active, bdates, pn, channel, key, campaign_id, ad_group_id, ad_id, source, day_retention, all_retention, day_recharge, all_recharge, day_recharge_count, all_recharge_count, day_withdraw, all_withdraw, day_income, all_income, day_gross_profit, all_gross_profit, day_net_profit, all_net_profit, day_cost, all_cost, all_roi, final_day_recharge, final_day_withdraw, day_delivery_revenue, final_delivery_revenue, day_fission_revenue, day_sharing_fission_revenue, day_revenue, final_day_revenue, final_all_roi, final_all_revenue, updated, remark, rebate_to_agent, final_all_recharge, final_all_roas, created) VALUES (20230812, 1, 20230810, 'test', 'test_1001133', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120209944045730713-adgroup-120209944045790713-creative-120209944046160713', '120209944045730713', '120209944045790713', '120209944046160713', 'FB', 5, 5, 321.00, 32.00, 1, 1, 123.00, 3213.00, 100.00, 200.00, 10.00, 20.00, 10.00, 20.00, 20.00, 30.00, 0.20, 100.00, 50.00, 10.00, 20.00, 10.00, 20.00, 30.00, 10.00, 0.10, 200.00, '1970-01-01 00:00:00.000000', 'test', 20.00, 100.00, 0.50, '1970-01-01 00:00:00.000000');
-- INSERT INTO flink_adjust_stat_detail (dates, active, bdates, pn, channel, key, campaign_id, ad_group_id, ad_id, source, day_retention, all_retention, day_recharge, all_recharge, day_recharge_count, all_recharge_count, day_withdraw, all_withdraw, day_income, all_income, day_gross_profit, all_gross_profit, day_net_profit, all_net_profit, day_cost, all_cost, all_roi, final_day_recharge, final_day_withdraw, day_delivery_revenue, final_delivery_revenue, day_fission_revenue, day_sharing_fission_revenue, day_revenue, final_day_revenue, final_all_roi, final_all_revenue, updated, remark, rebate_to_agent, final_all_recharge, final_all_roas, created) VALUES (20230812, 1, 20230810, 'test', 'test_1001133', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21282545518-adgroup-162323631339', '21282545518', '162323631339', '162323631325', 'GG', 3, 3, 321.00, 32.00, 1, 1, 123.00, 3213.00, 100.00, 200.00, 10.00, 20.00, 10.00, 20.00, 20.00, 30.00, 0.20, 100.00, 50.00, 10.00, 20.00, 10.00, 20.00, 30.00, 10.00, 0.10, 200.00, '1970-01-01 00:00:00.000000', 'test', 20.00, 100.00, 0.50, '1970-01-01 00:00:00.000000');
-- INSERT INTO flink_adjust_stat_detail (dates, active, bdates, pn, channel, key, campaign_id, ad_group_id, ad_id, source, day_retention, all_retention, day_recharge, all_recharge, day_recharge_count, all_recharge_count, day_withdraw, all_withdraw, day_income, all_income, day_gross_profit, all_gross_profit, day_net_profit, all_net_profit, day_cost, all_cost, all_roi, final_day_recharge, final_day_withdraw, day_delivery_revenue, final_delivery_revenue, day_fission_revenue, day_sharing_fission_revenue, day_revenue, final_day_revenue, final_all_roi, final_all_revenue, updated, remark, rebate_to_agent, final_all_recharge, final_all_roas, created) VALUES (20230811, 1, 20230810, 'test', 'test_1001133', 'pkg-test.test.test-channelid-test_1001133-source-GG-campaign-21246276476-adgroup-161911324779', '21246276476', '161911324779', '161911324755', 'GG', 4, 4, 321.00, 32.00, 1, 1, 123.00, 3213.00, 100.00, 200.00, 10.00, 20.00, 10.00, 20.00, 20.00, 30.00, 0.20, 100.00, 50.00, 10.00, 20.00, 10.00, 20.00, 30.00, 10.00, 0.10, 200.00, '1970-01-01 00:00:00.000000', 'test', 20.00, 100.00, 0.50, '1970-01-01 00:00:00.000000');
-- INSERT INTO flink_adjust_stat_detail (dates, active, bdates, pn, channel, key, campaign_id, ad_group_id, ad_id, source, day_retention, all_retention, day_recharge, all_recharge, day_recharge_count, all_recharge_count, day_withdraw, all_withdraw, day_income, all_income, day_gross_profit, all_gross_profit, day_net_profit, all_net_profit, day_cost, all_cost, all_roi, final_day_recharge, final_day_withdraw, day_delivery_revenue, final_delivery_revenue, day_fission_revenue, day_sharing_fission_revenue, day_revenue, final_day_revenue, final_all_roi, final_all_revenue, updated, remark, rebate_to_agent, final_all_recharge, final_all_roas, created) VALUES (20230811, 1, 20230810, 'test', 'test_1001133', 'pkg-test.test.test-channelid-test_1001133-source-FB-campaign-120208354756100125-adgroup-120208354756370125-creative-120208354838080125', '120208354756100125', '120208354756100125', '120208354756100125', 'FB', 5, 5, 321.00, 32.00, 1, 1, 123.00, 3213.00, 100.00, 200.00, 10.00, 20.00, 10.00, 20.00, 20.00, 30.00, 0.20, 100.00, 50.00, 10.00, 20.00, 10.00, 20.00, 30.00, 10.00, 0.10, 200.00, '1970-01-01 00:00:00.000000', 'test', 20.00, 100.00, 0.50, '1970-01-01 00:00:00.000000');



create table flink_daily_report
(
    id                     bigserial
            primary key,
    dates                  integer,
    pn                     varchar(30),
    channel                varchar(30),
    dealer_channel         integer,
    pkg                    varchar(255),
    dnu                    integer,
    dau                    integer,
    dou                    integer,
    total_users            integer,
    retention              integer,
    new_recharge           numeric(20, 2),
    new_recharge_count     integer,
    new_recharge_rate      numeric(14, 4),
    real_day_all_recharge  numeric(20, 2),
    recharge_user          integer,
    recharge_rate          numeric(14, 4),
    real_arppu             numeric(20, 2),
    real_arpu              numeric(20, 2),
    real_day_all_withdraw  numeric(20, 2),
    all_income             numeric(20, 2),
    all_gross_profit        numeric(20, 2),
    all_net_profit          numeric(20, 2),
    recharge_agency_fee    numeric(20, 2),
    payment_agency_fee     numeric(20, 2),
    departure_fee          numeric(20, 2),
    dealer_sharing_rate    numeric(14, 2),
    total_fission_revenue  numeric(20, 2),
    fission_revenue        numeric(20, 2),
    calculate_rate         numeric(14, 2),
    final_recharge         numeric(20, 2),
    final_recharge_rate    numeric(14, 2),
    final_withdraw         numeric(20, 2),
    final_withdraw_rate    numeric(14, 4),
    final_revenue          numeric(20, 2),
    dealer_sharing_revenue numeric(20, 2),
    final_arppu            numeric(20, 2),
    final_arpu             numeric(20, 2),
    real_total_recharge    numeric(20, 2),
    final_total_recharge   numeric(20, 2),
    final_new_recharge     numeric(20, 4),
    real_dou_recharge      numeric(20, 2),
    final_dou_recharge     numeric(20, 2),
    dou_recharge_count     integer,
    dou_recharge_rate      numeric(14, 4),
    rebate_to_agent        numeric(20, 2),
    rebate_agency_fee      numeric(20, 2),
	remark                 text,
    created                timestamp,
    updated                timestamp
);

comment on column flink_daily_report.id is '主键';

comment on column flink_daily_report.dates is '日期';

comment on column flink_daily_report.channel is '渠道';

comment on column flink_daily_report.dealer_channel is '代理渠道的id，管理channel表中的记录';

comment on column flink_daily_report.pkg is '包名';

comment on column flink_daily_report.dnu is '日新增用户';

comment on column flink_daily_report.dau is '日活';

comment on column flink_daily_report.dou is '历史活跃（老用户）';

comment on column flink_daily_report.total_users is '截止dates的所有（新增）用户';

comment on column flink_daily_report.retention is '留存';

comment on column flink_daily_report.new_recharge is '新增用户充值';

comment on column flink_daily_report.new_recharge_count is '新增用户充值人数';

comment on column flink_daily_report.new_recharge_rate is '新增用户充值率';

comment on column flink_daily_report.real_day_all_recharge is '日充值总额';

comment on column flink_daily_report.recharge_user is '充值人数';

comment on column flink_daily_report.recharge_rate is '充值率';

comment on column flink_daily_report.real_arppu is 'ARPPU';

comment on column flink_daily_report.real_arpu is 'arpu';

comment on column flink_daily_report.real_day_all_withdraw is '总提现';

comment on column flink_daily_report.all_income is '总收入';

comment on column flink_daily_report.all_gross_profit is '毛利';

comment on column flink_daily_report.all_net_profit is '净利';

comment on column flink_daily_report.remark is '备注';

comment on column flink_daily_report.recharge_agency_fee is '代收费用';

comment on column flink_daily_report.payment_agency_fee is '代付费用';

comment on column flink_daily_report.departure_fee is '离境费用';

comment on column flink_daily_report.dealer_sharing_rate is '渠道分成比例';

comment on column flink_daily_report.total_fission_revenue is '裂变总收入';

comment on column flink_daily_report.fission_revenue is '需要分给渠道的裂变收入';

comment on column flink_daily_report.calculate_rate is '显示比例（计算比例），影响充值、提现、收入';

comment on column flink_daily_report.final_recharge is '最终显示的日付费（充值）总额';

comment on column flink_daily_report.final_recharge_rate is '最终显示的日付费（充值）率';

comment on column flink_daily_report.final_withdraw is '最终显示的日提现总额';

comment on column flink_daily_report.final_withdraw_rate is '最终显示的日提现率';

comment on column flink_daily_report.final_revenue is '结算收入 = 充值 - 提现   + 部分裂变收入';

comment on column flink_daily_report.dealer_sharing_revenue is '渠道分成';

comment on column flink_daily_report.final_arppu is 'arppu';

comment on column flink_daily_report.final_arpu is 'arpu';

comment on column flink_daily_report.real_total_recharge is '截止dates为止的总充值数';

comment on column flink_daily_report.final_total_recharge is '计算显示比例之后的截止dates为止的总充值数';

comment on column flink_daily_report.final_new_recharge is '最终显示的日新增充值';

comment on column flink_daily_report.real_dou_recharge is '活跃充值金额';

comment on column flink_daily_report.final_dou_recharge is '最终显示的活跃充值金额';

comment on column flink_daily_report.dou_recharge_count is '老用户充值人数';

comment on column flink_daily_report.dou_recharge_rate is '最终显示的活跃充值率';

comment on column flink_daily_report.rebate_to_agent is '代理返利';

comment on column flink_daily_report.rebate_agency_fee is '代理返利费用';

comment on column flink_daily_report.created is '创建日期';

comment on column flink_daily_report.updated is '修改日期';


create unique index uni_flink_daily_report_d_c
    on flink_daily_report (dates, channel);


-- INSERT INTO flink_daily_report (dates, pn, channel, dealer_channel, pkg, dnu, dau, dou, total_users, retention, new_recharge, new_recharge_count, new_recharge_rate, real_day_all_recharge, recharge_user, recharge_rate, real_arppu, real_arpu, real_day_all_withdraw, all_income, all_gross_profit, all_net_profit, remark, recharge_agency_fee, payment_agency_fee, departure_fee, dealer_sharing_rate, total_fission_revenue, fission_revenue, calculate_rate, final_recharge, final_recharge_rate, final_withdraw, final_withdraw_rate, final_revenue, dealer_sharing_revenue, final_arppu, final_arpu, real_total_recharge, final_total_recharge, final_new_recharge, real_dou_recharge, final_dou_recharge, dou_recharge_count, dou_recharge_rate, rebate_to_agent, rebate_agency_fee, created, updated) VALUES (20230808, 'test', 'test_1000003', 42, 'test.test.test', 1, 2, 3, 4, 1, 5.00, 1, 2.0000, 3123.00, 2, 1.0000, 32.00, 2.00, 1.00, 2.00, 1.00, 5.00, '1', 5.00, 5.00, 5.00, 1.00, 5.00, 5.00, 5.00, 1.00, 2.00, 2.00, 32.0000, 123.00, 3213.00, 3213.00, 3123.00, 321.00, 3123.00, 31.0000, 332.00, 313.00, 313, 313.0000, 313.00, 31.00, '2023-08-12 11:04:39.000000', '2023-08-12 11:04:39.000000');
-- INSERT INTO flink_daily_report (dates, pn, channel, dealer_channel, pkg, dnu, dau, dou, total_users, retention, new_recharge, new_recharge_count, new_recharge_rate, real_day_all_recharge, recharge_user, recharge_rate, real_arppu, real_arpu, real_day_all_withdraw, all_income, all_gross_profit, all_net_profit, remark, recharge_agency_fee, payment_agency_fee, departure_fee, dealer_sharing_rate, total_fission_revenue, fission_revenue, calculate_rate, final_recharge, final_recharge_rate, final_withdraw, final_withdraw_rate, final_revenue, dealer_sharing_revenue, final_arppu, final_arpu, real_total_recharge, final_total_recharge, final_new_recharge, real_dou_recharge, final_dou_recharge, dou_recharge_count, dou_recharge_rate, rebate_to_agent, rebate_agency_fee, created, updated) VALUES (20230808, 'test', 'test_1000006', 42, 'test.test.test', 1, 2, 3, 4, 1, 5.00, 1, 2.0000, 3123.00, 2, 1.0000, 32.00, 2.00, 1.00, 2.00, 1.00, 5.00, '1', 5.00, 5.00, 5.00, 1.00, 5.00, 5.00, 5.00, 1.00, 2.00, 2.00, 32.0000, 123.00, 3213.00, 3213.00, 3123.00, 321.00, 3123.00, 31.0000, 332.00, 313.00, 313, 313.0000, 313.00, 31.00, '2023-08-12 11:04:39.000000', '2023-08-12 11:04:39.000000');
-- INSERT INTO flink_daily_report (dates, pn, channel, dealer_channel, pkg, dnu, dau, dou, total_users, retention, new_recharge, new_recharge_count, new_recharge_rate, real_day_all_recharge, recharge_user, recharge_rate, real_arppu, real_arpu, real_day_all_withdraw, all_income, all_gross_profit, all_net_profit, remark, recharge_agency_fee, payment_agency_fee, departure_fee, dealer_sharing_rate, total_fission_revenue, fission_revenue, calculate_rate, final_recharge, final_recharge_rate, final_withdraw, final_withdraw_rate, final_revenue, dealer_sharing_revenue, final_arppu, final_arpu, real_total_recharge, final_total_recharge, final_new_recharge, real_dou_recharge, final_dou_recharge, dou_recharge_count, dou_recharge_rate, rebate_to_agent, rebate_agency_fee, created, updated) VALUES (20230808, 'test', 'test_1000002', 42, 'test.test.test', 1, 2, 3, 4, 1, 5.00, 1, 2.0000, 3123.00, 2, 1.0000, 32.00, 2.00, 1.00, 2.00, 1.00, 5.00, '1', 5.00, 5.00, 5.00, 1.00, 5.00, 5.00, 5.00, 1.00, 2.00, 2.00, 32.0000, 123.00, 3213.00, 3213.00, 3123.00, 321.00, 3123.00, 31.0000, 332.00, 313.00, 313, 313.0000, 313.00, 31.00, '2023-08-12 11:04:39.000000', '2023-08-12 11:04:39.000000');
-- INSERT INTO flink_daily_report (dates, pn, channel, dealer_channel, pkg, dnu, dau, dou, total_users, retention, new_recharge, new_recharge_count, new_recharge_rate, real_day_all_recharge, recharge_user, recharge_rate, real_arppu, real_arpu, real_day_all_withdraw, all_income, all_gross_profit, all_net_profit, remark, recharge_agency_fee, payment_agency_fee, departure_fee, dealer_sharing_rate, total_fission_revenue, fission_revenue, calculate_rate, final_recharge, final_recharge_rate, final_withdraw, final_withdraw_rate, final_revenue, dealer_sharing_revenue, final_arppu, final_arpu, real_total_recharge, final_total_recharge, final_new_recharge, real_dou_recharge, final_dou_recharge, dou_recharge_count, dou_recharge_rate, rebate_to_agent, rebate_agency_fee, created, updated) VALUES (20230808, 'test', 'test_1100002', 42, 'test.test.test', 1, 2, 3, 4, 1, 5.00, 1, 2.0000, 3123.00, 2, 1.0000, 32.00, 2.00, 1.00, 2.00, 1.00, 5.00, '1', 5.00, 5.00, 5.00, 1.00, 5.00, 5.00, 5.00, 1.00, 2.00, 2.00, 32.0000, 123.00, 3213.00, 3213.00, 3123.00, 321.00, 3123.00, 31.0000, 332.00, 313.00, 313, 313.0000, 313.00, 31.00, '2023-08-12 11:04:39.000000', '2023-08-12 11:04:39.000000');
