package com.kisd.dao;

import com.kisd.util.DBUtil;
import com.kisd.vo.*;

import java.util.*;
import java.sql.*;

public class EmpDAO {

    public List<EmpVO> empListData(){
        List<EmpVO> list=new ArrayList<EmpVO>();
        String sql="SELECT eno,ename,sex,rank,dname,phone,TO_CHAR(regdate,'YYYY-MM-DD'),status " +
                "FROM emp e "
                +"JOIN emprank r ON e.rankno=r.rankno " +
                "JOIN empstatus es ON e.statuscode=es.statuscode " +
                "JOIN dept d ON e.deptno=d.deptno "+
                "ORDER BY eno";
        try(Connection conn= DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);){
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                EmpVO vo=new EmpVO();
                vo.setEno(rs.getInt(1));
                vo.setEname(rs.getString(2));
                vo.setSex(rs.getString(3));
                vo.getErvo().setRank(rs.getString(4));
                vo.getDvo().setDname(rs.getString(5));
                vo.setPhone(rs.getString(6));
                vo.setStrReg(rs.getString(7));
                vo.getEsvo().setStatus(rs.getString(8));
                list.add(vo);
            }
            rs.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return list;
    }
}
