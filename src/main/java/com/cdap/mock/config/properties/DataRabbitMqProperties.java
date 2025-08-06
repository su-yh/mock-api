package com.cdap.mock.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

@ConfigurationProperties("mq.flink.produce")
@Data
@Validated
public class DataRabbitMqProperties {

    private String commonExchange;
    //     # user login
    private String userLoginRoutingkey;

   //     # user recharge
    private String userRechargeRoutingkey;

    //    # user registry
    private String userRegistryRoutingkey;

    //    # user withdrawal
    private String userWithdrawalRoutingkey;
}
