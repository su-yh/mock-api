-- 创建创意表
CREATE TABLE IF NOT EXISTS ad_creative_group
(
    id                  BIGSERIAL   NOT NULL,
    owner_user_id       BIGINT      NOT NULL,
    delete_flag         BIGINT      NOT NULL,
    name                VARCHAR(64) NOT NULL,
    objective           VARCHAR(50) NOT NULL,
    conversion_position VARCHAR(50),
    creative_properties TEXT        NOT NULL,
    create_by_id        BIGINT      NOT NULL,
    create_by_nick      VARCHAR(64) NOT NULL,
    created             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_creative_group IS '广告创意表';
COMMENT ON COLUMN ad_creative_group.owner_user_id IS '所属用户id';
COMMENT ON COLUMN ad_creative_group.delete_flag IS '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)';
COMMENT ON COLUMN ad_creative_group.name IS '创意名称，用户维度下唯一';
COMMENT ON COLUMN ad_creative_group.objective IS '广告目标';
COMMENT ON COLUMN ad_creative_group.conversion_position IS '转化发生位置';
COMMENT ON COLUMN ad_creative_group.creative_properties IS '整个创意信息的完整json 格式数据';
COMMENT ON COLUMN ad_creative_group.create_by_id IS '创建者ID';
COMMENT ON COLUMN ad_creative_group.create_by_nick IS '创建者昵称';


CREATE UNIQUE INDEX uni_ad_creative_group_uid_name ON ad_creative_group (owner_user_id, name, delete_flag);

-- 素材表
CREATE TABLE IF NOT EXISTS ad_material
(
    id             BIGSERIAL    NOT NULL,
    ad_material_id VARCHAR(32)  NOT NULL,
    name           VARCHAR(255) NOT NULL,
    prefix         VARCHAR(255),
    url            TEXT         NOT NULL,
    cover          VARCHAR(255),
    type           VARCHAR(50),
    hash           VARCHAR(255),
    source         SMALLINT     NOT NULL DEFAULT 0,
    size           NUMERIC(30, 2),
    width          BIGINT,
    height         BIGINT,
    designer       VARCHAR(255),
    duration       NUMERIC(5, 2),
    description    TEXT,
    folder_id      BIGINT,
    permissions    VARCHAR(50),
    created_by_id  BIGINT       NOT NULL,
    update_by_id   BIGINT,
    created        TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated        TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_material IS '素材表';
COMMENT ON COLUMN ad_material.id IS '主键ID';
COMMENT ON COLUMN ad_material.name IS '素材名';
COMMENT ON COLUMN ad_material.prefix IS '前缀';
COMMENT ON COLUMN ad_material.url IS '路径';
COMMENT ON COLUMN ad_material.cover IS '封面';
COMMENT ON COLUMN ad_material.type IS '素材类型';
COMMENT ON COLUMN ad_material.hash IS '本地上传产生的hash';
COMMENT ON COLUMN ad_material.source IS '来源 来源 0:人工(本地) 1:ai(s3) 2:同步...';
COMMENT ON COLUMN ad_material.size IS '素材大小（单位：B）';
COMMENT ON COLUMN ad_material.width IS '素材宽';
COMMENT ON COLUMN ad_material.height IS '素材高';
COMMENT ON COLUMN ad_material.designer IS '设计师';
COMMENT ON COLUMN ad_material.duration IS '时长（单位：秒）';
COMMENT ON COLUMN ad_material.description IS '素材描述';
COMMENT ON COLUMN ad_material.folder_id IS '素材文件夹ID（关联ad_material_folders表）';
COMMENT ON COLUMN ad_material.permissions IS '权限';
COMMENT ON COLUMN ad_material.created_by_id IS '创建者ID';
COMMENT ON COLUMN ad_material.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX idx_ad_material_id_unique ON ad_material (ad_material_id);
CREATE INDEX folder_id ON ad_material (folder_id);

-- 素材文件夹表
CREATE TABLE IF NOT EXISTS ad_material_folders
(
    id            BIGSERIAL    NOT NULL,
    name          VARCHAR(255) NOT NULL,
    parent_id     BIGINT,
    level         BIGINT,
    created_by_id BIGINT       NOT NULL,
    update_by_id  BIGINT,
    created       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_material_folders IS '素材文件夹表';
COMMENT ON COLUMN ad_material_folders.id IS '主键ID';
COMMENT ON COLUMN ad_material_folders.name IS '文件夹名';
COMMENT ON COLUMN ad_material_folders.parent_id IS '父级文件夹ID（根文件夹为NULL）';
COMMENT ON COLUMN ad_material_folders.level IS '级数';
COMMENT ON COLUMN ad_material_folders.created_by_id IS '创建者ID';
COMMENT ON COLUMN ad_material_folders.update_by_id IS '修改者ID';


CREATE INDEX fk_parent ON ad_material_folders (parent_id);

--FB推广链接
CREATE TABLE IF NOT EXISTS ad_promotional_link
(
    id             BIGSERIAL   NOT NULL,
    link_name      VARCHAR(50) NOT NULL,
    link_type      VARCHAR(255),
    link           TEXT        NOT NULL,
    ad_packages_id BIGINT      NOT NULL,
    remark         TEXT,
    visible_range  VARCHAR(50) NOT NULL,
    authorizer_id  BIGINT      NOT NULL,
    status         VARCHAR(16) NOT NULL DEFAULT 'ENABLED',
    created_by_id  BIGINT      NOT NULL,
    created        TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated        TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_promotional_link IS 'FB推广链接';
COMMENT ON COLUMN ad_promotional_link.id IS '主键ID';
COMMENT ON COLUMN ad_promotional_link.link_name IS '链接名称';
COMMENT ON COLUMN ad_promotional_link.link_type IS '链接类型';
COMMENT ON COLUMN ad_promotional_link.link IS '链接';
COMMENT ON COLUMN ad_promotional_link.ad_packages_id IS '投放包';
COMMENT ON COLUMN ad_promotional_link.remark IS '备注';
COMMENT ON COLUMN ad_promotional_link.visible_range IS '可见范围';
COMMENT ON COLUMN ad_promotional_link.authorizer_id IS '授权人ID';
COMMENT ON COLUMN ad_promotional_link.status IS '是否启用枚举 ENABLED, DISABLED';
COMMENT ON COLUMN ad_promotional_link.created_by_id IS '创建者ID';


CREATE INDEX idx_ad_promotional_link_status ON ad_promotional_link (status);

-- 广告模板草稿
CREATE TABLE IF NOT EXISTS ad_template_draft
(
    id                       BIGSERIAL   NOT NULL,
    owner_user_id            BIGINT      NOT NULL,
    team_id                  BIGINT      NOT NULL,
    region_group_list        TEXT,
    targeting_list           TEXT,
    creative_group_list      TEXT,
    campaign_properties      TEXT,
    campaign_name            VARCHAR(255),
    advertise_content        TEXT,
    ad_set_name              VARCHAR(255),
    creative_properties      TEXT,
    budget_advanced          TEXT,
    budget_normal            TEXT,
    placement_properties     TEXT,
    splitting_rule           TEXT,
    fb_personal_account_list TEXT,
    ad_personal_account_page TEXT,
    create_by_id             BIGINT      NOT NULL,
    create_by_nick           VARCHAR(64) NOT NULL,
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_template_draft IS '广告模板草稿';
COMMENT ON COLUMN ad_template_draft.owner_user_id IS '所属用户id';
COMMENT ON COLUMN ad_template_draft.team_id IS '所属项目团队ID';
COMMENT ON COLUMN ad_template_draft.region_group_list IS '地区组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_draft.targeting_list IS '定向包详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_draft.creative_group_list IS '创意组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_draft.campaign_properties IS '广告系列属性：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_draft.campaign_name IS '广告系列名';
COMMENT ON COLUMN ad_template_draft.advertise_content IS '投放内容';
COMMENT ON COLUMN ad_template_draft.ad_set_name IS '广告组名';
COMMENT ON COLUMN ad_template_draft.creative_properties IS '创意设置';
COMMENT ON COLUMN ad_template_draft.budget_advanced IS '出价与预算(进阶赋能弄应用广告)';
COMMENT ON COLUMN ad_template_draft.budget_normal IS '出价与预算(应用广告)';
COMMENT ON COLUMN ad_template_draft.placement_properties IS '版位';
COMMENT ON COLUMN ad_template_draft.splitting_rule IS '拆分规则：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_draft.fb_personal_account_list IS 'FB 个人号ID 列表';
COMMENT ON COLUMN ad_template_draft.ad_personal_account_page IS '广告帐号及个号选择：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_draft.create_by_id IS '创建者ID';
COMMENT ON COLUMN ad_template_draft.create_by_nick IS '创建者昵称';


CREATE UNIQUE INDEX uni_ad_template_draft_uid ON ad_template_draft (owner_user_id);

-- 广告模板表
CREATE TABLE ad_template_formal
(
    id                       BIGSERIAL   NOT NULL,
    owner_user_id            BIGINT      NOT NULL,
    team_id                  BIGINT      NOT NULL,
    name                     VARCHAR(64) NOT NULL,
    template_described       TEXT,
    delete_flag              BIGINT      NOT NULL,
    region_group_list        TEXT,
    targeting_list           TEXT,
    creative_group_list      TEXT,
    campaign_properties      TEXT,
    campaign_name            VARCHAR(255),
    advertise_content        TEXT,
    ad_set_name              VARCHAR(255),
    creative_properties      TEXT,
    budget_advanced          TEXT,
    budget_normal            TEXT,
    placement_properties     TEXT,
    splitting_rule           TEXT,
    fb_personal_account_list TEXT,
    ad_personal_account_page TEXT,
    create_by_id             BIGINT      NOT NULL,
    create_by_nick           VARCHAR(64) NOT NULL,
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_template_formal IS '广告模板表';
COMMENT ON COLUMN ad_template_formal.owner_user_id IS '所属用户id';
COMMENT ON COLUMN ad_template_formal.team_id IS '所属项目团队ID';
COMMENT ON COLUMN ad_template_formal.name IS '模板名称';
COMMENT ON COLUMN ad_template_formal.template_described IS '模板描述';
COMMENT ON COLUMN ad_template_formal.delete_flag IS '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)';
COMMENT ON COLUMN ad_template_formal.region_group_list IS '地区组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_formal.targeting_list IS '定向包详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_formal.creative_group_list IS '创意组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_formal.campaign_properties IS '广告系列属性：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_formal.campaign_name IS '广告系列名';
COMMENT ON COLUMN ad_template_formal.advertise_content IS '投放内容';
COMMENT ON COLUMN ad_template_formal.ad_set_name IS '广告组名';
COMMENT ON COLUMN ad_template_formal.creative_properties IS '创意设置';
COMMENT ON COLUMN ad_template_formal.budget_advanced IS '出价与预算(进阶赋能弄应用广告)';
COMMENT ON COLUMN ad_template_formal.budget_normal IS '出价与预算(应用广告)';
COMMENT ON COLUMN ad_template_formal.placement_properties IS '版位';
COMMENT ON COLUMN ad_template_formal.splitting_rule IS '拆分规则：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_formal.fb_personal_account_list IS 'FB 个人号ID 列表';
COMMENT ON COLUMN ad_template_formal.ad_personal_account_page IS '广告帐号及个号选择：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_formal.create_by_id IS '创建者ID';
COMMENT ON COLUMN ad_template_formal.create_by_nick IS '创建者昵称';


CREATE UNIQUE INDEX uni_ad_template_formal_uid_name ON ad_template_formal (owner_user_id, name, delete_flag);

-- 广告模板预览表
CREATE TABLE IF NOT EXISTS ad_template_preview
(
    id                       BIGSERIAL   NOT NULL,
    owner_user_id            BIGINT      NOT NULL,
    team_id                  BIGINT      NOT NULL,
    delete_flag              BIGINT      NOT NULL,
    region_group_list        TEXT,
    targeting_list           TEXT,
    creative_group_list      TEXT,
    campaign_properties      TEXT,
    campaign_name            VARCHAR(255),
    advertise_content        TEXT,
    ad_set_name              VARCHAR(255),
    creative_properties      TEXT,
    budget_advanced          TEXT,
    budget_normal            TEXT,
    placement_properties     TEXT,
    splitting_rule           TEXT,
    fb_personal_account_list TEXT,
    ad_personal_account_page TEXT,
    objective                VARCHAR(64),
    create_by_id             BIGINT      NOT NULL,
    create_by_nick           VARCHAR(64) NOT NULL,
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE ad_template_preview IS '广告模板预览表';
COMMENT ON COLUMN ad_template_preview.owner_user_id IS '所属用户id';
COMMENT ON COLUMN ad_template_preview.team_id IS '所属项目团队ID';
COMMENT ON COLUMN ad_template_preview.delete_flag IS '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)';
COMMENT ON COLUMN ad_template_preview.region_group_list IS '地区组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_preview.targeting_list IS '定向包详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_preview.creative_group_list IS '创意组详情列表，以json 格式存储';
COMMENT ON COLUMN ad_template_preview.campaign_properties IS '广告系列属性：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_preview.campaign_name IS '广告系列名';
COMMENT ON COLUMN ad_template_preview.advertise_content IS '投放内容';
COMMENT ON COLUMN ad_template_preview.ad_set_name IS '广告组名';
COMMENT ON COLUMN ad_template_preview.creative_properties IS '创意设置';
COMMENT ON COLUMN ad_template_preview.budget_advanced IS '出价与预算(进阶赋能弄应用广告)';
COMMENT ON COLUMN ad_template_preview.budget_normal IS '出价与预算(应用广告)';
COMMENT ON COLUMN ad_template_preview.placement_properties IS '版位';
COMMENT ON COLUMN ad_template_preview.splitting_rule IS '拆分规则：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_preview.fb_personal_account_list IS 'FB 个人号ID 列表';
COMMENT ON COLUMN ad_template_preview.ad_personal_account_page IS '广告帐号及个号选择：草稿存实际的json 数据，而不是id';
COMMENT ON COLUMN ad_template_preview.objective IS '广告目标：应用推广，枚举值：VALUE_OUTCOME_APP_PROMOTION 流量，枚举值: VALUE_OUTCOME_TRAFFIC';
COMMENT ON COLUMN ad_template_preview.create_by_id IS '创建者ID';
COMMENT ON COLUMN ad_template_preview.create_by_nick IS '创建者昵称';


CREATE INDEX idx_ad_template_preview_uid_name ON ad_template_preview (owner_user_id);

-- 个号授权过期提示表
CREATE TABLE IF NOT EXISTS authorization_expiration_warning
(
    id                       BIGSERIAL NOT NULL,
    personal_account_data_id BIGINT    NOT NULL,
    authorizer_id            BIGINT    NOT NULL,
    confirm_status           BOOLEAN   NOT NULL,
    token_expiry_time        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by_id            BIGINT    NOT NULL,
    update_by_id             BIGINT,
    created                  TIMESTAMP          DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP          DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE authorization_expiration_warning IS '个号授权过期提示表';
COMMENT ON COLUMN authorization_expiration_warning.id IS '主键ID';
COMMENT ON COLUMN authorization_expiration_warning.personal_account_data_id IS '个人账户ID';
COMMENT ON COLUMN authorization_expiration_warning.authorizer_id IS '授权用户ID';
COMMENT ON COLUMN authorization_expiration_warning.confirm_status IS '[0:未确认,1:已确认]';
COMMENT ON COLUMN authorization_expiration_warning.token_expiry_time IS '授权过期时间';
COMMENT ON COLUMN authorization_expiration_warning.created_by_id IS '创建者ID';
COMMENT ON COLUMN authorization_expiration_warning.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_authorization_expiration_warning_p_id ON authorization_expiration_warning (personal_account_data_id);
CREATE INDEX idx_authorization_expiration_warning_c_a_id ON authorization_expiration_warning (confirm_status, authorizer_id);

-- FB广告账户收藏表
CREATE TABLE IF NOT EXISTS fb_account_collect
(
    id                     BIGSERIAL   NOT NULL,
    advertising_account_id VARCHAR(32) NOT NULL,
    user_id                BIGINT      NOT NULL,
    collection_time        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_account_collect IS 'FB广告账户收藏表';
COMMENT ON COLUMN fb_account_collect.id IS '主键ID';
COMMENT ON COLUMN fb_account_collect.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_account_collect.user_id IS '用户id';
COMMENT ON COLUMN fb_account_collect.collection_time IS '收藏时间';


CREATE UNIQUE INDEX uni_fb_account_collect_ad_account_user ON fb_account_collect (advertising_account_id, user_id);

-- FB广告账户转化事件表
CREATE TABLE IF NOT EXISTS fb_account_convert_event
(
    id                     BIGSERIAL    NOT NULL,
    event_id               VARCHAR(32)  NOT NULL,
    event_name             VARCHAR(255) NOT NULL,
    advertising_account_id VARCHAR(32)  NOT NULL,
    business_management_id VARCHAR(32),
    custom_event_type      VARCHAR(32)  NOT NULL,
    rule                   TEXT,
    data_sources           TEXT,
    created_by_id          BIGINT       NOT NULL,
    update_by_id           BIGINT,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_account_convert_event IS 'FB广告账户转化事件表';
COMMENT ON COLUMN fb_account_convert_event.id IS '主键ID';
COMMENT ON COLUMN fb_account_convert_event.event_id IS '像素Id';
COMMENT ON COLUMN fb_account_convert_event.event_name IS '像素名字';
COMMENT ON COLUMN fb_account_convert_event.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_account_convert_event.business_management_id IS 'BM_ID';
COMMENT ON COLUMN fb_account_convert_event.custom_event_type IS '事件类型';
COMMENT ON COLUMN fb_account_convert_event.rule IS '规则';
COMMENT ON COLUMN fb_account_convert_event.data_sources IS '数据来源id';
COMMENT ON COLUMN fb_account_convert_event.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_account_convert_event.update_by_id IS '修改者ID';

CREATE INDEX idx_fb_account_convert_event_account_id ON fb_account_convert_event (advertising_account_id);

-- FB广告账户像素代码表
CREATE TABLE IF NOT EXISTS fb_account_pixel_code
(
    id                     BIGSERIAL    NOT NULL,
    pixel_id               VARCHAR(32)  NOT NULL,
    pixel_name             VARCHAR(255) NOT NULL,
    advertising_account_id VARCHAR(32)  NOT NULL,
    created_by_id          BIGINT       NOT NULL,
    update_by_id           BIGINT,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_account_pixel_code IS 'FB广告账户像素代码表';
COMMENT ON COLUMN fb_account_pixel_code.id IS '主键ID';
COMMENT ON COLUMN fb_account_pixel_code.pixel_id IS '像素Id';
COMMENT ON COLUMN fb_account_pixel_code.pixel_name IS '像素名字';
COMMENT ON COLUMN fb_account_pixel_code.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_account_pixel_code.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_account_pixel_code.update_by_id IS '修改者ID';

CREATE INDEX idx_fb_account_pixel_code_account_id ON fb_account_pixel_code (advertising_account_id);

-- FB广告账户管理表
CREATE TABLE IF NOT EXISTS fb_advertising_account
(
    id                       BIGSERIAL    NOT NULL,
    advertising_account_id   VARCHAR(32)  NOT NULL,
    advertising_account_name VARCHAR(255) NOT NULL,
    status                   VARCHAR(50)  NOT NULL DEFAULT 'ENABLED',
    time_zone                VARCHAR(64),
    currency                 VARCHAR(16),
    account_status           VARCHAR(32)  NOT NULL,
    disable_reason           VARCHAR(64),
    last_auth_time           TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by_id            BIGINT       NOT NULL,
    update_by_id             BIGINT,
    created                  TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_advertising_account IS 'FB广告账号管理表';
COMMENT ON COLUMN fb_advertising_account.id IS '主键ID';
COMMENT ON COLUMN fb_advertising_account.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_advertising_account.advertising_account_name IS '广告账户名称';
COMMENT ON COLUMN fb_advertising_account.status IS '用户拉取数据开关状态';
COMMENT ON COLUMN fb_advertising_account.time_zone IS '时区';
COMMENT ON COLUMN fb_advertising_account.currency IS '币种';
COMMENT ON COLUMN fb_advertising_account.account_status IS '广告账户状态枚举 AdAccountStatusEnums';
COMMENT ON COLUMN fb_advertising_account.disable_reason IS '禁用原因';
COMMENT ON COLUMN fb_advertising_account.last_auth_time IS '最近授权时间';
COMMENT ON COLUMN fb_advertising_account.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_advertising_account.update_by_id IS '修改者ID';
COMMENT ON COLUMN fb_advertising_account.created IS '创建时间';
COMMENT ON COLUMN fb_advertising_account.updated IS '更新时间';


CREATE UNIQUE INDEX uni_fb_advertising_account_p_a_id ON fb_advertising_account (advertising_account_id);
CREATE INDEX idx_fb_advertising_account_a_a_s ON fb_advertising_account (advertising_account_id, account_status);

-- FB广告账号和推广应用关联表
CREATE TABLE IF NOT EXISTS fb_advertising_app_mapping
(
    id                 BIGSERIAL NOT NULL,
    ad_account_data_id BIGINT    NOT NULL,
    app_data_id        BIGINT    NOT NULL,
    created_by_id      BIGINT    NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_advertising_app_mapping IS 'FB广告账号和推广应用关联表';
COMMENT ON COLUMN fb_advertising_app_mapping.id IS '主键ID';
COMMENT ON COLUMN fb_advertising_app_mapping.ad_account_data_id IS '广告账号数据id';
COMMENT ON COLUMN fb_advertising_app_mapping.app_data_id IS '推广应用数据id';
COMMENT ON COLUMN fb_advertising_app_mapping.created_by_id IS '创建者ID';


CREATE UNIQUE INDEX uni_fb_advertising_app_mapping_a_a_id ON fb_advertising_app_mapping (ad_account_data_id, app_data_id);

-- 创建的FB广告系列v2
CREATE TABLE IF NOT EXISTS fb_ad_campaign
(
    id              BIGSERIAL NOT NULL,
    package_data_id BIGINT    NOT NULL,
    team            VARCHAR(20),
    account_id      VARCHAR(20),
    keywords        VARCHAR(20),
    campaign_id     VARCHAR(20),
    campaign_name   VARCHAR(255),
    campaign_type   VARCHAR(255),
    type            INTEGER,
    status          VARCHAR(50),
    account_status  INTEGER,
    created         TIMESTAMP,
    created_id      INTEGER,
    created_name    VARCHAR(255),
    updated         TIMESTAMP,
    updated_id      INTEGER,
    updated_name    VARCHAR(255),
    dates           INTEGER,
    team_id         INTEGER,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_campaign IS '创建的FB广告系列v2';
COMMENT ON COLUMN fb_ad_campaign.id IS '主键';
COMMENT ON COLUMN fb_ad_campaign.package_data_id IS '投放包数据id';
COMMENT ON COLUMN fb_ad_campaign.team IS '投放团队';
COMMENT ON COLUMN fb_ad_campaign.account_id IS '账号ID';
COMMENT ON COLUMN fb_ad_campaign.keywords IS '关键字';
COMMENT ON COLUMN fb_ad_campaign.campaign_id IS '广告系列ID';
COMMENT ON COLUMN fb_ad_campaign.campaign_name IS '广告系列名称';
COMMENT ON COLUMN fb_ad_campaign.campaign_type IS '广告系列类型';
COMMENT ON COLUMN fb_ad_campaign.type IS '广告系列类[1:3A,2:非3A]';
COMMENT ON COLUMN fb_ad_campaign.status IS '广告系列状态';
COMMENT ON COLUMN fb_ad_campaign.account_status IS '广告账户状态';
COMMENT ON COLUMN fb_ad_campaign.created IS '创建时间';
COMMENT ON COLUMN fb_ad_campaign.created_id IS '创建者用户ID';
COMMENT ON COLUMN fb_ad_campaign.created_name IS '创建者';
COMMENT ON COLUMN fb_ad_campaign.updated IS '修改时间';
COMMENT ON COLUMN fb_ad_campaign.dates IS '日期';
COMMENT ON COLUMN fb_ad_campaign.team_id IS '项目团队ID';

-- FB广告系列指标数据表
CREATE TABLE IF NOT EXISTS fb_ad_campaign_metrics_record
(
    id                         BIGSERIAL   NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    ad_account_id              VARCHAR(32) NOT NULL,
    account_currency           VARCHAR(32) NOT NULL,
    spend                      NUMERIC(20, 8),
    frequency                  NUMERIC(20, 8),
    reach                      INTEGER,
    impressions                INTEGER,
    clicks                     INTEGER,
    conversions                INTEGER              DEFAULT 0,
    downloads                  INTEGER              DEFAULT 0,
    omni_app_install           INTEGER              DEFAULT 0,
    omni_activate_app          INTEGER              DEFAULT 0,
    registrations              INTEGER              DEFAULT 0,
    omni_purchase              INTEGER              DEFAULT 0,
    inline_link_clicks         INTEGER              DEFAULT 0,
    landing_page_view          INTEGER              DEFAULT 0,
    cost_per_inline_link_click NUMERIC(20, 8)       DEFAULT 0.00000000,
    d1_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d7_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d28_purchase_conversion    NUMERIC(20, 8)       DEFAULT 0.00000000,
    dates                      INTEGER,
    created                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_campaign_metrics_record IS 'FB广告系列指标数据表';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.id IS '主键ID';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.ad_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.account_currency IS '币种代码';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.clicks IS '点击量';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.frequency IS '频率';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.conversions IS '转化数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.downloads IS '下载数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.omni_app_install IS '安装数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.omni_activate_app IS '激活数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.registrations IS '注册数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.omni_purchase IS '付费次数';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.d1_purchase_conversion IS 'Day_1 购物转化价值';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.d7_purchase_conversion IS 'Day_7 购物转化价值';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.d28_purchase_conversion IS 'Day_28 购物转化价值';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.dates IS '日期';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.created IS '创建时间';
COMMENT ON COLUMN fb_ad_campaign_metrics_record.updated IS '更新时间';


CREATE UNIQUE INDEX uni_fb_ad_campaign_metrics_record ON fb_ad_campaign_metrics_record (ad_account_id, campaign_id, dates);
CREATE INDEX idx_fb_ad_campaign_metrics_record_dates ON fb_ad_campaign_metrics_record (dates);
CREATE INDEX idx_fb_ad_campaign_metrics_record_groups ON fb_ad_campaign_metrics_record (ad_account_id, campaign_id);

-- FB广告系列关联表;
CREATE TABLE IF NOT EXISTS fb_ad_campaign_relation
(
    id               BIGSERIAL   NOT NULL,
    personal_data_id BIGINT      NOT NULL,
    campaign_id      VARCHAR(32) NOT NULL,
    package_data_id  BIGINT,
    team_id          BIGINT,
    delete_flag      BIGINT    DEFAULT 0,
    created_by_id    BIGINT      NOT NULL,
    update_by_id     BIGINT,
    created          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_campaign_relation IS 'FB广告系列关联表';
COMMENT ON COLUMN fb_ad_campaign_relation.id IS '主键ID';
COMMENT ON COLUMN fb_ad_campaign_relation.personal_data_id IS '个号数据Id';
COMMENT ON COLUMN fb_ad_campaign_relation.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_campaign_relation.package_data_id IS '投放包数据Id';
COMMENT ON COLUMN fb_ad_campaign_relation.team_id IS '项目团队Id';
COMMENT ON COLUMN fb_ad_campaign_relation.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_ad_campaign_relation.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_ad_campaign_relation_c_id ON fb_ad_campaign_relation (personal_data_id, campaign_id);

-- FB广告系列资源表
CREATE TABLE IF NOT EXISTS fb_ad_campaign_resource
(
    id                         BIGSERIAL   NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    campaign_name              TEXT        NOT NULL,
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED',
    effective_status           VARCHAR(32) NOT NULL,
    advertising_account_id     VARCHAR(32) NOT NULL,
    objective                  VARCHAR(64) NOT NULL,
    daily_budget               NUMERIC(20, 8),
    lifetime_budget            NUMERIC(20, 8),
    bid_strategy               VARCHAR(64),
    start_time                 TIMESTAMP,
    end_time                   TIMESTAMP,
    attribution_config         VARCHAR(128),
    spend                      NUMERIC(20, 8),
    impressions                INTEGER,
    reach                      INTEGER,
    clicks                     INTEGER,
    ctr                        NUMERIC(20, 8),
    cpc                        NUMERIC(20, 8),
    cpm                        NUMERIC(20, 8),
    inline_link_clicks         INTEGER,
    inline_link_click_ctr      NUMERIC(20, 8),
    frequency                  NUMERIC(20, 8),
    cost_per_inline_link_click NUMERIC(20, 8),
    landing_page_view          INTEGER,
    effect                     VARCHAR(32),
    cost_per_effect            NUMERIC(20, 8),
    campaign_properties        TEXT        NOT NULL,
    campaign_created           TIMESTAMP,
    campaign_updated           TIMESTAMP,
    created_by_id              BIGINT      NOT NULL,
    update_by_id               BIGINT,
    created                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_campaign_resource IS 'FB广告系列资源表';
COMMENT ON COLUMN fb_ad_campaign_resource.id IS '主键ID';
COMMENT ON COLUMN fb_ad_campaign_resource.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_campaign_resource.campaign_name IS '广告系列名称';
COMMENT ON COLUMN fb_ad_campaign_resource.status IS '是否启用枚举 ENABLED, DISABLED';
COMMENT ON COLUMN fb_ad_campaign_resource.effective_status IS '投放状态 Facebook 枚举 EnumEffectiveStatus';
COMMENT ON COLUMN fb_ad_campaign_resource.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_campaign_resource.objective IS '广告目标';
COMMENT ON COLUMN fb_ad_campaign_resource.daily_budget IS '单日预算';
COMMENT ON COLUMN fb_ad_campaign_resource.lifetime_budget IS '总预算';
COMMENT ON COLUMN fb_ad_campaign_resource.bid_strategy IS '竞价策略';
COMMENT ON COLUMN fb_ad_campaign_resource.start_time IS '排期开始时间';
COMMENT ON COLUMN fb_ad_campaign_resource.end_time IS '排期结束时间';
COMMENT ON COLUMN fb_ad_campaign_resource.attribution_config IS '归因设置';
COMMENT ON COLUMN fb_ad_campaign_resource.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_campaign_resource.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_campaign_resource.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_campaign_resource.clicks IS '点击量';
COMMENT ON COLUMN fb_ad_campaign_resource.ctr IS '点击率';
COMMENT ON COLUMN fb_ad_campaign_resource.cpc IS '单次链接点击费用(全部)';
COMMENT ON COLUMN fb_ad_campaign_resource.cpm IS '千次展示费用';
COMMENT ON COLUMN fb_ad_campaign_resource.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_campaign_resource.inline_link_click_ctr IS '链接点击率';
COMMENT ON COLUMN fb_ad_campaign_resource.frequency IS '频次';
COMMENT ON COLUMN fb_ad_campaign_resource.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_campaign_resource.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_campaign_resource.effect IS '成效';
COMMENT ON COLUMN fb_ad_campaign_resource.cost_per_effect IS '单次成效费用';
COMMENT ON COLUMN fb_ad_campaign_resource.campaign_properties IS '广告系列属性';
COMMENT ON COLUMN fb_ad_campaign_resource.campaign_created IS '广告系列创建日期';
COMMENT ON COLUMN fb_ad_campaign_resource.campaign_updated IS '广告系列修改日期';
COMMENT ON COLUMN fb_ad_campaign_resource.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_ad_campaign_resource.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_ad_campaign_resource_c_id ON fb_ad_campaign_resource (campaign_id);

-- FB广告素材指标数据表
CREATE TABLE IF NOT EXISTS fb_ad_material_metrics_record
(
    id                         BIGSERIAL   NOT NULL,
    ad_account_id              VARCHAR(32) NOT NULL,
    ad_id                      VARCHAR(32) NOT NULL,
    reach                      INTEGER,
    frequency                  NUMERIC(20, 8),
    landing_page_view          INTEGER,
    inline_link_clicks         INTEGER,
    cost_per_inline_link_click NUMERIC(20, 8),
    play_times                 INTEGER              DEFAULT 0,
    percent25_play_times       INTEGER              DEFAULT 0,
    percent50_play_times       INTEGER              DEFAULT 0,
    percent75_play_times       INTEGER              DEFAULT 0,
    percent100_play_times      INTEGER              DEFAULT 0,
    dates                      INTEGER,
    created                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ad_set_id                  VARCHAR(32),
    campaign_id                VARCHAR(32),
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_material_metrics_record IS 'FB广告素材指标数据表';
COMMENT ON COLUMN fb_ad_material_metrics_record.id IS '主键ID';
COMMENT ON COLUMN fb_ad_material_metrics_record.ad_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_material_metrics_record.ad_id IS '广告Id';
COMMENT ON COLUMN fb_ad_material_metrics_record.play_times IS '播放次数';
COMMENT ON COLUMN fb_ad_material_metrics_record.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_material_metrics_record.frequency IS '频率';
COMMENT ON COLUMN fb_ad_material_metrics_record.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_material_metrics_record.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_material_metrics_record.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_material_metrics_record.percent25_play_times IS '25%播放次数';
COMMENT ON COLUMN fb_ad_material_metrics_record.percent50_play_times IS '50%播放次数';
COMMENT ON COLUMN fb_ad_material_metrics_record.percent75_play_times IS '75%播放次数';
COMMENT ON COLUMN fb_ad_material_metrics_record.percent100_play_times IS '100%播放次数';
COMMENT ON COLUMN fb_ad_material_metrics_record.dates IS '创建日期';
COMMENT ON COLUMN fb_ad_material_metrics_record.created IS '创建时间';
COMMENT ON COLUMN fb_ad_material_metrics_record.updated IS '更新时间';
COMMENT ON COLUMN fb_ad_material_metrics_record.ad_set_id IS '广告组id';
COMMENT ON COLUMN fb_ad_material_metrics_record.campaign_id IS '广告系列id';


CREATE INDEX idx_fb_ad_material_metrics_record_groups ON fb_ad_material_metrics_record (ad_id, ad_account_id);
CREATE INDEX idx_fb_ad_material_metrics_record_dates ON fb_ad_material_metrics_record (dates);

-- 本地素材和广告关系表
CREATE TABLE IF NOT EXISTS fb_ad_material_relation
(
    id                     BIGSERIAL NOT NULL,
    material_id            VARCHAR(255),
    ad_id                  VARCHAR(255),
    advertising_account_id TEXT,
    created_by_id          BIGINT    NOT NULL,
    update_by_id           BIGINT,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_material_relation IS '本地素材和广告关系表';
COMMENT ON COLUMN fb_ad_material_relation.id IS '主键ID';
COMMENT ON COLUMN fb_ad_material_relation.material_id IS 'ad_material表的id';
COMMENT ON COLUMN fb_ad_material_relation.ad_id IS '广告id';
COMMENT ON COLUMN fb_ad_material_relation.advertising_account_id IS '广告账户';
COMMENT ON COLUMN fb_ad_material_relation.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_ad_material_relation.update_by_id IS '修改者ID';


CREATE INDEX idx_fb_ad_material_relation_ad_id ON fb_ad_material_relation (ad_id);

-- 广告素材表;
CREATE TABLE IF NOT EXISTS fb_ad_material_resource
(
    id                         BIGSERIAL   NOT NULL,
    advertising_account_id     VARCHAR(32) NOT NULL,
    ad_id                      VARCHAR(32) NOT NULL,
    type                       VARCHAR(32) NOT NULL,
    hash                       VARCHAR(255),
    video_id                   VARCHAR(60),
    quality_ranking            VARCHAR(32),
    engagement_rate_ranking    VARCHAR(32),
    conversion_rate_ranking    VARCHAR(32),
    spend                      NUMERIC(20, 8),
    impressions                INTEGER,
    reach                      INTEGER,
    clicks                     INTEGER,
    ctr                        NUMERIC(20, 8),
    cpc                        NUMERIC(20, 8),
    cpm                        NUMERIC(20, 8),
    inline_link_clicks         INTEGER,
    inline_link_click_ctr      NUMERIC(20, 8),
    frequency                  NUMERIC(20, 8),
    cost_per_inline_link_click NUMERIC(20, 8),
    landing_page_view          INTEGER,
    effect                     VARCHAR(32),
    cost_per_effect            NUMERIC(20, 8),
    created                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_material_resource IS '广告素材表';
COMMENT ON COLUMN fb_ad_material_resource.id IS '主键ID';
COMMENT ON COLUMN fb_ad_material_resource.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_material_resource.ad_id IS '广告Id';
COMMENT ON COLUMN fb_ad_material_resource.type IS '素材类型';
COMMENT ON COLUMN fb_ad_material_resource.hash IS 'fb的图片hash';
COMMENT ON COLUMN fb_ad_material_resource.video_id IS '视频Id';
COMMENT ON COLUMN fb_ad_material_resource.quality_ranking IS '质量排名';
COMMENT ON COLUMN fb_ad_material_resource.engagement_rate_ranking IS '互动率排名';
COMMENT ON COLUMN fb_ad_material_resource.conversion_rate_ranking IS '转化率排名';
COMMENT ON COLUMN fb_ad_material_resource.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_material_resource.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_material_resource.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_material_resource.clicks IS '点击量（全部）';
COMMENT ON COLUMN fb_ad_material_resource.ctr IS '点击率（全部）';
COMMENT ON COLUMN fb_ad_material_resource.cpc IS '单次点击费用（全部）';
COMMENT ON COLUMN fb_ad_material_resource.cpm IS '千次展示费用';
COMMENT ON COLUMN fb_ad_material_resource.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_material_resource.inline_link_click_ctr IS '链接点击率';
COMMENT ON COLUMN fb_ad_material_resource.frequency IS '频次';
COMMENT ON COLUMN fb_ad_material_resource.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_material_resource.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_material_resource.effect IS '成效';
COMMENT ON COLUMN fb_ad_material_resource.cost_per_effect IS '单次成效费用';

CREATE INDEX idx_fb_ad_material_resource_account_id_ad_id ON fb_ad_material_resource (advertising_account_id, ad_id);


-- 广告资源指标数据表;
CREATE TABLE fb_ad_metrics_record
(
    id                         BIGSERIAL   NOT NULL,
    ad_account_id              VARCHAR(32) NOT NULL,
    ad_id                      VARCHAR(32) NOT NULL,
    ad_set_id                  VARCHAR(32) NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    account_currency           VARCHAR(32) NOT NULL,
    frequency                  NUMERIC(20, 8),
    reach                      INTEGER,
    spend                      NUMERIC(20, 8)       DEFAULT 0.00000000,
    impressions                INTEGER              DEFAULT 0,
    clicks                     INTEGER              DEFAULT 0,
    conversions                INTEGER              DEFAULT 0,
    downloads                  INTEGER              DEFAULT 0,
    omni_app_install           INTEGER              DEFAULT 0,
    omni_activate_app          INTEGER              DEFAULT 0,
    registrations              INTEGER              DEFAULT 0,
    omni_purchase              INTEGER              DEFAULT 0,
    inline_link_clicks         INTEGER              DEFAULT 0,
    landing_page_view          INTEGER              DEFAULT 0,
    cost_per_inline_link_click NUMERIC(20, 8)       DEFAULT 0.00000000,
    d1_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d7_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d28_purchase_conversion    NUMERIC(20, 8)       DEFAULT 0.00000000,
    country                    VARCHAR(32) NOT NULL,
    dates                      INTEGER,
    created                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_metrics_record IS '广告资源指标数据表';
COMMENT ON COLUMN fb_ad_metrics_record.id IS '主键ID';
COMMENT ON COLUMN fb_ad_metrics_record.ad_account_id IS '广告账户Id';
COMMENT ON COLUMN fb_ad_metrics_record.ad_id IS '广告Id';
COMMENT ON COLUMN fb_ad_metrics_record.ad_set_id IS '广告组Id';
COMMENT ON COLUMN fb_ad_metrics_record.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_metrics_record.account_currency IS '币种代码';
COMMENT ON COLUMN fb_ad_metrics_record.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_metrics_record.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_metrics_record.clicks IS '点击量（全部）';
COMMENT ON COLUMN fb_ad_metrics_record.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_metrics_record.frequency IS '频率';
COMMENT ON COLUMN fb_ad_metrics_record.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_metrics_record.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_metrics_record.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_metrics_record.conversions IS '转化数';
COMMENT ON COLUMN fb_ad_metrics_record.downloads IS '下载数';
COMMENT ON COLUMN fb_ad_metrics_record.omni_app_install IS '安装数';
COMMENT ON COLUMN fb_ad_metrics_record.omni_activate_app IS '激活数';
COMMENT ON COLUMN fb_ad_metrics_record.registrations IS '注册数';
COMMENT ON COLUMN fb_ad_metrics_record.omni_purchase IS '付费次数';
COMMENT ON COLUMN fb_ad_metrics_record.d1_purchase_conversion IS 'Day_1 购物转化价值';
COMMENT ON COLUMN fb_ad_metrics_record.d7_purchase_conversion IS 'Day_7 购物转化价值';
COMMENT ON COLUMN fb_ad_metrics_record.d28_purchase_conversion IS 'Day_28 购物转化价值';
COMMENT ON COLUMN fb_ad_metrics_record.country IS '国家';
COMMENT ON COLUMN fb_ad_metrics_record.dates IS '日期';
COMMENT ON COLUMN fb_ad_metrics_record.created IS '创建时间';
COMMENT ON COLUMN fb_ad_metrics_record.updated IS '更新时间';


CREATE UNIQUE INDEX uni_fb_ad_metrics_record ON fb_ad_metrics_record (ad_account_id, campaign_id, ad_set_id, ad_id, dates);
CREATE INDEX idx_fb_ad_metrics_record_compose_ids ON fb_ad_metrics_record (ad_account_id, campaign_id, ad_set_id, ad_id);
CREATE INDEX idx_fb_ad_metrics_record_dates ON fb_ad_metrics_record (dates);

-- FB广告创意资源表;
CREATE TABLE IF NOT EXISTS fb_ad_resource
(
    id                         BIGSERIAL   NOT NULL,
    ad_id                      VARCHAR(32) NOT NULL,
    ad_name                    TEXT        NOT NULL,
    ad_set_id                  VARCHAR(32) NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    creative_id                VARCHAR(32),
    creative_name              VARCHAR(255),
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED',
    cover_image                TEXT,
    effective_status           VARCHAR(32) NOT NULL,
    advertising_account_id     VARCHAR(32) NOT NULL,
    objective                  VARCHAR(64) NOT NULL,
    link                       TEXT,
    quality_ranking            VARCHAR(32),
    engagement_rate_ranking    VARCHAR(32),
    conversion_rate_ranking    VARCHAR(32),
    spend                      NUMERIC(20, 8),
    impressions                INTEGER,
    reach                      INTEGER,
    clicks                     INTEGER,
    ctr                        NUMERIC(20, 8),
    cpc                        NUMERIC(20, 8),
    cpm                        NUMERIC(20, 8),
    inline_link_clicks         INTEGER,
    inline_link_click_ctr      NUMERIC(20, 8),
    frequency                  NUMERIC(20, 8),
    cost_per_inline_link_click NUMERIC(20, 8),
    landing_page_view          INTEGER,
    effect                     VARCHAR(32),
    cost_per_effect            NUMERIC(20, 8),
    creative_properties        TEXT,
    creative_group_list        TEXT,
    ad_created                 TIMESTAMP,
    ad_updated                 TIMESTAMP,
    created_by_id              BIGINT      NOT NULL,
    update_by_id               BIGINT,
    created                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_resource IS 'FB广告创意资源表';
COMMENT ON COLUMN fb_ad_resource.id IS '主键ID';
COMMENT ON COLUMN fb_ad_resource.ad_id IS '广告创意Id';
COMMENT ON COLUMN fb_ad_resource.ad_name IS '广告创意名称';
COMMENT ON COLUMN fb_ad_resource.ad_set_id IS '广告组Id';
COMMENT ON COLUMN fb_ad_resource.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_resource.creative_id IS '创意id';
COMMENT ON COLUMN fb_ad_resource.creative_name IS '创意名';
COMMENT ON COLUMN fb_ad_resource.status IS '是否启用枚举 ENABLED, DISABLED';
COMMENT ON COLUMN fb_ad_resource.cover_image IS '封面';
COMMENT ON COLUMN fb_ad_resource.effective_status IS '投放状态 Facebook 枚举 EnumEffectiveStatus';
COMMENT ON COLUMN fb_ad_resource.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_resource.objective IS '广告目标';
COMMENT ON COLUMN fb_ad_resource.link IS '链接';
COMMENT ON COLUMN fb_ad_resource.quality_ranking IS '质量排名';
COMMENT ON COLUMN fb_ad_resource.engagement_rate_ranking IS '互动率排名';
COMMENT ON COLUMN fb_ad_resource.conversion_rate_ranking IS '转化率排名';
COMMENT ON COLUMN fb_ad_resource.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_resource.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_resource.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_resource.clicks IS '点击量（全部）';
COMMENT ON COLUMN fb_ad_resource.ctr IS '点击率（全部）';
COMMENT ON COLUMN fb_ad_resource.cpc IS '单次点击费用（全部）';
COMMENT ON COLUMN fb_ad_resource.cpm IS '千次展示费用';
COMMENT ON COLUMN fb_ad_resource.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_resource.inline_link_click_ctr IS '链接点击率';
COMMENT ON COLUMN fb_ad_resource.frequency IS '频次';
COMMENT ON COLUMN fb_ad_resource.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_resource.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_resource.effect IS '成效';
COMMENT ON COLUMN fb_ad_resource.cost_per_effect IS '单次成效费用';
COMMENT ON COLUMN fb_ad_resource.creative_properties IS '创意设置';
COMMENT ON COLUMN fb_ad_resource.creative_group_list IS '创意组';
COMMENT ON COLUMN fb_ad_resource.ad_created IS '广告创建日期';
COMMENT ON COLUMN fb_ad_resource.ad_updated IS '广告修改日期';
COMMENT ON COLUMN fb_ad_resource.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_ad_resource.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_ad_resource_c_id ON fb_ad_resource (ad_id);
CREATE INDEX idx_fb_ad_resource_creative_creative ON fb_ad_resource (creative_id, creative_name);

-- FB广告组指标数据表;
CREATE TABLE IF NOT EXISTS fb_ad_set_metrics_record
(
    id                         BIGSERIAL   NOT NULL,
    ad_account_id              VARCHAR(32) NOT NULL,
    ad_set_id                  VARCHAR(32) NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    account_currency           VARCHAR(32) NOT NULL,
    spend                      NUMERIC(20, 8)       DEFAULT 0.00000000,
    impressions                INTEGER              DEFAULT 0,
    clicks                     INTEGER              DEFAULT 0,
    frequency                  NUMERIC(20, 8),
    reach                      INTEGER,
    conversions                INTEGER              DEFAULT 0,
    downloads                  INTEGER              DEFAULT 0,
    omni_app_install           INTEGER              DEFAULT 0,
    omni_activate_app          INTEGER              DEFAULT 0,
    registrations              INTEGER              DEFAULT 0,
    omni_purchase              INTEGER              DEFAULT 0,
    inline_link_clicks         INTEGER              DEFAULT 0,
    landing_page_view          INTEGER              DEFAULT 0,
    cost_per_inline_link_click NUMERIC(20, 8)       DEFAULT 0.00000000,
    d1_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d7_purchase_conversion     NUMERIC(20, 8)       DEFAULT 0.00000000,
    d28_purchase_conversion    NUMERIC(20, 8)       DEFAULT 0.00000000,
    country                    VARCHAR(32) NOT NULL,
    dates                      INTEGER,
    created                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_set_metrics_record IS 'FB广告组指标数据表';
COMMENT ON COLUMN fb_ad_set_metrics_record.id IS '主键ID';
COMMENT ON COLUMN fb_ad_set_metrics_record.ad_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_set_metrics_record.ad_set_id IS '广告组Id';
COMMENT ON COLUMN fb_ad_set_metrics_record.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_set_metrics_record.account_currency IS '币种代码';
COMMENT ON COLUMN fb_ad_set_metrics_record.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_set_metrics_record.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_set_metrics_record.clicks IS '点击量';
COMMENT ON COLUMN fb_ad_set_metrics_record.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_set_metrics_record.frequency IS '频率';
COMMENT ON COLUMN fb_ad_set_metrics_record.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_set_metrics_record.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_set_metrics_record.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_set_metrics_record.conversions IS '转化数';
COMMENT ON COLUMN fb_ad_set_metrics_record.downloads IS '下载数';
COMMENT ON COLUMN fb_ad_set_metrics_record.omni_app_install IS '安装数';
COMMENT ON COLUMN fb_ad_set_metrics_record.omni_activate_app IS '激活数';
COMMENT ON COLUMN fb_ad_set_metrics_record.registrations IS '注册数';
COMMENT ON COLUMN fb_ad_set_metrics_record.omni_purchase IS '付费次数';
COMMENT ON COLUMN fb_ad_set_metrics_record.d1_purchase_conversion IS 'Day_1 购物转化价值';
COMMENT ON COLUMN fb_ad_set_metrics_record.d7_purchase_conversion IS 'Day_7 购物转化价值';
COMMENT ON COLUMN fb_ad_set_metrics_record.d28_purchase_conversion IS 'Day_28 购物转化价值';
COMMENT ON COLUMN fb_ad_set_metrics_record.country IS '国家';
COMMENT ON COLUMN fb_ad_set_metrics_record.dates IS '日期';
COMMENT ON COLUMN fb_ad_set_metrics_record.created IS '创建时间';
COMMENT ON COLUMN fb_ad_set_metrics_record.updated IS '更新时间';


CREATE UNIQUE INDEX uni_fb_ad_set_metrics_record ON fb_ad_set_metrics_record (ad_account_id, campaign_id, ad_set_id, dates);
CREATE INDEX idx_fb_ad_set_metrics_record_campaign__groups ON fb_ad_set_metrics_record (ad_account_id, campaign_id, ad_set_id);
CREATE INDEX idx_fb_ad_set_metrics_record_dates ON fb_ad_set_metrics_record (dates);

-- FB广告组资源表
CREATE TABLE IF NOT EXISTS fb_ad_set_resource
(
    id                         BIGSERIAL   NOT NULL,
    ad_set_id                  VARCHAR(32) NOT NULL,
    campaign_id                VARCHAR(32) NOT NULL,
    ad_set_name                TEXT        NOT NULL,
    status                     VARCHAR(16) NOT NULL DEFAULT 'ENABLED',
    effective_status           VARCHAR(32) NOT NULL,
    advertising_account_id     VARCHAR(32) NOT NULL,
    objective                  VARCHAR(64) NOT NULL,
    start_time                 TIMESTAMP,
    end_time                   TIMESTAMP,
    daily_budget               NUMERIC(20, 8),
    lifetime_budget            NUMERIC(20, 8),
    bid_strategy               VARCHAR(64),
    spend                      NUMERIC(20, 8),
    impressions                INTEGER,
    reach                      INTEGER,
    clicks                     INTEGER,
    ctr                        NUMERIC(20, 8),
    cpc                        NUMERIC(20, 8),
    cpm                        NUMERIC(20, 8),
    inline_link_clicks         INTEGER,
    inline_link_click_ctr      NUMERIC(20, 8),
    frequency                  NUMERIC(20, 8),
    cost_per_inline_link_click NUMERIC(20, 8),
    landing_page_view          INTEGER,
    effect                     VARCHAR(32),
    cost_per_effect            NUMERIC(20, 8),
    destination_type           VARCHAR(32),
    region_group_list          TEXT,
    targeting_list             TEXT,
    advertise_content          TEXT,
    budget_advanced            TEXT,
    budget_normal              TEXT,
    placement_properties       TEXT,
    ad_set_created             TIMESTAMP,
    ad_set_updated             TIMESTAMP,
    created_by_id              BIGINT      NOT NULL,
    update_by_id               BIGINT,
    created                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_ad_set_resource IS 'FB广告组资源表';
COMMENT ON COLUMN fb_ad_set_resource.id IS '主键ID';
COMMENT ON COLUMN fb_ad_set_resource.ad_set_id IS '广告组Id';
COMMENT ON COLUMN fb_ad_set_resource.campaign_id IS '广告系列Id';
COMMENT ON COLUMN fb_ad_set_resource.ad_set_name IS '广告组名称';
COMMENT ON COLUMN fb_ad_set_resource.status IS '是否启用枚举 ENABLED, DISABLED';
COMMENT ON COLUMN fb_ad_set_resource.effective_status IS '投放状态 Facebook 枚举 EnumEffectiveStatus';
COMMENT ON COLUMN fb_ad_set_resource.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_ad_set_resource.objective IS '广告目标';
COMMENT ON COLUMN fb_ad_set_resource.start_time IS '排期开始时间';
COMMENT ON COLUMN fb_ad_set_resource.end_time IS '排期结束时间';
COMMENT ON COLUMN fb_ad_set_resource.daily_budget IS '单日预算';
COMMENT ON COLUMN fb_ad_set_resource.lifetime_budget IS '总预算';
COMMENT ON COLUMN fb_ad_set_resource.bid_strategy IS '竞价策略';
COMMENT ON COLUMN fb_ad_set_resource.spend IS '花费金额';
COMMENT ON COLUMN fb_ad_set_resource.impressions IS '展示次数';
COMMENT ON COLUMN fb_ad_set_resource.reach IS '覆盖人数';
COMMENT ON COLUMN fb_ad_set_resource.clicks IS '点击量';
COMMENT ON COLUMN fb_ad_set_resource.ctr IS '点击率';
COMMENT ON COLUMN fb_ad_set_resource.cpc IS '单次链接点击费用(全部)';
COMMENT ON COLUMN fb_ad_set_resource.cpm IS '千次展示费用';
COMMENT ON COLUMN fb_ad_set_resource.inline_link_clicks IS '链接点击量';
COMMENT ON COLUMN fb_ad_set_resource.inline_link_click_ctr IS '链接点击率';
COMMENT ON COLUMN fb_ad_set_resource.frequency IS '频次';
COMMENT ON COLUMN fb_ad_set_resource.cost_per_inline_link_click IS '单次链接点击费用';
COMMENT ON COLUMN fb_ad_set_resource.landing_page_view IS '落地页浏览量';
COMMENT ON COLUMN fb_ad_set_resource.effect IS '成效';
COMMENT ON COLUMN fb_ad_set_resource.cost_per_effect IS '单次成效费用';
COMMENT ON COLUMN fb_ad_set_resource.destination_type IS '转化发生位置';
COMMENT ON COLUMN fb_ad_set_resource.region_group_list IS '地区组详情列表，以json 格式存储';
COMMENT ON COLUMN fb_ad_set_resource.targeting_list IS '定向包详情列表，以json 格式存储';
COMMENT ON COLUMN fb_ad_set_resource.advertise_content IS '投放内容';
COMMENT ON COLUMN fb_ad_set_resource.budget_advanced IS '出价与预算(进阶赋能弄应用广告)';
COMMENT ON COLUMN fb_ad_set_resource.budget_normal IS '出价与预算(应用广告)';
COMMENT ON COLUMN fb_ad_set_resource.placement_properties IS '版位';
COMMENT ON COLUMN fb_ad_set_resource.ad_set_created IS '广告组创建日期';
COMMENT ON COLUMN fb_ad_set_resource.ad_set_updated IS '广告组修改日期';
COMMENT ON COLUMN fb_ad_set_resource.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_ad_set_resource.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_ad_set_resource_c_id ON fb_ad_set_resource (ad_set_id);

-- 业务标签;
CREATE TABLE IF NOT EXISTS fb_biz_object_tags
(
    id            BIGSERIAL   NOT NULL,
    code          VARCHAR(90),
    name          VARCHAR(90) NOT NULL,
    description   VARCHAR(255),
    created_by_id BIGINT,
    updated_by_id BIGINT,
    created       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_biz_object_tags IS '业务标签';
COMMENT ON COLUMN fb_biz_object_tags.id IS '主键';
COMMENT ON COLUMN fb_biz_object_tags.code IS '标签代码';
COMMENT ON COLUMN fb_biz_object_tags.name IS '标签名称';
COMMENT ON COLUMN fb_biz_object_tags.description IS '备注';
COMMENT ON COLUMN fb_biz_object_tags.created_by_id IS '创建人';
COMMENT ON COLUMN fb_biz_object_tags.updated_by_id IS '更新人';
COMMENT ON COLUMN fb_biz_object_tags.created IS '创建时间';
COMMENT ON COLUMN fb_biz_object_tags.updated IS '更新时间';

-- 业务标签关联;
CREATE TABLE IF NOT EXISTS fb_biz_tags_mapping
(
    id            BIGSERIAL   NOT NULL,
    category      VARCHAR(90) NOT NULL,
    tag_id        BIGINT      NOT NULL,
    biz_object_id BIGINT      NOT NULL,
    created_by_id BIGINT,
    updated_by_id BIGINT,
    created       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_biz_tags_mapping IS '业务标签关联';
COMMENT ON COLUMN fb_biz_tags_mapping.id IS '主键id';
COMMENT ON COLUMN fb_biz_tags_mapping.category IS '业务类别';
COMMENT ON COLUMN fb_biz_tags_mapping.tag_id IS '标签id';
COMMENT ON COLUMN fb_biz_tags_mapping.biz_object_id IS '业务对象id';
COMMENT ON COLUMN fb_biz_tags_mapping.created_by_id IS '创建人';
COMMENT ON COLUMN fb_biz_tags_mapping.updated_by_id IS '更新人';
COMMENT ON COLUMN fb_biz_tags_mapping.created IS '创建时间';
COMMENT ON COLUMN fb_biz_tags_mapping.updated IS '更新时间';

CREATE UNIQUE INDEX uni_fb_business_tag_relationship_c_b_t ON fb_biz_tags_mapping (category, biz_object_id, tag_id);

-- FB商务管理平台;
CREATE TABLE IF NOT EXISTS fb_business_management_platform
(
    id                       BIGSERIAL   NOT NULL,
    resource_id              BIGINT      NOT NULL,
    resource_type            VARCHAR(32) NOT NULL,
    business_management_id   VARCHAR(64),
    business_management_name VARCHAR(255),
    business_management_logo TEXT,
    store_source             VARCHAR(90),
    authorizer_id            BIGINT      NOT NULL,
    last_auth_time           TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by_id            BIGINT      NOT NULL,
    update_by_id             BIGINT,
    created                  TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_business_management_platform IS 'FB商务管理平台';
COMMENT ON COLUMN fb_business_management_platform.id IS '主键ID';
COMMENT ON COLUMN fb_business_management_platform.resource_id IS '资源ID';
COMMENT ON COLUMN fb_business_management_platform.resource_type IS '资源类型枚举 PERSONAL_ACCOUNT, ADVERTISING_ACCOUNT, PUBLIC_PAGE';
COMMENT ON COLUMN fb_business_management_platform.business_management_id IS '商务管理平台ID';
COMMENT ON COLUMN fb_business_management_platform.business_management_name IS '商务管理平台名称';
COMMENT ON COLUMN fb_business_management_platform.business_management_logo IS '商务管理平台 Logo URL';
COMMENT ON COLUMN fb_business_management_platform.store_source IS 'Logo URL存储方式';
COMMENT ON COLUMN fb_business_management_platform.authorizer_id IS '授权人ID';
COMMENT ON COLUMN fb_business_management_platform.last_auth_time IS '最近授权时间';
COMMENT ON COLUMN fb_business_management_platform.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_business_management_platform.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_business_management_platform_r_r_b_id ON fb_business_management_platform (resource_id, resource_type, business_management_id);

-- FB自定义受众表（包含类似受众）;
CREATE TABLE IF NOT EXISTS fb_custom_audience
(
    id                          BIGSERIAL    NOT NULL,
    custom_audience_id          VARCHAR(32)  NOT NULL,
    advertising_account_id      VARCHAR(32)  NOT NULL,
    custom_audience_name        VARCHAR(255) NOT NULL,
    custom_audience_description VARCHAR(255) NOT NULL,
    subtype                     VARCHAR(50)  NOT NULL,
    customer_file_source        VARCHAR(255) NOT NULL,
    lookalike_spec              TEXT,
    user_id                     BIGINT       NOT NULL,
    time_updated                BIGINT       NOT NULL,
    created                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_custom_audience IS 'FB自定义受众表（包含类似受众）';
COMMENT ON COLUMN fb_custom_audience.id IS '主键ID';
COMMENT ON COLUMN fb_custom_audience.custom_audience_id IS '自定义受众ID';
COMMENT ON COLUMN fb_custom_audience.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_custom_audience.custom_audience_name IS '自定义受众名称';
COMMENT ON COLUMN fb_custom_audience.custom_audience_description IS '自定义受众描述';
COMMENT ON COLUMN fb_custom_audience.subtype IS '自定义受众类型';
COMMENT ON COLUMN fb_custom_audience.customer_file_source IS '说明自定义受众中客户信息的最初收集方式';
COMMENT ON COLUMN fb_custom_audience.lookalike_spec IS '类似受众相关联信息，自定义受众是没有值的';
COMMENT ON COLUMN fb_custom_audience.user_id IS '用户id';
COMMENT ON COLUMN fb_custom_audience.time_updated IS 'fb数据更新时间戳';
COMMENT ON COLUMN fb_custom_audience.created IS '数据创建时间';
COMMENT ON COLUMN fb_custom_audience.updated IS '数据更新时间';

-- FB数据权限表;
CREATE TABLE IF NOT EXISTS fb_data_scope
(
    id            BIGSERIAL   NOT NULL,
    data_id       BIGINT      NOT NULL,
    permission_id BIGINT      NOT NULL,
    source_table  VARCHAR(32) NOT NULL,
    created_by_id BIGINT      NOT NULL,
    created       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_data_scope IS 'FB数据权限表';
COMMENT ON COLUMN fb_data_scope.id IS '主键ID';
COMMENT ON COLUMN fb_data_scope.data_id IS '数据ID';
COMMENT ON COLUMN fb_data_scope.permission_id IS '角色权限id';
COMMENT ON COLUMN fb_data_scope.source_table IS '数据来源枚举';
COMMENT ON COLUMN fb_data_scope.created_by_id IS '创建者ID';


CREATE UNIQUE INDEX uni_fb_data_scope_d_p_s ON fb_data_scope (data_id, permission_id, source_table);

-- 定向包管理;
CREATE TABLE IF NOT EXISTS fb_directional_package_management
(
    id                           BIGSERIAL   NOT NULL,
    name                         VARCHAR(64) NOT NULL,
    targeting_package_properties TEXT        NOT NULL,
    owner_user_id                BIGINT      NOT NULL,
    delete_flag                  BIGINT      NOT NULL,
    create_by_id                 BIGINT      NOT NULL,
    create_by_nick               VARCHAR(64) NOT NULL,
    update_by_id                 BIGINT,
    update_by_nick               VARCHAR(64),
    created                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_directional_package_management IS '定向包管理';
COMMENT ON COLUMN fb_directional_package_management.id IS 'id';
COMMENT ON COLUMN fb_directional_package_management.name IS '定向包名称，用户维度下唯一';
COMMENT ON COLUMN fb_directional_package_management.targeting_package_properties IS '整个定向包的完整json 格式数据';
COMMENT ON COLUMN fb_directional_package_management.owner_user_id IS '所属用户id';
COMMENT ON COLUMN fb_directional_package_management.delete_flag IS '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)';
COMMENT ON COLUMN fb_directional_package_management.create_by_id IS '创建者ID';
COMMENT ON COLUMN fb_directional_package_management.create_by_nick IS '创建者昵称';
COMMENT ON COLUMN fb_directional_package_management.update_by_id IS '修改者ID';
COMMENT ON COLUMN fb_directional_package_management.update_by_nick IS '修改者昵称';


CREATE UNIQUE INDEX uni_fb_directional_package_management_key_name ON fb_directional_package_management (owner_user_id, name, delete_flag);

-- 广告素材表;
CREATE TABLE IF NOT EXISTS fb_material_detail_resource
(
    id                     BIGSERIAL   NOT NULL,
    advertising_account_id VARCHAR(32) NOT NULL,
    material_id            VARCHAR(255),
    ad_material_id         VARCHAR(32),
    name                   TEXT,
    type                   VARCHAR(32) NOT NULL,
    hash                   VARCHAR(255),
    permalink_url          TEXT,
    cover_image            TEXT,
    height                 INTEGER,
    width                  INTEGER,
    original_height        INTEGER,
    original_width         INTEGER,
    material_status        VARCHAR(32),
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_material_detail_resource IS '广告素材表';
COMMENT ON COLUMN fb_material_detail_resource.id IS '主键ID';
COMMENT ON COLUMN fb_material_detail_resource.advertising_account_id IS '广告账户ID';
COMMENT ON COLUMN fb_material_detail_resource.material_id IS 'fb的素材id';
COMMENT ON COLUMN fb_material_detail_resource.ad_material_id IS 'ad_material表的ad_material_id';
COMMENT ON COLUMN fb_material_detail_resource.name IS '素材名';
COMMENT ON COLUMN fb_material_detail_resource.type IS '素材类型';
COMMENT ON COLUMN fb_material_detail_resource.hash IS 'fb的素材hash';
COMMENT ON COLUMN fb_material_detail_resource.permalink_url IS 'url';
COMMENT ON COLUMN fb_material_detail_resource.cover_image IS '封面图片';
COMMENT ON COLUMN fb_material_detail_resource.height IS '高';
COMMENT ON COLUMN fb_material_detail_resource.width IS '宽';
COMMENT ON COLUMN fb_material_detail_resource.original_height IS '最初上传的图像的高度';
COMMENT ON COLUMN fb_material_detail_resource.original_width IS '最初上传的图像的宽度';
COMMENT ON COLUMN fb_material_detail_resource.material_status IS '图像状态';


CREATE UNIQUE INDEX uni_fb_material_detail_resource_c_id ON fb_material_detail_resource (advertising_account_id, hash);

-- FB个人账号管理表
CREATE TABLE fb_personal_account_plus
(
    id                      BIGSERIAL    NOT NULL,
    personal_account_id     VARCHAR(32)  NOT NULL,
    personal_account_name   VARCHAR(255) NOT NULL,
    personal_account_avatar TEXT,
    store_source            VARCHAR(90),
    status                  VARCHAR(16)  NOT NULL DEFAULT 'ENABLED',
    visible_range           VARCHAR(16)  NOT NULL DEFAULT 'ONESELF',
    access_token            TEXT,
    token_status            VARCHAR(16)  NOT NULL DEFAULT 'VALID',
    granted_scopes          TEXT,
    authorizer_id           BIGINT       NOT NULL,
    last_auth_time          TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    token_expiry_time       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by_id           BIGINT       NOT NULL,
    update_by_id            BIGINT,
    created                 TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_personal_account_plus IS 'FB个人账号管理表';
COMMENT ON COLUMN fb_personal_account_plus.id IS '主键ID';
COMMENT ON COLUMN fb_personal_account_plus.personal_account_id IS '个人账户ID';
COMMENT ON COLUMN fb_personal_account_plus.personal_account_name IS '个人账户名称';
COMMENT ON COLUMN fb_personal_account_plus.personal_account_avatar IS '个人账户头像URL';
COMMENT ON COLUMN fb_personal_account_plus.store_source IS '头像URL存储标记';
COMMENT ON COLUMN fb_personal_account_plus.status IS '是否启用枚举 ENABLED, DISABLED';
COMMENT ON COLUMN fb_personal_account_plus.visible_range IS '可见范围枚举 ONESELF, TEAM';
COMMENT ON COLUMN fb_personal_account_plus.access_token IS 'token';
COMMENT ON COLUMN fb_personal_account_plus.token_status IS 'Token状态枚举 VALID, EXPIRED';
COMMENT ON COLUMN fb_personal_account_plus.granted_scopes IS '授予的权限';
COMMENT ON COLUMN fb_personal_account_plus.authorizer_id IS '授权人ID';
COMMENT ON COLUMN fb_personal_account_plus.last_auth_time IS '最近授权时间';
COMMENT ON COLUMN fb_personal_account_plus.token_expiry_time IS '授权过期时间';
COMMENT ON COLUMN fb_personal_account_plus.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_personal_account_plus.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_personal_account_plus_p_a_id ON fb_personal_account_plus (personal_account_id, authorizer_id);
CREATE INDEX idx_fb_personal_account_plus_status ON fb_personal_account_plus (status);

-- FB个号和广告账号关联表;
CREATE TABLE fb_personal_advertising_mapping
(
    id                 BIGSERIAL NOT NULL,
    personal_data_id   BIGINT    NOT NULL,
    ad_account_data_id BIGINT    NOT NULL,
    created_by_id      BIGINT    NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_personal_advertising_mapping IS 'FB个号和广告账号关联表';
COMMENT ON COLUMN fb_personal_advertising_mapping.id IS '主键ID';
COMMENT ON COLUMN fb_personal_advertising_mapping.personal_data_id IS '个号数据库ID';
COMMENT ON COLUMN fb_personal_advertising_mapping.ad_account_data_id IS '广告账数据库ID';
COMMENT ON COLUMN fb_personal_advertising_mapping.created_by_id IS '创建者ID';


CREATE UNIQUE INDEX uni_fb_personal_advertising_mapping_p_a_id ON fb_personal_advertising_mapping (personal_data_id, ad_account_data_id);

-- FB个号和主页关联表;
CREATE TABLE fb_personal_page_mapping
(
    id               BIGSERIAL NOT NULL,
    personal_data_id BIGINT    NOT NULL,
    page_data_id     BIGINT    NOT NULL,
    created_by_id    BIGINT    NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_personal_page_mapping IS 'FB个号和主页关联表';
COMMENT ON COLUMN fb_personal_page_mapping.id IS '主键ID';
COMMENT ON COLUMN fb_personal_page_mapping.personal_data_id IS '个号数据库ID';
COMMENT ON COLUMN fb_personal_page_mapping.page_data_id IS '主页数据库ID';
COMMENT ON COLUMN fb_personal_page_mapping.created_by_id IS '创建者ID';


CREATE UNIQUE INDEX uni_fb_personal_page_mapping_p_p_id ON fb_personal_page_mapping (personal_data_id, page_data_id);

-- FB推广应用;
CREATE TABLE fb_promotion_app
(
    id                BIGSERIAL    NOT NULL,
    app_id            VARCHAR(32)  NOT NULL,
    app_name          VARCHAR(256) NOT NULL,
    app_avatar        TEXT,
    app_store_details TEXT,
    last_auth_time    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    package_data_id   BIGINT,
    created_by_id     BIGINT       NOT NULL,
    update_by_id      BIGINT,
    created           TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_promotion_app IS 'FB推广应用';
COMMENT ON COLUMN fb_promotion_app.id IS '主键ID';
COMMENT ON COLUMN fb_promotion_app.app_id IS '推广应用Id';
COMMENT ON COLUMN fb_promotion_app.app_name IS '推广应用名称';
COMMENT ON COLUMN fb_promotion_app.app_avatar IS '应用头像URL';
COMMENT ON COLUMN fb_promotion_app.app_store_details IS '推广应用商店详情';
COMMENT ON COLUMN fb_promotion_app.last_auth_time IS '最近授权时间';
COMMENT ON COLUMN fb_promotion_app.package_data_id IS '投放包数据id';
COMMENT ON COLUMN fb_promotion_app.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_promotion_app.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_promotion_app_app_id ON fb_promotion_app (app_id);

-- FB公共主页管理表;
CREATE TABLE fb_public_page
(
    id                BIGSERIAL    NOT NULL,
    page_id           VARCHAR(32)  NOT NULL,
    page_name         VARCHAR(255) NOT NULL,
    page_type         VARCHAR(64)  NOT NULL,
    page_introduction VARCHAR(512),
    page_avatar       TEXT,
    top_count         BIGINT,
    followers_count   BIGINT,
    last_auth_time    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by_id     BIGINT       NOT NULL,
    update_by_id      BIGINT,
    created           TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_public_page IS 'FB公共主页管理表';
COMMENT ON COLUMN fb_public_page.id IS '主键ID';
COMMENT ON COLUMN fb_public_page.page_id IS 'Facebook主页ID';
COMMENT ON COLUMN fb_public_page.page_name IS '主页名称';
COMMENT ON COLUMN fb_public_page.page_type IS '主页类型';
COMMENT ON COLUMN fb_public_page.page_introduction IS '主页简介';
COMMENT ON COLUMN fb_public_page.page_avatar IS '主页头像URL';
COMMENT ON COLUMN fb_public_page.top_count IS '点赞数';
COMMENT ON COLUMN fb_public_page.followers_count IS '粉丝数';
COMMENT ON COLUMN fb_public_page.last_auth_time IS '最近授权时间';
COMMENT ON COLUMN fb_public_page.created_by_id IS '创建者ID';
COMMENT ON COLUMN fb_public_page.update_by_id IS '修改者ID';


CREATE UNIQUE INDEX uni_fb_public_page_p_a_id ON fb_public_page (page_id);

-- FB地区组管理表;
CREATE TABLE fb_region_group_management
(
    id                       BIGSERIAL   NOT NULL,
    region_group_name        VARCHAR(64) NOT NULL,
    targeting_properties     TEXT,
    excluded_properties      TEXT,
    beneficiary              VARCHAR(64),
    payor                    VARCHAR(64),
    beneficiary_payor_status VARCHAR(32),
    owner_user_id            BIGINT      NOT NULL,
    delete_flag              BIGINT      NOT NULL,
    create_by_id             BIGINT      NOT NULL,
    create_by_nick           VARCHAR(64) NOT NULL,
    update_by_id             BIGINT,
    update_by_nick           VARCHAR(64),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_region_group_management IS 'FB地区组管理表';
COMMENT ON COLUMN fb_region_group_management.id IS 'id';
COMMENT ON COLUMN fb_region_group_management.region_group_name IS '地区组组名';
COMMENT ON COLUMN fb_region_group_management.targeting_properties IS '定向json';
COMMENT ON COLUMN fb_region_group_management.excluded_properties IS '排除json';
COMMENT ON COLUMN fb_region_group_management.beneficiary IS '受益方';
COMMENT ON COLUMN fb_region_group_management.payor IS '付费方';
COMMENT ON COLUMN fb_region_group_management.beneficiary_payor_status IS '付费方与受益方是否相同';
COMMENT ON COLUMN fb_region_group_management.owner_user_id IS '用户属主id';
COMMENT ON COLUMN fb_region_group_management.delete_flag IS '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)';
COMMENT ON COLUMN fb_region_group_management.create_by_id IS '创建者ID';
COMMENT ON COLUMN fb_region_group_management.create_by_nick IS '创建者昵称';
COMMENT ON COLUMN fb_region_group_management.update_by_id IS '修改者ID';
COMMENT ON COLUMN fb_region_group_management.update_by_nick IS '修改者昵称';


CREATE UNIQUE INDEX uni_fb_region_group_management_key_name ON fb_region_group_management (owner_user_id, region_group_name, delete_flag);

-- 看板指标列表;
CREATE TABLE kanban_column_config
(
    id            BIGSERIAL    NOT NULL,
    column_name   VARCHAR(100) NOT NULL,
    column_value  VARCHAR(100) NOT NULL,
    column_types  VARCHAR(255) NOT NULL,
    column_class  VARCHAR(255) NOT NULL,
    sort          INTEGER   DEFAULT 0,
    created_by_id BIGINT       NOT NULL,
    created       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE kanban_column_config IS '看板指标列表';
COMMENT ON COLUMN kanban_column_config.id IS '主键ID';
COMMENT ON COLUMN kanban_column_config.column_name IS '列名';
COMMENT ON COLUMN kanban_column_config.column_value IS '列值';
COMMENT ON COLUMN kanban_column_config.column_types IS '列类型(DIMENSION 维度，INDICATORS 指标)';
COMMENT ON COLUMN kanban_column_config.column_class IS '列类(DELIVERY投放，MATERIAL素材)，可以有多个如：["DELIVERY","MATERIAL"]';
COMMENT ON COLUMN kanban_column_config.sort IS '排序';
COMMENT ON COLUMN kanban_column_config.created_by_id IS '创建人';
COMMENT ON COLUMN kanban_column_config.created IS '创建时间';
COMMENT ON COLUMN kanban_column_config.updated IS '更新时间';


CREATE UNIQUE INDEX idx_kanban_column_config_value_id ON kanban_column_config (column_value);

-- 看板指标常用列;
CREATE TABLE kanban_commonly_column
(
    id                 BIGSERIAL    NOT NULL,
    custom_column_name VARCHAR(20)  NOT NULL,
    selected_column    TEXT         NOT NULL,
    column_class       VARCHAR(255) NOT NULL,
    is_default         BOOLEAN      NOT NULL DEFAULT FALSE,
    created_by_id      BIGINT       NOT NULL,
    updated_by_id      BIGINT,
    created            TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated            TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE kanban_commonly_column IS '看板指标常用列';
COMMENT ON COLUMN kanban_commonly_column.id IS '主键ID';
COMMENT ON COLUMN kanban_commonly_column.custom_column_name IS '自定义列名';
COMMENT ON COLUMN kanban_commonly_column.selected_column IS '已选列，json字符串';
COMMENT ON COLUMN kanban_commonly_column.column_class IS '列类型(DELIVERY投放，MATERIAL素材)';
COMMENT ON COLUMN kanban_commonly_column.is_default IS '是否默认(0:否,1:是)';
COMMENT ON COLUMN kanban_commonly_column.created_by_id IS '创建人';
COMMENT ON COLUMN kanban_commonly_column.updated_by_id IS '修改人';
COMMENT ON COLUMN kanban_commonly_column.created IS '创建时间';
COMMENT ON COLUMN kanban_commonly_column.updated IS '更新时间';


CREATE UNIQUE INDEX uni_kanban_commonly_column_column_creator ON kanban_commonly_column (column_class, created_by_id, custom_column_name);

-- 个性化配置;
CREATE TABLE sys_personalizes_config
(
    id                             BIGSERIAL   NOT NULL,
    cover                          VARCHAR(255),
    system_name                    VARCHAR(64) NOT NULL DEFAULT 'AD管理系统',
    logo                           VARCHAR(255),
    title                          VARCHAR(50),
    title_font                     VARCHAR(50),
    title_size                     BIGINT,
    title_color                    VARCHAR(10),
    description                    VARCHAR(100),
    description_font               VARCHAR(50),
    description_size               BIGINT,
    description_color              VARCHAR(10),
    privacy_policy_name            VARCHAR(25)          DEFAULT '隐私政策',
    help_info                      VARCHAR(100),
    contact_info                   VARCHAR(100),
    logo_module_top_margin         BIGINT      NOT NULL DEFAULT 0,
    logo_module_left_margin        BIGINT      NOT NULL DEFAULT 0,
    login_module_top_margin        BIGINT      NOT NULL DEFAULT 0,
    login_module_left_margin       BIGINT      NOT NULL DEFAULT 0,
    promo_module_top_margin        BIGINT      NOT NULL DEFAULT 0,
    promo_module_left_margin       BIGINT      NOT NULL DEFAULT 0,
    system_code_module_font        VARCHAR(50),
    system_code_module_size        BIGINT,
    system_code_module_color       VARCHAR(10),
    system_code_module_top_margin  BIGINT      NOT NULL DEFAULT 0,
    system_code_module_left_margin BIGINT      NOT NULL DEFAULT 0,
    other_module_bottom_margin     BIGINT      NOT NULL DEFAULT 0,
    other_module_right_margin      BIGINT      NOT NULL DEFAULT 0,
    other_module_color             VARCHAR(10),
    show_cover                     BOOLEAN     NOT NULL DEFAULT FALSE,
    show_logo                      BOOLEAN     NOT NULL DEFAULT FALSE,
    show_promo                     BOOLEAN     NOT NULL DEFAULT FALSE,
    show_privacy_policy            BOOLEAN     NOT NULL DEFAULT FALSE,
    show_system_code               BOOLEAN     NOT NULL DEFAULT FALSE,
    show_other                     BOOLEAN     NOT NULL DEFAULT FALSE,
    template_cover                 VARCHAR(255),
    enable                         BOOLEAN     NOT NULL DEFAULT FALSE,
    created_by_id                  BIGINT      NOT NULL,
    updated_by_id                  BIGINT      NOT NULL,
    created                        TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                        TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE sys_personalizes_config IS '个性化配置';
COMMENT ON COLUMN sys_personalizes_config.id IS '主键ID';
COMMENT ON COLUMN sys_personalizes_config.cover IS '封面（非文件路径）';
COMMENT ON COLUMN sys_personalizes_config.system_name IS '系统名称';
COMMENT ON COLUMN sys_personalizes_config.logo IS '系统logo（非文件路径）';
COMMENT ON COLUMN sys_personalizes_config.title IS '标题';
COMMENT ON COLUMN sys_personalizes_config.title_font IS '标题字体';
COMMENT ON COLUMN sys_personalizes_config.title_size IS '标题大小';
COMMENT ON COLUMN sys_personalizes_config.title_color IS '标题颜色';
COMMENT ON COLUMN sys_personalizes_config.description IS '描述';
COMMENT ON COLUMN sys_personalizes_config.description_font IS '描述字体';
COMMENT ON COLUMN sys_personalizes_config.description_size IS '描述大小';
COMMENT ON COLUMN sys_personalizes_config.description_color IS '描述颜色';
COMMENT ON COLUMN sys_personalizes_config.privacy_policy_name IS '隐私政策';
COMMENT ON COLUMN sys_personalizes_config.help_info IS '帮助信息';
COMMENT ON COLUMN sys_personalizes_config.contact_info IS '联系方式';
COMMENT ON COLUMN sys_personalizes_config.logo_module_top_margin IS '系统logo模块上边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.logo_module_left_margin IS '系统logo模块左边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.login_module_top_margin IS '登录模块上边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.login_module_left_margin IS '登录模块左边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.promo_module_top_margin IS '宣传描述模块上边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.promo_module_left_margin IS '宣传描述模块左边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.system_code_module_font IS '系统代号字体';
COMMENT ON COLUMN sys_personalizes_config.system_code_module_size IS '系统代号大小';
COMMENT ON COLUMN sys_personalizes_config.system_code_module_color IS '系统代号颜色';
COMMENT ON COLUMN sys_personalizes_config.system_code_module_top_margin IS '系统代号模块上边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.system_code_module_left_margin IS '系统代号模块左边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.other_module_bottom_margin IS '其他信息模块底边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.other_module_right_margin IS '其他信息模块右边距 百分比';
COMMENT ON COLUMN sys_personalizes_config.other_module_color IS '其他信息模块颜色';
COMMENT ON COLUMN sys_personalizes_config.show_cover IS '是否展示封面模块';
COMMENT ON COLUMN sys_personalizes_config.show_logo IS '是否展示logo模块';
COMMENT ON COLUMN sys_personalizes_config.show_promo IS '是否展示宣传描述模块';
COMMENT ON COLUMN sys_personalizes_config.show_privacy_policy IS '是否展示隐私政策模块';
COMMENT ON COLUMN sys_personalizes_config.show_system_code IS '是否展示系统代号模块';
COMMENT ON COLUMN sys_personalizes_config.show_other IS '是否展示其他模块';
COMMENT ON COLUMN sys_personalizes_config.template_cover IS '整个模板封面（非文件路径）';
COMMENT ON COLUMN sys_personalizes_config.enable IS '是否启用';
COMMENT ON COLUMN sys_personalizes_config.created_by_id IS '创建人';
COMMENT ON COLUMN sys_personalizes_config.updated_by_id IS '修改人';
COMMENT ON COLUMN sys_personalizes_config.created IS '数据创建时间';
COMMENT ON COLUMN sys_personalizes_config.updated IS '数据更新时间';

-- FB账号资源同步任务明细表;
CREATE TABLE task_account_detail_record
(
    id                  BIGSERIAL   NOT NULL,
    batch_uuid          VARCHAR(36) NOT NULL,
    refer_task_id       BIGINT,
    personal_data_id    BIGINT      NOT NULL,
    personal_account_id VARCHAR(36) NOT NULL,
    trigger_type        VARCHAR(36) NOT NULL,
    trigger_priority    INT,
    status              VARCHAR(36) NOT NULL,
    ordinal             INT         NOT NULL DEFAULT 0,
    result              VARCHAR(36),
    trigger_time        TIMESTAMP,
    start_time          TIMESTAMP,
    finished_time       TIMESTAMP,
    result_detail       TEXT,
    created             TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated             TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    dates               INT                  DEFAULT 0,
    ad_accounts         INTEGER              DEFAULT 0,
    metadata            TEXT,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_account_detail_record IS 'FB账号资源同步任务明细表';
COMMENT ON COLUMN task_account_detail_record.id IS '主键ID';
COMMENT ON COLUMN task_account_detail_record.batch_uuid IS '任务批次uuid';
COMMENT ON COLUMN task_account_detail_record.refer_task_id IS '任务关联任务id';
COMMENT ON COLUMN task_account_detail_record.personal_data_id IS '个号数据id';
COMMENT ON COLUMN task_account_detail_record.personal_account_id IS 'Fb个号id';
COMMENT ON COLUMN task_account_detail_record.trigger_type IS '触发类型：手动、授权、自动';
COMMENT ON COLUMN task_account_detail_record.trigger_priority IS '触发优先级';
COMMENT ON COLUMN task_account_detail_record.status IS '状态：排队中、进行中、已完成等..';
COMMENT ON COLUMN task_account_detail_record.ordinal IS '状态排序';
COMMENT ON COLUMN task_account_detail_record.result IS '结果：成功、失败';
COMMENT ON COLUMN task_account_detail_record.result_detail IS '详细结果，成功、失败详情';
COMMENT ON COLUMN task_account_detail_record.start_time IS '任务开始时间';
COMMENT ON COLUMN task_account_detail_record.finished_time IS '任务结束时间';
COMMENT ON COLUMN task_account_detail_record.dates IS '时间戳';
COMMENT ON COLUMN task_account_detail_record.ad_accounts IS '已同步的广告账号数';
COMMENT ON COLUMN task_account_detail_record.metadata IS '任务元数据';

CREATE INDEX idx_task_account_detail_record_personal_account_id ON task_account_detail_record (personal_account_id);
CREATE INDEX idx_task_account_detail_record_dates ON task_account_detail_record (dates);

-- FB授权认证记录表;
CREATE TABLE task_account_record
(
    id            BIGSERIAL   NOT NULL,
    sign_uuid     VARCHAR(64) NOT NULL,
    batch_uuid    VARCHAR(32),
    user_id       BIGINT      NOT NULL,
    trigger_type  VARCHAR(36) NOT NULL,
    impact_scope  VARCHAR(32) NOT NULL DEFAULT 'PERSONAL',
    status        VARCHAR(32) NOT NULL,
    result        VARCHAR(32),
    metadata      TEXT,
    start_time    TIMESTAMP,
    finished_time TIMESTAMP,
    created_by_id BIGINT      NOT NULL,
    update_by_id  BIGINT,
    created       TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    dates         INT                  DEFAULT 0,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_account_record IS 'FB授权认证记录表';
COMMENT ON COLUMN task_account_record.id IS '主键ID';
COMMENT ON COLUMN task_account_record.sign_uuid IS '标志uuid';
COMMENT ON COLUMN task_account_record.batch_uuid IS '任务批次uuid';
COMMENT ON COLUMN task_account_record.user_id IS '用户ID';
COMMENT ON COLUMN task_account_record.trigger_type IS '类型: 授权(授权或者新增授权), 手动(单条或者批量), 半自动批量(页面间隔1小时触发和手动点击刷新), 全自动(每天零点触发)';
COMMENT ON COLUMN task_account_record.impact_scope IS '影响范围: 全局 GLOBAL 或者个人 PERSONAL';
COMMENT ON COLUMN task_account_record.status IS '状态：未开始、进行中、完成等..';
COMMENT ON COLUMN task_account_record.result IS '结果：成功、失败';
COMMENT ON COLUMN task_account_record.metadata IS '元数据';
COMMENT ON COLUMN task_account_record.start_time IS '任务开始时间';
COMMENT ON COLUMN task_account_record.finished_time IS '任务结束时间';
COMMENT ON COLUMN task_account_record.created_by_id IS '创建者ID';
COMMENT ON COLUMN task_account_record.update_by_id IS '修改者ID';
COMMENT ON COLUMN task_account_record.dates IS '时间戳';


CREATE UNIQUE INDEX uni_task_account_record_s_uuid ON task_account_record (sign_uuid);
CREATE INDEX idx_task_account_record_dates ON task_account_record (dates);

-- 广告任务中心，明细
CREATE TABLE task_ad_detail
(
    id                     BIGSERIAL     NOT NULL,
    uuid                   VARCHAR(64)   NOT NULL,
    parent_uuid            VARCHAR(64),
    task_uuid              VARCHAR(64)   NOT NULL,
    person_account_data_id BIGINT,
    person_id              VARCHAR(64),
    account_id             VARCHAR(64)   NOT NULL,
    page_id                VARCHAR(2000) NOT NULL,
    kinds                  VARCHAR(32)   NOT NULL,
    source                 VARCHAR(32)   NOT NULL,
    parent_campaign_id     VARCHAR(128),
    parent_ad_set_id       VARCHAR(128),
    instance_id            VARCHAR(128),
    instance_name          VARCHAR(256)  NOT NULL,
    instance_properties    TEXT,
    status                 VARCHAR(32),
    result                 VARCHAR(32),
    result_detail          TEXT,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_ad_detail IS '广告任务中心，明细';
COMMENT ON COLUMN task_ad_detail.uuid IS 'uuid';
COMMENT ON COLUMN task_ad_detail.parent_uuid IS '父ID，这里主要是因为广告组的创建必须要有广告系列ID，广告的创建必须要有广告组。';
COMMENT ON COLUMN task_ad_detail.task_uuid IS '对应广告任务中心的主键ID';
COMMENT ON COLUMN task_ad_detail.account_id IS '广告账号ID';
COMMENT ON COLUMN task_ad_detail.page_id IS '主页ID';
COMMENT ON COLUMN task_ad_detail.kinds IS '分类：广告系列、广告组、广告';
COMMENT ON COLUMN task_ad_detail.source IS '平台：FB、GG 等';
COMMENT ON COLUMN task_ad_detail.parent_campaign_id IS '所属广告系列ID，当kinds 为广告组和广告时有效';
COMMENT ON COLUMN task_ad_detail.parent_ad_set_id IS '所属广告组ID，当kinds 为广告时有效';
COMMENT ON COLUMN task_ad_detail.instance_id IS '调用平台返回的ID(广告系列ID、广告组ID、广告ID)';
COMMENT ON COLUMN task_ad_detail.instance_name IS '广告系列名|广告组名|广告名';
COMMENT ON COLUMN task_ad_detail.instance_properties IS '实例属性';
COMMENT ON COLUMN task_ad_detail.status IS '状态：未开始、进行中、已完成';
COMMENT ON COLUMN task_ad_detail.result IS '结果：成功、失败';
COMMENT ON COLUMN task_ad_detail.result_detail IS '详细结果，成功、失败详情';


CREATE UNIQUE INDEX uni_task_ad_detail_uuid ON task_ad_detail (uuid);
CREATE INDEX idx_task_ad_detail_task ON task_ad_detail (task_uuid);

-- 广告任务明细扩展：广告素材;
CREATE TABLE task_ad_detail_external_asset
(
    id                     BIGSERIAL     NOT NULL,
    uuid                   VARCHAR(64)   NOT NULL,
    owner_task_uuid        VARCHAR(64)   NOT NULL,
    person_account_data_id BIGINT,
    person_id              VARCHAR(64),
    account_id             VARCHAR(64)   NOT NULL,
    asset_id               BIGINT,
    type                   VARCHAR(32)   NOT NULL,
    name                   VARCHAR(256)  NOT NULL,
    asset_url              VARCHAR(1000) NOT NULL,
    cover_url              VARCHAR(1000),
    image_hash             VARCHAR(64),
    image_url              VARCHAR(4000),
    video_id               VARCHAR(64),
    result                 VARCHAR(32),
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    video_status           VARCHAR(128),
    result_detail          TEXT,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_ad_detail_external_asset IS '广告任务明细扩展：广告素材';
COMMENT ON COLUMN task_ad_detail_external_asset.uuid IS 'uuid';
COMMENT ON COLUMN task_ad_detail_external_asset.owner_task_uuid IS '所属任务主键ID';
COMMENT ON COLUMN task_ad_detail_external_asset.account_id IS '广告账户ID';
COMMENT ON COLUMN task_ad_detail_external_asset.asset_id IS '对应 fb_asset 表中的主键ID，当前只有 FACEBOOK';
COMMENT ON COLUMN task_ad_detail_external_asset.type IS '素材类型：图片、视频';
COMMENT ON COLUMN task_ad_detail_external_asset.name IS '素材文件名';
COMMENT ON COLUMN task_ad_detail_external_asset.asset_url IS '素材存储路径，绝对路径，非http 的url。';
COMMENT ON COLUMN task_ad_detail_external_asset.cover_url IS '视频封面图片存储路径，绝对路径，非http 的url。';
COMMENT ON COLUMN task_ad_detail_external_asset.image_hash IS 'facebook 上传成功之后的图片hash（如果是视频，则为封面图片）。';
COMMENT ON COLUMN task_ad_detail_external_asset.image_url IS 'facebook 上传成功之后的图片url（如果是视频，则为封面图片）';
COMMENT ON COLUMN task_ad_detail_external_asset.video_id IS 'facebook 上传成功之后的视频id';
COMMENT ON COLUMN task_ad_detail_external_asset.result IS '任务结果：成功、失败';
COMMENT ON COLUMN task_ad_detail_external_asset.video_status IS '视频上传结果状态';
COMMENT ON COLUMN task_ad_detail_external_asset.result_detail IS '详细结果，成功、失败详情';


CREATE UNIQUE INDEX uni_task_ad_detail_external_asset_uuid ON task_ad_detail_external_asset (uuid);
CREATE INDEX idx_task_ad_detail_external_asset_uuid ON task_ad_detail_external_asset (owner_task_uuid, account_id);

-- 广告任务明细扩展：广告创意;
CREATE TABLE task_ad_detail_external_creative
(
    id                     BIGSERIAL    NOT NULL,
    uuid                   VARCHAR(64)  NOT NULL,
    owner_task_uuid        VARCHAR(64)  NOT NULL,
    person_account_data_id BIGINT,
    owner_task_detail_uuid VARCHAR(64)  NOT NULL,
    person_id              VARCHAR(64),
    account_id             VARCHAR(64)  NOT NULL,
    asset_kinds            VARCHAR(32)  NOT NULL,
    name                   VARCHAR(256) NOT NULL,
    result                 VARCHAR(32),
    creative_id            VARCHAR(64),
    asset_task_uuid_list   TEXT         NOT NULL,
    created                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_ad_detail_external_creative IS '广告任务明细扩展：广告创意';
COMMENT ON COLUMN task_ad_detail_external_creative.uuid IS 'uuid';
COMMENT ON COLUMN task_ad_detail_external_creative.owner_task_uuid IS '所属任务主键ID';
COMMENT ON COLUMN task_ad_detail_external_creative.owner_task_detail_uuid IS '所属任务明细主键ID  与广告一一映射，唯一索引';
COMMENT ON COLUMN task_ad_detail_external_creative.account_id IS '广告账户ID';
COMMENT ON COLUMN task_ad_detail_external_creative.asset_kinds IS '广告创意素材格式枚举：灵活、单图片或视频、轮播';
COMMENT ON COLUMN task_ad_detail_external_creative.name IS '创意名';
COMMENT ON COLUMN task_ad_detail_external_creative.result IS '任务结果：成功、失败';
COMMENT ON COLUMN task_ad_detail_external_creative.creative_id IS 'facebook 创建成功返回的创意ID';
COMMENT ON COLUMN task_ad_detail_external_creative.asset_task_uuid_list IS '关联的素材任务主键ID 列表';


CREATE UNIQUE INDEX uni_task_ad_detail_external_creative_o_uuid ON task_ad_detail_external_creative (owner_task_detail_uuid);
CREATE UNIQUE INDEX uni_task_ad_detail_external_creative_uuid ON task_ad_detail_external_creative (uuid);

-- 广告系列任务详情;
CREATE TABLE task_campaign_detail_record
(
    id               BIGSERIAL   NOT NULL,
    batch_uuid       VARCHAR(64) NOT NULL,
    refer_task_id    BIGINT,
    account_id       VARCHAR(32) NOT NULL,
    trigger_type     VARCHAR(36) NOT NULL,
    trigger_priority INT,
    status           VARCHAR(32) NOT NULL,
    ordinal          INT         NOT NULL DEFAULT 0,
    result           VARCHAR(32),
    trigger_time     TIMESTAMP,
    data_begin       INT,
    data_end         INT,
    result_detail    TEXT,
    metadata         TEXT,
    start_time       TIMESTAMP,
    finished_time    TIMESTAMP,
    created          TIMESTAMP            DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated          TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    dates            INT                  DEFAULT 0,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_campaign_detail_record IS '广告系列任务详情';
COMMENT ON COLUMN task_campaign_detail_record.id IS '主键ID';
COMMENT ON COLUMN task_campaign_detail_record.batch_uuid IS '任务批次uuid';
COMMENT ON COLUMN task_campaign_detail_record.refer_task_id IS '关联任务id';
COMMENT ON COLUMN task_campaign_detail_record.account_id IS '广告账号id';
COMMENT ON COLUMN task_campaign_detail_record.trigger_type IS '触发状态';
COMMENT ON COLUMN task_campaign_detail_record.status IS '状态：未开始、进行中、完成等..';
COMMENT ON COLUMN task_campaign_detail_record.ordinal IS '状态排序';
COMMENT ON COLUMN task_campaign_detail_record.result IS '结果：成功、失败';
COMMENT ON COLUMN task_campaign_detail_record.result_detail IS '详细结果，成功、失败详情';
COMMENT ON COLUMN task_campaign_detail_record.start_time IS '任务开始时间';
COMMENT ON COLUMN task_campaign_detail_record.finished_time IS '任务结束时间';
COMMENT ON COLUMN task_campaign_detail_record.dates IS '时间戳';

CREATE INDEX idx_task_campaign_detail_record_account_id ON task_campaign_detail_record (account_id);
CREATE INDEX idx_task_campaign_detail_record_dates ON task_campaign_detail_record (dates);

-- FB广告系列资源同步任务表;
CREATE TABLE task_campaign_record
(
    id            BIGSERIAL   NOT NULL,
    sign_uuid     VARCHAR(64) NOT NULL,
    batch_uuid    VARCHAR(64),
    user_id       BIGINT      NOT NULL,
    trigger_type  VARCHAR(36) NOT NULL,
    impact_scope  VARCHAR(32) NOT NULL DEFAULT 'PERSONAL',
    status        VARCHAR(32) NOT NULL,
    result        VARCHAR(32),
    metadata      TEXT,
    start_time    TIMESTAMP,
    finished_time TIMESTAMP,
    created_by_id BIGINT      NOT NULL,
    update_by_id  BIGINT,
    created       TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    dates         INT                  DEFAULT 0,
    category      VARCHAR(32),
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_campaign_record IS 'FB广告系列资源同步任务表';
COMMENT ON COLUMN task_campaign_record.id IS '主键ID';
COMMENT ON COLUMN task_campaign_record.sign_uuid IS '标志uuid';
COMMENT ON COLUMN task_campaign_record.batch_uuid IS '任务批次uuid';
COMMENT ON COLUMN task_campaign_record.user_id IS '用户ID';
COMMENT ON COLUMN task_campaign_record.trigger_type IS 'RefreshTriggerType 任务类型 MANUAL:手动(单条或者批量), FULL_AUTO:全自动(每天零点触发)';
COMMENT ON COLUMN task_campaign_record.impact_scope IS '影响范围: 全局 GLOBAL 或者个人 PERSONAL';
COMMENT ON COLUMN task_campaign_record.status IS '状态：未开始、进行中、完成等..';
COMMENT ON COLUMN task_campaign_record.result IS '结果：成功、失败';
COMMENT ON COLUMN task_campaign_record.metadata IS '元数据';
COMMENT ON COLUMN task_campaign_record.start_time IS '任务开始时间';
COMMENT ON COLUMN task_campaign_record.finished_time IS '任务结束时间';
COMMENT ON COLUMN task_campaign_record.created_by_id IS '创建者ID';
COMMENT ON COLUMN task_campaign_record.update_by_id IS '修改者ID';
COMMENT ON COLUMN task_campaign_record.category IS '任务记录类别';

-- 广告任务中心;
CREATE TABLE task_management_ad
(
    id                        BIGSERIAL   NOT NULL,
    uuid                      VARCHAR(64) NOT NULL,
    source                    VARCHAR(32) NOT NULL,
    ad_app_category           VARCHAR(50),
    type                      VARCHAR(50) NOT NULL DEFAULT 'CREATE_AD',
    template_preview_id       BIGINT,
    preview_detail_properties TEXT,
    copy_detail_properties    TEXT,
    package_data_id           BIGINT,
    app_id                    VARCHAR(64),
    app_name                  VARCHAR(64),
    status                    VARCHAR(32) NOT NULL,
    result                    VARCHAR(32),
    start_time                TIMESTAMP,
    finished_time             TIMESTAMP,
    create_by_id              BIGINT      NOT NULL,
    create_by_nick            VARCHAR(64) NOT NULL,
    version                   NUMERIC(10, 2)       DEFAULT 1.00,
    created                   TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    updated                   TIMESTAMP            DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_management_ad IS '广告任务中心';
COMMENT ON COLUMN task_management_ad.uuid IS 'uuid';
COMMENT ON COLUMN task_management_ad.source IS '平台：FB、GG 等';
COMMENT ON COLUMN task_management_ad.type IS '任务类型：创建广告、复制广告';
COMMENT ON COLUMN task_management_ad.preview_detail_properties IS '预览明细属性';
COMMENT ON COLUMN task_management_ad.copy_detail_properties IS '复制广告系列详细json';
COMMENT ON COLUMN task_management_ad.status IS '任务状态：未开始、进行中、完成等..';
COMMENT ON COLUMN task_management_ad.result IS '任务结果：成功、失败';
COMMENT ON COLUMN task_management_ad.start_time IS '任务开始时间';
COMMENT ON COLUMN task_management_ad.finished_time IS '任务结束时间';
COMMENT ON COLUMN task_management_ad.create_by_id IS '创建者ID';
COMMENT ON COLUMN task_management_ad.create_by_nick IS '创建者昵称';
COMMENT ON COLUMN task_management_ad.version IS '版本号';


CREATE UNIQUE INDEX uni_task_management_ad_tpid ON task_management_ad (template_preview_id);
CREATE UNIQUE INDEX uni_task_management_ad_uuid ON task_management_ad (uuid);
CREATE INDEX idx_task_management_ad_ssr ON task_management_ad (source, status, result);
CREATE INDEX idx_task_management_ad_status ON task_management_ad (status);


-- 任务调度记录;
DROP TABLE IF EXISTS task_dispatch_record;
CREATE TABLE task_dispatch_record
(
    id               BIGSERIAL   NOT NULL,
    task_id          INT8        NOT NULL,
    category_id      VARCHAR(36) NOT NULL,
    category         VARCHAR(90) NOT NULL,
    trigger_type     VARCHAR(90) NOT NULL,
    trigger_priority INTEGER     NOT NULL,
    trigger_time     TIMESTAMP   NOT NULL,
    status           VARCHAR(90) NOT NULL,
    ordinal          INT         NOT NULL DEFAULT 0,
    result           VARCHAR(90),
    metadata         TEXT,
    finished_time    TIMESTAMP,
    created          TIMESTAMP   NOT NULL,
    updated          TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE task_dispatch_record IS '任务调度记录';
COMMENT ON COLUMN task_dispatch_record.id IS '主键';
COMMENT ON COLUMN task_dispatch_record.task_id IS '执行任务id';
COMMENT ON COLUMN task_dispatch_record.category_id IS '业务对象id';
COMMENT ON COLUMN task_dispatch_record.category IS '任务类别;个号同步, 广告账户';
COMMENT ON COLUMN task_dispatch_record.trigger_type IS '触发类型';
COMMENT ON COLUMN task_dispatch_record.trigger_priority IS '触发优先级';
COMMENT ON COLUMN task_dispatch_record.trigger_time IS '触发时间';
COMMENT ON COLUMN task_dispatch_record.status IS '运行状态;【待执行, 执行中, 已完成，已停止】';
COMMENT ON COLUMN task_dispatch_record.ordinal IS '状态排序';
COMMENT ON COLUMN task_dispatch_record.result IS '执行结果;【成功, 失败】';
COMMENT ON COLUMN task_dispatch_record.metadata IS '任务元数据';
COMMENT ON COLUMN task_dispatch_record.finished_time IS '结束时间';
COMMENT ON COLUMN task_dispatch_record.created IS '创建时间';
COMMENT ON COLUMN task_dispatch_record.updated IS '更新时间';

CREATE UNIQUE INDEX uni_task_dispatch_record_c_c_id ON task_dispatch_record (category, category_id);

-- Fb数据同步限流记录
DROP TABLE IF EXISTS fb_sync_rate_limit_record;
CREATE TABLE fb_sync_rate_limit_record
(
    id                  SERIAL                              NOT NULL,
    category            VARCHAR(90)                         NOT NULL,
    category_id         VARCHAR(36)                         NOT NULL,
    personal_account_id VARCHAR(36)                         NOT NULL,
    begin_date          TIMESTAMP,
    ban_period          INT,
    retry_times         INT,
    created             TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated             TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE fb_sync_rate_limit_record IS 'Fb数据同步限流记录';
COMMENT ON COLUMN fb_sync_rate_limit_record.id IS '主键';
COMMENT ON COLUMN fb_sync_rate_limit_record.category IS '限流类别(APPLICATION, ACCOUNT)';
COMMENT ON COLUMN fb_sync_rate_limit_record.category_id IS '限流业务id(应用,广告账号)';
COMMENT ON COLUMN fb_sync_rate_limit_record.personal_account_id IS '触发个号id';
COMMENT ON COLUMN fb_sync_rate_limit_record.begin_date IS '开始时间';
COMMENT ON COLUMN fb_sync_rate_limit_record.ban_period IS '预计时长分钟';
COMMENT ON COLUMN fb_sync_rate_limit_record.created IS '创建时间';
COMMENT ON COLUMN fb_sync_rate_limit_record.updated IS '更新时间';

CREATE INDEX idx_fb_sync_rate_limit_record_category_id ON fb_sync_rate_limit_record (category_id);


--##########################################################################################
-- Prepare DB Data
--##########################################################################################

-- 插入默认数据
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (1, '-1', '购物', '-1', '-1', 'VALUE_PURCHASE', null, -1, -1, '1970-01-01 18:06:13', '1970-01-02 10:23:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (2, '-2', '订阅', '-1', '-1', 'VALUE_SUBSCRIBE', null, -1, -1, '1970-01-01 18:07:13', '1970-01-02 10:24:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (3, '-3', '添加支付信息', '-1', '-1', 'VALUE_ADD_PAYMENT_INFO', null, -1, -1, '1970-01-01 18:08:13', '1970-01-02 10:25:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (4, '-4', '查看内容', '-1', '-1', 'VALUE_CONTENT_VIEW', null, -1, -1, '1970-01-01 18:09:13', '1970-01-02 10:26:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (5, '-5', '搜索', '-1', '-1', 'VALUE_SEARCH', null, -1, -1, '1970-01-01 18:10:13', '1970-01-02 10:27:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (6, '-6', '捐款', '-1', '-1', 'VALUE_DONATE', null, -1, -1, '1970-01-01 18:11:13', '1970-01-02 10:28:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (7, '-7', '开始试用', '-1', '-1', 'VALUE_START_TRIAL', null, -1, -1, '1970-01-01 18:12:13', '1970-01-02 10:29:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (8, '-8', '完成注册', '-1', '-1', 'VALUE_COMPLETE_REGISTRATION', null, -1, -1, '1970-01-01 18:13:13', '1970-01-02 10:30:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (9, '-9', '发起结账', '-1', '-1', 'VALUE_INITIATED_CHECKOUT', null, -1, -1, '1970-01-01 18:14:13', '1970-01-02 10:31:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (10, '-10', '加入购物车', '-1', '-1', 'VALUE_ADD_TO_CART', null, -1, -1, '1970-01-01 18:15:13', '1970-01-02 10:32:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created, updated)
VALUES (11, '-11', '加入心愿单', '-1', '-1', 'VALUE_ADD_TO_WISHLIST', null, -1, -1, '1970-01-01 18:16:13', '1970-01-02 10:33:59');


INSERT INTO ad_material_folders (id, name, parent_id, level, created_by_id, update_by_id, created, updated)
VALUES (1, '默认素材库', null, -1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42'),
       (2, '团队共享素材', null, -1, -1, -1, '2024-12-02 11:56:42', '2024-12-02 11:56:42');


INSERT INTO sys_personalizes_config (id, cover, system_name, logo, title, title_font, title_size, title_color, description, description_font, description_size, description_color, privacy_policy_name, help_info, contact_info, logo_module_top_margin, logo_module_left_margin, login_module_top_margin,
                                     login_module_left_margin, promo_module_top_margin, promo_module_left_margin, system_code_module_font, system_code_module_size, system_code_module_color, system_code_module_top_margin, system_code_module_left_margin, other_module_bottom_margin,
                                     other_module_right_margin, other_module_color, show_cover, show_logo, show_promo, show_privacy_policy, show_system_code, show_other, template_cover, enable, created_by_id, updated_by_id, created, updated)
VALUES (1, null, 'AD管理系统', null, '打造一流的AD管理系统', null, 32, '#FFFFFF', '输入您的账号信息开始使用！', null, 14, '#FFFFFF', '隐私政策', '', '', 5, 5, 50, 50, 70, 10, null, 14, '#6b7280', 10, 45, 10, 5, '#FFFFFF', false, false, false, true, false,
        false, null, true, 1, 1,
        '2025-03-18 18:44:40', '2025-03-21 12:11:11');

-- 初始化数据
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (1, '花费', 'spend', 'INDICATORS', '["DELIVERY","MATERIAL"]', 0, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (2, '展示数', 'impressions', 'INDICATORS', '["DELIVERY","MATERIAL"]', 1, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (3, '千次展示成本', 'cpm', 'INDICATORS', '["DELIVERY","MATERIAL"]', 2, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (4, '点击数', 'clicks', 'INDICATORS', '["DELIVERY","MATERIAL"]', 3, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (5, '点击成本', 'cpc', 'INDICATORS', '["DELIVERY","MATERIAL"]', 4, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (6, '点击率', 'ctr', 'INDICATORS', '["DELIVERY","MATERIAL"]', 5, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (7, '转化数', 'conversions', 'INDICATORS', '["DELIVERY","MATERIAL"]', 6, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (8, '转化成本', 'cost_per_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 7, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
-- INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
-- VALUES (9, '下载数', 'downloads', 'INDICATORS', '["DELIVERY","MATERIAL"]', 8, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
-- INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
-- VALUES (10, '下载成本', 'cost_pre_download', 'INDICATORS', '["DELIVERY","MATERIAL"]', 9, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
-- INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
-- VALUES (11, '下载率', 'download_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 10, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (12, '安装数', 'omni_app_install', 'INDICATORS', '["DELIVERY","MATERIAL"]', 11, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (13, '安装成本', 'cost_pre_omni_install', 'INDICATORS', '["DELIVERY","MATERIAL"]', 12, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (14, '安装率', 'omni_install_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 13, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (15, '激活数', 'omni_activate_app', 'INDICATORS', '["DELIVERY","MATERIAL"]', 14, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (16, '激活成本', 'cost_pre_activate_app', 'INDICATORS', '["DELIVERY","MATERIAL"]', 15, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (17, '激活率', 'omni_activate_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 16, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (18, '注册数', 'registrations', 'INDICATORS', '["DELIVERY","MATERIAL"]', 17, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (19, '注册成本', 'cost_pre_registration', 'INDICATORS', '["DELIVERY","MATERIAL"]', 18, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (20, '注册率', 'registration_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 19, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (21, '付费次数', 'omni_purchase', 'INDICATORS', '["DELIVERY","MATERIAL"]', 20, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (22, '付费成本', 'cost_pre_omni_purchase', 'INDICATORS', '["DELIVERY","MATERIAL"]', 21, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (23, '付费率', 'omni_purchase_rate', 'INDICATORS', '["DELIVERY","MATERIAL"]', 22, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (24, 'd1_付费转化', 'd1_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 23, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (25, 'd1_ROAS', 'd1_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 24, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (26, 'd7_付费转化', 'd7_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 25, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (27, 'd7_ROAS', 'd7_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 26, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (28, 'd28_付费转化', 'd28_purchase_conversion', 'INDICATORS', '["DELIVERY","MATERIAL"]', 27, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (29, 'd28_ROAS', 'd28_purchase_roas', 'INDICATORS', '["DELIVERY","MATERIAL"]', 28, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (30, '播放次数', 'play_times', 'INDICATORS', '["MATERIAL"]', 29, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (31, '25%播放次数', 'percent_25_play_times', 'INDICATORS', '["MATERIAL"]', 30, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (32, '25%播放率', 'percent_25_rate', 'INDICATORS', '["MATERIAL"]', 31, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (33, '50%播放次数', 'percent_50_play_times', 'INDICATORS', '["MATERIAL"]', 32, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (34, '50%播放率', 'percent_50_rate', 'INDICATORS', '["MATERIAL"]', 33, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (35, '75%播放次数', 'percent_75_play_times', 'INDICATORS', '["MATERIAL"]', 34, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (36, '75%播放率', 'percent_75_rate', 'INDICATORS', '["MATERIAL"]', 35, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (37, '100%播放次数', 'percent_100_play_times', 'INDICATORS', '["MATERIAL"]', 36, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (38, '100%播放率', 'percent_100_rate', 'INDICATORS', '["MATERIAL"]', 37, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (40, '素材', 'hash', 'DIMENSION', '["MATERIAL"]', 39, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (42, '类型', 'type', 'DIMENSION', '["MATERIAL"]', 41, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
-- INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
-- VALUES (43, '标签', 'material_label', 'DIMENSION','["MATERIAL"]', 42, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (44, '创意', 'creative_id', 'DIMENSION', '["DELIVERY"]', 43, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (45, '产品', 'link', 'DIMENSION', '["DELIVERY","MATERIAL"]', 44, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (46, '地区', 'country', 'DIMENSION', '["DELIVERY"]', 45, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (47, '广告系列', 'campaign_id', 'DIMENSION', '["DELIVERY","MATERIAL"]', 46, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (48, '广告账户', 'ad_account_id', 'DIMENSION', '["DELIVERY","MATERIAL"]', 47, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (49, '日期', 'dates', 'DIMENSION', '["DELIVERY"]', 48, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (50, '关键字', 'keywords', 'DIMENSION', '["DELIVERY"]', 49, 1, '2025-05-07 10:41:48', '2025-05-07 10:41:48');
-- 新增看板指标列表
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (51, 'cds_新增注册', 'cds_active', 'CDS_INDICATORS', '["DELIVERY"]', 50, 1, '2025-05-19 10:41:48', '2025-05-19 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (52, 'cds_D1充值金额（USD）', 'cds_day_recharge_usd', 'CDS_INDICATORS', '["DELIVERY"]', 51, 1, '2025-05-19 10:41:48', '2025-05-19 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (53, 'cds_D1ROAS', 'cds_d1_roas', 'CDS_INDICATORS', '["DELIVERY"]', 52, 1, '2025-05-19 10:41:48', '2025-05-19 10:41:48');
INSERT INTO kanban_column_config (id, column_name, column_value, column_types, column_class, sort, created_by_id, created, updated)
VALUES (54, '标签', 'material_tag_id', 'DIMENSION', '["MATERIAL"]', 53, 1, '2025-05-19 10:41:48', '2025-05-19 10:41:48');


-- 针对非常量表, 需要设置表的最大自增量
SELECT setval('ad_material_folders_id_seq', (SELECT max(id) FROM ad_material_folders), TRUE);
SELECT setval('sys_personalizes_config_id_seq', (SELECT max(id) FROM sys_personalizes_config), TRUE);
SELECT setval('kanban_column_config_id_seq', (SELECT max(id) FROM kanban_column_config), TRUE);
SELECT setval('fb_account_convert_event_id_seq', (SELECT max(id) FROM fb_account_convert_event), TRUE);

-- 更新同步任务的资源类别
-- v3.5.0 end
