package com.cdap.mock.platform.service;

import com.cdap.mock.platform.dao.mgr.mapper.EnvRabbitmqPropertiesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author suyh
 * @since 2025-08-06
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class EnvRabbitmqPropertiesService {
    private final EnvRabbitmqPropertiesMapper envRabbitmqPropertiesMapper;
}
