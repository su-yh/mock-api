
-- 本地素材 增加封面字段
ALTER TABLE ad_material
    ADD COLUMN cover VARCHAR(255) NULL COMMENT '封面' AFTER url;

-- 广告与本地素材关系表 增加广告账户字段
ALTER TABLE fb_ad_material_relation
    ADD COLUMN advertising_account_id VARCHAR(50) NULL COMMENT '广告账户' AFTER ad_id;

-- 同步广告账户id
UPDATE fb_ad_material_relation fm
    JOIN fb_ad_resource fa ON fm.ad_id = fa.ad_id
SET fm.advertising_account_id = fa.advertising_account_id WHERE fm.material_id IS NOT NULL;

-- 修改路由名字
UPDATE sys_menu SET menu_name = 'Facebook Ads' WHERE menu_id = 2048;

-- 任务中心添加任务类型
ALTER TABLE task_management_ad
    ADD COLUMN type VARCHAR(50) NOT NULL DEFAULT 'CREATE_AD' COMMENT '任务类型：创建广告、复制广告' AFTER ad_app_category;


-- 任务中心添加复制的json
ALTER TABLE task_management_ad
    ADD COLUMN  copy_detail_properties LONGTEXT NULL COMMENT '复制广告系列详细json' AFTER preview_detail_properties;

-- 任务中心 允许为空
ALTER TABLE task_management_ad
    MODIFY ad_app_category VARCHAR(50) NULL;

-- 任务中心 预览id可以为空
ALTER TABLE task_management_ad
    MODIFY template_preview_id BIGINT NULL;

ALTER TABLE task_management_ad
    MODIFY package_data_id BIGINT NULL;

ALTER TABLE task_management_ad
    MODIFY app_id VARCHAR(64) NULL;

ALTER TABLE task_management_ad
    MODIFY app_name VARCHAR(64) NULL;

-- 个号可以为空
ALTER TABLE task_ad_detail
    MODIFY person_id VARCHAR(64) NULL;

-- 个号可以为空
ALTER TABLE task_ad_detail_external_creative
    MODIFY person_id VARCHAR(64) NULL;

-- 个号可以为空
ALTER TABLE task_ad_detail_external_asset
    MODIFY person_id VARCHAR(64) NULL;

-- 设置默认值

ALTER TABLE fb_ad_campaign_relation
    MODIFY COLUMN delete_flag BIGINT DEFAULT 0;
