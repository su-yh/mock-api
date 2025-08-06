-- DROP TABLE IF EXISTS mock_properties;
CREATE TABLE mock_properties
(
    id                    BIGINT PRIMARY KEY AUTO_INCREMENT,
    env                   VARCHAR(100) NOT NULL COMMENT 'env',
    mode                  INT          NOT NULL COMMENT '0-NONE, 1-实时, 2-按日期范围, 3-按时间戳范围',

    ts_begin              BIGINT COMMENT '开始时间戳（左闭），单位：毫秒',
    ts_end                BIGINT COMMENT '结束时间戳（右开），单位：毫秒',

    sub_channel_count     INT          NOT NULL COMMENT '每个channel 的sub channel 数量',
    random_max_registry   INT          NOT NULL COMMENT '每次随机注册的最大数量',
    random_max_login      INT          NOT NULL COMMENT '每次随机登录的最大数量',
    random_max_recharge   INT          NOT NULL COMMENT '每次随机充值的最大数量',
    random_max_withdrawal INT          NOT NULL COMMENT '每次随机提现的最大数量',

    created               DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
    updated               DATETIME(3) DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间'
) ENGINE = InnoDB COMMENT ='mock 环境配置管理';

ALTER TABLE mock_properties
    ADD UNIQUE INDEX uni_env (env);


