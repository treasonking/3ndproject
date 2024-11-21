<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지역별 필터 화면</title>
    <link rel="stylesheet" type="text/css" href="/css/regionfilter.css">
</head>

<body>


    <h1>지역 선택</h1>

    <!-- 대분류 카테고리 -->
    <div class="region-container">
        <button class="region-box" onclick="toggleSubregion('서울시')">서울시</button>
        <button class="region-box" onclick="toggleSubregion('경기도')">경기도</button>
        <button class="region-box" onclick="toggleSubregion('울산광역시')">울산광역시</button>
    </div>

    <!-- 중분류 카테고리 (서울시) -->
    <div id="subregion-서울시" class="subregion" style="display: none;">
        <h2>서울시 세부 지역</h2>
        <div class="subregion-container">
            <button class="subregion-box" onclick="selectSubregion('강남구')">강남구</button>
            <button class="subregion-box" onclick="selectSubregion('강동구')">강동구</button>
            <button class="subregion-box" onclick="selectSubregion('강북구')">강북구</button>
            <button class="subregion-box" onclick="selectSubregion('강서구')">강서구</button>
        </div>
    </div>

    <!-- 중분류 카테고리 (경기도) -->
    <div id="subregion-경기도" class="subregion" style="display: none;">
        <h2>경기도 세부 지역</h2>
        <div class="subregion-container">
            <button class="subregion-box" onclick="selectSubregion('수원시')">수원시</button>
            <button class="subregion-box" onclick="selectSubregion('성남시')">성남시</button>
            <button class="subregion-box" onclick="selectSubregion('고양시')">고양시</button>
            <button class="subregion-box" onclick="selectSubregion('용인시')">용인시</button>
        </div>
    </div>

    <!-- 검색 버튼 -->
    <div id="search-button-container" style="text-align: center; margin-top: 10px; display: none;">
        <button onclick="search()">검색</button>
    </div>

<script>
    let currentVisible = null;  // 현재 보이는 중분류를 저장하는 변수

    function toggleSubregion(region) {
        const subregionDiv = document.getElementById('subregion-' + region);
        const searchButtonContainer = document.getElementById('search-button-container');

        // 현재 보이는 중분류가 있고, 그것이 사용자가 선택한 것이라면 숨김 처리
        if (currentVisible && currentVisible === subregionDiv) {
            subregionDiv.style.display = 'none';
            searchButtonContainer.style.display = 'none'; // 검색 버튼 숨기기
            currentVisible = null;  // 현재 보이는 것을 없앰
        } else {
            if (currentVisible) {
                currentVisible.style.display = 'none';
            }
            // 새로 선택된 중분류를 보여줌
            subregionDiv.style.display = 'block';
            currentVisible = subregionDiv;

            // 검색 버튼을 중분류 카테고리 아래로 이동시키고 표시
            subregionDiv.after(searchButtonContainer);
            searchButtonContainer.style.display = 'block';
        }
    }

    function search() {
        alert('검색을 시작합니다!');
        // 여기서 선택한 값으로 페이지 이동 또는 데이터 처리 가능
    }
</script>

</body>
</html>
