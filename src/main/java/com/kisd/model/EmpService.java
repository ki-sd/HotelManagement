package com.kisd.model;
import java.util.*;
import com.kisd.dao.EmpDAO;
import com.kisd.vo.EmpVO;
public class EmpService {
    public Map<String,Object> getEmpList(String strPage){
        int curpage=(strPage==null)?1:Integer.parseInt(strPage);
        int start=(curpage*20)-20;

        List<EmpVO> list=EmpDAO.empListData(start);
        int total=EmpDAO.empTotalPage();

        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("curpage",curpage);
        resultMap.put("total",total);
        resultMap.put("list",list);
        resultMap.put("start",start);

        return resultMap;
    }
    public EmpVO authenticate(String id,String pwd){
        EmpVO vo=EmpDAO.empLoginData(id,pwd);
        if(vo!=null&&vo.getMsg()!=null){
            return vo;
        }
        EmpVO errorVO=new EmpVO();
        errorVO.setMsg("UNKNOWN");
        return errorVO;
    }
}
