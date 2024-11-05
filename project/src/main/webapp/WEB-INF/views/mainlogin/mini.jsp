<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>미트박스 회원가입</title>
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->


<style>
body {
    font-family: "Single Day", cursive !important;
    text-align: center;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.welcome-text {
    color: #333;
    margin-bottom: 20px;
    font-weight: bold; /* 글씨를 굵게 설정 */
}

.highlight {
    color: #e74c3c;
    font-weight: bold;
}

.buttons {
    display: flex;
    justify-content: space-around;
    margin-top: 30px;
    
}

.button {
    width: 45%;
    padding: 15px;
    background-color: #fff;
    border: 2px solid #333;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, border-color 0.3s;
    font-size: 18px;
    font-weight: bold; /* 버튼의 텍스트를 굵게 설정 */
    text-decoration: none;
    color: #333;
    display: inline-block;
    text-align: center;
    margin-right: -5px;
}
.button:last-child {
    margin-right: 0; /* 마지막 버튼에는 여백을 적용하지 않음 */
}

.button:hover {
    background-color: #e74c3c;
    border-color: #e74c3c;
    color: #fff;
}
 /* 검색 버튼 스타일 */
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

/* 푸터 스타일 */
footer {
    background-color: LightCoral;
    padding: 20px 0;
    margin-top: auto;
}

footer .container {
    text-align: center;
}

footer p {
    margin: 5px 0;
    font-weight: bold; /* 푸터의 텍스트를 굵게 설정 */
}
</style>
</head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!"><strong>경빈이네</strong></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="#!"><strong>로그인 / 회원가입</strong></a></li>
                    <li class="nav-item"><a class="nav-link" href="#!"><strong>마이페이지</strong></a></li>
                    <li class="nav-item"><a class="nav-link" href="#!"><strong>고객센터</strong></a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><strong>카테고리</strong></a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!"><strong>돼지고기</strong></a></li>
                            <li><a class="dropdown-item" href="#!"><strong>닭고기</strong></a></li>
                            <li><a class="dropdown-item" href="#!"><strong>소고기</strong></a></li>
                        </ul>
                    </li>
                </ul>
                <div class="search-container">
                    <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                    <button class="search-button">
                        <img src="https://img.icons8.com/ios-filled/50/ffffff/search.png" alt="돋보기">
                    </button>
                </div>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i> Cart
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container" style="margin-top: 100px;">
        <h2 class="welcome-text">No.3 축산물 직거래 플랫폼 <span class="highlight">경빈이네</span>에 오신 것을 환영합니다</h2>
        <p><strong>가입하실 회원 유형을 선택해주세요.</strong></p>
        <div class="buttons">
            <a href="/agree" class="button"><strong>사업자 회원가입</strong></a>
            <a href="/agree2" class="button"><strong>개인 회원가입</strong></a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="py-5">
        <div class="container">
            <p class="m-0 text-center text-white">| <strong>회사명:</strong> 경빈이네 주식회사 <strong>대표자:</strong> 3조 <strong>주소:</strong> 서울특별시 마포구 |</p>
            <p class="m-0 text-center text-white">| <strong>전화:</strong> 1818-9797 | <strong>팩스:</strong> 042-526-9289 |</p>
            <p class="m-0 text-center text-white">| <strong>개인정보보호책임자:</strong> 노종문 (jsfood5@naver.com) |</p>
            <p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
        </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
