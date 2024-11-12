<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경빈이네 - 아이디 찾기</title>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    .subjecet {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        border-bottom: 2px solid #e74c3c;
        padding-bottom: 10px;
        
    }
    input[type="text"], input[type="email"], input[type="number"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="button"], input[type="submit"] {
        width: 100%;
        padding: 10px 0;
        margin-top: 15px;
        font-size: 16px;
        border-radius: 5px;
        border: none;
        color: white;
        cursor: pointer;
    }
    .find_button {
        background-color: #e74c3c;
    }
    .find_button:hover {
        background-color: #c62d1f;
    }
    
      /* 푸터 스타일 */
    footer {
        background-color: LightCoral;
        padding: 20px 0;
        margin-top: auto;
    }
    .search-container {
            display: flex;
            align-items: center;
            width: 300px;
            margin: 20px auto;
        }

        .search-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
            outline: none;
        }

        .search-button {
            padding: 10px;
            background-color: LightCoral;
            border: none;
            cursor: pointer;
            border-radius: 0 5px 5px 0;
        }

        .search-button img {
            width: 20px;
            height: 20px;
		}
		 
</style>
</head>
<body>
 <nav class="navbar navbar-expand-lg ">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">경빈이네</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <!-- 로그인 상태에 따른 메뉴 표시 -->
                        <c:choose>
                            <c:when test="${sessionScope.loginStatus == 'ok'}">
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user_logout">로그아웃</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user_login">로그인 / 회원가입</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/notice">고객센터</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="products?category_idx=24002">돼지고기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="products?category_idx=24003">닭고기</a></li>
                                <li><a class="dropdown-item" href="products?category_idx=24001">소고기</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="search-container">
                    <form action="product_search_main" method="get">
                        <input type="text" class="search-input" name="keyword"
                            placeholder="검색어를 입력하세요"></form>
                    <button class="search-button">
							<img src="https://img.icons8.com/ios-filled/50/ffffff/search.png"
								alt="돋보기">
						</button> 
						
                </div>
    
           
    
    </div>
                     <form class="d-flex" action="/cart_list" method="get">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                    </form>
                    
            </div>
      
    </nav>

<div class="wrapper">
    <form action="/loginf_ok" method="post">
        <div class="subjecet">아이디 찾기</div>
        
        <label for="userName">이름</label>
        <input type="text" id="userName" name="username" placeholder="이름 입력" required>

        <label for="userMail">이메일</label>
        <input type="email" id="userMail" name="email" placeholder="이메일 입력" required>
        <input type="button" onclick="send_email()" value="이메일 전송" class="find_button">

        <label for="authNumber">이메일 인증 번호</label>
        <input type="number" id="authNumber" name="authNumber" placeholder="인증번호" maxlength="6" required>
        <input type="button" onclick="authNum_chk()" value="확인" class="find_button">

        <input type="submit" class="find_button" value="아이디 찾기">
    </form>
</div>

<footer class="py-5" style="background-color: LightCoral;">
    <div class="container">
        <p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조 주소: 서울특별시 마포구 |</p>
        <p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스: 042-526-9289 |</p>
        <p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문 (jsfood5@naver.com) |</p>
        <p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
    </div>
</footer>

<script>
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let isEmailVerified = false;

    function send_email() {
        const userMail = $("#userMail").val();
        if (emailRegex.test(userMail)) {
            $.post("/send_email_code", { userMail }, function() {
                alert("인증 이메일이 전송되었습니다.");
                isEmailVerified = false;
            });
        } else {
            alert("올바른 이메일을 입력해주세요.");
        }
    }

    function authNum_chk() {
        const authNumber = $("#authNumber").val();
        if (authNumber) {
            $.post("/judge_code_match", { authNumber }, function(response) {
                if (response.status === "success") {
                    alert("인증에 성공했습니다.");
                    isEmailVerified = true;
                } else {
                    alert("인증번호가 일치하지 않습니다.");
                    $("#authNumber").val("").focus();
                }
            });
        } else {
            alert("인증번호를 입력하세요.");
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
