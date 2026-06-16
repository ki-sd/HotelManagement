package com.kisd.model;

import com.kisd.controller.Controller;
import com.kisd.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import java.io.*;
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

        return "/jsp/views/emp/list.jsp";
    }
    @RequestMapping("emp/login.do")
    public String empLogin(HttpServletRequest request, HttpServletResponse response){

        String id=request.getParameter("id");
        String pwd=request.getParameter("pwd");

        EmpVO vo=EmpDAO.empLoginData(id, pwd);

        String state="UNKNOWN";
        if(vo!=null && vo.getMsg()!=null){
            switch (vo.getMsg()) {
                case "OK"    -> state="OK";
                case "NOID"  -> state="NOID";
                case "NOPWD" -> state="NOPWD";
            }
        }

        try {
            if("OK".equals(state)) {
                HttpSession session=request.getSession();
                session.setAttribute("isLogin", true);
                session.setAttribute("user", vo);
            }

            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.write(state);
            out.flush();

        } catch(Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }
    @RequestMapping("emp/logout.do")
    public void empLogout(HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        session.invalidate();
        try{
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out=response.getWriter();
            out.println("yes");
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
