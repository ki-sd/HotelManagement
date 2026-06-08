<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            <a href="/login" class="header-login">로그인</a>
        </div>

    <div class="header-center">
        <a href="/" class="logo">호텔로고</a>
    </div>

    <div class="header-right">
        <nav class="header-nav">
            <a href="/intro">호텔소개</a>
            <a href="/rooms">객실보기</a>
            <a href="/reserve" class="nav-reserve">예약</a>
        </nav>

        <button class="hamburger-btn" aria-label="전체 메뉴">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div>

</header>
</body>
</html>
