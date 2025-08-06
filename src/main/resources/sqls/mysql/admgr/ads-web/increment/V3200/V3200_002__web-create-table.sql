DROP TABLE IF EXISTS tg_notify_channel_config;
CREATE TABLE tg_notify_channel_config
(
    `id`            INT AUTO_INCREMENT COMMENT 'id',
    `chat_id`       VARCHAR(128) NOT NULL COMMENT '聊天id',
    `bot_token`     VARCHAR(128) NOT NULL COMMENT '机器人token',
    `description`   VARCHAR(300) COMMENT '描述信息',
    `enabled`       VARCHAR(1)   NOT NULL DEFAULT 0 COMMENT '是否启用[0:启用,1:禁用]',
    `created_by_id` VARCHAR(64) COMMENT '创建人',
    `updated_by_id` VARCHAR(64) COMMENT '修改人',
    `created`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'TG 通知渠道配置';


DROP TABLE IF EXISTS ops_notify_config;
CREATE TABLE ops_notify_config
(
    `id`            INT AUTO_INCREMENT COMMENT 'id',
    `biz_category`  VARCHAR(128) NOT NULL COMMENT '业务类别',
    `channel_id`    VARCHAR(128) NOT NULL COMMENT '通知渠道',
    `created`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_by_id` VARCHAR(64) COMMENT '创建人',
    `updated_by_id` VARCHAR(64) COMMENT '修改人',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '运维通知配置';

CREATE UNIQUE INDEX uni_ops_notify_config_b_c ON ops_notify_config (biz_category, channel_id);
