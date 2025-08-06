

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2063, '账户管理', 2052, 0, 'account-manage', 'wealth/facebook/account-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:gold-outlined', 'admin', '2024-08-30 16:32:41', 'admin', '2024-08-31 19:38:51', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2064, '产品管理', 2052, 1, 'product-manage', 'wealth/facebook/product-manage/index', NULL, 1, 0, 'C', '0', '0', NULL, 'ant-design:profile-outlined', 'admin', '2024-08-30 16:47:27', 'admin', '2024-08-30 16:48:35', '');
update sys_menu set order_num = 2 where menu_id = 2053;
update sys_menu set order_num = 3 where menu_id = 2055;
update sys_menu set order_num = 4 where menu_id = 2056;
update sys_menu set order_num = 5 where menu_id = 2054;


delete from sys_menu where menu_id = 103;
delete from sys_menu where menu_id = 1016;
delete from sys_menu where menu_id = 1017;
delete from sys_menu where menu_id = 1018;
delete from sys_menu where menu_id = 1019;

delete from sys_menu where menu_id = 2011;
delete from sys_menu where menu_id = 2012;
delete from sys_menu where menu_id = 2013;
delete from sys_menu where menu_id = 2014;
delete from sys_menu where menu_id = 2015;
delete from sys_menu where menu_id = 2016;


delete from sys_menu where menu_id = 2018;
delete from sys_menu where menu_id = 2019;
delete from sys_menu where menu_id = 2020;
delete from sys_menu where menu_id = 2021;
delete from sys_menu where menu_id = 2022;