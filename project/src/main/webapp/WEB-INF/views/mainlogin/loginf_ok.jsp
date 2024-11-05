<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경빈이네 - 아이디 안내</title>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: "Single Day", cursive;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .header {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #e74c3c;
        padding-bottom: 10px;
    }
    .content {
        font-size: 18px;
        color: #333;
        margin-top: 15px;
    }
    .button-container {
        display: flex;
        gap: 10px;
        margin-top: 20px;
        justify-content: center;
    }
    .button {
        width: 150px;
        padding: 10px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        color: white;
        cursor: pointer;
        text-align: center;
    }
    .login-btn {
        background-color: #e74c3c;
    }
    .login-btn:hover {
        background-color: #c62d1f;
    }
    .pw-btn {
        background-color: #e74c3c;
    }
    .pw-btn:hover {
        background-color: #c62d1f;
    }
</style>
</head>
<body>
<div class="container">
    <div class="header">아이디 안내</div>
    <div class="content">
        <p>찾으시는 아이디는 <b>${user_id}</b> 입니다.</p>
    </div>
    <div class="button-container">
        <a href="/login" class="button login-btn">로그인</a>
        <a href="/find_id" class="button pw-btn">비밀번호 찾기</a>
    </div>
</div>
</body>
</html>
    