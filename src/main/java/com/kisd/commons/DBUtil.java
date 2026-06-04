package com.kisd.commons;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DBUtil {

    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            String resource = "config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);

            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            System.err.println("=================================================");
            System.err.println("🚨 MyBatis XML 파싱 실패! 진짜 원인을 확인하세요 🚨");
            System.err.println("=================================================");
            e.printStackTrace();
            throw new RuntimeException("MyBatis 팩토리 생성 실패: " + e.getMessage());
        }
    }
    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

}
