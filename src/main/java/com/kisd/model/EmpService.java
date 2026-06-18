package com.kisd.model;
import java.util.*;
import com.kisd.dao.EmpDAO;
import com.kisd.vo.EmpVO;
public class EmpService {
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
