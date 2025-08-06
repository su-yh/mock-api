-- DROP TABLE IF EXISTS fb_custom_audience;

-- 自定义受众表（包含类似受众）
CREATE TABLE fb_custom_audience
(
    id                          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    custom_audience_id          VARCHAR(32)  NOT NULL COMMENT '自定义受众ID',
    advertising_account_id      VARCHAR(32)  NOT NULL COMMENT '广告账户ID',
    custom_audience_name        VARCHAR(50)  NOT NULL COMMENT '自定义受众名称',
    custom_audience_description VARCHAR(255) NOT NULL COMMENT '自定义受众描述',
    subtype                     VARCHAR(50)  NOT NULL COMMENT '自定义受众类型',
    customer_file_source        VARCHAR(255) NOT NULL COMMENT '说明自定义受众中客户信息的最初收集方式',
    lookalike_spec              TEXT         NULL COMMENT '类似受众相关联信息，自定义受众是没有值的',
    user_id                     BIGINT       NOT NULL COMMENT '用户id',
    time_updated                BIGINT       NOT NULL COMMENT 'fb数据更新时间戳',
    created                     DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    updated                     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT 'FB自定义受众表（包含类似受众）';


-- DROP TABLE IF EXISTS sys_personalizes_config;

-- 个性化配置
CREATE TABLE sys_personalizes_config
(
    id                             BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    cover                          VARCHAR(255) COMMENT '封面（非文件路径）',
    system_name                    VARCHAR(64) NOT NULL DEFAULT 'AD管理系统' COMMENT '系统名称',
    logo                           VARCHAR(255) COMMENT '系统logo（非文件路径）',
    title                          VARCHAR(50) COMMENT '标题',
    title_font                     VARCHAR(50) COMMENT '标题字体',
    title_size                     BIGINT COMMENT '标题大小',
    title_color                    VARCHAR(10) COMMENT '标题颜色',
    description                    VARCHAR(100) COMMENT '描述',
    description_font               VARCHAR(50) COMMENT '描述字体',
    description_size               BIGINT COMMENT '描述大小',
    description_color              VARCHAR(10) COMMENT '描述颜色',
    privacy_policy_name            VARCHAR(25)          DEFAULT '隐私政策' COMMENT '隐私政策',
    help_info                      VARCHAR(100) COMMENT '帮助信息',
    contact_info                   VARCHAR(100) COMMENT '联系方式',
    logo_module_top_margin         BIGINT      NOT NULL DEFAULT 0 COMMENT '系统logo模块上边距 百分比',
    logo_module_left_margin        BIGINT      NOT NULL DEFAULT 0 COMMENT '系统logo模块左边距 百分比',
    login_module_top_margin        BIGINT      NOT NULL DEFAULT 0 COMMENT '登录模块上边距 百分比',
    login_module_left_margin       BIGINT      NOT NULL DEFAULT 0 COMMENT '登录模块左边距 百分比',
    promo_module_top_margin        BIGINT      NOT NULL DEFAULT 0 COMMENT '宣传描述模块上边距 百分比',
    promo_module_left_margin       BIGINT      NOT NULL DEFAULT 0 COMMENT '宣传描述模块左边距 百分比',
    system_code_module_font        VARCHAR(50) COMMENT '系统代号字体',
    system_code_module_size        BIGINT COMMENT '系统代号大小',
    system_code_module_color       VARCHAR(10) COMMENT '系统代号颜色',
    system_code_module_top_margin  BIGINT      NOT NULL DEFAULT 0 COMMENT '系统代号模块上边距 百分比',
    system_code_module_left_margin BIGINT      NOT NULL DEFAULT 0 COMMENT '系统代号模块左边距 百分比',
    other_module_bottom_margin     BIGINT      NOT NULL DEFAULT 0 COMMENT '其他信息模块底边距 百分比',
    other_module_right_margin      BIGINT      NOT NULL DEFAULT 0 COMMENT '其他信息模块右边距 百分比',
    other_module_color             VARCHAR(10) COMMENT '其他信息模块颜色',
    show_cover                     tinyint(1)           DEFAULT 0 COMMENT '是否展示封面模块',
    show_logo                      tinyint(1)           DEFAULT 0 COMMENT '是否展示logo模块',
    show_promo                     tinyint(1)           DEFAULT 0 COMMENT '是否展示宣传描述模块',
    show_privacy_policy            tinyint(1)           DEFAULT 0 COMMENT '是否展示隐私政策模块',
    show_system_code               tinyint(1)           DEFAULT 0 COMMENT '是否展示系统代号模块',
    show_other                     tinyint(1)           DEFAULT 0 COMMENT '是否展示其他模块',
    template_cover                 VARCHAR(255) COMMENT '整个模板封面（非文件路径）',
    enable                         tinyint(1)           DEFAULT 0 COMMENT '是否启用',
    created_by_id                  BIGINT      NOT NULL COMMENT '创建人',
    updated_by_id                  BIGINT      NOT NULL COMMENT '修改人',
    created                        DATETIME             DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    updated                        DATETIME             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '个性化配置';


-- 默认数据
INSERT INTO sys_personalizes_config (id, cover, system_name, logo, title, title_font, title_size, title_color, description, description_font, description_size, description_color, privacy_policy_name, help_info, contact_info, logo_module_top_margin, logo_module_left_margin, login_module_top_margin, login_module_left_margin, promo_module_top_margin, promo_module_left_margin, system_code_module_font, system_code_module_size, system_code_module_color, system_code_module_top_margin, system_code_module_left_margin, other_module_bottom_margin, other_module_right_margin, other_module_color, show_cover, show_logo, show_promo, show_privacy_policy, show_system_code, show_other, template_cover, enable, created_by_id, updated_by_id, created, updated)
VALUES (1, null, 'AD管理系统', null, '打造一流的AD管理系统', null, 32, '#FFFFFF', '输入您的账号信息开始使用！', null, 14, '#FFFFFF', '隐私政策', '', '', 5, 5, 50, 50, 70, 10, null, 14, '#6b7280', 10, 45, 10, 5, '#FFFFFF', 0, 0, 0, 1, 0, 0, null, 1, 1, 1, '2025-03-18 18:44:40', '2025-03-21 12:11:11');
