

ALTER TABLE fb_asset ADD COLUMN parent_team_id bigint comment '投放方ID，也是数据权限主键ID';
ALTER TABLE fb_app_token ADD COLUMN parent_team_id bigint comment '投放方ID，也是数据权限主键ID';


