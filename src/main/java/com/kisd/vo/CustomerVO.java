package com.kisd.vo;
import lombok.Data;

import java.util.*;
@Data
public class CustomerVO {
    private int cno;
    private String cname,sex,phone,email,strBirth,strReg,addr1,addr2,gno,id,pwd;
    private CustStatus status;
    private Date birthdate,regdate;

    private GradeVO gvo=new GradeVO();
}
