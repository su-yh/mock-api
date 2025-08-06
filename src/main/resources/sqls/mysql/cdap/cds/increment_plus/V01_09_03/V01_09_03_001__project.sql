
-- 兼容历史数据，以前的所有数据都是按印度时区处理的，所以历史数据默认全处理成印度时区。
ALTER TABLE project
    ADD COLUMN zone_id varchar(64) NOT NULL DEFAULT '+05:30' COMMENT '时区偏移量，默认为印度时区：+05:30';


