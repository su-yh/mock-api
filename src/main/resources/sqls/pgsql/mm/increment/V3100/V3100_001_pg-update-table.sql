-- 模型的Logo
ALTER TABLE ai_model_config ADD model_logo varchar(128) NULL;
COMMENT ON COLUMN ai_model_config.model_logo IS 'AI模型Logo';

-- 模型开关配置
ALTER TABLE ai_model_config ADD enabled varchar(1) NOT NULL DEFAULT 'Y';
COMMENT ON COLUMN ai_model_config.enabled IS '是否启用(Y: 启用, N: 禁用)';

-- 模型备注说明
ALTER TABLE ai_model_config ADD remark varchar(300) NULL;
COMMENT ON COLUMN ai_model_config.remark IS 'AI模型Logo';

-- 图片比例
ALTER TABLE material_ai_gen_file_record ADD ratio varchar(20) NULL;
COMMENT ON COLUMN material_ai_gen_file_record.ratio IS '图片比例(16:9)';

-- 添加调用模型Logo
ALTER TABLE material_ai_gen_task_record ADD gen_model_logo varchar(128) NULL;
COMMENT ON COLUMN material_ai_gen_task_record.gen_model_logo IS '模型Logo';

ALTER TABLE material_ai_parsing_task_record ADD parsing_model_logo varchar(128) NULL;
COMMENT ON COLUMN material_ai_parsing_task_record.parsing_model_logo IS '调用模型的 Logo';


-- 更新默认模型logo
UPDATE ai_model_config SET model_logo = 'aigc-text-to-img-flux' WHERE model_code = '2';

-- 修复模型历史数据支持的Logo
UPDATE material_ai_gen_task_record magtr
SET gen_model_logo = amc.model_logo
    FROM ai_model_config amc
WHERE amc.model_code = magtr.gen_model_code AND magtr.gen_model_logo IS NULL;

UPDATE material_ai_parsing_task_record maptr
SET parsing_model_logo = amc.model_logo
    FROM ai_model_config amc
WHERE amc.model_code = maptr.parsing_model_code AND maptr.parsing_model_logo IS NULL;


-- Imagen3 模型参数：apiKey 在Gemini网站的 API秘钥页面 https://aistudio.google.com/app/apikey 获取
-- resultUrl、requestUrl 已经配好，不用修改。
INSERT INTO ai_model_config
(id, model_code, model_name, model_version, model_type, model_parameters, created, updated, model_logo, enabled)
VALUES((SELECT COALESCE(MAX(id), 0) + 1 FROM ai_model_config), '3', 'Imagen3', 'v1 beta', 'TextToImg', '{"requestConfig": {"apiKey": "请替换为你的apiKey", "requestUrl": "https://generativelanguage.googleapis.com/v1beta/models/imagen-3.0-generate-002:predict"}, "parametersSchema": [{"name": "promptText", "type": "string", "required": "Y"}, {"name": "aspectRatio", "type": "string", "required": "Y"}, {"name": "width", "type": "number", "required": "N"}, {"name": "height", "type": "number", "required": "N"}, {"name": "personGeneration", "type": "string", "required": "Y"}]}'::jsonb, '2025-04-28 11:52:44.539', '2025-04-28 11:52:44.539', NULL, 'Y');
