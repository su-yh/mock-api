
update sys_menu set order_num = 8 where menu_id = 1;
update sys_menu set order_num = 19 where menu_id = 2;
update sys_menu set order_num = 20 where menu_id = 3;
update sys_menu set order_num = 3 where menu_id = 2030;
update sys_menu set order_num = 5 where menu_id = 2007;
update sys_menu set order_num = 6 where menu_id = 2018;
update sys_menu set order_num = 3 where menu_id = 2030;

update sys_menu set status = 1 where menu_id = 4;
update sys_menu set status = 1 where menu_id = 103;
update sys_menu set visible = 1 where menu_id = 103;

update sys_menu set is_cache = 0 where menu_id = 2012;


INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2047, '推广', 0, 1, 'popularize', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'ant-design:dollar-outlined', 'admin', '2024-07-04 19:06:36', 'admin', '2024-07-11 16:07:01', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2048, 'Facebook', 2047, 0, 'facebook-manage', 'popularize/facebook/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:facebook-filled', 'admin', '2024-07-04 19:07:54', 'admin', '2024-07-22 15:27:54', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2049, '创建广告', 2047, 1, 'facebook-create', 'popularize/facebook/create/index', NULL, 1, 0, 'C', '1', '0', NULL, 'ant-design:appstore-add-outlined', 'admin', '2024-07-04 19:09:23', 'admin', '2024-07-23 17:35:27', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2050, '任务中心', 2057, 0, 'mission', 'toolbar/mission/list/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:bars-outlined', 'admin', '2024-07-04 19:14:07', 'admin', '2024-07-27 19:00:12', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2051, '资产', 0, 2, 'wealth', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'ant-design:api-filled', 'admin', '2024-07-04 19:14:08', 'admin', '2024-07-11 16:07:09', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2052, 'Facebook', 2051, 0, 'facebook', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'ant-design:facebook-filled', 'admin', '2024-07-04 19:16:27', '', NULL, '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2053, '广告模板管理', 2052, 0, 'ad-template-manage', 'wealth/facebook/ad-template-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:html5-outlined', 'admin', '2024-07-04 19:18:29', 'admin', '2024-07-11 15:58:06', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2054, '创意组管理', 2052, 4, 'creative-group-manage', 'wealth/facebook/creative-group-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:code-sandbox-circle-filled', 'admin', '2024-07-04 19:18:31', 'admin', '2024-07-11 15:59:35', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2055, '地区组管理', 2052, 0, 'district-group-manage', 'wealth/facebook/district-group-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:sliders-twotone', 'admin', '2024-07-04 19:19:44', 'admin', '2024-07-11 15:58:42', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2056, '定向包管理', 2052, 0, 'directed-packet-manage', 'wealth/facebook/directed-packet-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:funnel-plot-filled', 'admin', '2024-07-04 19:20:28', 'admin', '2024-07-11 15:59:03', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2057, '工具', 0, 4, 'toolbar', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'ant-design:solution-outlined', 'admin', '2024-07-27 18:44:10', 'admin', '2024-07-27 18:52:17', '');
