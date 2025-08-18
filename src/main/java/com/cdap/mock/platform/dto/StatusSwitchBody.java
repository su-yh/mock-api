package com.cdap.mock.platform.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author suyh
 * @since 2025-08-18
 */
@Data
public class StatusSwitchBody {
    @NotNull
    private Long id;

    @NotNull
    private Boolean enabled;
}
