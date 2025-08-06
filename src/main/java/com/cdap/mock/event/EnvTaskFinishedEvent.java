package com.cdap.mock.event;

import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Getter
public class EnvTaskFinishedEvent extends ApplicationEvent {
    private final String env;

    public EnvTaskFinishedEvent(String env) {
        super("");

        this.env = env;
    }
}
