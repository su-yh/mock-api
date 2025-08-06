-- 以下sql在pg库执行

-- adjust_ad 增加普通索引
CREATE INDEX idx_adjust_ad_c ON adjust_ad (channel);

-- adjust_user 增加普通索引
CREATE INDEX idx_adjust_user_k ON adjust_user (key);
CREATE INDEX idx_adjust_user_g ON adjust_user (gaid);
CREATE INDEX idx_adjust_user_c ON adjust_user (channel);
CREATE INDEX idx_adjust_user_c_c ON adjust_user (channel, campaign_id);
CREATE INDEX idx_adjust_user_c_c_a ON adjust_user (channel, campaign_id, ad_group_id);
CREATE INDEX idx_adjust_user_c_c_a_a ON adjust_user (channel, campaign_id, ad_group_id, ad_id);
CREATE INDEX idx_adjust_user_c_a_a_c ON adjust_user (campaign_id, ad_group_id, ad_id, channel);

-- adjust_user_history 增加普通索引
CREATE INDEX idx_adjust_user_history_g ON adjust_user_history (gaid);
CREATE INDEX idx_adjust_user_history_d ON adjust_user_history (dates);
CREATE INDEX idx_adjust_user_history_c ON adjust_user_history (channel);

-- adjust_cost_record 增加普通索引
CREATE INDEX idx_adjust_cost_record_d_c_a ON adjust_cost_record (dates, campaign_id, cost);

-- flink_adjust_stat 增加普通索引
CREATE INDEX idx_flink_adjust_stat_c ON flink_adjust_stat (campaign_id);
CREATE INDEX idx_flink_adjust_stat_a ON flink_adjust_stat (ad_group_id);
CREATE INDEX idx_flink_adjust_stat_ai ON flink_adjust_stat (ad_id);
CREATE INDEX idx_flink_adjust_stat_d_k ON flink_adjust_stat (dates, key);
CREATE INDEX idx_flink_adjust_stat_d_c ON flink_adjust_stat (dates, channel);
CREATE INDEX idx_flink_adjust_stat_d_s_c ON flink_adjust_stat (dates, source, channel);
CREATE INDEX idx_flink_adjust_stat_d_s_c_c ON flink_adjust_stat (dates, source, channel, campaign_id);

-- flink_adjust_stat_detail 增加普通索引
CREATE INDEX idx_flink_adjust_stat_detail_b_c ON flink_adjust_stat_detail (bdates, channel);
CREATE INDEX idx_flink_adjust_stat_detail_d_b_c ON flink_adjust_stat_detail (dates, bdates, channel);
CREATE INDEX idx_flink_adjust_stat_detail_d_b_c_s ON flink_adjust_stat_detail (dates, bdates, channel, source);
CREATE INDEX idx_flink_adjust_stat_detail_d_b_c_c_a ON flink_adjust_stat_detail (dates, bdates, channel, campaign_id, ad_group_id);
CREATE INDEX idx_flink_adjust_stat_detail_d_b_c_c_s ON flink_adjust_stat_detail (dates, bdates, channel, campaign_id, source);

-- flink_daily_report 增加普通索引
CREATE INDEX idx_flink_daily_report_d ON flink_daily_report (dates);

-- cohort_cost_calculate_trend 增加普通索引
CREATE INDEX idx_cohort_cost_calculate_trend_b_c ON cohort_cost_calculate_trend (bdates, channel);
CREATE INDEX idx_cohort_cost_calculate_trend_d_b_c ON cohort_cost_calculate_trend (dates, bdates, channel);
CREATE INDEX idx_cohort_cost_calculate_trend_d_b_c_k_c ON cohort_cost_calculate_trend (dates, bdates, channel, key, cohort);

-- cohort_recharge_retention 增加普通索引
CREATE INDEX idx_cohort_recharge_retention_b_c ON cohort_recharge_retention (bdates, channel);
CREATE INDEX idx_cohort_recharge_retention_d_b_c ON cohort_recharge_retention (dates, bdates, channel);
CREATE INDEX idx_cohort_recharge_retention_d_b_c_k ON cohort_recharge_retention (dates, bdates, channel, key);
CREATE INDEX idx_cohort_recharge_retention_d_b_c_s ON cohort_recharge_retention (dates, bdates, channel, source);
CREATE INDEX idx_cohort_recharge_retention_d_b_c_c_s ON cohort_recharge_retention (dates, bdates, channel, campaign_id, source);
CREATE INDEX idx_cohort_recharge_retention_d_b_c_c_a ON cohort_recharge_retention (dates, bdates, channel, campaign_id, ad_group_id);




