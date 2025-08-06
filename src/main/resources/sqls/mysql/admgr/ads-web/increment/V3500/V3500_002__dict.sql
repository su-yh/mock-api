-- 增加路由

INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, is_recommend, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2088, '系统运维', 1, 0, 'systemOM', null, null, 1, 0, 'M', '0', '0', 0, null, 'ant-design:code-outlined', 'admin', '2025-06-25 11:11:45', '', '2025-06-25 11:11:45', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, is_recommend, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2089, '同步配置', 2088, 0, 'syncConfig', 'system/systemOM/syncConfig/index', null, 1, 0, 'C', '0', '0', 0, 'system:systemOM:syncConfig', 'ant-design:node-index-outlined', 'admin', '2025-06-25 11:13:33', 'admin', '2025-06-25 11:14:08', '');

INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, is_recommend, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2090, '数据同步任务', 2057, 1, 'dataSyncTask', 'toolbar/data-sync-task/index', null, 1, 0, 'C', '0', '0', 0, null, 'ant-design:cloud-sync-outlined', 'admin', '2025-07-03 09:36:37', 'admin', '2025-07-03 09:36:45', '');

-- 新增同步枚举
-- SyncStatusEnums
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (201, '同步服务：同步状态', 'sync_status', '0', 'admin', now(), '', now(), '同步服务api-SyncStatusEnums');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (715, 0, '进行中', 'RUNNING', 'sync_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步服务：同步状态');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (716, 1, '排队中', 'PENDING', 'sync_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步服务：同步状态');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (717, 2, '停止中', 'STOPPING', 'sync_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步服务：同步状态');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (718, 3, '已停止', 'STOPPED', 'sync_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步服务：同步状态');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (719, 4, '已完成', 'COMPLETE', 'sync_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步服务：同步状态');

-- 不需要半自动
UPDATE sys_dict_data SET  status = '1' WHERE id = 512;
-- 改为自动
UPDATE sys_dict_data SET  dict_label = '自动' WHERE id = 513;

-- 修改父目录
update sys_menu set parent_id = 2088, order_num= 4 where id = 2068;
update sys_menu set parent_id = 2088, order_num= 3 where id = 2069;
update sys_menu set parent_id = 2088, order_num= 2 where id = 2042;
update sys_menu set parent_id = 2088, order_num= 5 where id = 500;
update sys_menu set parent_id = 2088, order_num= 6 where id = 501;
-- 隐藏菜单
update sys_menu set visible = 1 where id = 108;
-- 修改顺序
update sys_menu set order_num = 4 where id = 102;
