package com.kisd.dao;

import com.kisd.commons.DBUtil;
import com.kisd.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;

import java.util.*;
import java.sql.*;

public class EmpDAO {

    public static List<EmpVO> empListData(int start){
        List<EmpVO> list=new ArrayList<EmpVO>();
        try(SqlSession session=DBUtil.getSqlSessionFactory().openSession()){
            list=session.selectList("empListData",start);
        }catch(Exception ex){
            ex.printStackTrace();
            ex.getMessage();
        }
        return list;
    }
    public static int empTotalPage(){
        int total=0;
        try(SqlSession session=DBUtil.getSqlSessionFactory().openSession()){
            total=session.selectOne("empTotalPage");
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return total;
    }

    public static EmpVO empLoginData(String id,String pwd){
        EmpVO vo=new EmpVO();
        try(SqlSession session=DBUtil.getSqlSessionFactory().openSession()){
            EmpVO dbVo=session.selectOne("empLoginData",id);
            if(dbVo!=null){
                String dbPwd=dbVo.getPwd();
                boolean isMatch= BCrypt.checkpw(pwd,dbPwd);
                if(isMatch){
                    vo=dbVo;
                    vo.setMsg("OK");
                }else{
                    vo.setMsg("NOPWD");
                }
            }else{
                vo.setMsg("NOID");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return vo;
    }
}
