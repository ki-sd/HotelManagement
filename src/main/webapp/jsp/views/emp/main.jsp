<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>호텔 직원 시스템 - 대시보드</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        /* 대시보드 상단 요약 카드들을 가로로 배치하기 위한 추가 그리드 */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            margin-bottom: 24px;
        }
        .stat-card {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .stat-title {
            color: var(--text-muted);
            font-size: 0.875rem;
            font-weight: 600;
        }
        .stat-value {
            color: var(--primary-color);
            font-size: 1.8rem;
            font-weight: 800;
        }
    </style>
</head>
<body>

<aside class="sidebar">
    <div class="sidebar-header">
        <span>HOTEL SYSTEM</span>
    </div>
    <ul class="sidebar-menu">
        <li><a href="#" class="active">대시보드 홈</a></li>
        <li><a href="#">예약 관리</a></li>
        <li><a href="#">객실 현황</a></li>
        <li><a href="#">고객 관리</a></li>

        <c:if test="${sessionScope.user.isAdmin == 'Y'}">
            <li style="margin-top: 20px;"><a href="#" style="color: var(--danger);">[관리자] 직원 관리</a></li>
            <li><a href="#" style="color: var(--danger);">[관리자] 매출 통계</a></li>
        </c:if>
    </ul>
</aside>

<main class="main-content">

    <header class="topbar">
        <div class="topbar-search">
            <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
            <input type="text" placeholder="예약번호 또는 고객명 검색...">
        </div>

        <div class="topbar-actions">
            <button class="icon-btn">
                <span class="badge-dot"></span> <svg width="24" height="24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
            </button>

            <button class="user-profile">
                <div class="avatar">
                    ${empty sessionScope.user.ename ? 'Emp' : sessionScope.user.ename.substring(0,1)}
                </div>
                <div class="user-info">
                    <span class="user-name">${empty sessionScope.user.ename ? '알수없음' : sessionScope.user.ename} 님</span>
                    <span class="user-role">${sessionScope.user.isAdmin == 'Y' ? '총괄 관리자' : '프론트 데스크'}</span>
                </div>
            </button>
        </div>
    </header>

    <section class="content-wrapper">
        <h1 class="page-title">오늘의 호텔 현황</h1>

        <div class="dashboard-cards">
            <div class="card stat-card">
                <span class="stat-title">오늘 체크인 예정</span>
                <span class="stat-value">12건</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">현재 가용 객실</span>
                <span class="stat-value" style="color: var(--success);">45실</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">신규 예약 대기</span>
                <span class="stat-value" style="color: var(--accent-color);">8건</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">고객 클레임 / 요청</span>
                <span class="stat-value" style="color: var(--danger);">2건</span>
            </div>
        </div>

        <div class="card">
            <h3 style="margin-bottom: 16px; font-weight: 600;">실시간 예약 접수 현황</h3>
            <div class="table-container">
                <table class="table">
                    <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>고객명</th>
                        <th>객실타입</th>
                        <th>체크인 날짜</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="row-odd">
                        <td>RES-00124</td>
                        <td>김고객</td>
                        <td>디럭스 더블</td>
                        <td>2026-06-20</td>
                        <td><span class="badge-success">결제완료</span></td>
                    </tr>
                    <tr class="row-even">
                        <td>RES-00125</td>
                        <td>이예약</td>
                        <td>프리미엄 트윈</td>
                        <td>2026-06-21</td>
                        <td><span class="badge-warning">입금대기</span></td>
                    </tr>
                    <tr class="row-odd">
                        <td>RES-00126</td>
                        <td>박투숙</td>
                        <td>스위트 룸</td>
                        <td>2026-06-21</td>
                        <td><span class="badge-success">결제완료</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </section>
</main>

</body>
</html>