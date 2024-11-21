<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>카카오 정보 삽입 여부 확인</title>
</head>
<body>
    <h1>카카오 정보 삽입</h1>
    <p>카카오 계정 정보를 삽입하시겠습니까?</p>
    
    <form action="/confirm-kakao-insert" method="post" onsubmit="return showSuccessAlert();">
		<!--<p id="username-result" th:text="'username: ' + ${username}"></p>
				<p id="username-result" th:text="'name: ' + ${name}"></p>
				<p id="token-result" th:text="'email: ' + ${email}"></p>
				<p id="username-result" th:text="'phone_number: ' + ${phoneNumber}"></p>
				<p id="username-result" th:text="'genderInKorean: ' + ${genderInKorean}"></p>
				<p id="username-result" th:text="'birthDate: ' + ${birthDate}"></p>-->
				<input type="hidden" name="email" th:value="${email}" />
				    <input type="hidden" name="name" th:value="${name}" />
				    <input type="hidden" name="nickname" th:value="${nickname}" />
				    <input type="hidden" name="phone_number" th:value="${phoneNumber}" />
				    <input type="hidden" name="gender" th:value="${genderInKorean}" />
				    <input type="hidden" name="birthDate" th:value="${birthDate}" />
			<div id="token-container" th:data-username="${username}" th:data-nickname="${nickname}"
					th:data-name="${name}" th:data-email="${email}" th:data-phoneNumber="${phoneNumber}" th:data-genderInKorean="${genderInKorean}" th:data-birthDate="${birthDate}"></div>
		<input type="hidden" name="username" th:value="${username}" /> <!-- 모델에서 username 값을 설정 -->
		    <label>사용자 이름: <span th:text="${username}"></span></label>
		    <label>인서트 하시겠습니까?</label>
		    <input type="checkbox" name="confirm" value="true" /> 확인
		    <button type="submit">제출</button>
    </form>
	<script>
		window.onload = output();
		function output() {
		const container = document.getElementById('token-container');
			        const urlParams = new URLSearchParams(window.location.search);
			        //const code = urlParams.get('code');
			        //console.log('Extracted code:', code);
			        //const token = document.getElementById('token-container').dataset.token;
			        const username = document.getElementById('token-container').dataset.username;
			        const name = document.getElementById('token-container').dataset.name;
			        const nickname = document.getElementById('token-container').dataset.nickname;
			        const email = document.getElementById('token-container').dataset.email;
			        const phoneNumber = container.dataset.genderinkorean;
					const genderInKorean = container.dataset.genderinkorean; // 소문자로 변경
					const birthDate = container.dataset.birthdate; // 소문자로 변경

			        
					}
					function showSuccessAlert() {
								    alert('카카오 회원가입 성공!');
								    return true; // 폼 제출을 계속 진행합니다.
								}
		</script>
</body>
</html>
