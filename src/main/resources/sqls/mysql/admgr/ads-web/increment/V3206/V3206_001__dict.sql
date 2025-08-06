
-- TaskExecutionStatus
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (198, '凭证来源类型', 'credential_source_type', '0', 'admin', now(), '', now(), '凭证来源类型-CredentialSourceType');


INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (691, 1, '自动上报', 'AUTO', 'credential_source_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '凭证来源类型-自动上报');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (692, 1, '手动录入', 'MANUAL', 'credential_source_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '凭证来源类型-手动录入');
