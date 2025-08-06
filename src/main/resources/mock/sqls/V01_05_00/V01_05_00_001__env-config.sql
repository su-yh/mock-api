-- DROP TABLE IF EXISTS mock_env_config;
CREATE TABLE mock_env_config
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT,
    env         VARCHAR(100) NOT NULL COMMENT '全表唯一，只允许输入英文和数字',
    description VARCHAR(4000),
    enabled     TINYINT(1) NOT NULL COMMENT '启用/禁用',
    created     DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
    updated     DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间'
) ENGINE = InnoDB COMMENT = 'mock 环境配置管理';

ALTER TABLE mock_env_config
    ADD UNIQUE INDEX uni_env (env);

