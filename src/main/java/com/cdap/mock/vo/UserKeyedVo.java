package com.cdap.mock.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author suyh
 * @since 2025-01-14
 */
@AllArgsConstructor
@Data
public class UserKeyedVo {
    private String channel;
    private String uid;
}
