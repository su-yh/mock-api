
CREATE TABLE sys_operation_record
(
    id            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    trace_id      bigint               DEFAULT NULL COMMENT '业务操作ID',
    user_id       bigint               DEFAULT NULL COMMENT '用户ID',
    username      varchar(64)          DEFAULT NULL COMMENT '用户名称',
    page          varchar(255)         DEFAULT NULL COMMENT '页面',
    operation     varchar(255)    NULL DEFAULT NULL COMMENT '操作',
    req_method    varchar(20)          DEFAULT NULL COMMENT '请求方法',
    req_path      varchar(255)         DEFAULT NULL COMMENT '请求路径',
    req_argument  text            NULL DEFAULT NULL COMMENT '请求参数',
    result        text                 DEFAULT NULL COMMENT '结果',
    sql_list      text                 default NULL COMMENT '操作SQL列表，以json 格式存储',
    created       datetime        NULL DEFAULT NULL COMMENT '创建日期',
    updated       datetime        NULL DEFAULT NULL COMMENT '修改日期',
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='操作日志记录表';