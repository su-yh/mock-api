package com.cdap.mock.platform.task.runner;

import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.util.CdapStopWatch;
import com.cdap.mock.util.IdGenerator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;

@Slf4j
public class TimestampRangeTaskExecutorThread extends AbstractTaskExecutor {
    public TimestampRangeTaskExecutorThread(
            ApplicationContext context,
            MockPropertiesEntity mockPropertiesEntity,
            EnvDatasourcePropertiesEntity cdsDataSource,
            EnvDatasourcePropertiesEntity pgDataSource,
            IdGenerator idGenerator) {
        super(context, mockPropertiesEntity, cdsDataSource, pgDataSource, idGenerator);
    }

    @Override
    protected void doRun() {
        mockByDateRage();
    }


    private void mockByDateRage() {
        CdapStopWatch stopWatch = new CdapStopWatch("dateRage");
        try {
            log.info("MOCK RANGE START...");
            stopWatch.start();
            doMockByDateRage(INTERVAL_MILLIS);
        } catch (Exception e) {
            log.error("SOME EXCEPTION HAPPENED.", e);
            throw new RuntimeException(e);
        } finally {
            stopWatch.stop();
            log.info("\n" +
                            "##########################\n" +
                            "# MOCK RANGE FINISHED. \n" +
                            "##########################\n" +
                            "{}",
                    stopWatch.prettyPrint());
        }
    }

    public void doMockByDateRage(long intervalMillis) {
        Long timestampBegin = mockDataTask.obtainDateRangeTimeBegin();
        if (timestampBegin == null) {
            log.error("timeBegin is null}");
            return;
        }

        long timestampEnd = mockPropertiesEntity.getTsEnd();

        for (long timestamp = timestampBegin; timestamp < timestampEnd; timestamp += intervalMillis) {
            if (stopFlag.get()) {
                log.info("STOP FLAG is true.");
                break;
            }

            mockDataTask.doDataMockTick(timestamp);
        }
    }
}
