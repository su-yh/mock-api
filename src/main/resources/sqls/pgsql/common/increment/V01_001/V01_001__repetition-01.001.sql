



-- 统计结果存储表
DROP TABLE if EXISTS repetition_statistic;
CREATE TABLE repetition_statistic (
    id BIGSERIAL PRIMARY KEY,
    dates int NOT NULL ,
    channel varchar(255) NOT NULL,
    source varchar(16) NOT NULL,
    advertiser_id BIGINT NOT NULL,
    advertiser_name varchar(255) NULL,
    campaign_id VARCHAR(64) NOT NULL,
    campaign_name VARCHAR(255) NULL,
    increment_user int DEFAULT 0,
    increment_recharge int DEFAULT 0,
    user_repetition_1  int DEFAULT 0,
    user_repetition_2  int DEFAULT 0,
    user_repetition_3  int DEFAULT 0,
    user_repetition_4  int DEFAULT 0,
    user_repetition_5  int DEFAULT 0,
    user_repetition_6  int DEFAULT 0,
    user_repetition_7  int DEFAULT 0,
    user_repetition_30 int DEFAULT 0,
    user_repetition_60 int DEFAULT 0,
    recharge_repetition_1  int DEFAULT 0,
    recharge_repetition_2  int DEFAULT 0,
    recharge_repetition_3  int DEFAULT 0,
    recharge_repetition_4  int DEFAULT 0,
    recharge_repetition_5  int DEFAULT 0,
    recharge_repetition_6  int DEFAULT 0,
    recharge_repetition_7  int DEFAULT 0,
    recharge_repetition_30 int DEFAULT 0,
    recharge_repetition_60 int DEFAULT 0,
    created timestamp(3) DEFAULT CURRENT_TIMESTAMP(3),
    updated timestamp(3) DEFAULT CURRENT_TIMESTAMP(3)
);

CREATE UNIQUE INDEX uni_repetition_statistic_d_c_s_a_c ON repetition_statistic (dates, channel, source, advertiser_id, campaign_id);

COMMENT ON TABLE repetition_statistic IS '新增重复率，统计维度：渠道 + 投放平台 + 投放方ID + 广告系列ID';

comment on column repetition_statistic.dates is '报表日期，格式：yyyyMMdd';
comment on column repetition_statistic.source is '投放平台，如：GG、FB';
comment on column repetition_statistic.advertiser_id is '投放方ID';
comment on column repetition_statistic.advertiser_name is '投放方名';
comment on column repetition_statistic.campaign_id is '广告系列ID';
comment on column repetition_statistic.increment_user is '新增用户数量';
comment on column repetition_statistic.increment_recharge is '新增付费用户数量';
comment on column repetition_statistic.user_repetition_1  is '新增重复数（区间：(0,1]日）';
comment on column repetition_statistic.user_repetition_2  is '新增重复数（区间：(1,2]日）';
comment on column repetition_statistic.user_repetition_3  is '新增重复数（区间：(2,3]日）';
comment on column repetition_statistic.user_repetition_4  is '新增重复数（区间：(3,4]日）';
comment on column repetition_statistic.user_repetition_5  is '新增重复数（区间：(4,5]日）';
comment on column repetition_statistic.user_repetition_6  is '新增重复数（区间：(5,6]日）';
comment on column repetition_statistic.user_repetition_7  is '新增重复数（区间：(6,7]日）';
comment on column repetition_statistic.user_repetition_30 is '新增重复数（区间：(7,30]日）';
comment on column repetition_statistic.user_repetition_60 is '新增重复数（区间：(30,60]日）';
comment on column repetition_statistic.recharge_repetition_1  is '付费重复数（区间：(0,1]日）';
comment on column repetition_statistic.recharge_repetition_2  is '付费重复数（区间：(1,2]日）';
comment on column repetition_statistic.recharge_repetition_3  is '付费重复数（区间：(2,3]日）';
comment on column repetition_statistic.recharge_repetition_4  is '付费重复数（区间：(3,4]日）';
comment on column repetition_statistic.recharge_repetition_5  is '付费重复数（区间：(4,5]日）';
comment on column repetition_statistic.recharge_repetition_6  is '付费重复数（区间：(5,6]日）';
comment on column repetition_statistic.recharge_repetition_7  is '付费重复数（区间：(6,7]日）';
comment on column repetition_statistic.recharge_repetition_30 is '付费重复数（区间：(7,30]日）';
comment on column repetition_statistic.recharge_repetition_60 is '付费重复数（区间：(30,60]日）';



