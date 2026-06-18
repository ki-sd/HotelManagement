package com.kisd.controller;

import com.kisd.commons.Controller;
import com.kisd.commons.RequestMapping;
import com.kisd.model.EmpService;
import com.kisd.vo.*;

import java.io.PrintWriter;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class EmpController {
    private EmpService empService=new EmpService();

    @RequestMapping("emp/login.do")
    public String empLogin(HttpServletRequest request,HttpServletResponse response){
        String id=request.getParameter("id");
        String pwd=request.getParameter("pwd");

        EmpVO vo=empService.authenticate(id,pwd);
        String state=vo.getMsg();

        try{
            if("OK".equals(state)){
                HttpSession session= request.getSession();
                session.setAttribute("isLogin",true);
                session.setAttribute("loginEmp",vo);
            }
            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.write(state);
            out.flush();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    @RequestMapping("emp/logout.do")
    public void empLogout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        session.invalidate();
        try{
            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.println("yes");
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    @RequestMapping("emp/main.do")
    public String emp_main(HttpServletRequest request,HttpServletResponse response){
        return "/jsp/views/emp/main.jsp";
    }
}
