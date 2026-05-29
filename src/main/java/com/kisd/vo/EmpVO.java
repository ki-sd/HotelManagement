package com.kisd.vo;

//ENO
//        ENAME
//SEX
//        RANKNO
//DEPTNO
//        PHONE
//EMAIL
//        BIRTH_DATE
//REGDATE
//        ADDR1
//ADDR2
//        ISADMIN
//STATUSCODE

import lombok.Data;

import java.util.Date;
@Data
public class EmpVO {
    private int eno,deptno,rankno,statuscode;
    private String ename,sex,phone,email,strBirth,strReg,addr1,addr2,isAdmin,id,pwd,msg;
    private Date birthdate,regdate;
    private DeptVO dvo=new DeptVO();
    private EmpStatusVO esvo=new EmpStatusVO();
    private EmpRankVO ervo=new EmpRankVO();
}
