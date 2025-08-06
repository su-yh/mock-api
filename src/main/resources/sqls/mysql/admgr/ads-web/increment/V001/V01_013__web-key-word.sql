
CREATE TABLE ad_keyword  (
  id bigint NOT NULL AUTO_INCREMENT,
  keyword varchar(255) NOT NULL,
  key_desc varchar(255) NULL COMMENT '描述',
  create_by varchar(64) NULL,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  update_by varchar(64) NULL,
  update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) engine=innodb comment = '关键字管理';;

ALTER TABLE ad_keyword
    ADD UNIQUE INDEX index_key(keyword) USING BTREE;


