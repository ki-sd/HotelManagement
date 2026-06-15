<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .modal-overlay {
        position: fixed !important; /* 브라우저 창에 딱 붙어서 따라다니게 강제 고정 */
        top: 0; left: 0;
        width: 100vw; height: 100vh; /* 화면 전체 크기 100% 차지 */
        background: rgba(0, 0, 0, 0.6) !important; /* 뒷배경 어둡게 처리 */
        display: flex; justify-content: center; align-items: center;
        z-index: 9999 !important; /* 기존 헤더나 슬라이더(z-index: 10)보다 무조건 높게 띄움 */
    }
    .modal-close-btn {
        position: absolute; top: 16px; right: 16px;
        background: none; border: none; font-size: 1.8rem;
        cursor: pointer; color: var(--text-muted);
    }
    .modal-close-btn:hover { color: var(--danger); }
    .error-msg {
        color: var(--danger); text-align: center; margin-top: 16px;
        font-size: 0.875rem; font-weight: 500;
    }

    /* 폼 디자인 */
    .form-signin {
        width: 100%; max-width: 380px; padding: 35px 35px 45px;
        background-color: var(--surface); border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3); /* 모달이 붕 떠 보이게 강한 그림자 부여 */
    }
    .form-signin-heading { margin-bottom: 30px; }
    .form-signin .form-control {
        position: relative; font-size: 0.875rem; height: auto;
        padding: 12px; box-sizing: border-box; width: 100%;
        border: 1px solid var(--border); outline: none;
    }
    .form-signin .form-control:focus { z-index: 2; border-color: var(--primary-color); }
    .form-signin input[type="text"] {
        margin-bottom: -1px;
        border-bottom-left-radius: 0; border-bottom-right-radius: 0;
        border-top-left-radius: 8px; border-top-right-radius: 8px;
    }
    .form-signin input[type="password"] {
        margin-bottom: 20px;
        border-top-left-radius: 0; border-top-right-radius: 0;
        border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;
    }
    .btn-login {
        width: 100%; height: 48px; background-color: var(--primary-color);
        color: white; border: none; border-radius: 8px;
        font-size: 1rem; font-weight: 600; cursor: pointer; transition: 0.2s;
    }
    .btn-login:hover { background-color: var(--primary-hover); }
</style>
<div id="loginModalOverlay" class="modal-overlay" style="display: none;">
    <div class="form-signin" style="position: relative; border-radius: 12px;">
        <button type="button" id="closeLoginModal" class="modal-close-btn">&times;</button>
        <h2 class="form-signin-heading" style="text-align: center; color: var(--primary-color);">STAFF LOGIN</h2>

        <form id="modalLoginForm">
            <input type="text" class="form-control" name="id" placeholder="사원 아이디" required autofocus>
            <input type="password" class="form-control" name="pwd" placeholder="비밀번호" required>
            <button class="btn-login" type="submit">로그인</button>
            <div id="modalErrorMsg" class="error-msg" style="display: none;"></div>
        </form>
    </div>
</div>
<script>
    $(() => {
        const $modal = $("#loginModalOverlay");
        const $errorMsg = $("#modalErrorMsg");

        // 열기
        $("#openLoginModal").on("click", () => {
            $modal.css("display", "flex");
            $errorMsg.hide();
            $("#modalLoginForm")[0].reset();
        });

        // 닫기
        $("#closeLoginModal").on("click", () => {
            $modal.hide();
        });

        // 바깥 영역 클릭 시 닫기
        $(window).on("click", (e) => {
            if ($(e.target).is($modal)) {
                $modal.hide();
            }
        });

        // 비동기 로그인
        $("#modalLoginForm").on("submit", (e) => {
            e.preventDefault();

            const formData = $(e.currentTarget).serialize();

            $.ajax({
                url: "${pageContext.request.contextPath}/emp/login.do",
                type: "POST",
                data: formData,
                dataType: "text",
                success: (state) => {
                    state = state.trim();
                    if (state === "OK") {
                        location.reload();
                    } else if (state === "NOID") {
                        $errorMsg.text("존재하지 않는 아이디입니다.").show();
                    } else if (state === "NOPWD") {
                        $errorMsg.text("비밀번호가 일치하지 않습니다.").show();
                    } else {
                        $errorMsg.text("알 수 없는 오류가 발생했습니다.").show();
                    }
                },
                error: (xhr, status, error) => {
                    console.error("통신 에러 발생:", error);
                    $errorMsg.text("서버와의 통신에 실패했습니다.").show();
                }
            });
        });
    });
</script>
