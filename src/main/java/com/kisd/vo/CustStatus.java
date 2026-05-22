package com.kisd.vo;

public enum CustStatus {
    AVAILABLE("Y"),
    TERMINATED("N");

    private final String dbValue;

    CustStatus(String dbValue){
        this.dbValue= dbValue;
    }
}
