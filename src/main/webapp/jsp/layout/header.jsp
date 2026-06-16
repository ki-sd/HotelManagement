<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(()=>{
            $('.header-logout').on('click',(e)=>{
                e.preventDefault();
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/emp/logout.do',
                    success:(result)=>{
                        if(result.trim()==="yes"){
                            location.href="${pageContext.request.contextPath}/main/main.do"
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
    <header class="customer-header">

        <div class="header-left">
            <div class="lang-select">
                <select>
                    <option value="ko">한국어</option>
                    <option value="en">ENG</option>
                    <option value="jp">日本語</option>
                </select>
            </div>
            <c:choose>
                <%-- 관리자 --%>
                <c:when test="${sessionScope.user.isAdmin == 'Y'}">
                    <a href="javascript:void(0);" class="header-logout">로그아웃</a>
                    <a href="${pageContext.request.contextPath}/admin/main.do" class="header-admin">관리자페이지</a>
                </c:when>
                <%-- 일반 직원 --%>
                <c:when test="${sessionScope.user.isAdmin == 'N'}">
                    <a href="javascript:void(0);" class="header-logout">로그아웃</a>
                    <a href="${pageContext.request.contextPath}/emp/main.do" class="header-admin">직원페이지</a>
                </c:when>
                <%-- 일반 회원 --%>
                <c:when test="${not empty sessionScope.user}">
                    <a href="javascript:void(0);" class="header-logout">로그아웃</a>
                    <a href="${pageContext.request.contextPath}/cust/mypage.do" class="header-mypage">마이페이지</a>
                </c:when>
                <%-- 비로그인 --%>
                <c:otherwise>
                    <a href="javascript:void(0);" id="openLoginModal" class="header-login">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>

    <div class="header-center">
        <a href="${pageContext.request.contextPath}/main/main.do" class="logo">호텔로고</a>
    </div>

    <div class="header-right">
        <nav class="header-nav">
            <a href="${pageContext.request.contextPath}/main/intro.do">호텔소개</a>
            <a href="${pageContext.request.contextPath}/room/rooms.do">객실보기</a>
            <a href="${pageContext.request.contextPath}/reserve/main.do" class="nav-reserve">예약</a>
        </nav>

        <button class="hamburger-btn" aria-label="전체 메뉴">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div>

</header>
    <jsp:include page="/jsp/views/emp/login.jsp" />
</body>
</html>
