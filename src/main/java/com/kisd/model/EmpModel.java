package com.kisd.model;

import com.kisd.controller.Controller;
import com.kisd.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.kisd.vo.*;
import com.kisd.dao.*;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class EmpModel {
    @RequestMapping("emp/list.do")
    public String empList(HttpServletRequest request,HttpServletResponse response){
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

        return "../emp/list.jsp";
    }
    @RequestMapping("emp/login.do")
    public String empLogin(HttpServletRequest request, HttpServletResponse response){
        String id=request.getParameter("id");
        String pwd=request.getParameter("pwd");
        EmpVO vo=EmpDAO.empLoginData(id,pwd);

        if(vo==null){
            request.setAttribute("state","UNKNOWN");
            return "../emp/login.jsp";
        }

        String state="";
        String msg = (vo.getMsg() != null) ? vo.getMsg() : "";
        switch (msg) {
            case "OK"    -> state="OK";
            case "NOID"  -> state="NOID";
            case "NOPWD" -> state="NOPWD";
            default      -> state="UNKNOWN";
        }
        if("OK".equals(state)) {
            HttpSession session = request.getSession();
            session.setAttribute("isLogin", true);
            session.setAttribute("vo", vo);

            return "redirect:../main/main.do";
        }else {
            request.setAttribute("state", state);
            return "../emp/login.jsp";
        }
    }
}
