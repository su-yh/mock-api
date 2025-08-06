-- DROP TABLE IF EXISTS fb_targeting_device;
-- DROP TABLE IF EXISTS fb_targeting_os;
-- DROP TABLE IF EXISTS fb_targeting_language;
-- DROP TABLE IF EXISTS fb_targeting_segment;
-- DROP TABLE IF EXISTS fb_targeting_package_management;


CREATE TABLE fb_targeting_device
(
    id              BIGINT       NOT NULL auto_increment COMMENT 'id',
    name            VARCHAR(32)  NOT NULL COMMENT 'FB受众名称',
    type            VARCHAR(32)  NOT NULL COMMENT 'FB受众类别(user_device)',
    platform        VARCHAR(32)  NOT NULL COMMENT '平台',
    description     VARCHAR(512)  NOT NULL COMMENT '描述',
    audience_size_lower_bound INTEGER DEFAULT NULL COMMENT '受众下限',
    audience_size_upper_bound INTEGER DEFAULT NULL COMMENT '受众上限',
    created         datetime     DEFAULT CURRENT_TIMESTAMP,
    updated         datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB设备系统';


CREATE TABLE fb_targeting_os
(
    id              BIGINT       NOT NULL auto_increment COMMENT 'id',
    name            VARCHAR(32)  NOT NULL COMMENT 'FB受众名称',
    type            VARCHAR(32)  NOT NULL COMMENT 'FB受众类别(user_os)',
    platform        VARCHAR(32)  NOT NULL COMMENT '平台',
    description     VARCHAR(512)  NOT NULL COMMENT '版本号描述逗号分隔',
    created         datetime     DEFAULT CURRENT_TIMESTAMP,
    updated         datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB操作系统受众';


CREATE TABLE fb_targeting_language
(
    id              BIGINT       NOT NULL auto_increment COMMENT 'id',
    unique_key      VARCHAR(32)  NOT NULL COMMENT 'FB受众唯一Key',
    name            VARCHAR(32)  NOT NULL COMMENT 'FB受众名称',
    created         datetime     DEFAULT CURRENT_TIMESTAMP,
    updated         datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB语言受众';

CREATE TABLE fb_targeting_segment
(
    id              BIGINT       NOT NULL auto_increment COMMENT 'id',
    name            VARCHAR(32)  NOT NULL COMMENT 'FB受众名称',
    type            VARCHAR(32)  NOT NULL COMMENT 'FB受众类别(life_events:人口统计数据,behaviors:行为,interests兴趣)',
    path    				VARCHAR(512)  NOT NULL COMMENT '层级路径',
    description    VARCHAR(256) NOT NULL COMMENT '描述',
    audience_size_lower_bound INTEGER DEFAULT NULL COMMENT '受众下限',
    audience_size_upper_bound INTEGER DEFAULT NULL COMMENT '受众上限',
    created         datetime     DEFAULT CURRENT_TIMESTAMP,
    updated         datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB细分定位';


CREATE TABLE fb_targeting_package_management
(
    id                BIGINT      NOT NULL auto_increment COMMENT 'id',
    name            varchar(64) NOT NULL COMMENT '定向包名称，用户维度下唯一',
    targeting_package_properties      text NOT NULL COMMENT '整个定向包的完整json 格式数据',
    owner_user_id   BIGINT NOT NULL COMMENT '所属用户id',
    delete_flag          BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    create_by_id         BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick       VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    update_by_id         BIGINT NULL COMMENT '修改者ID',
    update_by_nick       VARCHAR(64) NULL COMMENT '修改者昵称',
    created           datetime     DEFAULT CURRENT_TIMESTAMP,
    updated           datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB定向包管理';


