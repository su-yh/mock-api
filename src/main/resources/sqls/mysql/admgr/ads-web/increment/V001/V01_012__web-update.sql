
ALTER TABLE fb_created_campaign DROP COLUMN team_id;


ALTER TABLE fb_app_account DROP COLUMN team_id;
ALTER TABLE fb_app_account
    ADD COLUMN type int default 1 not null comment '账户类别(1:正常户,2:三不限,3:二不限，4:其他)';

