-- 系统配置表，存储本系统只需要一条数据，用json存储（不做列表查询）
CREATE TABLE sys_business_config
(
    id                bigint auto_increment comment '主键ID' primary key,
    config_type       varchar(255)                        NOT NULL comment '配置类型 同步配置-syncConfig',
    config_json       text                                NOT NULL COMMENT '配置内容（JSON 格式）',
    update_by_id      bigint                              null comment '修改者ID',
    created           timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    updated           timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    created_timestamp bigint                              null comment '创建时间戳',
    updated_timestamp bigint                              null comment '更新时间戳',
    UNIQUE KEY uniq_config_type (config_type)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统业务配置表';
