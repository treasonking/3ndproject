<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="/css/find-id.css">
</head>
<body>
<div class="container">
    <h2>아이디 찾기</h2>
    <form id="findIdForm">
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
        
        <div id="foundIdMessage" style="color: green; display: none;"></div> <!-- 아이디 표시 메시지 -->
        <div id="errorMessage" style="color: red; display: none;"></div> <!-- 에러 메시지 -->

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
    let foundId = '';  // 찾은 ID를 저장할 변수

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

                // 인증 번호 입력란 표시
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

    // 인증 코드 검증 처리
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

                isEmailVerified = true; // 인증 성공 시 이메일 인증 상태를 true로 설정
                document.getElementById('submitBtn').disabled = false; // 버튼 활성화

                // 이메일이 인증된 후 ID 찾기 요청
                findIdByEmail();
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

    // ID 찾기 요청
    function findIdByEmail() {
        const email = document.getElementById('email').value;

        fetch('/find-id/email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email: email })
        })
        .then(response => response.json())
        .then(data => {
            const foundIdMessage = document.getElementById('foundIdMessage');
            const errorMessage = document.getElementById('errorMessage');

            if (data.success === "true") {
                foundId = data.id;  // 찾은 ID 저장
                
                foundIdMessage.textContent = `아이디: ${foundId}`; // 수정된 부분
                foundIdMessage.style.display = 'block';
                errorMessage.style.display = 'none'; // 에러 메시지 숨기기
            } else {
                errorMessage.textContent = data.message;
                errorMessage.style.display = 'block';
                foundIdMessage.style.display = 'none'; // 아이디 메시지 숨기기
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 폼 제출 시 /idview로 POST 요청하면서 ID 전달
    document.getElementById('findIdForm').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지
        if (isEmailVerified && foundId) {
            // 동적으로 form 생성
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/idview';  // POST 요청할 경로 설정

            // hidden input 필드로 ID 추가
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'id';
            hiddenField.value = foundId;
            form.appendChild(hiddenField);

            document.body.appendChild(form);  // 폼을 문서에 추가
            form.submit();  // 폼 제출
        } else {
            alert('이메일 인증을 완료하고 ID를 찾으세요.');
        }
    });
</script>
</body>
</html>
