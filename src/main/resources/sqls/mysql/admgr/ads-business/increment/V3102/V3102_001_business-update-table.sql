ALTER TABLE fb_custom_audience
    MODIFY COLUMN custom_audience_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义受众名称';