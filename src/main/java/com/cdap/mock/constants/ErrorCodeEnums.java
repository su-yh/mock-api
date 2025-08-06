package com.cdap.mock.constants;

import com.base.web.error.IErrorCode;

/**
 * @author suyh
 * @since 2025-07-29
 */
public enum ErrorCodeEnums implements IErrorCode {
    ITEM_NOT_FOUND(2_100_001, "{0}不存在（{1}）"),
    ITEM_DUPLICATE(2_100_002, "{0}已存在（{1}）"),
    ITEM_DISABLED(2_100_003, "{0}已禁用（{1}）"),

    ;

    private final int code;
    private final String msg;

    ErrorCodeEnums(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
