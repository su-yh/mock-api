
-- 创建用户注册表
DROP TABLE IF EXISTS tb_user_simplify;
CREATE TABLE tb_user_simplify
(
    id   BIGINT PRIMARY KEY,
    gaid VARCHAR(36) NOT NULL,
    days BIGINT      NOT NULL,
    INDEX idx_days (days),
    INDEX idx_gaid (gaid)
) ENGINE = InnoDB;

-- 创建登录表 (不存储GAID)
DROP TABLE IF EXISTS tb_login_simplify;
CREATE TABLE tb_login_simplify
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    days    BIGINT NOT NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_days (days)
) ENGINE = InnoDB;

-- 创建充值表 (不存储GAID)
DROP TABLE IF EXISTS tb_recharge_simplify;
CREATE TABLE tb_recharge_simplify
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    days    BIGINT NOT NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_days (days)
) ENGINE = InnoDB;

-- 创建提现表 (不存储GAID)
DROP TABLE IF EXISTS tb_withdrawal_simplify;
CREATE TABLE tb_withdrawal_simplify
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    days    BIGINT NOT NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_days (days)
) ENGINE = InnoDB;