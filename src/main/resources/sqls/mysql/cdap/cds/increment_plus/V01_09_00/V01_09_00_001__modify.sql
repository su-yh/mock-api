


ALTER TABLE project
    ADD COLUMN     order_asc     integer NULL DEFAULT 0 COMMENT '排序，值越小优先级越高';


