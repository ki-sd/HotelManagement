<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /* =========================================
       호텔 고객용 메인 푸터 (Customer Footer)
       ========================================= */
    .customer-footer {
        background-color: var(--primary-color); /* 묵직한 포레스트 그린으로 안정감 부여 */
        color: var(--border); /* 부드러운 베이지톤 텍스트 */
        padding: 60px 40px 20px;
        font-size: 0.875rem;
        margin-top: auto;
    }

    .footer-container {
        max-width: 1400px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        gap: 40px;
        flex-wrap: wrap;
    }

    .footer-brand {
        flex: 1;
        min-width: 300px;
    }

    .footer-logo {
        font-size: 1.8rem;
        font-weight: 800;
        color: var(--accent-color);
        letter-spacing: 2px;
        margin-bottom: 20px;
        display: inline-block;
    }

    .footer-brand p {
        margin-bottom: 8px;
        line-height: 1.6;
        color: #C2C0BA;
    }

    .footer-brand strong {
        color: #FFFFFF;
        font-weight: 600;
    }

    .footer-links-wrapper {
        display: flex;
        gap: 60px;
    }

    .footer-link-group {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .footer-link-group h3 {
        color: #FFFFFF;
        font-size: 1.1rem;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .footer-link-group a {
        color: #C2C0BA;
        transition: color 0.2s, transform 0.2s;
    }

    .footer-link-group a:hover {
        color: var(--accent-color);
        transform: translateX(4px);
    }

    .footer-bottom {
        max-width: 1400px;
        margin: 40px auto 0;
        padding-top: 24px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: rgba(255, 255, 255, 0.5);
    }

    .social-icons {
        display: flex;
        gap: 16px;
    }

    .social-icons a {
        color: rgba(255, 255, 255, 0.5);
        transition: color 0.2s;
    }

    .social-icons a:hover {
        color: var(--accent-color);
    }
</style>

<footer class="customer-footer">
    <div class="footer-container">

        <div class="footer-brand">
            <span class="footer-logo">GRAND HOTEL</span>
            <p><strong>주소</strong> |  </p>
            <p><strong>대표전화</strong> | 02-1234-5678 &nbsp;&nbsp;&nbsp; <strong>팩스</strong> | 02-1234-5679</p>
            <p><strong>이메일</strong> | contact@hotel.com</p>
            <p><strong>사업자등록번호</strong> | 123-45-67890 &nbsp;&nbsp;&nbsp; <strong>통신판매업신고</strong> | 제 2026-서울강남-1234호</p>
        </div>

        <div class="footer-links-wrapper">
            <div class="footer-link-group">
                <h3>ABOUT</h3>
                <a href="#">호텔 소개</a>
                <a href="#">오시는 길</a>
                <a href="#">채용 정보</a>
                <a href="#">지점 안내</a>
            </div>

            <div class="footer-link-group">
                <h3>CUSTOMER</h3>
                <a href="#">고객센터</a>
                <a href="#">자주 묻는 질문 (FAQ)</a>
                <a href="#">1:1 문의</a>
                <a href="#">분실물 센터</a>
            </div>

            <div class="footer-link-group">
                <h3>POLICY</h3>
                <a href="#" style="color: #FFFFFF; font-weight: 600;">개인정보처리방침</a>
                <a href="#">이용약관</a>
                <a href="#">이메일무단수집거부</a>
                <a href="#">관리자 페이지</a>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2026  HOTEL MANAGEMENT SYSTEM. All rights reserved.</p>
        <div class="social-icons">
            <a href="#" aria-label="Instagram">

            </a>
            <a href="#" aria-label="Facebook">

            </a>
        </div>
    </div>
</footer>