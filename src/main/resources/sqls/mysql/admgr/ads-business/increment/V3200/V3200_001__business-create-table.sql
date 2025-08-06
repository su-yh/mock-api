DROP TABLE IF EXISTS fb_biz_object_tags;
CREATE TABLE fb_biz_object_tags
(
    `id`            BIGINT AUTO_INCREMENT NOT NULL COMMENT '主键',
    `code`          VARCHAR(90) COMMENT '标签代码',
    `name`          VARCHAR(90)           NOT NULL COMMENT '标签名称',
    `description`   VARCHAR(255) COMMENT '备注',
    `created_by_id` BIGINT COMMENT '创建人',
    `updated_by_id` BIGINT COMMENT '更新人',
    `created`       DATETIME              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated`       DATETIME              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '业务标签;';


DROP TABLE IF EXISTS fb_biz_tags_mapping;
CREATE TABLE fb_biz_tags_mapping
(
    `id`            INT AUTO_INCREMENT COMMENT '主键id',
    `category`      VARCHAR(90) NOT NULL COMMENT '业务类别',
    `tag_id`        BIGINT      NOT NULL COMMENT '标签id',
    `biz_object_id` BIGINT      NOT NULL COMMENT '业务对象id',
    `created_by_id` BIGINT COMMENT '创建人',
    `updated_by_id` BIGINT COMMENT '更新人',
    `created`       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated`       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '业务标签关联;';

CREATE UNIQUE INDEX uni_fb_business_tag_relationship_c_b_t ON fb_biz_tags_mapping (category, biz_object_id, tag_id);
