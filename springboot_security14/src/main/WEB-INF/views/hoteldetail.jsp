<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/hoteldetail.css">
</head>
<body>
    <div class="hotel-detail-page">
      <!-- 상단 호텔 이미지 -->
      <img src="https://via.placeholder.com/1200x400?text=Hotel+Image" 
           alt="Hotel Image" class="hotel-image">
  
      <!-- 호텔 기본 정보 -->
      <div class="hotel-info">
        <h1 class="hotel-name">호텔 A</h1>
        <p class="hotel-address">서울특별시 강남구 테헤란로 123</p>
        <p class="hotel-description">
          이 호텔은 서울의 중심부에 위치해 있으며, 편안한 휴식과 고급 서비스를 제공합니다.
          비즈니스 여행객과 가족 여행객 모두에게 적합한 최고의 시설을 갖추고 있습니다.
        </p>
      </div>
  
      <!-- 방 종류 섹션 -->
      <div class="room-types">
        <h2>객실 종류</h2>
  
        <div class="room">
          <h3>스탠다드</h3>
          <p>기본적인 편의시설을 갖춘 스탠다드룸입니다.</p>
          <p>가격: 80,000원/박</p>
          <button class="btn book-btn" onclick="bookRoom('스탠다드', '80,000원')">예약하기</button>
        </div>
  
        <div class="room">
          <h3>디럭스</h3>
          <p>넓은 공간과 고급 침구를 갖춘 디럭스룸입니다.</p>
          <p>가격: 120,000원/박</p>
          <button class="btn book-btn" onclick="bookRoom('디럭스', '120,000원')">예약하기</button>
        </div>
  
        <div class="room">
          <h3>스위트</h3>
          <p>럭셔리한 인테리어와 최고의 편안함을 제공하는 스위트룸입니다.</p>
          <p>가격: 200,000원/박</p>
          <button class="btn book-btn" onclick="bookRoom('스위트', '200,000원')">예약하기</button>
        </div>
      </div>
    </div>
  
    <script src="script.js"></script>
  </body>
</html>
