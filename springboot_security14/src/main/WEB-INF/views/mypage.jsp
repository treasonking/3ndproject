<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cozy Pick</title>
    <link rel="stylesheet" href="/css/mypage.css"> <!-- CSS 파일 경로 확인 -->
</head>
<body>
    <div class="wrap">
        <div class="intro_bg">
            <div class="header">
                <h1 class="logo">cozypick</h1>
                <div class="nav">
                    <a href="#">HOME</a>
                    <a href="#ABOUTUS">ABOUT US</a>
                    <a href="#RESERVATION">RESERVATION</a>
                    <a href="#REVIEW">REVIEW</a>
                    <a href="#CONTACT">CONTACT</a>
                </div>
                
            </div>
        </div>
        
        <div class="user-info">
            <h2>사용자 이름</h2>
            <span class="user-status" id="username">님은 <strong>일반 회원</strong>입니다</span>
        </div>
        
        <!-- 버튼을 user-info 아래에 위치 -->
        <div class="button-row">
            <button class="button small-button"><span>일반회원 혜택</span><span class="arrow">></span></button>
            <button class="button small-button" onclick="location.href='/MyInformation'">
                <span>내 정보 관리</span><span class="arrow">></span>
            </button>
        </div>

        <div class="button-container">
            <div class="small-container">
                <button class="button"><span>코지픽 포인트 0</span><span class="arrow">></span></button>
                <div class="button-row">
                    <button class="button"><span>내 후기</span><span class="arrow">></span></button>
                    <button class="button"><span>쿠폰</span><span class="arrow">></span></button>
                </div>
            </div>
        </div>
        
        <div class="section-title">예약내역</div>
        <div class="button-row">
            <button class="button"><span>국내숙소</span><span class="arrow">></span></button>
        </div>
        
        <div class="section-title">문의/안내</div>
        <div class="faq-buttons">
            <button class="button"><span>공지사항</span><span class="arrow">></span></button>
            <button class="button"><span>자주 묻는 질문</span><span class="arrow">></span></button>
			<button class="button" onclick="location.href='Chatbot.html'">
			    <span>챗봇 상담</span><span class="arrow">></span>
			</button>
            <button class="button"><span>고객상담센터</span><span class="arrow">></span></button>
        </div>
        
        <div class="section-title">혜택</div>
        <div class="button-container">
            <button class="button"><span>이벤트</span><span class="arrow">></span></button>
            <button class="button"><span>기획전</span><span class="arrow">></span></button>
            <button class="button"><span>프로모션 코드 등록</span><span class="arrow">></span></button>
            <button class="button"><span>MY혜택</span><span class="arrow">></span></button>
        </div>

        <div class="section-title">서비스 관리</div>
        <div class="button-container">
            <button class="button"><span>코지픽 정보</span><span class="arrow">></span></button>
			<button class="button" onclick="location.href='/setting'">
			    <span>설정</span><span class="arrow">></span>
			</button>
		  </button>
        </div>
    </div>
	<script>
		fetch('/api/user-info', {
		                method: 'GET',
		                credentials: 'include' // 쿠키를 포함하여 요청
		            })
		            .then(response => response.json())
		            .then(userInfo => {
		                // 사용자 정보를 화면에 출력
		                document.getElementById('username').textContent = userInfo.name;
		                document.getElementById('id').textContent = userInfo.username;
		                document.getElementById('mail').textContent = userInfo.mail;
		                document.getElementById('email').textContent = userInfo.mail;
		                document.getElementById('tel').textContent = userInfo.tel;
		            })
		            .catch(error => {
		                console.error('Error fetching user info:', error);
		            });
	</script>
</body>
</html>
