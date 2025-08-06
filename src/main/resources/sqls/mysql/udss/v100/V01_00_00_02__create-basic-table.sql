-- 推广应用
CREATE TABLE fb_promotion_app
(
    id                bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    app_id            varchar(32)  NOT NULL COMMENT '推广应用Id',
    app_name          varchar(256) NOT NULL COMMENT '推广应用名称',
    app_avatar        text COMMENT '应用头像URL',
    app_store_details text COMMENT '推广应用商店详情',
    last_auth_time    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近授权时间',
    package_name      varchar(255)          DEFAULT NULL COMMENT '投放包',
    created_by_id     bigint       NOT NULL DEFAULT 1 COMMENT '创建者ID',
    update_by_id      bigint                DEFAULT NULL COMMENT '修改者ID',
    created           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP,
    updated           timestamp    NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uni_app_id (app_id) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='FB推广应用';
