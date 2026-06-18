<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(() => {
            const currentPath = window.location.pathname

            $('.sidebar-menu a').removeClass('active')

            $('.sidebar-menu a').each((index, element) => {
              const menuHref = $(element).attr('href')

              if (menuHref !== "#" && currentPath.includes(menuHref)) {
                $(element).addClass('active')
              }
            })

            if($('.sidebar-menu a.active').length === 0) {
              $('.sidebar-menu a').first().addClass('active')
            }
        });
    </script>
</head>
<body>
<aside class="sidebar">
  <div class="sidebar-header" style="color: var(--accent-color);">
    <span><a href="main.do">ADMIN CENTER</a></span>
  </div>
  <ul class="sidebar-menu">
    <li><a href="main.do" class="active">총괄 대시보드</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/list.do">직원 계정 및 권한 관리</a></li>
    <li><a href="#">객실 및 요금 설정</a></li>
    <li><a href="#">매출 및 재무 통계</a></li>
    <li><a href="#">고객 리뷰 및 클레임</a></li>
    <li style="margin-top: 20px;"><a href="#" style="color: var(--text-muted);">사이트 시스템 설정</a></li>
  </ul>
</aside>
</body>
</html>
