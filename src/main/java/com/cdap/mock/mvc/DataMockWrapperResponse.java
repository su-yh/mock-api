package com.cdap.mock.mvc;

import com.base.web.response.wrapper.WrapperResponseScanPackages;
import com.cdap.mock.platform.controller.MockEnvConfigController;

import java.util.Collection;
import java.util.Collections;

/**
 * @author suyh
 * @since 2025-08-06
 */
public class DataMockWrapperResponse implements WrapperResponseScanPackages {
    @Override
    public Collection<String> getScanPackages() {
        return Collections.singletonList(MockEnvConfigController.class.getPackage().getName());
    }
}
