


ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_0 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_1 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_2 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_3 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_4 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_5 int4 DEFAULT 0 NOT NULL;
ALTER TABLE repetition_statistic
    ADD COLUMN increment_recharge_offset_6 int4 DEFAULT 0 NOT NULL;

comment on column repetition_statistic.increment_recharge_offset_0 is
    '充值日期相对于注册日期相差为0 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_1 is
    '充值日期相对于注册日期相差为1 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_2 is
    '充值日期相对于注册日期相差为2 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_3 is
    '充值日期相对于注册日期相差为3 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_4 is
    '充值日期相对于注册日期相差为4 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_5 is
    '充值日期相对于注册日期相差为5 天时，充值总人数';
comment on column repetition_statistic.increment_recharge_offset_6 is
    '充值日期相对于注册日期相差为6 天时，充值总人数';


