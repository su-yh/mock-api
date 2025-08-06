package com.cdap.mock.constants;

public interface DataSourceNames {
	// 当前管理平台所需要的数据库，且该数据库需要是默认数据库
	String MASTER = "master";

	// 每个环境对应的两个数据库
	String FLINK_CDS = "flink-cds";
	String FLINK_PG_CDAP = "flink-pg-cdap";
}

