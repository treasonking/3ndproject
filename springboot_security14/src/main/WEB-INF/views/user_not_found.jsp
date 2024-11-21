<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 오류</title>
    <meta th:content="'3;url=/confirm-kakao-insert?username=' + ${kakaoId} + '&email=' + ${email} + '&name=' + ${name} + '&nickname=' + ${nickname} + '&phone_number=' + ${phoneNumber} + '&gender=' + ${genderInKorean} + '&birthDate=' + ${birthDate}" http-equiv="refresh">
	
</head>
<body>
	<!--<p id="username-result" th:text="'username: ' + ${kakaoId}"></p>
		<p id="username-result" th:text="'name: ' + ${name}"></p>
		<p id="token-result" th:text="'email: ' + ${email}"></p>
		<p id="username-result" th:text="'username: ' + ${nickname}"></p>
		<p id="username-result" th:text="'phone_number: ' + ${phoneNumber}"></p>
		<p id="username-result" th:text="'genderInKorean: ' + ${genderInKorean}"></p>
		<p id="username-result" th:text="'birthDate: ' + ${birthDate}"></p>-->
	<div id="token-container" th:data-username="${username}" th:data-nickname="${nickname}"
			th:data-name="${name}" th:data-email="${email}" th:data-phoneNumber="${phoneNumber}" th:data-genderInKorean="${genderInKorean}" th:data-birthDate="${birthDate}"></div>
    <h2>사용자 오류</h2>
    <p th:text="${errorMessage}"></p>
    <p>3초 후에 카카오 회원가입 페이지로 이동합니다. 만약 이동하지 않으면 아래 링크를 클릭하세요:</p>
	<a th:href="@{/confirm-kakao-insert(username=${kakaoId}, email=${email}, name=${name}, nickname=${nickname}, phone_number=${phoneNumber}, gender=${genderInKorean}, birthDate=${birthDate})}">
	    카카오 회원가입
	</a>
	

</body>
</html>