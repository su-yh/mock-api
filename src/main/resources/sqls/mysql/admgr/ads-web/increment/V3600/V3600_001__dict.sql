
-- SplitModeEnums
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (202, '拆分模式', 'split_mode_type', '0', 'admin', now(), '', now(), '拆分模式-SplitModeEnums');


INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (725, 1, '排列组合', 'PERMUTATION_COMBINATION', 'split_mode_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '凭证来源类型-自动上报');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (726, 2, '全排列', 'PERMUTATION', 'split_mode_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '凭证来源类型-手动录入');

-- 更换路由
update sys_menu set parent_id = 2073, order_num= 2 where id = 2031;
update sys_menu set visible = 1 where id = 2030;
