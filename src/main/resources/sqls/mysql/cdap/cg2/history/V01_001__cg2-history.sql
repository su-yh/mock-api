

create table taurus_channel
(
    id               int auto_increment comment '自增id'
        primary key,
    channelid        varchar(100)                                                                                      not null comment '渠道号',
    origin_file_name varchar(1000)                                                                                     not null comment '母包原始文件文件名，不带.apk',
    size             int                                                                                               not null comment '母包大小',
    out_path         varchar(1000)                                                                                     not null comment '输出文件夹路径',
    dir              varchar(1000)                                                                                     not null comment '生成apk的放置目录',
    pkg              varchar(255) charset ascii  default 'com.rummy.game.pro896.mkswo45m'                              null comment '包名',
    origin_file_path varchar(1024) charset ascii default '/opt/origin_apks/com.rummy.game.pro896.mkswo45m/3100003.apk' null comment '母包完整路径',
    is_default       int                         default 0                                                             not null comment '是否包名对应的默认渠道, 0-否, 1-是',
    pn               varchar(255)                                                                                      null comment '渠道号所属pn'
);


