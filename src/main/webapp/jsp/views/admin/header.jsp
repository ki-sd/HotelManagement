<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header class="topbar">
  <div class="topbar-search">
    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
    <input type="text" placeholder="사원번호, 고객명, 예약번호 통합 검색...">
  </div>

  <div class="topbar-actions">
    <button class="user-profile">
      <div class="avatar" style="background-color: var(--accent-color); color: var(--primary-color);">
        ${empty sessionScope.loginEmp.ename ? 'Admin' : sessionScope.loginEmp.ename.substring(0,1)}
      </div>
      <div class="user-info">
        <span class="user-name">${empty sessionScope.loginEmp.ename ? '관리자' : sessionScope.loginEmp.ename} 님</span>
        <span class="user-role" style="color: var(--danger); font-weight: 600;">System Admin</span>
      </div>
    </button>
  </div>
</header>
</body>
</html>
