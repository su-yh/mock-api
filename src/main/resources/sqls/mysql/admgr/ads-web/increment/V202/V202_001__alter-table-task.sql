
-- task_management_ad
-- 删除 PRIMARY KEY
ALTER TABLE task_management_ad DROP PRIMARY KEY;
-- 增加主键
ALTER TABLE task_management_ad
    ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
-- 添加唯一索引
ALTER TABLE task_management_ad
    ADD UNIQUE INDEX uni_uuid(uuid);
-- 修改注释
ALTER TABLE task_management_ad
    MODIFY COLUMN uuid VARCHAR (64) NOT NULL COMMENT 'uuid';


-- task_ad_detail
-- 删除 PRIMARY KEY
ALTER TABLE task_ad_detail DROP PRIMARY KEY;
-- 增加主键
ALTER TABLE task_ad_detail
    ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
-- 添加唯一索引
ALTER TABLE task_ad_detail
    ADD UNIQUE INDEX uni_uuid(uuid);
-- 修改注释
ALTER TABLE task_ad_detail
    MODIFY COLUMN uuid VARCHAR (64) NOT NULL COMMENT 'uuid';


-- task_ad_detail_external_creative
-- 删除 PRIMARY KEY
ALTER TABLE task_ad_detail_external_creative DROP PRIMARY KEY;
-- 增加主键
ALTER TABLE task_ad_detail_external_creative
    ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
-- 删除唯一索引
DROP INDEX uni_uuid ON task_ad_detail_external_creative;
-- 添加唯一索引
ALTER TABLE task_ad_detail_external_creative
    ADD UNIQUE INDEX uni_uuid(uuid);
-- 添加唯一索引
ALTER TABLE task_ad_detail_external_creative
    ADD UNIQUE INDEX uni_o_uuid(owner_task_detail_uuid);
-- 修改注释
ALTER TABLE task_ad_detail_external_creative
    MODIFY COLUMN uuid VARCHAR (64) NOT NULL COMMENT 'uuid';


-- task_ad_detail_external_asset
-- 删除 PRIMARY KEY
ALTER TABLE task_ad_detail_external_asset DROP PRIMARY KEY;
-- 增加主键
ALTER TABLE task_ad_detail_external_asset
    ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
-- 添加唯一索引
ALTER TABLE task_ad_detail_external_asset
    ADD UNIQUE INDEX uni_uuid(uuid);
-- 修改注释
ALTER TABLE task_ad_detail_external_asset
    MODIFY COLUMN uuid VARCHAR (64) NOT NULL COMMENT 'uuid';