package com.kisd.controller;

import com.kisd.commons.Controller;
import com.kisd.commons.RequestMapping;
import com.kisd.model.AdminService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Map;

@Controller
public class AdminController {
    private AdminService adminService = new AdminService();

    @RequestMapping("admin/main.do")
    public String admin_main(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("main_jsp","/jsp/views/admin/main.jsp");
        return "/jsp/views/admin/home.jsp";
    }
    @RequestMapping("admin/list.do")
    public String empList(HttpServletRequest request, HttpServletResponse response){
        String strPage=request.getParameter("page");
        Map<String,Object> result=adminService.getEmpList(strPage);

        request.setAttribute("curpage",result.get("curpage"));
        request.setAttribute("total",result.get("total"));
        request.setAttribute("list",result.get("list"));
        request.setAttribute("start",result.get("start"));
        request.setAttribute("main_jsp","/jsp/views/admin/list.jsp");

        return "/jsp/views/admin/home.jsp";
    }
}
