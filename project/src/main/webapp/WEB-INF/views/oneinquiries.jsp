<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
    rel="stylesheet">
    
    
 <link href="../css/styles.css" rel="stylesheet" />
<style>
    body {
        font-family: "Single Day", cursive !important;
        font-weight: 400;
        font-style: normal;
    }

    .sidebar {
        background-color: white;
        padding: 15px;
        height: 100vh;
        position: sticky;
        top: 0;
    }

    .sidebar a {
        display: block;
        padding: 10px;
        color: #333;
        text-decoration: none;
    }

    .sidebar a:hover {
        background-color: #e9ecef;
        border-radius: 5px;
    }

    .sidebar .active {
        background-color: #ffcccc;
        color: #fff;
        border-radius: 5px;
    }

    .dashboard-title {
        font-weight: bold;
        font-size: 1.5rem;
        margin-bottom: 20px;
    }

    .dashboard-card, .dashboard-card2 {
        padding: 20px;
        border-radius: 10px;
        background-color: #f8f9fa;
        text-align: center;
        font-size: 1.1rem;
        width: 100%;
        min-height: 130px; /* 일정한 크기 */
        display: flex;
        justify-content: center;
        align-items: center;
        transition: 0.3s ease-in-out;
        text-decoration: none;
        color: black;
        flex-direction: column; /* 두 줄로 표시 */
    }

    .dashboard-card span, .dashboard-card2 span {
        font-size: 17px;
    }

    .dashboard-card p, .dashboard-card2 p {
        font-weight: bold;
    }

    .fa-solid.fa-snowflake {
        font-size: 18px;
        color: #a8dbf0;
    }

    .dashboard-card:hover {
        background-color: #e9ecef;
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
    }

    /* 배송단계 내역 여백 추가 */
    .shipping-status {
        margin-top: 40px;
    }

    /* 좌우 여백 추가 */
    .main-content {
        padding-left: 15%; /* 좌우 15% 여백 */
        padding-right: 15%;
    }

    /* 고객센터 스타일 */
    .customer-center {
        text-align: center;
        margin-top: 50px;
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

    .user-actions {
        margin-left: auto;
        display: flex;
        gap: 10px;
    }

    .discount-text {
        color: #ffa64d; /* 연한 주황색 */
        font-size: small !important;
    }

    .row.text-center.mb-4 {
        margin-left: 210px;
    }

    /* 공지사항과 푸터 사이의 여백 조정 */
    .notice-section {
        margin-bottom: 60px; /* 푸터와의 간격 조정 */
    }
     .inquiry-button {
            text-align: left;
            margin-top: 20px;
        }

        .inquiry-button a {
            background-color: #ff4d4d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .inquiry-button a:hover {
            background-color: #e60000;
        }
        .accordion-body{
        	font-size: 14px;
        }
    footer {
    background-color: LightCoral; /* 원하는 색상으로 변경 */
}
</style>
</head>
<body>

    <!-- 상단 네비게이션 바 -->
    <header>
        <nav class="navbar navbar-expand-lg ">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">경빈이네</a>
                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page"
                                href="#!">로그인 / 회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
                        <li class="nav-item dropdown"><a
                                class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">돼지고기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">닭고기</a></li>
                                <li><a class="dropdown-item" href="#!">소고기</a></li>
                            </ul></li>
                    </ul>
                    <div class="search-container">
                        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                        <button class="search-button">
                            <img src="https://img.icons8.com/ios-filled/50/ffffff/search.png"
                                alt="돋보기">
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
    </header>

    <!-- 메인 컨테이너 -->
    <div class="container-fluid main-content">
        <div class="row">
            <!-- 사이드바 -->
            <div class="col-md-2 sidebar">
                <a href="/notice" >공지사항</a>
                <a href="/questions">자주 묻는 질문</a>
                <a href="/rank">등급 혜택</a>
                <a href="/productinquiries">상품 문의</a>
                <a href="/oneinquiries" class="active">1:1 문의</a>
            </div>

            <!-- 메인 콘텐츠 -->
             <div class="col-md-10">
                <h1 class="dashboard-title mt-4">1:1 문의</h1>

                <!-- 등록된 문의 목록 -->
                <div class="inquiry-list">
                    <h6>예시</h6>
                    <p><strong>[기타문의]</strong> 안녕하세요? 2024-09-26 12:30</p>
                    
                    <!-- 아코디언 적용 -->
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    답변 보기
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    판매자 답변: 안녕하세요, 문의주셔서 감사합니다. 답변 내용이 여기에 표시됩니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>

                <!-- 1:1 문의하기 버튼 -->
                <div class="inquiry-button">
                    <a href="/inquiryWrite">1:1 문의하기</a>
                </div>
            </div>
        </div>
    </div>


    <footer class="py-5 ">
        <div class="container">
            <p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조 주소: 서울특별시 마포구 |</p>
            <p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스: 042-526-9289 |</p>
            <p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문 (jsfood5@naver.com) |</p>
            <p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
        </div>
    </footer>

     <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
