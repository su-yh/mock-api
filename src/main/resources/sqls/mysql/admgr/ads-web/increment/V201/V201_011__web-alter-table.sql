-- 更改表名 fb_targeting_position to fb_geo_location
ALTER TABLE fb_targeting_position RENAME TO fb_geo_location;
-- 修改表注释
ALTER TABLE fb_geo_location COMMENT '地理位置表';
-- 修改列注释
ALTER TABLE fb_geo_location MODIFY COLUMN unique_key   VARCHAR(32) COMMENT '唯一Key';
ALTER TABLE fb_geo_location MODIFY COLUMN name  VARCHAR(32) COMMENT'位置名称';
ALTER TABLE fb_geo_location MODIFY COLUMN type  VARCHAR(32) COMMENT '类别(country:国家,city:城市,region区域)';
ALTER TABLE fb_geo_location MODIFY COLUMN country_code VARCHAR(32)  COMMENT '国家编码';
ALTER TABLE fb_geo_location MODIFY COLUMN country_name VARCHAR(128)  COMMENT '国家名称';
ALTER TABLE fb_geo_location MODIFY COLUMN region  VARCHAR(128) COMMENT '区域';
ALTER TABLE fb_geo_location MODIFY COLUMN region_id     INTEGER COMMENT '区域id';


-- 更改表名 fb_targeting_device to fb_device
ALTER TABLE fb_targeting_device RENAME TO fb_device;
-- 修改表注释
ALTER TABLE fb_device COMMENT '设备表';

-- 修改列注释
ALTER TABLE fb_device MODIFY COLUMN name VARCHAR(32) COMMENT '设备名称';
ALTER TABLE fb_device MODIFY COLUMN type VARCHAR(32) COMMENT '设备类别';
ALTER TABLE fb_device MODIFY COLUMN platform VARCHAR(32) COMMENT '平台';
ALTER TABLE fb_device MODIFY COLUMN description VARCHAR(512) COMMENT '描述';
ALTER TABLE fb_device MODIFY COLUMN audience_size_lower_bound INTEGER COMMENT '目标受众规模的预估值下限';
ALTER TABLE fb_device MODIFY COLUMN audience_size_upper_bound INTEGER COMMENT '目标受众规模的预估值上限';

-- 删除唯一索引
DROP INDEX uni_key_name ON fb_device;

-- 更改表名 fb_targeting_os to fb_os
ALTER TABLE fb_targeting_os RENAME TO fb_os;
-- 修改表注释
ALTER TABLE fb_os COMMENT '操作系统';

-- 修改列注释
ALTER TABLE fb_os MODIFY COLUMN name VARCHAR(32) COMMENT '系统名称';
ALTER TABLE fb_os MODIFY COLUMN type VARCHAR(32) COMMENT '系统类型';
ALTER TABLE fb_os MODIFY COLUMN platform VARCHAR(32) COMMENT '平台';
ALTER TABLE fb_os MODIFY COLUMN description VARCHAR(512) COMMENT '描述';

-- 更改表名 fb_targeting_language to fb_language
ALTER TABLE fb_targeting_language RENAME TO fb_language;
-- 修改表注释
ALTER TABLE fb_language COMMENT '语言';

-- 修改列注释
ALTER TABLE fb_language MODIFY COLUMN unique_key VARCHAR(32) COMMENT '语言唯一key';
ALTER TABLE fb_language MODIFY COLUMN name VARCHAR(32) COMMENT '语言名称';

-- 更改表名 fb_targeting_country_group to fb_country_group
ALTER TABLE fb_targeting_country_group RENAME TO fb_country_group;
-- 修改表注释
ALTER TABLE fb_country_group COMMENT '国家组/地区组';

-- 修改列注释
ALTER TABLE fb_country_group MODIFY COLUMN unique_key varchar(32) COMMENT '国家组/地区组唯一key';
ALTER TABLE fb_country_group MODIFY COLUMN name varchar(32) COMMENT '国家组/地区组名称';
ALTER TABLE fb_country_group MODIFY COLUMN type varchar(32)  COMMENT '类型';
ALTER TABLE fb_country_group MODIFY COLUMN country_codes text COMMENT '平台';


-- 更改表名 fb_targeting_package_management to fb_directional_package_management
ALTER TABLE fb_targeting_package_management RENAME TO fb_directional_package_management;
-- 修改表注释
ALTER TABLE fb_directional_package_management COMMENT '定向包管理';

-- 唯一索引
ALTER TABLE fb_region_group_management
    ADD UNIQUE INDEX uni_key_name(region_group_name,owner_user_id) USING BTREE;

-- 唯一索引
ALTER TABLE fb_directional_package_management
    ADD UNIQUE INDEX uni_key_name(`name`,owner_user_id) USING BTREE;


