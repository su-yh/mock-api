
-- normal  deleted
ALTER TABLE sys_data_permission
    ADD COLUMN del_status varchar(16) default 'normal' comment '删除状态（normal代表存在 deleted代表删除）';



