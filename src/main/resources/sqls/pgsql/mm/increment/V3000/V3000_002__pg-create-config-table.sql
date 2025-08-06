-- AI模型配置表
CREATE SEQUENCE ai_model_config_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE ai_model_config
(
    id               int8 PRIMARY KEY DEFAULT nextval('ai_model_config_id_seq'),
    model_code       varchar(20)  NOT NULL, -- 模型编号
    model_name       VARCHAR(100) NOT NULL, -- 模型名称
    model_version    VARCHAR(50)  NOT NULL, -- 模型版本
    model_type       VARCHAR(50)  NOT NULL, -- 模型类型
    model_parameters JSONB,                 -- 模型参数，每个模型的配置可能不同
    created          TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP,
    updated          TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_ai_model_config_model_code ON ai_model_config (model_code);

-- 表注释
COMMENT ON TABLE ai_model_config IS 'AI模型配置表';

-- 字段注释
COMMENT ON COLUMN ai_model_config.model_code IS '模型编号';
COMMENT ON COLUMN ai_model_config.model_name IS '模型名称';
COMMENT ON COLUMN ai_model_config.model_version IS '模型版本';
COMMENT ON COLUMN ai_model_config.model_type IS '模型类型';
COMMENT ON COLUMN ai_model_config.model_parameters IS '模型参数，每个模型的配置可能不同';
COMMENT ON COLUMN ai_model_config.created IS '记录创建时间';
COMMENT ON COLUMN ai_model_config.updated IS '记录更新时间';

-- Joy-Caption模型参数：requestUrl里面的ip端口，取自Joy-caption模型目录app.py中的配置（GRADIO_SERVER_IP、GRADIO_SERVER_PORT）
INSERT INTO ai_model_config (id, model_code, model_name, model_version, model_type, model_parameters, created, updated)
VALUES (1, '1', 'Joy-Caption', 'Pre-Alpha', 'ParsingImg', '{
  "requestConfig": {
    "requestUrl": "http://192.168.xxx.xxx:7860/gradio_api/call/stream_chat"
  }
}', '2025-04-19 03:52:44.539237 +00:00', '2025-04-19 03:52:44.539237 +00:00');

-- Flux模型参数：apiKey 在 https://dashboard.bfl.ai/keys 页面获取
-- resultUrl、requestUrl 已经配好，不用修改。 参见：https://api.us1.bfl.ai/scalar
INSERT INTO ai_model_config (id, model_code, model_name, model_version, model_type, model_parameters, created, updated)
VALUES (2, '2', 'Flux', '1.1 Pro', 'TextToImg', '{
  "requestConfig": {
    "apiKey": "请替换为你的apiKey",
    "resultUrl": "https://api.us1.bfl.ai/v1/get_result",
    "requestUrl": "https://api.us1.bfl.ai/v1/flux-pro-1.1"
  }
}', '2025-04-19 03:52:44.539237 +00:00', '2025-04-19 03:52:44.539237 +00:00');
