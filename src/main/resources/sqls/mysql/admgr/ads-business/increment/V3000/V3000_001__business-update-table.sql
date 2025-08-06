-- 修改素材备注

ALTER TABLE ad_material
    MODIFY COLUMN `hash` varchar(255) COMMENT '本地上传产生的hash';

ALTER TABLE fb_ad_material_relation
    MODIFY COLUMN material_id varchar(255) COMMENT 'ad_material表的id';

ALTER TABLE fb_ad_material_resource
    MODIFY COLUMN `hash` varchar(255) COMMENT 'fb的图片hash';

ALTER TABLE fb_material_detail_resource
    MODIFY COLUMN `material_id` varchar(255) COMMENT 'fb的素材id';

ALTER TABLE fb_material_detail_resource
    MODIFY COLUMN `hash` varchar(255) COMMENT 'fb的素材hash';

-- 关联表增加索引
ALTER TABLE fb_ad_material_relation
    ADD INDEX idx_ad_id (ad_id);

ALTER TABLE ad_material
    ADD COLUMN ad_material_id VARCHAR(32) COMMENT '素材唯一标识，用于素材投放效果回收时拼接后缀' AFTER id;

ALTER TABLE ad_material
    ADD COLUMN source SMALLINT NOT NULL DEFAULT 0 COMMENT '来源 来源 0:人工(本地) 1:ai(s3) 2:同步...' AFTER hash;

UPDATE ad_material
    JOIN (SELECT id, REPLACE(UUID(), '-', '') AS new_uuid
          FROM ad_material) AS uuid_gen
    ON ad_material.id = uuid_gen.id
SET ad_material.ad_material_id = uuid_gen.new_uuid
WHERE ad_material.ad_material_id IS NULL;

ALTER TABLE ad_material
    MODIFY COLUMN ad_material_id VARCHAR(32) NOT NULL;

-- 添加唯一索引
CREATE UNIQUE INDEX idx_ad_material_id_unique ON ad_material (ad_material_id);
