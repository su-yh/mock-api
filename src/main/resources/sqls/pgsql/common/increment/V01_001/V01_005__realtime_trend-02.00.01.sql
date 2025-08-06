


ALTER TABLE realtime_trend_statistic DROP COLUMN flink_window_start;
ALTER TABLE realtime_trend_statistic DROP COLUMN flink_window_end;

ALTER TABLE realtime_trend_statistic
    ADD COLUMN flink_window_start varchar(32);
ALTER TABLE realtime_trend_statistic
    ADD COLUMN flink_window_end varchar(32);
comment on column realtime_trend_statistic.flink_execution_mode is 'flink 运行时的执行模式';
comment on column realtime_trend_statistic.flink_window_start is 'flink 运行时统计窗口开始时间，字符串格式：yyyy-MM-dd HH:mm:ss';
comment on column realtime_trend_statistic.flink_window_end is 'flink 运行时统计窗口结束(不包含)时间，字符串格式：yyyy-MM-dd HH:mm:ss';

