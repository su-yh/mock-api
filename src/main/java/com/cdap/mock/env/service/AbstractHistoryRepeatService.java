package com.cdap.mock.env.service;

import lombok.extern.slf4j.Slf4j;

import java.util.Random;

/**
 * @author suyh
 * @since 2025-01-15
 */
@Slf4j
public abstract class AbstractHistoryRepeatService {
    protected final Random random = new Random();
}
