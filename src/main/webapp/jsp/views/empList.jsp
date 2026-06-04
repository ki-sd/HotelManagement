<%@ page import="com.kisd.model.EmpModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    EmpModel model=new EmpModel();
    model.empList(request);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="table-container">
        <table class="table">
            <thead>
                <tr>
                    <th style="text-align: center;">사번</th>
                    <th style="text-align: center;">이름</th>
                    <th style="text-align: center;">성별</th>
                    <th style="text-align: center;">소속</th>
                    <th style="text-align: center;">직급</th>
                    <th style="text-align: center;">연락처</th>
                    <th style="text-align: center;">입사일</th>
                    <th style="text-align: center;">상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${list}">
                <tr>
                    <td style="text-align: center;">${vo.eno}</td>
                    <td style="text-align: center;">${vo.ename}</td>
                    <td style="text-align: center;">${vo.sex}</td>
                    <td style="text-align: center;">${vo.dvo.dname}</td>
                    <td style="text-align: center;">${vo.ervo.rank}</td>
                    <td style="text-align: center;">${vo.phone}</td>
                    <td style="text-align: center;">${vo.strReg}</td>
                    <td style="text-align: center;">${vo.esvo.status}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
