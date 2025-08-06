-- AdTaskTypeEnums 任务类型：创建广告，复制广告
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES (180, '任务类型', 'ad_task_type', '0', 'admin', now(), '', now(), 'AdTaskTypeEnums');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (520, 0, '创建广告', 'CREATE_AD', 'ad_task_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '创建广告');
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES (521, 0, '复制广告', 'COPY_AD', 'ad_task_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '复制广告');

