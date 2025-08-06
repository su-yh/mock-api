
-- 删除路由
-- 备用
# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2007, '广告工具', 0, 5, 'ads', null, '', 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-09-19 10:46:39', 'admin', '2024-07-27 18:45:05', '广告工具目录');

# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2008, '文件上传管理', 2007, 1, 'ads/file', null, null, 1, 0, 'M', '0', '0', '', 'upload', 'admin', '2023-09-27 17:15:33', 'admin', '2023-09-27 17:24:46', '');

# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2009, '文件上传', 2008, 1, 'ads/file/upload', 'ads/file/upload/index', null, 1, 0, 'C', '0', '0', '', 'upload', 'admin', '2023-09-27 17:16:34', 'admin', '2023-09-27 17:17:43', '');
# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2010, '文件列表', 2008, 2, 'ads/file/view', 'ads/file/view/index', null, 1, 0, 'C', '0', '0', null, 'dashboard', 'admin', '2023-09-27 17:17:33', '', null, '');
# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2023, '素材类型配置', 2008, 4, 'ads/file/asseettype', 'ads/file/assettype/index', null, 1, 0, 'C', '0', '0', '', 'system', 'admin', '2024-01-25 02:49:15', 'admin', '2024-01-25 06:16:26', '');
# INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# VALUES (2024, '素材场景配置', 2008, 6, 'ads/file/assetscenes', 'ads/file/assetscenes/index', null, 1, 0, 'C', '0', '0', '', 'time', 'admin', '2024-01-25 03:37:25', 'admin', '2024-01-25 06:16:39', '');

-- 删除以前的广告工具
delete from sys_menu where menu_id in(2007,2008,2009,2010,2023,2024);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2067, '素材库', 2051, 1, 'material', 'wealth/material/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:folder-outlined', 'admin', '2024-11-29 18:25:21', '', null, '');

