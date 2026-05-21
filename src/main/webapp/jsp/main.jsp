<%@ page import="com.kisd.util.DBUtil" %><%--
  Created by IntelliJ IDEA.
  User: sist8
  Date: 2026-05-21
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.kisd.dao.*,com.kisd.vo.*"%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        table{
            margin: 50px auto;
            border-collapse: collapse;
            width: 900px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05)
        }
        thead{
            background-color: #4F46E5;
            color: white;
        }
        th,td{
            padding: 12px 16px;
            text-align: left;
        }
        tbody tr{
            border-bottom: 1px solid #eee;
        }
        tbody tr:nth-child(even) {
            background-color: #F2F2F2;
        }
        tbody tr:hover{
            background-color: #F5F7FF;
        }
        tbody tr:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<Table>
    <thead>
    <tr>
        <th>사번</th>
        <th>이름</th>
        <th>성별</th>
        <th>직위</th>
        <th>부서</th>
        <th>연락처</th>
        <th>입사일</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>
    <%
        EmpDAO dao=new EmpDAO();
        List<EmpVO> list=dao.empListData();
        for(EmpVO vo:list){
    %>
    <tr>
        <td><%= vo.getEno() %></td>
        <td><%= vo.getEname() %></td>
        <td><%= vo.getSex() %></td>
        <td><%= vo.getErvo().getRank() %></td>
        <td><%= vo.getDvo().getDname() %></td>
        <td><%= vo.getPhone() %></td>
        <td><%= vo.getStrReg() %></td>
        <td><%= vo.getEsvo().getStatus() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</Table>
</body>
</html>
