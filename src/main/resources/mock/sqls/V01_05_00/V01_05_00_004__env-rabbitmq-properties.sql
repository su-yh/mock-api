-- DROP TABLE IF EXISTS env_rabbitmq_properties;
CREATE TABLE env_rabbitmq_properties
(
    id                     BIGINT PRIMARY KEY AUTO_INCREMENT,
    env                    VARCHAR(100) NOT NULL COMMENT 'env',

    enabled                TINYINT(1) NOT NULL COMMENT '启用/禁用',

    host                   VARCHAR(32) COMMENT '192.168.8.143',
    port                   INT,
    username               VARCHAR(32) COMMENT '',
    password               VARCHAR(32) COMMENT '',
    virtual_host           VARCHAR(32),

    exchange               VARCHAR(32),
    routing_key_registry   VARCHAR(32) COMMENT '',
    routing_key_login      VARCHAR(32) COMMENT '',
    routing_key_recharge   VARCHAR(32) COMMENT '',
    routing_key_withdrawal VARCHAR(32) COMMENT '',

    created                DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
    updated                DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间'
) ENGINE = InnoDB COMMENT ='每个环境的一个rabbitmq相关的配置';

ALTER TABLE env_rabbitmq_properties
    ADD UNIQUE INDEX uni_env (env);


