package com.kisd.controller;

import com.kisd.commons.Controller;
import com.kisd.commons.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainController {

    @RequestMapping("main/main.do")
    public String mainHome(HttpServletRequest request, HttpServletResponse response) {
        return "../jsp/home.jsp";
    }
}