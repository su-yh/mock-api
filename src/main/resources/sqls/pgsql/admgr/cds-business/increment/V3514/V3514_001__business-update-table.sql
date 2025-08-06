-- 调整表结构的唯一索引
DROP INDEX uni_fb_material_detail_resource_c_id;
CREATE UNIQUE INDEX uni_fb_material_detail_resource_a_m_t_h_id ON fb_material_detail_resource (advertising_account_id,material_id,"type",hash);

-- 素材的创建时间
ALTER TABLE fb_material_detail_resource ADD asset_created timestamp NULL;
COMMENT ON COLUMN public.fb_material_detail_resource.asset_created IS '素材创建时间';

-- 素材更新时间
ALTER TABLE fb_material_detail_resource ADD asset_updated timestamp NULL;
COMMENT ON COLUMN public.fb_material_detail_resource.asset_updated IS '素材更新时间';