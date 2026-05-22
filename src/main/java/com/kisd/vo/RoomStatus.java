package com.kisd.vo;

public enum RoomStatus {
    AVAILABLE("예약가능"),
    OCCUPIED("예약됨"),
    CLEANING("청소중"),
    REPAIRING("수리중");

    private final String desc;

    RoomStatus(String desc){
        this.desc=desc;
    }
}
