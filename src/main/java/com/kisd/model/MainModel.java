package com.kisd.model;

import com.kisd.controller.Controller;
import com.kisd.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {

    @RequestMapping("main/main.do")
    public String mainHome(HttpServletRequest request, HttpServletResponse response) {
        return "../jsp/home.jsp";
    }
}