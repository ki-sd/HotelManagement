package com.kisd.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.kisd.vo.*;
import com.kisd.dao.*;

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
}
