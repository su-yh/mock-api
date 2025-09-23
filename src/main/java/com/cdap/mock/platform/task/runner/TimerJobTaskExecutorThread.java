package com.cdap.mock.platform.task.runner;

import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.util.IdGenerator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;

import java.util.concurrent.TimeUnit;

@Slf4j
public class TimerJobTaskExecutorThread extends AbstractTaskExecutor {

    public TimerJobTaskExecutorThread(
            ApplicationContext context,
            MockPropertiesEntity mockPropertiesEntity,
            IdGenerator idGenerator) {
        super(context, mockPropertiesEntity, idGenerator);
    }

    @Override
    protected void doRun() {
        long lastTs = 0L;
        while (true) {
            if (stopFlag.get()) {
                log.info("STOP FLAG is true.");
                break;
            }

            try {
                TimeUnit.MILLISECONDS.sleep(10);
            } catch (InterruptedException e) {
                log.warn("wait Interrupted.", e);
            } catch (Exception e) {
                log.error("some exception happened.", e);
            }

            // 超过间隔时间才可以执行下一次的tick 任务
            long curTs = System.currentTimeMillis();
            if (curTs - lastTs > INTERVAL_MILLIS) {
                mockDataTask.doDataMockTick(curTs);
                lastTs = System.currentTimeMillis();
            }
        }
    }
}
