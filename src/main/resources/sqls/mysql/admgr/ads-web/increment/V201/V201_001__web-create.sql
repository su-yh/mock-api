-- DROP TABLE IF EXISTS fb_region_group_management;
-- DROP TABLE IF EXISTS fb_targeting_position;

CREATE TABLE fb_targeting_position
(
    id              BIGINT       NOT NULL auto_increment COMMENT 'id',
    unique_key      VARCHAR(32)  NOT NULL COMMENT 'FB受众唯一Key',
    name            VARCHAR(32)  NOT NULL COMMENT 'FB受众名称',
    type            VARCHAR(32)  NOT NULL COMMENT 'FB受众类别(country:国家,city:城市,region区域)',
    country_code    VARCHAR(32)  NOT NULL COMMENT 'FB国家受众编码',
    country_name    VARCHAR(128) NOT NULL COMMENT 'FB国家受众名称',
    region          VARCHAR(128) DEFAULT '' COMMENT 'FB受众区域',
    region_id       INTEGER      DEFAULT NULL COMMENT 'FB区域id',
    supports_region TINYINT ( 1 ) NOT NULL DEFAULT 0 COMMENT '是否拥有地区代码[0:false,1:true]',
    supports_city   TINYINT ( 1 ) NOT NULL DEFAULT 0 COMMENT '是否拥有城市代码[0:false,1:true]',
    created         datetime     DEFAULT CURRENT_TIMESTAMP,
    updated         datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB受众定位表';


CREATE TABLE fb_region_group_management
(
    id                   BIGINT      NOT NULL auto_increment COMMENT 'id',
    region_group_name    VARCHAR(64) NOT NULL COMMENT '地区组组名',
    targeting_properties text NULL COMMENT '定向json',
    excluded_properties  text NULL COMMENT '排除json',
    owner_user_id        BIGINT      NOT NULL COMMENT '用户属主id',
    delete_flag          BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    create_by_id         BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick       VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    update_by_id         BIGINT NULL COMMENT '修改者ID',
    update_by_nick       VARCHAR(64) NULL COMMENT '修改者昵称',
    created              datetime DEFAULT CURRENT_TIMESTAMP,
    updated              datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = 'FB地区组管理表';