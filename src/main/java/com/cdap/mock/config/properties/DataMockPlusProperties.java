//package com.cdap.mock.config.properties;
//
//import com.cdap.mock.constants.MockModeEnums;
//import lombok.Data;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.validation.annotation.Validated;
//
//import javax.validation.constraints.NotNull;
//import java.time.LocalDateTime;
//
///**
// * @author suyh
// * @since 2024-04-12
// */
//@ConfigurationProperties("data.mock.plus")
//@Data
//@Validated
//public class DataMockPlusProperties {
//    @NotNull
//    private MockModeEnums mockMode;
//
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime timeBegin;
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime timeEnd;
//
//    // 每个channel 的sub channel 数量
//    private int subChannelCount = 5;
//
//    @NotNull
//    private Integer randomTbUser;
//    @NotNull
//    private Integer randomTbUserLogin;
//    @NotNull
//    private Integer randomTbWithdrawal;
//    @NotNull
//    private Integer randomTbRecharge;
//
//    private boolean rmqEnabled = false;
//}
