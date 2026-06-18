package com.kisd.model;

import com.kisd.dao.EmpDAO;
import com.kisd.vo.EmpVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminService {
    public Map<String,Object> getEmpList(String strPage){
        int curpage=(strPage==null)?1:Integer.parseInt(strPage);
        int start=(curpage*20)-20;

        List<EmpVO> list= EmpDAO.empListData(start);
        int total=EmpDAO.empTotalPage();

        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("curpage",curpage);
        resultMap.put("total",total);
        resultMap.put("list",list);
        resultMap.put("start",start);

        return resultMap;
    }
}
