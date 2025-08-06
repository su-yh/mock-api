-- 添加唯一索引
ALTER TABLE fb_targeting_language
    ADD UNIQUE INDEX uni_key(unique_key) USING BTREE;

-- 添加字段
ALTER TABLE fb_targeting_os
    ADD COLUMN os_version text  not null comment '操作系统版本' after platform;

-- 添加唯一索引
ALTER TABLE fb_targeting_os
    ADD UNIQUE INDEX uni_key_platform(platform) USING BTREE;

-- 添加唯一索引
ALTER TABLE fb_targeting_device
    ADD UNIQUE INDEX uni_key_name(name) USING BTREE;

