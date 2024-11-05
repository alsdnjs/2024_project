<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 혜택</title>
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
/* 시작 */
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
.dashboard-title {
        font-weight: bold;
        font-size: 1.5rem;
        margin-bottom: 20px;
    }
    
    .table-container {
        max-width: 100%;
        margin: 0 auto;
    }

    .membership-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .membership-table th,
    .membership-table td {
        padding: 40px; 
        text-align: center;
        border: 1px solid #ddd;
    }

    .membership-table th {
        background-color: #f3f3f3;
        font-weight: bold;
    }

    .membership-table td {
        font-size: 16px;
        color: #333;
    }

    .membership-table .badge {
        font-size: 14px;
        font-weight: bold;
        color: white;
        padding: 5px 10px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .badge-vplus {
        background-color: #5669cc;
    }

    .badge-vip {
        background-color: #f05c5c;
    }

    .badge-gold {
        background-color: #d4af37;
    }

    .badge-silver {
        background-color: #b0b0b0;
    }

    .badge-family {
        background-color: #5abf5a;
    }

footer {
	background-color: LightCoral; /* 원하는 색상으로 변경 */
}
/* 끝 */
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
                <a href="/rank" class="active">등급 혜택</a>
                <a href="/productinquiries">상품 문의</a>
                <a href="/oneinquiries">1:1 문의</a>
            </div>

			<!-- 메인 콘텐츠 -->
			 <div class="col-md-10">
      <div class="container mt-4">
        <h1 class="dashboard-title">등급 혜택</h1><hr><br><br>

        <div class="table-container">
            <table class="membership-table">
                <thead>
                    <tr>
                        <th>등급</th>
                        <th>달성 조건</th>
                        <th>혜택</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><span class="badge badge-vip">V</span> VIP</td>
                        <td>분기 중 월 300만원 구매</td>
                        <td>상품 구매 시 15% 할인</td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-gold">G</span> GOLD</td>
                        <td>분기 중 월 100만원 구매</td>
                        <td>상품 구매 시 8% 할인 </td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-silver">S</span> SILVER</td>
                        <td>분기 중 월 1회 구매</td>
                        <td>상품 구매 시 3% 할인</td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-family">F</span> FAMILY</td>
                        <td>신규 회원가입 , 기존 회원</td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
        </div>

      </div>
    </div>
  </div>
</div>
	<footer class="py-5 ">
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


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="js/scripts.js"></script>
</body>
</html>
