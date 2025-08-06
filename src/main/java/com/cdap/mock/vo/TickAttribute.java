package com.cdap.mock.vo;

import com.cdap.mock.biz.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.SubChannelEntity;
import lombok.Data;

import java.util.List;

/**
 * 一次定时任务所需要的一些基础的初始数据
 *
 * @author suyh
 * @since 2024-12-16
 */
@Data
public class TickAttribute {
    private ProjectPlusEntity projectPlusEntity; // 项目
    private AdAdvertiserEntity advertiserEntity;  // 固定该项目对应的投放方
    private List<SubChannelEntity> subChannelEntities;   // 该项目对应的SubChannel
}
