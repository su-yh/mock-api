-- 修改多系统配置表名
ALTER TABLE fb_app_system_code RENAME TO fb_app_system_code_config;
-- 增加创建时间、创建人、修改人、更新时间名
ALTER TABLE fb_app_system_code_config
    ADD COLUMN create_by_id BIGINT NOT NULL DEFAULT 0 COMMENT '创建者ID'  AFTER privacy_policy,
    ADD COLUMN update_by_id BIGINT NOT NULL DEFAULT 0 COMMENT '修改者ID'  AFTER create_by_id,
    ADD COLUMN created DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' AFTER update_by_id,
    CHANGE COLUMN updated_at updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间';


-- 修改表 ad_keyword 的字段 create_time 为 created
ALTER TABLE ad_keyword CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 ad_keyword 的字段 update_time 为 updated
ALTER TABLE ad_keyword CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表名 ad_package 为 ad_package_config
RENAME TABLE ad_package TO ad_package_config;

-- 修改表 ad_package_config 的字段 created_date 为 created
ALTER TABLE ad_package_config CHANGE created_date created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 向表 ad_package_config 添加缺少的字段 updated
ALTER TABLE ad_package_config ADD COLUMN updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 currency_code 的字段 created_at 为 created
ALTER TABLE currency_code CHANGE created_at created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 currency_code 的字段 updated_at 为 updated
ALTER TABLE currency_code CHANGE updated_at updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 gen_table 的字段 table_id 为 id
ALTER TABLE gen_table CHANGE COLUMN table_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 gen_table 的字段 create_time 为 created
ALTER TABLE gen_table CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 gen_table 的字段 update_time 为 updated
ALTER TABLE gen_table CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 gen_table_column 的字段 column_id 为 id
ALTER TABLE gen_table_column CHANGE column_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 gen_table_column 的字段 create_time 为 created
ALTER TABLE gen_table_column CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 gen_table_column 的字段 update_time 为 updated
ALTER TABLE gen_table_column CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_config 的字段 config_id 为 id
ALTER TABLE sys_config CHANGE config_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_config 的字段 create_time 为 created
ALTER TABLE sys_config CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_config 的字段 update_time 为 updated
ALTER TABLE sys_config CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_data_permission 的字段 create_time 为 created
ALTER TABLE sys_data_permission CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_data_permission 的字段 update_time 为 updated
ALTER TABLE sys_data_permission CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_dept 的字段 dept_id 为 id
ALTER TABLE sys_dept CHANGE dept_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_dept 的字段 create_time 为 created
ALTER TABLE sys_dept CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_dept 的字段 update_time 为 updated
ALTER TABLE sys_dept CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_dict_data 的字段 dict_code 为 id
ALTER TABLE sys_dict_data CHANGE dict_code id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_dict_data 的字段 create_time 为 created
ALTER TABLE sys_dict_data CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_dict_data 的字段 update_time 为 updated
ALTER TABLE sys_dict_data CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_dict_type 的字段 dict_id 为 id
ALTER TABLE sys_dict_type CHANGE dict_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_dict_type 的字段 create_time 为 created
ALTER TABLE sys_dict_type CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_dict_type 的字段 update_time 为 updated
ALTER TABLE sys_dict_type CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_job 的字段 job_id 为 id
ALTER TABLE sys_job CHANGE job_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_job 的字段 create_time 为 created
ALTER TABLE sys_job CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_job 的字段 update_time 为 updated
ALTER TABLE sys_job CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_job_log 的字段 job_log_id 为 id
ALTER TABLE sys_job_log CHANGE job_log_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_job_log 的字段 create_time 为 created
ALTER TABLE sys_job_log CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表名 sys_logininfor 为 sys_logininfor_record
RENAME TABLE sys_logininfor TO sys_logininfor_record;

-- 修改表 sys_logininfor_record 的字段 info_id 为 id
ALTER TABLE sys_logininfor_record CHANGE info_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 向表 sys_logininfor_record 添加缺少的字段 created
ALTER TABLE sys_logininfor_record ADD COLUMN created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 向表 sys_logininfor_record 添加缺少的字段 updated
ALTER TABLE sys_logininfor_record ADD COLUMN updated timestamp DEFAULT CURRENT_TIMESTAMP;

-- 向表 sys_logininfor_record 添加缺少的字段 dates
ALTER TABLE sys_logininfor_record ADD COLUMN dates INT(10) UNSIGNED DEFAULT 0 COMMENT '时间戳',ADD INDEX idx_dates (dates);

-- 修改表 sys_menu 的字段 menu_id 为 id
ALTER TABLE sys_menu CHANGE menu_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_menu 的字段 create_time 为 created
ALTER TABLE sys_menu CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_menu 的字段 update_time 为 updated
ALTER TABLE sys_menu CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_notice 的字段 notice_id 为 id
ALTER TABLE sys_notice CHANGE notice_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_notice 的字段 create_time 为 created
ALTER TABLE sys_notice CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_notice 的字段 update_time 为 updated
ALTER TABLE sys_notice CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_oper_log 的字段 oper_id 为 id
ALTER TABLE sys_oper_log CHANGE oper_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 向表 sys_oper_log 添加缺少的字段 created
ALTER TABLE sys_oper_log ADD COLUMN created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_post 的字段 post_id 为 id
ALTER TABLE sys_post CHANGE post_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_post 的字段 create_time 为 created
ALTER TABLE sys_post CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_post 的字段 update_time 为 updated
ALTER TABLE sys_post CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 修改表 sys_role 的字段 role_id 为 id
ALTER TABLE sys_role CHANGE role_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_role 的字段 create_time 为 created
ALTER TABLE sys_role CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_role 的字段 update_time 为 updated
ALTER TABLE sys_role CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 sys_role_dept 添加缺少的字段 id
ALTER TABLE sys_role_dept ADD COLUMN id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,ADD UNIQUE KEY (id);

-- 向表 sys_role_menu 添加缺少的字段 id
ALTER TABLE sys_role_menu ADD COLUMN id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,ADD UNIQUE KEY (id);

-- 修改表 sys_user 的字段 user_id 为 id
ALTER TABLE sys_user CHANGE user_id id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 修改表 sys_user 的字段 create_time 为 created
ALTER TABLE sys_user CHANGE create_time created timestamp DEFAULT CURRENT_TIMESTAMP;

-- 修改表 sys_user 的字段 update_time 为 updated
ALTER TABLE sys_user CHANGE update_time updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 向表 sys_user_post 添加缺少的字段 id
ALTER TABLE sys_user_post ADD COLUMN id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,ADD UNIQUE KEY (id);

-- 向表 sys_user_role 添加缺少的字段 id
ALTER TABLE sys_user_role ADD COLUMN id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,ADD UNIQUE KEY (id);

-- 修改表名 tg_notify_setting 为 tg_notify_config
RENAME TABLE tg_notify_setting TO tg_notify_config;
