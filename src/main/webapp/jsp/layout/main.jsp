<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.kisd.dao.*,com.kisd.vo.*"%>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    .hero-slider h2,p{
        cursor: default;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", ()=>{
        const slides = document.querySelectorAll('.slide');
        const prevBtn = document.querySelector('.prev-btn');
        const nextBtn = document.querySelector('.next-btn');
        let currentSlide = 0;
        const slideInterval = 4000;
        let slideTimer;

        // 슬라이드가 2개 이상일 때만 작동
        if (slides.length > 1) {

            // 특정 인덱스로 슬라이드 이동
            const goToSlide=(index)=>{
                slides[currentSlide].classList.remove('active');

                // 슬라이드 루프
                currentSlide = (index + slides.length) % slides.length;

                slides[currentSlide].classList.add('active');
            }

            // 자동 슬라이드 시작
            const startTimer=()=>{
                slideTimer = setInterval(()=>{
                    goToSlide(currentSlide + 1);
                }, slideInterval);
            }

            // 충돌 방지
            const resetTimer=()=>{
                clearInterval(slideTimer);
                startTimer();
            }

            // 오른쪽 화살표 클릭
            nextBtn.addEventListener('click', ()=>{
                goToSlide(currentSlide + 1);
                resetTimer();
            });

            // 왼쪽 화살표 클릭
            prevBtn.addEventListener('click', ()=>{
                goToSlide(currentSlide - 1);
                resetTimer();
            });

            // 페이지 로딩 시 자동 슬라이드 최초 1회 실행
            startTimer();

        } else {
            if(prevBtn) prevBtn.style.display = 'none';
            if(nextBtn) nextBtn.style.display = 'none';
        }
    });
</script>
<body>
    <section class="hero-slider">
        <div class="slide active" style="background-image: url('https://images.unsplash.com/photo-1517253259615-dff3842d2544?q=80&w=1470&auto=format&fit=crop');">
            <div class="slide-content">
                <h2>자연과 머무는 시간</h2>
                <p> 호텔에서 특별한 휴식을 경험하세요.</p>
            </div>
        </div>
        <div class="slide" style="background-image: url('https://plus.unsplash.com/premium_photo-1661877303180-19a028c21048?q=80&w=1074&auto=format&fit=crop');">
            <div class="slide-content">
                <h2>도심 속의 완벽한 힐링</h2>
                <p>클래식한 우아함이 돋보이는 객실</p>
            </div>
        </div>
        <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=1470&auto=format&fit=crop');">
            <div class="slide-content">
                <h2>품격 있는 다이닝</h2>
                <p>최고의 셰프가 선사하는 미식의 향연</p>
            </div>
        </div>
        <button class="slider-btn prev-btn" aria-label="이전 슬라이드">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
            </svg>
        </button>
        <button class="slider-btn next-btn" aria-label="다음 슬라이드">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
            </svg>
        </button>
    </section>
</body>
</html>
