
ALTER TABLE sys_data_permission
    ADD COLUMN permission_role varchar(16) not null comment '权限角色: root、admin、parent_team、team';

-- 对于初始化的记录，初始化他的角色为root
update sys_data_permission set permission_role = 'root' where id = 1;

ALTER TABLE fb_created_campaign ADD COLUMN created_name varchar(64) comment '创建者';

ALTER TABLE fb_app_account ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';

ALTER TABLE fb_asset ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';

ALTER TABLE asset_scenes_tag ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';

ALTER TABLE fb_app_token ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';

ALTER TABLE fb_created_campaign ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';

