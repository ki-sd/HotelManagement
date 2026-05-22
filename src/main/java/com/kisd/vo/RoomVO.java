package com.kisd.vo;

import lombok.Data;

@Data
public class RoomVO {
    private int rno,tno,sno;
    private RoomStatusVO rsvo=new RoomStatusVO();
    private RoomTypeVO rtvo=new RoomTypeVO();
}
