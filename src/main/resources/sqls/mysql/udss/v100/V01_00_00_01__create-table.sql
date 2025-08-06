CREATE TABLE mock_task_config
(
    id                       BIGINT PRIMARY KEY AUTO_INCREMENT,
    task_name                VARCHAR(100) NOT NULL COMMENT '任务名称',
    mock_mode                VARCHAR(16)  NOT NULL DEFAULT 'NONE' COMMENT '模拟模式(NONE:无/TIMER_JOB:定时任务/DATE_RAGE:日期范围)',
    status                   VARCHAR(16)           DEFAULT 'NOT_STARTED' COMMENT '状态(NOT_STARTED:未开始,RUNNING:运行中,SUCCESS:执行成功,FAILED:执行失败,CANCELLED:已取消)',

    -- 时间配置
    start_date               BIGINT(20)   NULL     DEFAULT NULL COMMENT '数据开始日期',
    end_date                 BIGINT(20)   NULL     DEFAULT NULL COMMENT '数据结束日期',
    allow_earlier_data       VARCHAR(16)           DEFAULT 'DISALLOW' COMMENT '允许插入更早的数据(DISALLOW:不允许,ALLOW:允许)',

    -- 注册数据配置
    register_count           INT                   DEFAULT 300000 COMMENT '注册用户数',
    register_rate            INT                   DEFAULT 50 COMMENT '注册用户当日登录比例(%)',

    -- 登录数据配置
    login_count              INT                   DEFAULT 1000000 COMMENT '登录用户数',
    login_new_user_rate      INT                   DEFAULT 80 COMMENT '近100天内用户登录比例(%)',

    -- 充值数据配置
    recharge_count           INT                   DEFAULT 300000 COMMENT '充值用户数',
    recharge_new_user_rate   INT                   DEFAULT 80 COMMENT '近100天内用户充值比例(%)',

    -- 提现数据配置
    withdrawal_count         INT                   DEFAULT 300000 COMMENT '提现用户数',
    withdrawal_new_user_rate INT                   DEFAULT 80 COMMENT '近100天内用户提现比例(%)',

    -- 总数上限配置
    total_register_users     INT                   DEFAULT 350000000 COMMENT '注册用户总数',
    total_login_users        INT                   DEFAULT 1500000000 COMMENT '登陆用户总数',
    total_recharge_users     INT                   DEFAULT 300000000 COMMENT '充值用户总数',
    total_withdrawal_users   INT                   DEFAULT 150000000 COMMENT '提现用户总数',

    -- 循环次数配置
    cycles_count             INT                   DEFAULT 1 COMMENT '循环次数默认是1可以设置为1000将总数分别除以1000进行分批次进行处理',

    -- 重复率配置
    register_repetition_rate   INT                 DEFAULT 33 COMMENT '注册重复率',
    login_repetition_rate      INT                 DEFAULT 1267 COMMENT '登陆重复率',
    recharge_repetition_rate   INT                 DEFAULT 48 COMMENT '充值重复率',
    withdrawal_repetition_rate INT                 DEFAULT 21 COMMENT '提现重复率',

    -- 高级配置
    mock_peek_switch         VARCHAR(16)  NOT NULL DEFAULT 'MOCK' COMMENT '模拟高峰开关(MOCK:模拟/ NONE:不模拟)',
    peek_time_start          TIME                  DEFAULT '20:00:00' COMMENT '高峰期开始时间',
    peek_time_end            TIME                  DEFAULT '04:00:00' COMMENT '高峰期结束时间',
    high_peak_percent        INT                   DEFAULT 80 COMMENT '高峰期全天流量占比(%)',
    delta_campaign_count     INT                   DEFAULT 100 COMMENT '每日增量广告系列数量',

    -- 基础配置
    created                  DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated                  DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    created_by               VARCHAR(50) COMMENT '创建人',
    remarks                  VARCHAR(500) COMMENT '备注'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='mock任务配置表';


CREATE TABLE mock_task_record
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT,
    task_id          BIGINT      NOT NULL COMMENT '任务ID',
    execution_date   BIGINT(20)  NULL DEFAULT NULL COMMENT '执行日期',
    start_time       DATETIME    NULL DEFAULT NULL COMMENT '开始时间',
    end_time         DATETIME    NULL DEFAULT NULL COMMENT '结束时间',
    status           VARCHAR(20) NOT NULL COMMENT '状态(RUNNING/SUCCESS/FAILED)',

    -- 表执行进度数据
    table_name       VARCHAR(50) COMMENT '执行表名（tb_user,tb_user_login,tb_withdrawal,tb_recharge）',
    insert_rate      INT COMMENT '插入速率 条/s',
    inserted_count   INT COMMENT '已插入条数',
    total_count      INT COMMENT '总记录条数',
    latest_data_date BIGINT(20)  NULL DEFAULT NULL COMMENT '最新数据日期',
    execution_log    TEXT COMMENT '执行日志',

    -- 基础字段
    created          DATETIME         DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated          DATETIME         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='mock任务执行记录表';

CREATE TABLE mock_user_pool
(
    id        BIGINT PRIMARY KEY AUTO_INCREMENT,
    gaid      VARCHAR(255) NOT NULL COMMENT '设备ID',
    high_freq TINYINT(1)   NOT NULL DEFAULT 0 COMMENT '是否高频用户 0-否 1-是',
    -- 基础字段
    created   DATETIME              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated   DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='mock用户池';

-- 为mock_task_config表添加索引
ALTER TABLE mock_task_config
    ADD INDEX idx_task_name (task_name);
ALTER TABLE mock_task_config
    ADD INDEX idx_status (status);
ALTER TABLE mock_task_config
    ADD INDEX idx_start_date (start_date);
ALTER TABLE mock_task_config
    ADD INDEX idx_end_date (end_date);

-- 为mock_task_execution表添加索引
ALTER TABLE mock_task_record
    ADD INDEX idx_task_id (task_id);
ALTER TABLE mock_task_record
    ADD INDEX idx_execution_date (execution_date);
ALTER TABLE mock_task_record
    ADD INDEX idx_status (status);
ALTER TABLE mock_task_record
    ADD INDEX idx_table_name (table_name);

-- 为mock_user_pool表添加索引
ALTER TABLE mock_user_pool
    ADD UNIQUE INDEX idx_gaid (gaid);
