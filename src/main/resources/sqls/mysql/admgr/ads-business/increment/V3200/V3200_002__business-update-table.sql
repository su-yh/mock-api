-- 删除自定义列的唯一索引
ALTER TABLE kanban_commonly_column
    DROP INDEX uni_custom_column_creator;
-- 增加新的索引
ALTER TABLE kanban_commonly_column
    ADD CONSTRAINT uni_column_creator UNIQUE (column_class, created_by_id, custom_column_name);


INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (54, '标签', 'material_tag_id', 'DIMENSION', '["MATERIAL"]', 53, 1, '2025-05-19 10:41:48', '2025-05-19 10:41:48');

-- 在广告素材详情资源表中增加 增加对应素材id
ALTER TABLE fb_material_detail_resource
    ADD COLUMN ad_material_id varchar(32) COMMENT 'ad_material表的ad_material_id' after material_id;;
