

# data-mock 程序生成数据时，会大量查询 tb_user 并且基于ctime ，所以为其加一个索引。
ALTER TABLE tb_user ADD INDEX idx_ctime(ctime);

