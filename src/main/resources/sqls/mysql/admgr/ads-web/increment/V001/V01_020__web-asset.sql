

ALTER TABLE fb_asset ADD COLUMN created_id bigint comment '创建者ID';
ALTER TABLE fb_asset ADD COLUMN created_name varchar(64) comment '创建者名称';
