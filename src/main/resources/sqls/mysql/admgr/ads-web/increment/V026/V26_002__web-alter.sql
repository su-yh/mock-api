
ALTER TABLE asset_type ADD COLUMN created_name varchar(64) comment '创建者名称';
ALTER TABLE asset_type ADD COLUMN updated_name varchar(64) comment '修改者名称';
ALTER TABLE asset_scenes ADD COLUMN created_name varchar(64) comment '创建者名称';
ALTER TABLE asset_scenes ADD COLUMN updated_name varchar(64) comment '修改者名称';

