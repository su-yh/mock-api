-- ----------------------------
-- 更改rate表小数点位数,因INR和美元的汇率如果是两位小数误差较大,故调整成3位小数
-- ----------------------------
ALTER TABLE rate
    MODIFY COLUMN rate decimal(20, 3) NULL DEFAULT NULL COMMENT '汇率' AFTER symbols;

-- ----------------------------
-- 写入卢比与其他币种的汇率
-- 如汇率不准确可自行调整
-- 如id与历史数据有冲突可自行调整删除
-- ----------------------------
-- INSERT INTO rate (id, base, symbols, rate, dates, created, updated) VALUES (4, 'INR', 'PKR', 3.330, 20240801, '2024-08-01 11:20:33', NULL);
-- INSERT INTO rate (id, base, symbols, rate, dates, created, updated) VALUES (5, 'INR', 'BRL', 0.068, 20240801, '2024-08-01 11:20:51', NULL);
-- INSERT INTO rate (id, base, symbols, rate, dates, created, updated) VALUES (6, 'INR', 'USD', 0.012, 20240801, '2024-08-01 11:20:55', NULL);

