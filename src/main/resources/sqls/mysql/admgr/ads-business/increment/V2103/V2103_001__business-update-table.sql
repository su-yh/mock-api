-- 修改表 ad_material 的字段 created_at 为 created
ALTER TABLE ad_material CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 ad_material 的字段 updated_at 为 updated
ALTER TABLE ad_material CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 ad_material_folders 的字段 created_at 为 created
ALTER TABLE ad_material_folders CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 ad_material_folders 的字段 updated_at 为 updated
ALTER TABLE ad_material_folders CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 ad_promotional_link 的字段 created_at 为 created
ALTER TABLE ad_promotional_link CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 ad_promotional_link 的字段 updated_at 为 updated
ALTER TABLE ad_promotional_link CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 authorization_expiration_warning 的字段 created_at 为 created
ALTER TABLE authorization_expiration_warning CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 authorization_expiration_warning 的字段 updated_at 为 updated
ALTER TABLE authorization_expiration_warning CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 fb_account_collect 添加缺少的字段 created
ALTER TABLE fb_account_collect ADD COLUMN created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 向表 fb_account_collect 添加缺少的字段 updated
ALTER TABLE fb_account_collect ADD COLUMN updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_account_convert_event 的字段 created_at 为 created
ALTER TABLE fb_account_convert_event CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_account_convert_event 的字段 updated_at 为 updated
ALTER TABLE fb_account_convert_event CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_account_pixel_code 的字段 created_at 为 created
ALTER TABLE fb_account_pixel_code CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_account_pixel_code 的字段 updated_at 为 updated
ALTER TABLE fb_account_pixel_code CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_campaign_relation 的字段 created_at 为 created
ALTER TABLE fb_ad_campaign_relation CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_campaign_relation 的字段 updated_at 为 updated
ALTER TABLE fb_ad_campaign_relation CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_campaign_resource 的字段 created_at 为 created
ALTER TABLE fb_ad_campaign_resource CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_campaign_resource 的字段 updated_at 为 updated
ALTER TABLE fb_ad_campaign_resource CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_material_relation 的字段 created_at 为 created
ALTER TABLE fb_ad_material_relation CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_material_relation 的字段 updated_at 为 updated
ALTER TABLE fb_ad_material_relation CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_material_resource 的字段 created_at 为 created
ALTER TABLE fb_ad_material_resource CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_material_resource 的字段 updated_at 为 updated
ALTER TABLE fb_ad_material_resource CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_resource 的字段 created_at 为 created
ALTER TABLE fb_ad_resource CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_resource 的字段 updated_at 为 updated
ALTER TABLE fb_ad_resource CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_ad_set_resource 的字段 created_at 为 created
ALTER TABLE fb_ad_set_resource CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_ad_set_resource 的字段 updated_at 为 updated
ALTER TABLE fb_ad_set_resource CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_business_management_platform 的字段 created_at 为 created
ALTER TABLE fb_business_management_platform CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_business_management_platform 的字段 updated_at 为 updated
ALTER TABLE fb_business_management_platform CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_data_scope 的字段 created_at 为 created
ALTER TABLE fb_data_scope CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_data_scope 的字段 updated_at 为 updated
ALTER TABLE fb_data_scope CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_material_detail_resource 的字段 created_at 为 created
ALTER TABLE fb_material_detail_resource CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_material_detail_resource 的字段 updated_at 为 updated
ALTER TABLE fb_material_detail_resource CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_personal_account_plus 的字段 created_at 为 created
ALTER TABLE fb_personal_account_plus CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_personal_account_plus 的字段 updated_at 为 updated
ALTER TABLE fb_personal_account_plus CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_promotion_app 的字段 created_at 为 created
ALTER TABLE fb_promotion_app CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_promotion_app 的字段 updated_at 为 updated
ALTER TABLE fb_promotion_app CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 fb_public_page 的字段 created_at 为 created
ALTER TABLE fb_public_page CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 fb_public_page 的字段 updated_at 为 updated
ALTER TABLE fb_public_page CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表名 task_account_resource 为 task_account_record
RENAME TABLE task_account_resource TO task_account_record;

-- 修改表 task_account_record 的字段 created_at 为 created
ALTER TABLE task_account_record CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 task_account_record 的字段 updated_at 为 updated
ALTER TABLE task_account_record CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 task_account_record 添加缺少的字段 dates
ALTER TABLE task_account_record ADD COLUMN dates INT(10) UNSIGNED DEFAULT 0 COMMENT '时间戳',ADD INDEX idx_dates (dates);;

-- 修改表名 task_account_resource_detail 为 task_account_detail_record
RENAME TABLE task_account_resource_detail TO task_account_detail_record;

-- 修改表 task_account_detail_record 的字段 created_at 为 created
ALTER TABLE task_account_detail_record CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 task_account_detail_record 的字段 updated_at 为 updated
ALTER TABLE task_account_detail_record CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 task_account_detail_record 添加缺少的字段 dates
ALTER TABLE task_account_detail_record ADD COLUMN dates INT(10) UNSIGNED DEFAULT 0 COMMENT '时间戳',ADD INDEX idx_dates (dates);

-- 修改表名 task_campaign_resource 为 task_campaign_record
RENAME TABLE task_campaign_resource TO task_campaign_record;

-- 修改表 task_campaign_record 的字段 created_at 为 created
ALTER TABLE task_campaign_record CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 task_campaign_record 的字段 updated_at 为 updated
ALTER TABLE task_campaign_record CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 task_campaign_record 添加缺少的字段 dates
ALTER TABLE task_campaign_record ADD COLUMN dates INT(10) UNSIGNED;

-- 修改表名 task_campaign_resource_detail 为 task_campaign_detail_record
RENAME TABLE task_campaign_resource_detail TO task_campaign_detail_record;

-- 修改表 task_campaign_detail_record 的字段 created_at 为 created
ALTER TABLE task_campaign_detail_record CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 task_campaign_detail_record 的字段 updated_at 为 updated
ALTER TABLE task_campaign_detail_record CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 task_campaign_detail_record 添加缺少的字段 dates
ALTER TABLE task_campaign_detail_record ADD COLUMN dates INT(10) UNSIGNED DEFAULT 0 COMMENT '时间戳',ADD INDEX idx_dates (dates);

ALTER TABLE fb_advertising_account CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE fb_advertising_account CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_campaign_resource CHANGE campaign_created_at campaign_created timestamp DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_campaign_resource CHANGE campaign_updated_at campaign_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_set_resource CHANGE ad_set_created_at ad_set_created timestamp DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_set_resource CHANGE ad_set_updated_at ad_set_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_resource CHANGE ad_created_at ad_created timestamp DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE fb_ad_resource CHANGE ad_updated_at ad_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
