package com.cdap.mock.event;

import com.cdap.mock.biz.dao.cdappgsql.entity.AdAdvertiserEntity;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;
import org.springframework.lang.NonNull;

import java.util.List;

/**
 * @author suyh
 * @since 2025-03-18
 */
@Getter
public class AdvertiserCreatedEvent extends ApplicationEvent {
    private final List<AdAdvertiserEntity> entities;

    public AdvertiserCreatedEvent(@NonNull List<AdAdvertiserEntity> entities) {
        super(entities);
        this.entities = entities;
    }
}
