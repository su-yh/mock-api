alter table public.adjust_cost_record
    add advertiser varchar(100);

comment on column public.adjust_cost_record.advertiser is '投放方';