ALTER TABLE cohort_cost_calculate_trend
    ADD COLUMN first_withdrawal_count int4 DEFAULT 0;

COMMENT ON COLUMN cohort_cost_calculate_trend.first_withdrawal_count IS '首次提现人数';


