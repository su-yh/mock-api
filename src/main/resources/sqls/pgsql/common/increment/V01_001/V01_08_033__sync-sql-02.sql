




-- 花费表新增字段
alter table adjust_cost_record
    add partner varchar(50);

comment on column adjust_cost_record.partner is '广告投放平台名';

alter table adjust_cost_record
    add ad_account_id varchar(50);

comment on column adjust_cost_record.ad_account_id is '广告账户ID';


