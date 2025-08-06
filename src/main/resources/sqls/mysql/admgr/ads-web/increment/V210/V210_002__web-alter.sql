
-- 增加字段付费方受益方以及受益方支付方是否相同状态三个字段
ALTER TABLE fb_region_group_management
    ADD COLUMN beneficiary VARCHAR(64) NULL comment '受益方' after excluded_properties;
ALTER TABLE fb_region_group_management
    ADD COLUMN payor VARCHAR(64) NULL comment '付费方' after beneficiary;
ALTER TABLE fb_region_group_management
    ADD COLUMN beneficiary_payor_status VARCHAR(32) NULL comment '付费方与受益方是否相同' after payor;


-- 添加模板描述字段
ALTER TABLE ad_template_formal
    ADD COLUMN template_described text comment '模板描述' after name;


-- 增加 广告系列名
ALTER TABLE ad_template_draft
    ADD COLUMN campaign_name VARCHAR(255) NULL comment '广告系列名' after campaign_properties;
ALTER TABLE ad_template_formal
    ADD COLUMN campaign_name VARCHAR(255) NULL comment '广告系列名' after campaign_properties;
ALTER TABLE ad_template_preview
    ADD COLUMN campaign_name VARCHAR(255) NULL comment '广告系列名' after campaign_properties;

-- 增加 广告组名
ALTER TABLE ad_template_draft
    ADD COLUMN ad_set_name VARCHAR(255) NULL comment '广告组名' after advertise_content;
ALTER TABLE ad_template_formal
    ADD COLUMN ad_set_name VARCHAR(255) NULL comment '广告组名' after advertise_content;
ALTER TABLE ad_template_preview
    ADD COLUMN ad_set_name VARCHAR(255) NULL comment '广告组名' after advertise_content;


-- 修改地区组唯一索引
ALTER TABLE fb_region_group_management DROP INDEX uni_key_name;
ALTER TABLE fb_region_group_management
    ADD UNIQUE INDEX uni_key_name(owner_user_id, region_group_name, delete_flag) USING BTREE;

-- 修改定向包唯一索引
ALTER TABLE fb_directional_package_management DROP INDEX uni_key_name;
ALTER TABLE fb_directional_package_management
    ADD UNIQUE INDEX uni_key_name(owner_user_id, name, delete_flag) USING BTREE;

-- 任务表新增字段预览明细
ALTER TABLE task_management_ad
    ADD COLUMN preview_detail_properties LONGTEXT NULL COMMENT '预览明细属性' after template_preview_id;