
-- 修改系统管理显示顺序
-- 关键字管理
UPDATE sys_menu SET order_num = 4 WHERE id = 2032;
-- 投放包配置
UPDATE sys_menu SET order_num = 5 WHERE id = 2036;
-- 多系统配置
UPDATE sys_menu SET order_num = 6 WHERE id = 2068;
-- 菜单管理
UPDATE sys_menu SET order_num = 8 WHERE id = 102;
-- TG通知配置
UPDATE sys_menu SET order_num = 9 WHERE id = 2042;
-- 日志管理
UPDATE sys_menu SET order_num = 10 WHERE id = 108;
-- 增加个性化配置页面
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2069, '个性化配置', 1, 7, 'personalizesConfig', 'system/personalizes-config/index', null, 1, 0, 'C', '0', '0', 'system:personalizesConfig:list', 'ant-design:format-painter-outlined', 'admin', '2025-03-07 18:15:32', '', null, '');
