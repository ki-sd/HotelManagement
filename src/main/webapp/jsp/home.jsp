<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>호텔 Example</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

<jsp:include page="layout/aside.jsp" />

<main class="main-content">

    <jsp:include page="layout/header.jsp" />

    <div class="content-wrapper">
        <jsp:include page="layout/main.jsp" />
    </div>

    <jsp:include page="layout/footer.jsp" />

</main>

</body>
</html>