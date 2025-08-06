alter table transport_config_info
    add repeat_policy_switch tinyint null comment '重复用户策略开关[0:不开启,1:开启]';

alter table transport_config_info
    add repeat_policy_type varchar(50) null comment '重复策略类型[gp,web2apk]' after repeat_policy_switch;

alter table transport_config_info
    add repeat_days int null comment '多少天内算重复';

alter table transport_config_info
    add repeat_pns varchar(150) null comment '判断重复的pn,逗号分隔,例如:aw,gold';

alter table transport_config_info
    add repeat_channels varchar(255) null comment '判断重复的渠道,逗号分隔,例如:slm_1000,slg_1000';
