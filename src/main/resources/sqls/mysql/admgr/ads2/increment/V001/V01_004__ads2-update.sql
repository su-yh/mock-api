


ALTER TABLE fb_app_account ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';
ALTER TABLE fb_app_token ADD COLUMN team_id bigint comment '项目团队ID，也是数据权限主键ID';


