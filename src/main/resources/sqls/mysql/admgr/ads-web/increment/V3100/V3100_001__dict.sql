-- KanbanColumnClassEnums
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (189, '看板:列类', 'kanban_column_class', '0', 'admin', now(), '', now(), 'KanbanColumnClassEnums');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (650, 0, '投放', 'DELIVERY', 'kanban_column_class', '', 'primary', 'N', '0', 'admin', now(), '', now(), '看板:列类-投放');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (651, 1, '素材', 'MATERIAL', 'kanban_column_class', '', 'primary', 'N', '0', 'admin', now(), '', now(), '看板:列类-素材');

-- KanbanColumnTypeEnums
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (190, '看板：列类型', 'kanban_column_type', '0', 'admin', now(), '', now(), 'KanbanColumnTypeEnums');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (655, 0, '维度', 'DIMENSION', 'kanban_column_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '看板:列类型-维度');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (656, 1, '指标', 'INDICATORS', 'kanban_column_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '看板:列类型-指标');


-- 路由
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2073, '看板', 0, 0, 'panel', null, null, 1, 0, 'M', '0', '0', null, 'ant-design:bar-chart-outlined', 'admin', '2025-05-06 10:28:58', 'admin', '2025-05-09 10:39:50', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2074, '广告数据', 2073, 0, 'delivery-data', 'panel/delivery-data/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:area-chart-outlined', 'admin', '2025-05-06 10:35:32', 'admin', '2025-05-12 14:21:42', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2075, '素材数据', 2073, 1, 'material-data', 'panel/material-data/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:picture-filled', 'admin', '2025-05-06 15:53:43', 'admin', '2025-05-09 17:15:01', '');

