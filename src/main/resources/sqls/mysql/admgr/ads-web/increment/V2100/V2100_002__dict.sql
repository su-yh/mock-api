-- 增加隐私政策管页面
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2068, '多系统配置', 1, 5, 'systemConfig', 'system/systemConfig/index', null, 1, 0, 'C', '0', '0', 'system:systemConfig:list', 'ant-design:reconciliation-outlined', 'admin', '2025-02-24 17:50:35', 'admin', '2025-03-05 20:05:26', '');
