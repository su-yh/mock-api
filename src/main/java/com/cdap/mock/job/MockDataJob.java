//package com.cdap.mock.job;
//
//import com.cdap.mock.config.properties.DataMockPlusProperties;
//import com.cdap.mock.constants.MockModeEnums;
//import com.cdap.mock.util.CdapStopWatch;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.boot.ApplicationArguments;
//import org.springframework.boot.ApplicationRunner;
//import org.springframework.context.ConfigurableApplicationContext;
//
//import java.time.LocalDateTime;
//import java.time.ZoneId;
//import java.util.concurrent.Executors;
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.TimeUnit;
//
///**
// * @author suyh
// * @since 2024-11-19
// */
//@RequiredArgsConstructor
////@Component
//@Slf4j
//public class MockDataJob implements ApplicationRunner {
//    private final static long INTERVAL_MILLIS = 60_000L;
//
//    private final ConfigurableApplicationContext context;
//    private final DataMockPlusProperties properties;
//    private final MockDataTask mockDataTask;
//
//    public void dataMockTick() {
//        try {
//            long currentTimeMillis = System.currentTimeMillis();
//            mockDataTask.doDataMockTick(currentTimeMillis);
//        } catch (Exception e) {
//            log.error("some exception happened.", e);
//        }
//    }
//
//    @Override
//    public void run(ApplicationArguments args) throws Exception {
//        MockModeEnums mockMode = properties.getMockMode();
//
//        log.info("CURRENT DATA MOCK MODE: {}.", properties.getMockMode());
//
//        switch (mockMode) {
//            case TIMER_JOB:
//                mockByTimeJob();
//            break;
//            case DATE_RAGE:
//                mockByDateRage();
//            break;
//            case NONE:
//            default:
//                log.info("DATA MOCK IS DISABLED.");
//                break;
//        }
//    }
//
//    private void mockByTimeJob() {
//        ScheduledExecutorService scheduledExecutor = Executors.newSingleThreadScheduledExecutor();
//        scheduledExecutor.scheduleWithFixedDelay(
//                this::dataMockTick, 20_000, INTERVAL_MILLIS, TimeUnit.MILLISECONDS);
//    }
//
//    private void mockByDateRage() {
//        CdapStopWatch stopWatch = new CdapStopWatch("dateRage");
//        try {
//            log.info("MOCK RANGE START...");
//            stopWatch.start();
//            doMockByDateRage(INTERVAL_MILLIS);
//        } catch (Exception e) {
//            log.error("SOME EXCEPTION HAPPENED.", e);
//            throw new RuntimeException(e);
//        } finally {
//            stopWatch.stop();
//            log.info("\n" +
//                    "##########################\n" +
//                    "# MOCK RANGE FINISHED. \n" +
//                    "##########################\n" +
//                    "{}",
//                    stopWatch.prettyPrint());
//
//            context.close();
//        }
//    }
//
//    public void doMockByDateRage(long intervalMillis) {
//        Long timestampBegin = mockDataTask.obtainDateRangeTimeBegin();
//        LocalDateTime timeEnd = properties.getTimeEnd();
//        if (timestampBegin == null || timeEnd == null) {
//            log.error("timeBegin: {}, timeEnd: {}", timestampBegin, timeEnd);
//            return;
//        }
//
//        ZoneId zoneId = ZoneId.systemDefault();
//        long timestampEnd = timeEnd.atZone(zoneId).toEpochSecond() * 1000L;
//        for (long timestamp = timestampBegin; timestamp < timestampEnd; timestamp += intervalMillis) {
//            mockDataTask.doDataMockTick(timestamp);
//        }
//    }
//}
