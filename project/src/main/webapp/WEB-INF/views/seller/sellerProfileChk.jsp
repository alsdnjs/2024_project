<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원정보 수정</title>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <style>
        body {
            font-family: "Single Day", cursive !important;
            display: flex;
                font-weight: 400;
                font-style: normal;
        }

        body, html {
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            flex-direction: column;
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

        .form-container {
            margin-top: 20px;
        }

        .dashboard-title {
            font-weight: bold;
            font-size: 1.5rem;
            margin-bottom: 20px;
            margin-left: 0px;
        }

        .inquiry-list {
            margin-top: 20px;
            border-top: 1px solid #dee2e6;
        }

        .inquiry-list h6 {
            font-size: 1rem;
            font-weight: bold;
            margin-top: 20px;
        }

        .inquiry-list p {
            font-size: 0.9rem;
            margin-bottom: 10px;
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

         /* 배송단계 내역 여백 추가 */
.shipping-status {
	margin-top: 40px;
}


/* 고객센터 스타일 */
.customer-center {
	text-align: center;
	margin-top: 50px;
}
.btn.btn-primary{
	background-color: red;
	border: 1px solid red;
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

.discount-text {
	color: #ffa64d; /* 연한 주황색 */
	font-size: small !important;
}

.navbar-toggler{
    z-index: 1;
}
.box {
	white-space: nowrap;
	overflow: hidden;
}

.footer {
    z-index: 10;
    background-color: LightCoral; /* 원하는 색상으로 변경 */
    text-align: center;
    padding: 10px 0;
   margin-top: auto;
}

.side-main-container{
    display: flex;
    justify-content: center;
}


           /* 사이드바 스타일 */
    #sidebar {
        background-color: white;
        padding: 15px;
        height: 100vh;
        position: fixed;
        left: -250px;  /* 처음에 화면 밖에 숨김 */
        top: 0;
        width: 250px;
        transition: transform 0.5s ease;
    }

    /* 메인 콘텐츠는 고정 */
    #main-content {
        padding: 20px;
        transition: margin-left 0.5s ease;

        float: left;
        flex: 1;
    }
    /* 사이드바 오른쪽 중간에 토글 버튼 스타일 */
    #toggleSidebar {
        position: absolute;
        top: 50%;  /* 수직 가운데 */
        right: -30px;  /* 사이드바 오른쪽 밖으로 조금 나오게 */
        transform: translateY(-50%);  /* 정확히 가운데 맞추기 */
        background-color: red;
        border: none;
        color: white;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 50%;   /* 버튼을 원형으로 만듦 */
        display: none;  /* 기본적으로 숨김 */
    }

       /* 큰 화면에서 사이드바 항상 보이기 */
       @media (min-width: 1200px) {
            #sidebar {
                position: relative;
                transform: translateX(0);
                left: 0;  /* 큰 화면에서는 항상 사이드바 보임 */

            }
            #toggleSidebar {
                display: none;  /* 큰 화면에서는 토글 버튼 숨김 */
            }
            .main-content {
                margin-left: 5%;
                margin-right : 20%;
            }
            .sidebar-size-controll{
                width: 15%;
            }
        }

        /* 작은 화면에서 토글 버튼 보이게 하고, 사이드바 숨기기 */
        @media (max-width: 1199px) {
            #sidebar.show {
                transform: translateX(250px); /* 왼쪽에서 오른쪽으로 나옴 */
            }
            #toggleSidebar {
                display: block;  /* 작은 화면에서 토글 버튼 보이게 */
            }
            #sidebar {
                left: -250px;  /* 사이드바 숨기기 */
                z-index: 2;
                position: fixed;
            }
            .main-content {
                
                margin-left: 15%;
                margin-right: 15%;
                height: 700px;
                position: relative;
            }
            .footer{
                z-index: 1;
            }
            
        }
        
       .alert-container {
            display: flex;
            justify-content: center;  /* 수평 가운데 정렬 */
            align-items: center;      /* 수직 가운데 정렬 */
            height: 100vh;            /* 화면 전체 높이를 사용 */
        }
        .alert {
            width: 50%;                /* 원하는 너비로 설정 */
            text-align: center;        /* 텍스트 가운데 정렬 */
            margin: 0 auto;            /* 자동 여백으로 수평 가운데 정렬 */
        }


    </style>
</head>
<body>

<!-- 상단 네비게이션 바 -->
<header>
		<nav class="navbar navbar-expand-lg">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="#!">경빈이네</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa-solid fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#!">로그인 / 회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">돼지고기</a></li>
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

    <c:if test="${not empty message}">
        <div class="alert alert-danger" role="alert">
            ${message}
        </div>
    </c:if>
<div class="side-main-container">
    <div class="sidebar-size-controll"></div>
    <!-- 사이드바 -->
    <div id="sidebar" class="sidebar">
        <a href="/mypage">나의 경빈이네</a>
        <a href="/orderHistory">주문/배송 내역</a>
        <a href="#">회원정보수정</a>
        <a href="/myInquiry">나의 1:1 문의</a>
        <%
		String userRole = (String) session.getAttribute("user_role");
		if (userRole != null) {
		if (userRole.equalsIgnoreCase("사업자")) {
		%> <a href="/sellerProfile">판매자정보수정</a> <%
 		}
		}
 		%>
       
        <button id="toggleSidebar">>></button>
    </div>
    <!-- 메인 컨테이너 -->
    <div class="container-fluid main-content" id="main-content">
		
        <div class="form-container">
        <h1 class="dashboard-title"> 판매자 정보 확인하기<hr></h1><br>
        
        <!-- chk에서 detail로, 그다음에 update로 넘어가는 형식. 하나보기 화면으로 이동 -->
        <form action="/seller_profile_detail" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">아이디</label>
                <input type="text" class="form-control" id="user_id" value="${user_id }" readonly disabled>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호*</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="현재 비밀번호를 입력해주세요" required>
            </div><br>
            <button type="submit" class="btn btn-primary">확인</button>
        </form>
    </div>
</div>
</div>

<footer class="py-5 footer">
    <div class="container">
        <p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조
            주소: 서울특별시 마포구 |</p>
        <p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스:
            042-526-9289 |</p>
        <p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문
            (jsfood5@naver.com) |</p>
        <p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사
            ALL RIGHTS RESERVED. |</p>
    </div>
</footer>
<script>
    $(document).ready(function() {
        // 토글 버튼 클릭 시 사이드바 열고 닫기 및 메인 콘텐츠 이동
        $('#toggleSidebar').click(function() {
            $('#sidebar').toggleClass('show');
            if($("#toggleSidebar").text() == ">>"){
                $("#toggleSidebar").text("<<");
            }else{
                $("#toggleSidebar").text(">>");
            }
        });
    });
</script>
</body>
</html>