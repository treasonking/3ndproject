<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" type="text/css" href="/css/find-password.css">
</head>
<body>
<div class="container">
    <h2>비밀번호 찾기</h2>
    <form id="findPasswordForm">
        <div class="input-group">
            <div class="form-group">
                <label for="email">이메일 입력</label>
                <input type="email" id="email" name="email" required>
                <button type="button" id="sendEmailButton">인증 번호 보내기</button>
                <div id="emailMessage" style="color: red; display: none;"></div>
            </div>

            <div class="form-group" id="verificationGroup" style="display: none;">
                <label for="verificationCode">인증 번호 입력</label>
                <input type="text" id="verificationCode" name="verificationCode" required>
                <button type="button" id="verifyCodeButton">인증하기</button>
                <div id="verificationMessage" style="color: red; display: none;"></div>
            </div>
        </div>
        
        <div id="foundIdMessage" style="color: green; display: none;"></div>
        <div id="errorMessage" style="color: red; display: none;"></div>

        <div class="form-actions">
            <input type="submit" value="다음" id="submitBtn" disabled />
            <a href=""><input type="reset" value="취소" onclick="location.href='/'"/></a>
        </div>
    </form>

    <div class="divider"></div>

    <div class="login-section">
        <p>로그인이 필요하신가요? <a href="/login">로그인하기</a></p>
    </div>
</div>

<script>
    let isEmailVerified = false;

    document.getElementById('sendEmailButton').addEventListener('click', function () {
        const email = document.getElementById('email').value;

        if (!email) {
            alert('이메일을 입력하세요.');
            return;
        }

        fetch('/send-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email: email })
        })
        .then(response => response.json())
        .then(data => {
            const emailMessage = document.getElementById('emailMessage');
            if (data.success) {
                emailMessage.style.color = 'green';
                emailMessage.textContent = '인증 번호가 이메일로 전송되었습니다.';
                emailMessage.style.display = 'block';

                document.getElementById('verificationGroup').style.display = 'block';
            } else {
                emailMessage.style.color = 'red';
                emailMessage.textContent = '이메일 전송에 실패했습니다.';
                emailMessage.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    document.getElementById('verifyCodeButton').addEventListener('click', function () {
        const code = document.getElementById('verificationCode').value;

        if (!code) {
            alert('인증 번호를 입력하세요.');
            return;
        }

        fetch('/verify-code', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ code: code })
        })
        .then(response => response.json())
        .then(data => {
            const verificationMessage = document.getElementById('verificationMessage');
            if (data.success) {
                verificationMessage.style.color = 'green';
                verificationMessage.textContent = '인증 성공';
                verificationMessage.style.display = 'block';

                isEmailVerified = true;
                document.getElementById('submitBtn').disabled = false;
            } else {
                verificationMessage.style.color = 'red';
                verificationMessage.textContent = '인증 실패';
                verificationMessage.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    document.getElementById('findPasswordForm').addEventListener('submit', function(event) {
        event.preventDefault();
        if (isEmailVerified) {
            const form = document.createElement('form');
            form.method = 'GET';
            form.action = '/password/check';

            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'email';
            hiddenField.value = document.getElementById('email').value;
            form.appendChild(hiddenField);

            document.body.appendChild(form);
            form.submit();
        } else {
            alert('이메일 인증을 완료하세요.');
        }
    });
</script>
</body>
</html>
