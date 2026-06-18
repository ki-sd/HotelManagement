<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>호텔 관리자 시스템 - 총괄 대시보드</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        /* 대시보드 공통 그리드 (emp와 동일한 규격) */
        .dashboard-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 24px; }
        .stat-card { display: flex; flex-direction: column; gap: 8px; }
        .stat-title { color: var(--text-muted); font-size: 0.875rem; font-weight: 600; }
        .stat-value { color: var(--primary-color); font-size: 1.8rem; font-weight: 800; }

        /* 관리자 전용 2단 분할 레이아웃 */
        .admin-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; }
    </style>
</head>
<body>




    <section class="content-wrapper">
        <h1 class="page-title">총괄 경영 대시보드</h1>

        <div class="dashboard-cards">
            <div class="card stat-card">
                <span class="stat-title">금일 예상 매출</span>
                <span class="stat-value">₩ 12,450,000</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">현재 객실 가동률(OCC)</span>
                <span class="stat-value" style="color: var(--success);">82.5%</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">금주 신규 회원 가입</span>
                <span class="stat-value" style="color: var(--accent-color);">142명</span>
            </div>
            <div class="card stat-card">
                <span class="stat-title">미처리 결재 / 시스템 경고</span>
                <span class="stat-value" style="color: var(--danger);">3건</span>
            </div>
        </div>

        <div class="admin-grid">

            <div class="card">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                    <h3 style="font-weight: 600;">최근 재무 트랜잭션 (결제/환불)</h3>
                    <a href="#" style="font-size: 0.875rem; color: var(--accent-color);">전체보기 &rarr;</a>
                </div>
                <div class="table-container">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>거래일시</th>
                            <th>고객명</th>
                            <th>금액</th>
                            <th>유형</th>
                            <th>상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="row-odd">
                            <td>06-18 13:42</td>
                            <td>이회장</td>
                            <td>₩ 1,200,000</td>
                            <td>스위트 숙박</td>
                            <td><span class="badge-success">결제완료</span></td>
                        </tr>
                        <tr class="row-even">
                            <td>06-18 12:15</td>
                            <td>김투숙</td>
                            <td>₩ 350,000</td>
                            <td>디럭스 예약</td>
                            <td><span class="badge-success">결제완료</span></td>
                        </tr>
                        <tr class="row-odd">
                            <td>06-18 10:05</td>
                            <td>박환불</td>
                            <td>₩ -200,000</td>
                            <td>예약 취소</td>
                            <td><span class="badge-warning" style="color: var(--danger); background-color: #FCE8E8;">환불승인</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card">
                <h3 style="margin-bottom: 16px; font-weight: 600;">현재 근무(Shift) 직원</h3>
                <div class="table-container">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>부서</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="row-odd">
                            <td style="font-weight: 500;">프론트</td>
                            <td>김민수</td>
                            <td><span style="color: var(--success);">● 근무중</span></td>
                        </tr>
                        <tr class="row-even">
                            <td style="font-weight: 500;">객실팀</td>
                            <td>이지은</td>
                            <td><span style="color: var(--success);">● 근무중</span></td>
                        </tr>
                        <tr class="row-odd">
                            <td style="font-weight: 500;">식음료</td>
                            <td>박현우</td>
                            <td><span style="color: var(--text-muted);">○ 휴게중</span></td>
                        </tr>
                        <tr class="row-even">
                            <td style="font-weight: 500;">프론트</td>
                            <td>최수진</td>
                            <td><span style="color: var(--success);">● 근무중</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </section>


</body>
</html>