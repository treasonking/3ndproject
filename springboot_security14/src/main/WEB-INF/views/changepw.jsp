<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <style>
        .error {
            color: red;
        }
        .success {
            color: green;
        }
    </style>
    <script>
        // 비밀번호 규칙 체크
        function validatePasswordRules() {
            const newPassword = document.getElementById('newPassword').value;
            const passwordHint = document.getElementById('passwordHint');
            
            // 비밀번호 규칙: 최소 8자, 숫자, 대문자, 소문자, 특수문자 포함
            const passwordRegex = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$/;

            if (!passwordRegex.test(newPassword)) {
                passwordHint.textContent = "비밀번호는 최소 8자 이상이어야 하며, 숫자,소문자, 특수문자를 포함해야 합니다.";
                passwordHint.className = "error";
                return false;
            } else {
                passwordHint.textContent = "";
                return true;
            }
        }

        // 새 비밀번호와 비밀번호 확인 실시간 체크
        function checkNewPasswords() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const confirmPasswordHint = document.getElementById('confirmPasswordHint');

            if (newPassword !== confirmPassword) {
                confirmPasswordHint.textContent = "새 비밀번호가 일치하지 않습니다.";
                confirmPasswordHint.className = "error";
            } else {
                confirmPasswordHint.textContent = "새 비밀번호가 일치합니다.";
                confirmPasswordHint.className = "success";
            }
        }

        // 비밀번호 변경 성공 알림
        function showSuccessAlert() {
            if (validatePasswordRules()) {  // 비밀번호 규칙을 만족하는 경우
                alert('비밀번호 변경 성공!');
                return true;  // 폼 제출을 계속 진행합니다.
            } else {
                return false;  // 비밀번호 규칙을 만족하지 않으면 폼 제출 중단
            }
        }
    </script>
</head>
<body>
    <h2>비밀번호 변경</h2>
    <form th:action="@{/password/change}" method="post" onsubmit="return showSuccessAlert();">
        <input type="hidden" id="email" name="email" th:value="${param.email}" />
        <p>인증된 이메일: <span th:text="${param.email}"></span></p>
        <br><br>

        <label for="newPassword">새 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword" oninput="checkNewPasswords(); validatePasswordRules();" required>
        <span id="passwordHint" class="error"></span> <!-- 비밀번호 규칙에 대한 힌트 -->
        <br><br>

        <label for="confirmPassword">새 비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" oninput="checkNewPasswords()" required>
        <span id="confirmPasswordHint" class="error"></span>
        <br><br>

        <button type="submit">비밀번호 변경</button>
    </form>

    <div th:if="${error}">
        <p class="error" th:text="${error}"></p>
    </div>
</body>
</html>
