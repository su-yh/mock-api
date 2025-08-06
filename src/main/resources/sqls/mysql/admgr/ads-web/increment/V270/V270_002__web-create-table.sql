-- DROP TABLE IF EXISTS fb_account_convert_event;


-- 广告账户像素代码表
CREATE TABLE fb_account_pixel_code
(
    id                      BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    pixel_id                VARCHAR(32)  NOT NULL COMMENT '像素Id',
    pixel_name              VARCHAR(255) NOT NULL COMMENT '像素名字',
    advertising_account_id  VARCHAR(32)  NOT NULL COMMENT '广告账户ID',
    created_by_id           BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id            BIGINT                DEFAULT NULL COMMENT '修改者ID',
    created_at              DATETIME     COMMENT '像素创建时间',
    updated_at              DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间'
) COMMENT 'FB广告账户像素代码表';


-- 广告账户转化事件表
CREATE TABLE fb_account_convert_event
(
    id                      BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    event_id                VARCHAR(32)  NOT NULL COMMENT '像素Id',
    event_name              VARCHAR(255) NOT NULL COMMENT '像素名字',
    advertising_account_id  VARCHAR(32)  NOT NULL COMMENT '广告账户ID',
    business_management_id  VARCHAR(32)           COMMENT 'BM_ID',
    custom_event_type       VARCHAR(32)  NOT NULL COMMENT '事件类型',
    rule                    TEXT                  COMMENT '规则',
    data_sources            TEXT                  COMMENT '数据来源id',
    created_by_id           BIGINT       NOT NULL COMMENT '创建者ID',
    update_by_id            BIGINT       DEFAULT NULL COMMENT '修改者ID',
    created_at              DATETIME     COMMENT '转化事件创建时间',
    updated_at              DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间'
) COMMENT 'FB广告账户转化事件表';

INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (1, '-1', '购物', '-1', '-1', 'VALUE_PURCHASE', null, -1, -1, '1970-01-01 18:06:13', '1970-01-02 10:23:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (2, '-2', '订阅', '-1', '-1', 'VALUE_SUBSCRIBE', null, -1, -1, '1970-01-01 18:07:13', '1970-01-02 10:24:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (3, '-3', '添加支付信息', '-1', '-1', 'VALUE_ADD_PAYMENT_INFO', null, -1, -1, '1970-01-01 18:08:13', '1970-01-02 10:25:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (4, '-4', '查看内容', '-1', '-1', 'VALUE_CONTENT_VIEW', null, -1, -1, '1970-01-01 18:09:13', '1970-01-02 10:26:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (5, '-5', '搜索', '-1', '-1', 'VALUE_SEARCH', null, -1, -1, '1970-01-01 18:10:13', '1970-01-02 10:27:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (6, '-6', '捐款', '-1', '-1', 'VALUE_DONATE', null, -1, -1, '1970-01-01 18:11:13', '1970-01-02 10:28:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (7, '-7', '开始试用', '-1', '-1', 'VALUE_START_TRIAL', null, -1, -1, '1970-01-01 18:12:13', '1970-01-02 10:29:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (8, '-8', '完成注册', '-1', '-1', 'VALUE_COMPLETE_REGISTRATION', null, -1, -1, '1970-01-01 18:13:13', '1970-01-02 10:30:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (9, '-9', '发起结账', '-1', '-1', 'VALUE_INITIATED_CHECKOUT', null, -1, -1, '1970-01-01 18:14:13', '1970-01-02 10:31:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (10, '-10', '加入购物车', '-1', '-1', 'VALUE_ADD_TO_CART', null, -1, -1, '1970-01-01 18:15:13', '1970-01-02 10:32:59');
INSERT INTO fb_account_convert_event (id, event_id, event_name, advertising_account_id, business_management_id, custom_event_type, data_sources, created_by_id, update_by_id, created_at, updated_at)
VALUES (11, '-11', '加入心愿单', '-1', '-1', 'VALUE_ADD_TO_WISHLIST', null, -1, -1, '1970-01-01 18:16:13', '1970-01-02 10:33:59');


-- 删除所有创意组信息
TRUNCATE TABLE ad_creative_group;

-- 增加创意组列
ALTER TABLE ad_creative_group
    ADD COLUMN objective VARCHAR(50) NOT NULL COMMENT '广告目标' AFTER name;
ALTER TABLE ad_creative_group
    ADD COLUMN conversion_position VARCHAR(50) NULL COMMENT '转化发生位置' AFTER objective;


