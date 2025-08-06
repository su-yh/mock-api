-- 看板-素材指标增加创意维度
UPDATE kanban_column_config SET  column_class = '["DELIVERY","MATERIAL"]' WHERE id = 44;


-- 修改素材id字段类型
ALTER TABLE fb_ad_material_relation
    ALTER COLUMN material_id TYPE BIGINT USING material_id::BIGINT;


-- 删除非必要字段 （昵称在广告任务管理后台获取不到，而且昵称可以改变不准确，所以不用了。如果需要应该查询用户库的表）
alter table task_management_ad
    drop column create_by_nick;

-- 广告主任务
-- 添加字段
ALTER TABLE task_management_ad
    ADD COLUMN result_detail TEXT;

-- 添加字段注释
COMMENT ON COLUMN task_management_ad.result_detail IS '详情';
