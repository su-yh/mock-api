
-- 隐藏路由
update sys_menu SET visible = '1' where menu_id in(104,105,106,107);

-- 修改投放包配置图标
UPDATE sys_menu SET icon = 'ant-design:codepen-outlined' WHERE menu_id = 2036;
