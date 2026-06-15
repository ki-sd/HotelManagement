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

        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        // 1. DB에서 회원 정보 조회
        EmpVO vo = EmpDAO.empLoginData(id, pwd);

        // 2. 상태 코드 판별
        String state = "UNKNOWN";
        if(vo != null && vo.getMsg() != null){
            switch (vo.getMsg()) {
                case "OK"    -> state = "OK";
                case "NOID"  -> state = "NOID";
                case "NOPWD" -> state = "NOPWD";
            }
        }

        try {
            // 3. 로그인 성공 시에만 세션 발급
            if("OK".equals(state)) {
                HttpSession session = request.getSession();
                session.setAttribute("isLogin", true);
                session.setAttribute("user", vo);
            }

            // ⭕ 4. [핵심] 화면 주소가 아니라, 상태 코드("OK", "NOID" 등)를 텍스트로 직접 출력해서 AJAX에게 쏴줍니다.
            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.write(state);
            out.flush();

        } catch(Exception ex) {
            ex.printStackTrace();
        }

        // ⭕ 5. [핵심] null을 리턴하면 프론트 컨트롤러(DispatcherServlet)가 화면 이동을 생략하고 제자리에 멈춥니다.
        return null;
    }
}
