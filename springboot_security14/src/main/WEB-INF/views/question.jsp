<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/css/question.css">
<body>
    <div class="customer-center">
        <h2>고객센터</h2>
        <p class="subtitle">어려움이나 궁금한 점이 있으신가요?</p>

        <!-- 연락 정보 -->
        <div class="contact-info">
            <div class="phone-section">
                <span class="phone-number">📞 1670-6250</span>
                <p>고객행복센터(전화): 오전 9시 ~ 새벽 3시 운영<br>
                    카카오톡 문의: 24시간 운영</p>
            </div>
            <button class="kakao-btn">💬 카카오 문의</button>
        </div>

        <!-- 자주 묻는 질문 탭 -->
        <h3>자주 묻는 질문</h3>
        <div class="faq-tabs">
            <button class="tab active">TOP7</button>
            <button class="tab">이용문의</button>
            <button class="tab">결제/영수증</button>
            <button class="tab">쿠폰/포인트</button>
            <button class="tab">국내 숙소</button>
            <button class="tab">해외 숙소</button>
            <button class="tab">공간대여</button>
            <button class="tab">레저·티켓</button>
            <button class="tab">실시간항공</button>
            <button class="tab">국내 항공</button>
            <button class="tab">해외 항공</button>
            <button class="tab">항공+숙소</button>
        </div>

        <!-- FAQ 리스트 -->
        <div class="faq-list">
            <div class="faq-item">
                <button class="faq-question">[숙박] 예약을 취소하고 싶어요.</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[공통] 천재지변/감염병으로 인한 예약취소는 어떻게 하나요?</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[숙박] 예약대기가 걸려 예약취소하고 싶어요.</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[숙박] 체크인날짜/객실타입을 변경하고 싶어요.</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[공통] 현금영수증을 발급받고 싶어요.</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[공통] 영수증/거래내역서 발급받고 싶어요.</button>
            </div>
            <div class="faq-item">
                <button class="faq-question">[엘리트] 상품을 결제했는데 이용 횟수가 올라가지 않아요.</button>
            </div>
        </div>

        <!-- 메인으로 돌아가기 버튼 -->
        <div class="back-to-main">
            <button onclick="location.href='/'" class="back-button">메인으로 돌아가기</button>
        </div>
    </div>

    <script>
        // 아코디언 기능 구현
        document.querySelectorAll('.faq-question').forEach(button => {
            button.addEventListener('click', () => {
                button.classList.toggle('active');
                const content = button.nextElementSibling;

                if (content) {
                    content.style.display = content.style.display === 'block' ? 'none' : 'block';
                }
            });
        });

        // 탭 활성화 기능
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', () => {
                document.querySelector('.tab.active').classList.remove('active');
                tab.classList.add('active');
            });
        });
    </script>
</body>
</html>