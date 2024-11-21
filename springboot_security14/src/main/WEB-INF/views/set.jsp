<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cozy Pick</title>
    <link rel="stylesheet" href="/css/set.css"> <!-- CSS 파일 경로 확인 -->
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
			
			<!-- 설정 타이틀 -->
            <div class="settings-title">설정</div>
            <!-- 간편 로그인 버튼 -->
			<div class="button-container">
			    <button class="button" onclick="location.href='/easy-login'">
			        간편 로그인 <span class="right-arrow">></span>
			    </button>
			    <!-- 로그아웃 버튼 -->
			    <button class="button logout-button" onclick="location.href='/logout'">
			        로그아웃 <span class="right-arrow">></span>
			    </button>
			</div>
	    </div>
	</body>
</html>