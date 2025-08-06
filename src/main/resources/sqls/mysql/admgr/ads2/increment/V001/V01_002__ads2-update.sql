
ALTER TABLE fb_app_token
    ADD COLUMN created_name VARCHAR(64) NULL comment '创建者';
ALTER TABLE fb_app_token
    ADD COLUMN created_id BIGINT NULL comment '创建者用户ID';
ALTER TABLE fb_app_token
    ADD COLUMN updated_name VARCHAR(64) NULL comment '更新者';



ALTER TABLE fb_app_account
    ADD COLUMN created_name VARCHAR(64) NULL comment '创建者';
ALTER TABLE fb_app_account
    ADD COLUMN created_id BIGINT NULL comment '创建者用户ID';
ALTER TABLE fb_app_account
    ADD COLUMN updated_name VARCHAR(64) NULL comment '更新者';



ALTER TABLE fb_app
    ADD COLUMN created_name VARCHAR(64) NULL comment '创建者';
ALTER TABLE fb_app
    ADD COLUMN created_id BIGINT NULL comment '创建者用户ID';
ALTER TABLE fb_app
    ADD COLUMN updated_name VARCHAR(64) NULL comment '更新者';



ALTER TABLE fb_adjust_app_token
    ADD COLUMN created_name VARCHAR(64) NULL comment '创建者';
ALTER TABLE fb_adjust_app_token
    ADD COLUMN created_id BIGINT NULL comment '创建者用户ID';
ALTER TABLE fb_adjust_app_token
    ADD COLUMN updated_name VARCHAR(64) NULL comment '更新者';




