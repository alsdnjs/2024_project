<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: "Single Day", cursive;
        background-color: #f4f4f4;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        margin: 0;
    }
    .wrapper {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 350px;
        padding: 20px;
        margin: 50px auto;
    }
    .subject {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        border-bottom: 2px solid #e74c3c;
        padding-bottom: 10px;
    }
    input[type="password"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #e74c3c;
        color: white;
        cursor: pointer;
        font-weight: bold;
        border-radius: 5px;
    }
    input[type="submit"]:hover {
        background-color: #c62d1f;
    }
</style>
</head>
<body>
<div class="wrapper">
    <form action="/update_password" method="post">
        <div class="subject">비밀번호 변경</div>
        
        <label for="newPassword">새 비밀번호</label>
        <input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호 입력" required>

        <label for="confirmPassword">비밀번호 확인</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>

        <input type="submit" value="비밀번호 변경">
    </form>
</div>
<script>
    document.querySelector("form").onsubmit = function() {
        const newPassword = document.getElementById("newPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        
        if (newPassword !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    };
</script>
</body>
</html>
