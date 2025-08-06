-- 文件存储表
CREATE SEQUENCE material_file_storage_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE file_storage_record
(
    id             int8 PRIMARY KEY      DEFAULT nextval('material_file_storage_id_seq'),
    file_id        VARCHAR(32)  NOT NULL,              -- 文件唯一ID
    file_name      VARCHAR(255) NOT NULL,              -- 文件名称 （含扩展名，如jpg、pdf等）
    file_type      SMALLINT     NOT NULL,              -- 文件类型（1:IMAGE，2:VIDEO）
    file_size      BIGINT,                             -- 文件大小（字节）
    file_hash      VARCHAR(255) NOT NULL,              -- 文件 Hash（MD5）
    resource_url   TEXT         NOT NULL,              -- 外部或AI访问路径
    file_url       TEXT,                               -- 实际文件路径（本地或云端存储路径）
    storage_medium SMALLINT              DEFAULT 0,    -- 存储介质 -1:已删除 0:本地 1:s3标准 2:s3-ia
    source         SMALLINT     NOT NULL DEFAULT 0,    -- 来源 0:人工(本地) 1:ai(s3)...
    is_compressed  SMALLINT              DEFAULT 0,    -- 文件压缩状态（0=未压缩，1=gzip压缩）
    is_valid       BOOLEAN               DEFAULT TRUE, -- 是否有效（逻辑删除）
    created_by_id  BIGINT       NOT NULL,
    dates          INT4         NOT NULL,
    created        TIMESTAMPTZ           DEFAULT CURRENT_TIMESTAMP,
    updated        TIMESTAMPTZ           DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX idx_file_storage_record_file_id ON file_storage_record (file_id);

-- 为表添加注释
COMMENT ON TABLE file_storage_record IS '文件存储记录表，用于记录上传文件的元数据和存储路径信息';

-- 为每列添加注释
COMMENT ON COLUMN file_storage_record.id IS '主键，自增ID';
COMMENT ON COLUMN file_storage_record.file_id IS '文件唯一ID（例如UUID）';
COMMENT ON COLUMN file_storage_record.file_name IS '文件名称（含扩展名，如jpg、pdf等）';
COMMENT ON COLUMN file_storage_record.file_type IS '文件类型（1:IMAGE，2:VIDEO）';
COMMENT ON COLUMN file_storage_record.file_size IS '文件大小（单位：字节）';
COMMENT ON COLUMN file_storage_record.file_hash IS '文件内容的哈希值（MD5）';
COMMENT ON COLUMN file_storage_record.resource_url IS '对外访问路径或AI访问路径';
COMMENT ON COLUMN file_storage_record.file_url IS '实际文件存储路径（本地或云端）';
COMMENT ON COLUMN file_storage_record.storage_medium IS '存储介质 -1:已删除 0:本地 1:s3标准 2:s3-ia';
COMMENT ON COLUMN file_storage_record.source IS '来源 0:人工(本地) 1:ai(s3) 2:外部同步(本地)...';
COMMENT ON COLUMN file_storage_record.is_compressed IS '文件压缩状态（0=未压缩，1=gzip压缩）';
COMMENT ON COLUMN file_storage_record.is_valid IS '逻辑删除标志，是否有效';
COMMENT ON COLUMN file_storage_record.created_by_id IS '记录创建人ID';
COMMENT ON COLUMN file_storage_record.dates IS '日期信息，存储日期的整数表示';
COMMENT ON COLUMN file_storage_record.created IS '记录创建时间';
COMMENT ON COLUMN file_storage_record.updated IS '记录最后更新时间';


-- AI素材解析任务表
CREATE SEQUENCE material_ai_parsing_task_record_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE material_ai_parsing_task_record
(
    id                       int8 PRIMARY KEY DEFAULT nextval('material_ai_parsing_task_record_id_seq'),
    parsing_model_code       VARCHAR(20),                -- 使用模型编号
    parsing_model_name       VARCHAR(100),               -- 使用模型名称，如 joy-caption-v1
    parsing_model_version    VARCHAR(100),               -- 使用模型版本
    parsing_model_parameters JSONB,                      -- 模型参数
    status                   SMALLINT         DEFAULT 0, -- 任务状态（0=等待中，1=进行中，2=已完成）
    created_by_id            BIGINT,
    started                  TIMESTAMPTZ,                -- 任务开始时间
    finished                 TIMESTAMPTZ,                -- 任务完成时间
    dates                    INT4 NOT NULL,
    created                  TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP
);
-- 表注释
COMMENT ON TABLE material_ai_parsing_task_record IS 'AI素材解析任务表，用于记录AI解析任务的执行信息';

-- 字段注释
COMMENT ON COLUMN material_ai_parsing_task_record.parsing_model_code IS '使用模型编号';
COMMENT ON COLUMN material_ai_parsing_task_record.parsing_model_name IS '使用的模型名称，如 joy-caption-v1';
COMMENT ON COLUMN material_ai_parsing_task_record.parsing_model_version IS '使用模型版本';
COMMENT ON COLUMN material_ai_parsing_task_record.parsing_model_parameters IS '模型参数（JSON 格式）';
COMMENT ON COLUMN material_ai_parsing_task_record.status IS '任务状态：0=等待中，1=进行中，2=已完成';
COMMENT ON COLUMN material_ai_parsing_task_record.created_by_id IS '任务创建者ID';
COMMENT ON COLUMN material_ai_parsing_task_record.started IS '任务开始时间';
COMMENT ON COLUMN material_ai_parsing_task_record.finished IS '任务完成时间';
COMMENT ON COLUMN material_ai_parsing_task_record.dates IS '日期字段，存储日期的整数表示';
COMMENT ON COLUMN material_ai_parsing_task_record.created IS '创建时间';
COMMENT ON COLUMN material_ai_parsing_task_record.updated IS '最后更新时间';

-- AI素材解析
CREATE SEQUENCE material_ai_parsing_record_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE material_ai_parsing_record
(
    id              int8 PRIMARY KEY DEFAULT nextval('material_ai_parsing_record_id_seq'),
    parsing_task_id int8        NOT NULL,       -- 所属任务ID
    file_id         VARCHAR(32) NOT NULL,       -- 文件id，对应文件存储表file_id
    cover_file_id   VARCHAR(32) NOT NULL,       -- 封面id，对应文件存储表file_id
    caption_text    TEXT,                       -- 模型识别生成的描述文本（自然语言）
    status          SMALLINT         DEFAULT 0, -- 任务状态（0=等待中，1=进行中，2=已完成，3=ai模型接口失败，4=模型服务失败）
    result_msg      TEXT,                       -- 任务状态 返回的信息
    created_by_id   BIGINT      NOT NULL,
    dates           INT4        NOT NULL,       -- 日期
    created         TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP,
    updated         TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_material_ai_parsing_record_parsing_task_id ON material_ai_parsing_record (parsing_task_id);

-- 表注释
COMMENT ON TABLE material_ai_parsing_record IS 'AI素材解析记录表，存储模型生成的图文描述信息';

-- 字段注释
COMMENT ON COLUMN material_ai_parsing_record.parsing_task_id IS '所属AI解析任务ID，对应material_ai_parsing_task_record表';
COMMENT ON COLUMN material_ai_parsing_record.file_id IS '文件ID，对应文件存储表file_id';
COMMENT ON COLUMN material_ai_parsing_record.cover_file_id IS '封面ID，对应文件存储表file_id';
COMMENT ON COLUMN material_ai_parsing_record.caption_text IS 'AI模型识别生成的描述文本（自然语言）';
COMMENT ON COLUMN material_ai_parsing_record.status IS '记录状态（0=等待中，1=进行中，2=已完成，3=ai模型接口失败，4=模型服务失败）';
COMMENT ON COLUMN material_ai_parsing_record.result_msg IS '记录 返回的信息';
COMMENT ON COLUMN material_ai_parsing_record.dates IS '日期字段，表示解析任务所属日期，格式为整数';
COMMENT ON COLUMN material_ai_parsing_record.created IS '记录创建时间';
COMMENT ON COLUMN material_ai_parsing_record.updated IS '记录更新时间';

-- AI素材生成任务记录表
CREATE SEQUENCE material_ai_gen_task_record_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE material_ai_gen_task_record
(
    id                     int8 PRIMARY KEY     DEFAULT nextval('material_ai_gen_task_record_id_seq'),
    material_ai_parsing_id int8,                           -- 对应AI素材解析表中的id
    gen_model_code         VARCHAR(20) NOT NULL,           -- 使用模型编号
    gen_model_name         VARCHAR(100),                   -- 使用模型名称，如 flux-pro
    gen_model_version      VARCHAR(100),                   -- 使用模型版本
    gen_model_parameters   JSONB,                          -- 模型参数
    total_outputs          INT         NOT NULL DEFAULT 0, -- 实际生成的素材数量
    output_format          VARCHAR(50) NOT NULL,           -- 输出图片格式
    resolution_width       BIGINT      NOT NULL,           -- 分辨率宽
    resolution_height      BIGINT      NOT NULL,           -- 分辨率高
    seed                   BIGINT,                         -- 随机种子
    safety_tolerance       BIGINT      NOT NULL,           -- 安全容差
    status                 SMALLINT             DEFAULT 0, -- 任务状态（0=等待中，1=进行中，2=已完成）
    created_by_id          BIGINT,
    started                TIMESTAMPTZ,                    -- 任务开始时间
    finished               TIMESTAMPTZ,                    -- 任务完成时间
    dates                  INT4        NOT NULL,
    created                TIMESTAMPTZ          DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMPTZ          DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_material_ai_gen_task_record_parsing_id ON material_ai_gen_task_record (material_ai_parsing_id);
-- 表注释
COMMENT ON TABLE material_ai_gen_task_record IS 'AI素材生成任务表，记录每次基于提示词生成素材的任务信息';

-- 字段注释
COMMENT ON COLUMN material_ai_gen_task_record.id IS '主键，自增ID';
COMMENT ON COLUMN material_ai_gen_task_record.material_ai_parsing_id IS '对应AI素材解析表material_ai_parsing_record的ID';
COMMENT ON COLUMN material_ai_gen_task_record.gen_model_code IS '使用模型编号';
COMMENT ON COLUMN material_ai_gen_task_record.gen_model_name IS '使用的生成模型名称，例如 flux-pro';
COMMENT ON COLUMN material_ai_gen_task_record.gen_model_version IS '使用模型版本';
COMMENT ON COLUMN material_ai_gen_task_record.gen_model_parameters IS '生成模型所使用的参数，JSON格式';
COMMENT ON COLUMN material_ai_gen_task_record.total_outputs IS '该任务实际生成的素材数量';
COMMENT ON COLUMN material_ai_gen_task_record.output_format IS '输出图片格式';
COMMENT ON COLUMN material_ai_gen_task_record.resolution_width IS '分辨率宽';
COMMENT ON COLUMN material_ai_gen_task_record.resolution_height IS '分辨率高';
COMMENT ON COLUMN material_ai_gen_task_record.seed IS '随机种子';
COMMENT ON COLUMN material_ai_gen_task_record.safety_tolerance IS '安全容差';
COMMENT ON COLUMN material_ai_gen_task_record.status IS '任务状态（0=等待中，1=进行中，2=已完成）';
COMMENT ON COLUMN material_ai_gen_task_record.created_by_id IS '任务创建人ID';
COMMENT ON COLUMN material_ai_gen_task_record.started IS '任务开始时间';
COMMENT ON COLUMN material_ai_gen_task_record.finished IS '任务完成时间';
COMMENT ON COLUMN material_ai_gen_task_record.dates IS '日期字段，表示任务所属日期，格式为整数';
COMMENT ON COLUMN material_ai_gen_task_record.created IS '记录创建时间';
COMMENT ON COLUMN material_ai_gen_task_record.updated IS '记录更新时间';

-- AI素材生成素材记录表
CREATE SEQUENCE material_ai_gen_file_record_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE material_ai_gen_file_record
(
    id               int8 PRIMARY KEY DEFAULT nextval('material_ai_gen_file_record_id_seq'),
    gen_task_id      int8   NOT NULL,                -- 所属任务ID
    file_id          VARCHAR(32),                    -- 对应文件存储表file_id
    cover_file_id    VARCHAR(32),                    -- 封面id，对应文件存储表file_id
    ad_material_id   VARCHAR(32),                    -- 素材ad_material_id（加入素材库）
    prompt_text      TEXT   NOT NULL,                -- 提示词
    width            INT,
    height           INT,
    generation_score FLOAT,                          -- 模型评分
    is_primary       BOOLEAN          DEFAULT FALSE, -- 是否为主图（用户首选或系统推荐）
    status           SMALLINT         DEFAULT 0,     -- 记录状态（0=等待中，1=进行中，2=已完成，3=ai模型接口失败，4=模型服务失败）
    result_msg       TEXT,                           -- 记录状态 返回的信息
    created_by_id    BIGINT NOT NULL,
    dates            INT4   NOT NULL,
    created          TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP,
    updated          TIMESTAMPTZ      DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_material_ai_gen_file_record_gen_task_id ON material_ai_gen_file_record (gen_task_id);
CREATE INDEX idx_material_ai_gen_file_record_file_id ON material_ai_gen_file_record (file_id);

-- 表注释
COMMENT ON TABLE material_ai_gen_file_record IS 'AI素材生成文件表，记录每个生成任务所产生的文件信息';

-- 字段注释
COMMENT ON COLUMN material_ai_gen_file_record.gen_task_id IS '所属AI生成任务ID，对应material_ai_gen_task_record.id';
COMMENT ON COLUMN material_ai_gen_file_record.file_id IS '生成文件的唯一ID，对应文件存储表的file_id';
COMMENT ON COLUMN material_ai_gen_file_record.cover_file_id IS '封面id，对应文件存储表的file_id';
COMMENT ON COLUMN material_ai_gen_file_record.ad_material_id IS '生成后加入素材库的素材ad_material_id';
COMMENT ON COLUMN material_ai_gen_file_record.prompt_text IS '用于生成素材的提示词';
COMMENT ON COLUMN material_ai_gen_file_record.width IS '生成素材的宽度（像素）';
COMMENT ON COLUMN material_ai_gen_file_record.height IS '生成素材的高度（像素）';
COMMENT ON COLUMN material_ai_gen_file_record.generation_score IS '模型对生成结果的评分';
COMMENT ON COLUMN material_ai_gen_file_record.is_primary IS '是否为主图，主图为用户首选或系统推荐的图';
COMMENT ON COLUMN material_ai_gen_file_record.status IS '记录状态（0=等待中，1=进行中，2=已完成，3=ai模型接口失败，4=模型服务失败）';
COMMENT ON COLUMN material_ai_gen_file_record.result_msg IS '记录 返回的信息';
COMMENT ON COLUMN material_ai_gen_file_record.dates IS '任务所属日期（格式为整数）';
COMMENT ON COLUMN material_ai_gen_file_record.created IS '记录创建时间';
COMMENT ON COLUMN material_ai_gen_file_record.updated IS '记录更新时间';

