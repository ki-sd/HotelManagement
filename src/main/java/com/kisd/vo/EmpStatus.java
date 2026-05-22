package com.kisd.vo;

public enum EmpStatus {
    ACTIVE("재직"),
    LEAVE_OF_ABSENCE("휴직"),
    VACATION("휴가"),
    SICK_LEAVE("병가"),
    TERMINATED("퇴사");

    private final String desc;

    EmpStatus(String desc){
        this.desc=desc;
    }
}
