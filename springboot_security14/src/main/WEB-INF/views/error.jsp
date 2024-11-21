<%@ page contentType="text/html; charset=UTF-8" %>

<!-- src/main/resources/templates/error.html -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: #FF5733; }
        p { color: #555; }
        button { padding: 10px 20px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <h1>오류가 발생했습니다</h1>
    <p>요청하신 페이지를 찾을 수 없습니다.</p>
    <button onclick="window.history.back()">뒤로가기</button>
</body>
</html>
