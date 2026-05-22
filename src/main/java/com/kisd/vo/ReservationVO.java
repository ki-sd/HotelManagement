package com.kisd.vo;

import lombok.Data;

import java.util.*;
@Data
public class ReservationVO {
    private int rvno,cno,rno,eno,totalPrice;
    private String strPrice,strStart,strEnd,rvStatus;
    private Date startDate,endDate;
    private CustomerVO cvo=new CustomerVO();
    private RoomVO rvo=new RoomVO();
    private EmpVO evo=new EmpVO();
}
