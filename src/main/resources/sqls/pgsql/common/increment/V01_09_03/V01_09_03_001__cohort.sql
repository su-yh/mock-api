
ALTER TABLE cohort_cost_calculate_trend
    ADD COLUMN day_withdraw_count int;
COMMENT ON COLUMN cohort_cost_calculate_trend.day_withdraw_count IS '提现人数';

ALTER TABLE cohort_cost_calculate_trend
    ADD COLUMN first_recharge_count int;
COMMENT ON COLUMN cohort_cost_calculate_trend.first_recharge_count IS '首充用户人数(bdates 是为首充日期)';
