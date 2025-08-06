
ALTER TABLE sys_data_permission DROP COLUMN key_list;
ALTER TABLE sys_data_permission
    ADD COLUMN key_id_list VARCHAR(1024) NULL comment '关键字ID 列表';


