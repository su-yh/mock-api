-- DROP TABLE IF EXISTS env_datasource_properties;
CREATE TABLE env_datasource_properties
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT,
    env               VARCHAR(100)  NOT NULL COMMENT 'env',
    name              VARCHAR(32)   NOT NULL COMMENT '对应枚举：DataSourceEnums',

    jdbc_url          VARCHAR(1024) NOT NULL COMMENT '',
    username          VARCHAR(32)   NOT NULL COMMENT '',
    password          VARCHAR(32)   NOT NULL COMMENT '',
    driver_class_name VARCHAR(32)   NOT NULL COMMENT '',
    flyway_enabled    TINYINT(1) NOT NULL COMMENT '启用/禁用flyway',

    created           DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
    updated           DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间'
) ENGINE = InnoDB COMMENT ='每个环境的多个数据源相关的配置';

ALTER TABLE env_datasource_properties
    ADD UNIQUE INDEX uni_e_n (env, name);


