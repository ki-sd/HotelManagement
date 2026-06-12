package com.kisd.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.kisd.vo.*;
import com.kisd.dao.*;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EmpModel {
    public void empList(HttpServletRequest request){
        String strPage=request.getParameter("page");
        if(strPage==null)
            strPage="1";
        int curpage=Integer.parseInt(strPage);
        int start=(curpage*20)-20;
        List<EmpVO> list=EmpDAO.empListData(start);
        int total=EmpDAO.empTotalPage();

        request.setAttribute("curpage",curpage);
        request.setAttribute("total",total);
        request.setAttribute("list",list);
        request.setAttribute("start",start);

    }
    public void empLogin(HttpServletRequest request, HttpServletResponse response){
        String id=request.getParameter("id");
        String pwd=request.getParameter("pwd");
        EmpVO vo=EmpDAO.empLoginData(id,pwd);
        Boolean isLogin=false;
        String state="";
        String msg = (vo.getMsg() != null) ? vo.getMsg() : "";
        switch (msg) {
            case "OK"    -> {
                isLogin=true;
            }
            case "NOID"  -> {
                state="NOID";
            }
            case "NOPWD" -> {
                state="NOPWD";
            }
            default      -> {
                state="UNKNOWN";
            }
        }
        HttpSession session= request.getSession();
        session.setAttribute("isLogin",isLogin);
        session.setAttribute("vo",vo);
        request.setAttribute("state",state);

    }
}
