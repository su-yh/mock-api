-- DROP TABLE IF EXISTS fb_app_system_code;
-- 创建系统代号表
CREATE TABLE fb_app_system_code
(
    id                   BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    system_code          VARCHAR(255) NOT NULL COMMENT '系统代号',
    client_id            VARCHAR(255) COMMENT 'APPID',
    client_secret        VARCHAR(255) COMMENT '密钥',
    config_id            VARCHAR(255) COMMENT '配置ID',
    app_name             VARCHAR(255) COMMENT '应用名称',
    privacy_policy       TEXT COMMENT '隐私政策',
    updated_at           DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    UNIQUE KEY `uni_key_code` (`system_code`) USING BTREE
)COMMENT 'FBAppId和系统代号关联表';



# -- （作废）根据系统代号修改表名   将${systemCode}替换成配置文件的systemCode系统代号 配置第一次代号的时候执行即可，往后只需要启动程序
# ALTER TABLE fb_region_group_management RENAME TO fb_region_group_management_${systemCode};
# ALTER TABLE fb_directional_package_management RENAME TO fb_directional_package_management_${systemCode};
# ALTER TABLE ad_creative_group RENAME TO ad_creative_group_${systemCode};
#
# ALTER TABLE ad_template_draft RENAME TO ad_template_draft_${systemCode};
# ALTER TABLE ad_template_formal RENAME TO ad_template_formal_${systemCode};
# ALTER TABLE ad_template_preview RENAME TO ad_template_preview_${systemCode};
#
# ALTER TABLE task_management_ad RENAME TO task_management_ad_${systemCode};
# ALTER TABLE task_ad_detail RENAME TO task_ad_detail_${systemCode};
# ALTER TABLE task_ad_detail_external_creative RENAME TO task_ad_detail_external_creative_${systemCode};
# ALTER TABLE task_ad_detail_external_asset RENAME TO task_ad_detail_external_asset_${systemCode};
# ALTER TABLE task_account_resource_detail RENAME TO task_account_resource_detail_${systemCode};
# ALTER TABLE task_campaign_resource RENAME TO task_campaign_resource_${systemCode};
# ALTER TABLE task_campaign_resource_detail RENAME TO task_campaign_resource_detail_${systemCode};
#
# ALTER TABLE fb_ad_campaign RENAME TO fb_ad_campaign_${systemCode};
# ALTER TABLE fb_ad_campaign_resource RENAME TO fb_ad_campaign_resource_${systemCode};
# ALTER TABLE fb_ad_set_resource RENAME TO fb_ad_set_resource_${systemCode};
# ALTER TABLE fb_ad_resource RENAME TO fb_ad_resource_${systemCode};
# ALTER TABLE fb_ad_material_resource RENAME TO fb_ad_material_resource_${systemCode};
# ALTER TABLE fb_material_detail_resource RENAME TO fb_material_detail_resource_${systemCode};
# ALTER TABLE ad_material_folders RENAME TO ad_material_folders_${systemCode};
# ALTER TABLE ad_material RENAME TO ad_material_${systemCode};
# ALTER TABLE fb_ad_material_relation RENAME TO fb_ad_material_relation_${systemCode};
#
# ALTER TABLE fb_ad_campaign_relation RENAME TO fb_ad_campaign_relation_${systemCode};
#
# ALTER TABLE fb_personal_account_plus RENAME TO fb_personal_account_plus_${systemCode};
# ALTER TABLE fb_advertising_account RENAME TO fb_advertising_account_${systemCode};
# ALTER TABLE fb_public_page RENAME TO fb_public_page_${systemCode};
# ALTER TABLE fb_business_management_platform RENAME TO fb_business_management_platform_${systemCode};
# ALTER TABLE ad_promotional_link RENAME TO ad_promotional_link_${systemCode};
# ALTER TABLE fb_promotion_app RENAME TO fb_promotion_app_${systemCode};
#
# ALTER TABLE fb_personal_advertising_mapping RENAME TO fb_personal_advertising_mapping_${systemCode};
# ALTER TABLE fb_personal_page_mapping RENAME TO fb_personal_page_mapping_${systemCode};
# ALTER TABLE fb_data_scope RENAME TO fb_data_scope_${systemCode};
# ALTER TABLE fb_advertising_app_mapping RENAME TO fb_advertising_app_mapping_${systemCode};
#
# ALTER TABLE task_account_resource RENAME TO task_account_resource_${systemCode};
# ALTER TABLE authorization_expiration_warning RENAME TO authorization_expiration_warning_${systemCode};
#
# ALTER TABLE fb_account_pixel_code RENAME TO fb_account_pixel_code_${systemCode};
# ALTER TABLE fb_account_convert_event RENAME TO fb_account_convert_event_${systemCode};
# ALTER TABLE fb_account_collect RENAME TO fb_account_collect_${systemCode};
#
# -- （作废） 根据系统代号复制原始表结构   将${systemCode}替换成配置文件的systemCode系统代号 配置第一次代号的时候执行即可，往后只需要启动程序
# -- （作废） 这是原始表结构 往后复制都只会复制原始表
#
# CREATE TABLE fb_ad_campaign LIKE fb_ad_campaign_${systemCode} ;
# CREATE TABLE fb_ad_campaign_resource LIKE fb_ad_campaign_resource_${systemCode} ;
# CREATE TABLE fb_ad_set_resource LIKE fb_ad_set_resource_${systemCode} ;
# CREATE TABLE fb_ad_resource LIKE fb_ad_resource_${systemCode} ;
# CREATE TABLE fb_ad_material_resource LIKE fb_ad_material_resource_${systemCode} ;
# CREATE TABLE fb_material_detail_resource LIKE fb_material_detail_resource_${systemCode} ;
# CREATE TABLE ad_material_folders LIKE ad_material_folders_${systemCode} ;
# CREATE TABLE ad_material LIKE ad_material_${systemCode} ;
# CREATE TABLE fb_ad_material_relation LIKE fb_ad_material_relation_${systemCode} ;
#
# CREATE TABLE fb_ad_campaign_relation LIKE fb_ad_campaign_relation_${systemCode} ;
#
# CREATE TABLE fb_personal_account_plus LIKE fb_personal_account_plus_${systemCode} ;
# CREATE TABLE fb_advertising_account LIKE fb_advertising_account_${systemCode} ;
# CREATE TABLE fb_public_page LIKE fb_public_page_${systemCode} ;
# CREATE TABLE fb_business_management_platform LIKE fb_business_management_platform_${systemCode} ;
# CREATE TABLE ad_promotional_link LIKE ad_promotional_link_${systemCode} ;
# CREATE TABLE fb_promotion_app LIKE fb_promotion_app_${systemCode} ;
#
# CREATE TABLE fb_personal_advertising_mapping LIKE fb_personal_advertising_mapping_${systemCode} ;
# CREATE TABLE fb_personal_page_mapping LIKE fb_personal_page_mapping_${systemCode} ;
# CREATE TABLE fb_data_scope LIKE fb_data_scope_${systemCode} ;
# CREATE TABLE fb_advertising_app_mapping LIKE fb_advertising_app_mapping_${systemCode} ;
#
# CREATE TABLE task_account_resource LIKE task_account_resource_${systemCode} ;
# CREATE TABLE authorization_expiration_warning LIKE authorization_expiration_warning_${systemCode} ;
#
# CREATE TABLE fb_account_pixel_code LIKE fb_account_pixel_code_${systemCode} ;
# CREATE TABLE fb_account_convert_event LIKE fb_account_convert_event_${systemCode} ;
# CREATE TABLE fb_account_collect LIKE fb_account_collect_${systemCode} ;
#
# CREATE TABLE fb_region_group_management LIKE fb_region_group_management_${systemCode} ;
# CREATE TABLE fb_directional_package_management LIKE fb_directional_package_management_${systemCode} ;
# CREATE TABLE ad_creative_group LIKE ad_creative_group_${systemCode} ;
# CREATE TABLE ad_template_draft LIKE ad_template_draft_${systemCode} ;
# CREATE TABLE ad_template_formal LIKE ad_template_formal_${systemCode} ;
# CREATE TABLE ad_template_preview LIKE ad_template_preview_${systemCode} ;
# CREATE TABLE task_management_ad LIKE task_management_ad_${systemCode} ;
# CREATE TABLE task_ad_detail LIKE task_ad_detail_${systemCode} ;
# CREATE TABLE task_ad_detail_external_creative LIKE task_ad_detail_external_creative_${systemCode} ;
# CREATE TABLE task_ad_detail_external_asset LIKE task_ad_detail_external_asset_${systemCode} ;
# CREATE TABLE task_account_resource_detail LIKE task_account_resource_detail_${systemCode} ;
# CREATE TABLE task_campaign_resource LIKE task_campaign_resource_${systemCode} ;
# CREATE TABLE task_campaign_resource_detail LIKE task_campaign_resource_detail_${systemCode} ;
#
# -- （作废） 插入默认数据
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (1, '-1', '购物', '-1', '-1', 'VALUE_PURCHASE', null, -1, -1, '1970-01-01 18:06:13', '1970-01-02 10:23:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (2, '-2', '订阅', '-1', '-1', 'VALUE_SUBSCRIBE', null, -1, -1, '1970-01-01 18:07:13', '1970-01-02 10:24:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (3, '-3', '添加支付信息', '-1', '-1', 'VALUE_ADD_PAYMENT_INFO', null, -1, -1, '1970-01-01 18:08:13', '1970-01-02 10:25:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (4, '-4', '查看内容', '-1', '-1', 'VALUE_CONTENT_VIEW', null, -1, -1, '1970-01-01 18:09:13', '1970-01-02 10:26:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (5, '-5', '搜索', '-1', '-1', 'VALUE_SEARCH', null, -1, -1, '1970-01-01 18:10:13', '1970-01-02 10:27:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (6, '-6', '捐款', '-1', '-1', 'VALUE_DONATE', null, -1, -1, '1970-01-01 18:11:13', '1970-01-02 10:28:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (7, '-7', '开始试用', '-1', '-1', 'VALUE_START_TRIAL', null, -1, -1, '1970-01-01 18:12:13', '1970-01-02 10:29:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (8, '-8', '完成注册', '-1', '-1', 'VALUE_COMPLETE_REGISTRATION', null, -1, -1, '1970-01-01 18:13:13', '1970-01-02 10:30:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (9, '-9', '发起结账', '-1', '-1', 'VALUE_INITIATED_CHECKOUT', null, -1, -1, '1970-01-01 18:14:13', '1970-01-02 10:31:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (10, '-10', '加入购物车', '-1', '-1', 'VALUE_ADD_TO_CART', null, -1, -1, '1970-01-01 18:15:13', '1970-01-02 10:32:59');
# INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
# VALUES (11, '-11', '加入心愿单', '-1', '-1', 'VALUE_ADD_TO_WISHLIST', null, -1, -1, '1970-01-01 18:16:13', '1970-01-02 10:33:59');
#
#
# INSERT INTO ad_material_folders (id, name, parent_id,level, created_by_id, update_by_id, created_at, updated_at)
# VALUES (1, '默认素材库', null,-1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42'),
#        (2, '团队共享素材', null,-1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42');



