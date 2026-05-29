package com.kisd.dao;

import com.kisd.util.DBUtil;
import com.kisd.vo.*;

import java.util.*;
import java.sql.*;

public class EmpDAO {

    public List<EmpVO> empListData(){
        List<EmpVO> list=new ArrayList<EmpVO>();
        String sql="SELECT eno,ename,sex,rank,dname,phone,TO_CHAR(regdate,'YYYY-MM-DD') AS regdate,status " +
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
                vo.setEno(rs.getInt("eno"));
                vo.setEname(rs.getString("ename"));
                vo.setSex(rs.getString("sex"));
                vo.getErvo().setRank(rs.getString("rank"));
                vo.getDvo().setDname(rs.getString("dname"));
                vo.setPhone(rs.getString("phone"));
                vo.setStrReg(rs.getString("regdate"));
                vo.getEsvo().setStatus(rs.getString("status"));
                list.add(vo);
            }
            rs.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return list;
    }

    public EmpVO empLoginData(String id,String pwd){
        EmpVO vo=new EmpVO();
        String sql="SELECT eno,ename,sex,phone,email,TO_CHAR(birth_date,'yyyy-mm-dd') AS birth_date,TO_CHAR(regdate,'yyyy-mm-dd') AS regdate,addr1,addr2,rank,dname,status,isadmin,id,pwd " +
                "FROM emp e JOIN emprank r " +
                "ON e.rankno=r.rankno " +
                "JOIN dept d ON e.deptno=d.deptno " +
                "JOIN empstatus s ON e.statuscode=s.statuscode " +
                "WHERE id=?";
        try(Connection conn=DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);){
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                String dbPwd=rs.getString("PWD");
                if(pwd.equals(dbPwd)){
                    vo.setEno(rs.getInt("eno"));
                    vo.setEname(rs.getString("ename"));
                    vo.setSex(rs.getString("sex"));
                    vo.setPhone(rs.getString("phone"));
                    vo.setEmail(rs.getString("email"));
                    vo.setStrBirth(rs.getString("birth_date"));
                    vo.setStrReg(rs.getString("regdate"));
                    vo.setAddr1(rs.getString("addr1"));
                    vo.setAddr2(rs.getString("addr2"));
                    vo.getErvo().setRank(rs.getString("rank"));
                    vo.getDvo().setDname(rs.getString("dname"));
                    vo.getEsvo().setStatus(rs.getString("status"));
                    vo.setIsAdmin(rs.getString("isadmin"));
                    vo.setId(rs.getString("id"));
                    vo.setMsg("OK");
                }else{
                    vo.setMsg("NOPWD");
                }
            }else{
                vo.setMsg("NOID");
            }
            rs.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return vo;
    }
}
