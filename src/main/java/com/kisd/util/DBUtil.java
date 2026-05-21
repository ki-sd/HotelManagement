package com.kisd.util;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DBUtil {
    private static String USER;
    private static String PWD;
    private static String URL;

    static {
        try (InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties props = new Properties();
            props.load(is);

            URL = props.getProperty("db.url");
            USER = props.getProperty("db.user");
            PWD = props.getProperty("db.pwd");

            Class.forName("oracle.jdbc.OracleDriver");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static Connection getConnection(){
        Connection conn=null;
        try{
            conn=DriverManager.getConnection(URL,USER,PWD);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return conn;
    }
}
