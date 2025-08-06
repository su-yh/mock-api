模拟数据生成程序
java -jar -Xmx512m -Xms256m flink-data-mock-1.0.1.jar --spring.profiles.active=beta > log.file 2>&1 &

tb_user 表中没有ctime 的索引，在后面的速度会非常之慢，所以需要给tb_user 加一个 ctime 的索引，以提升查询速度。

-- 带子模块一起克隆
git clone --recurse-submodules git@192.168.8.134:aiteer/flink-data-mock.git


配置子模块私有地址
    git config submodule.flyway-cds-sql.url git@192.168.8.134:aiteer/flyway-cds-sql.git
初始化子模块
    git submodule init
    git submodule update



