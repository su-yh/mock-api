
ALTER TABLE flink_daily_report
    ADD COLUMN new_recharge_order_count int;
COMMENT ON COLUMN flink_daily_report.new_recharge_order_count IS '新用户充值订单数(注册当天充值)';

ALTER TABLE flink_daily_report
    ADD COLUMN dou_recharge_order_count int;
COMMENT ON COLUMN flink_daily_report.dou_recharge_order_count IS '老用户充值订单数(非注册当天充值)';


