<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.kisd.dao.*,com.kisd.vo.*"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<style>
    .hero-slider h2, p {
        cursor: default;
    }
    .swiper-slide::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.3);
        z-index: 1;
    }
    .slide-content {
        z-index: 2;
    }
</style>

<body>
    <section class="swiper hero-slider">
        <div class="swiper-wrapper">

            <div class="swiper-slide" style="background-image: url('https://images.unsplash.com/photo-1517253259615-dff3842d2544?q=80&w=1470&auto=format&fit=crop');">
                <div class="slide-content">
                    <h2>자연과 머무는 시간</h2>
                    <p>호텔에서 특별한 휴식을 경험하세요.</p>
                </div>
            </div>

            <div class="swiper-slide" style="background-image: url('https://plus.unsplash.com/premium_photo-1661877303180-19a028c21048?q=80&w=1074&auto=format&fit=crop');">
                <div class="slide-content">
                    <h2>도심 속의 완벽한 힐링</h2>
                    <p>클래식한 우아함이 돋보이는 객실</p>
                </div>
            </div>

            <div class="swiper-slide" style="background-image: url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=1470&auto=format&fit=crop');">
                <div class="slide-content">
                    <h2>품격 있는 다이닝</h2>
                    <p>최고의 셰프가 선사하는 미식의 향연</p>
                </div>
            </div>

        </div>

        <div class="swiper-pagination"></div>

        <button class="slider-btn prev-btn swiper-button-prev" style="color: #E6F0E9" aria-label="이전 슬라이드">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
            </svg>
        </button>
        <button class="slider-btn next-btn swiper-button-next" style="color: #E6F0E9" aria-label="다음 슬라이드">
            <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
            </svg>
        </button>
    </section>

    <script>
        $(() => {
            const heroSwiper = new Swiper('.hero-slider', {
                loop: true,
                speed: 800,
                effect: 'fade',
                fadeEffect: {
                    crossFade: true
                },
                autoplay: {
                    delay: 4000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        });
    </script>
</body>
</html>
