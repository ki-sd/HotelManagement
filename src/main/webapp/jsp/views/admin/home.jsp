<%--
  Created by IntelliJ IDEA.
  User: sist8
  Date: 2026-06-18
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="aside.jsp"></jsp:include>
  <main class="main-content">
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="${main_jsp}"></jsp:include>
  </main>
</body>
</html>
