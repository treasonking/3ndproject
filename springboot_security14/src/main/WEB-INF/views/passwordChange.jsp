<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="styles.css"> <!-- CSS 파일 연결 -->
</head>
<body>
    <div class="container">
        <h2>비밀번호 변경</h2>
        <form id="change-password-form">
            <div class="form-group"> 
                <label for="current-password">현재 비밀번호</label>
                <input type="password" id="current-password" name="current-password" required>
            </div>
            <div class="form-group">
                <label for="new-password">새 비밀번호</label>
                <input type="password" id="new-password" name="new-password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">새 비밀번호 확인</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <button type="submit">비밀번호 변경</button>
        </form>
        <div id="message"></div>
    </div>
    <script src="script.js"></script> <!-- JavaScript 파일 연결 -->
	<script>
		document.getElementById('change-password-form').addEventListener('submit', function(event) {
		    event.preventDefault(); // 폼 제출 기본 동작 방지

		    const currentPassword = document.getElementById('current-password').value;
		    const newPassword = document.getElementById('new-password').value;
		    const confirmPassword = document.getElementById('confirm-password').value;
		    const messageDiv = document.getElementById('message');

		    // 비밀번호 확인
		    if (newPassword !== confirmPassword) {
		        messageDiv.textContent = '새 비밀번호가 일치하지 않습니다.';
		        messageDiv.style.color = 'red';
		        return;
		    }

		    // 여기서 비밀번호 변경 요청을 서버로 전송하는 로직을 추가할 수 있습니다.
		    // 예시로 성공 메시지를 표시합니다.
		    messageDiv.textContent = '비밀번호가 성공적으로 변경되었습니다.';
		    messageDiv.style.color = 'green';

		    // 입력 필드 초기화
		    document.getElementById('change-password-form').reset();
		});

		
	</script>
</body>
</html>
