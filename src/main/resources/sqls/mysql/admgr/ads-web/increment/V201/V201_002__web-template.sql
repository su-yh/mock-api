
-- DROP TABLE IF EXISTS ad_template_draft;
-- DROP TABLE IF EXISTS ad_template_formal;
-- DROP TABLE IF EXISTS ad_template_preview;


CREATE TABLE ad_template_draft
(
    id              BIGINT       NOT NULL AUTO_INCREMENT,
    owner_user_id   BIGINT NOT NULL COMMENT '所属用户id',
    team_id         BIGINT NOT NULL COMMENT '所属项目团队ID',
    region_group_list       TEXT NULL COMMENT '地区组详情列表，以json 格式存储',
    targeting_list          TEXT NULL COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list     TEXT NULL COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties     TEXT NULL COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    advertise_content       TEXT NULL COMMENT '投放内容',
    creative_properties     TEXT NULL COMMENT '创意设置',
    budget_advanced         TEXT NULL COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal           TEXT NULL COMMENT '出价与预算(应用广告)',
    placement_properties    TEXT NULL COMMENT '版位',
    splitting_rule          TEXT NULL COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list   TEXT NULL COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page   TEXT NULL COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    create_by_id   BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    created        datetime DEFAULT CURRENT_TIMESTAMP,
    updated        datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = '广告模板草稿';

-- 唯一索引，每个用户最多一张模板草稿
ALTER TABLE ad_template_draft
    ADD UNIQUE INDEX uni_uid(owner_user_id) USING BTREE;



CREATE TABLE ad_template_formal
(
    id              BIGINT       NOT NULL AUTO_INCREMENT,
    owner_user_id   BIGINT NOT NULL COMMENT '所属用户id',
    team_id         BIGINT NOT NULL COMMENT '所属项目团队ID',
    name            VARCHAR(64) NOT NULL COMMENT '模板名称',
    delete_flag     BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    region_group_list       TEXT NULL COMMENT '地区组详情列表，以json 格式存储',
    targeting_list          TEXT NULL COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list     TEXT NULL COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties     TEXT NULL COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    advertise_content       TEXT NULL COMMENT '投放内容',
    creative_properties     TEXT NULL COMMENT '创意设置',
    budget_advanced         TEXT NULL COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal           TEXT NULL COMMENT '出价与预算(应用广告)',
    placement_properties    TEXT NULL COMMENT '版位',
    splitting_rule          TEXT NULL COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list   TEXT NULL COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page   TEXT NULL COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    create_by_id   BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    created        datetime DEFAULT CURRENT_TIMESTAMP,
    updated        datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = '广告模板表';

-- 唯一索引，每个用户最多一张模板草稿
ALTER TABLE ad_template_formal
    ADD UNIQUE INDEX uni_uid_name(owner_user_id, name, delete_flag) USING BTREE;



CREATE TABLE ad_template_preview
(
    id              BIGINT       NOT NULL AUTO_INCREMENT,
    owner_user_id   BIGINT NOT NULL COMMENT '所属用户id',
    team_id         BIGINT NOT NULL COMMENT '所属项目团队ID',
    delete_flag     BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    region_group_list       TEXT NULL COMMENT '地区组详情列表，以json 格式存储',
    targeting_list          TEXT NULL COMMENT '定向包详情列表，以json 格式存储',
    creative_group_list     TEXT NULL COMMENT '创意组详情列表，以json 格式存储',
    campaign_properties     TEXT NULL COMMENT '广告系列属性：草稿存实际的json 数据，而不是id',
    advertise_content       TEXT NULL COMMENT '投放内容',
    creative_properties     TEXT NULL COMMENT '创意设置',
    budget_advanced         TEXT NULL COMMENT '出价与预算(进阶赋能弄应用广告)',
    budget_normal           TEXT NULL COMMENT '出价与预算(应用广告)',
    placement_properties    TEXT NULL COMMENT '版位',
    splitting_rule          TEXT NULL COMMENT '拆分规则：草稿存实际的json 数据，而不是id',
    fb_personal_account_list   TEXT NULL COMMENT 'FB 个人号ID 列表',
    ad_personal_account_page   TEXT NULL COMMENT '广告帐号及个号选择：草稿存实际的json 数据，而不是id',
    create_by_id   BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    created        datetime DEFAULT CURRENT_TIMESTAMP,
    updated        datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = '广告模板预览表';

-- 唯一索引，每个用户最多一张模板草稿
ALTER TABLE ad_template_preview
    ADD INDEX idx_uid_name(owner_user_id) USING BTREE;



