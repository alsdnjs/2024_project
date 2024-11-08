<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>1:1 문의</title>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
}

.inquiry-list {
	margin-top: 20px;
	border-top: 1px solid #dee2e6;
}

.inquiry-list p {
	font-size: 0.9rem;
	margin-bottom: 10px;
	margin-top: 40px;
	margin-left: 30px;
}

/* 메인 css */
.dashboard-title {
	font-weight: bold;
	font-size: 1.5rem;
	margin-bottom: 20px;
}

.inquiry-details {
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #dee2e6;
	border-radius: 5px;
}

.inquiry-details h4 {
	font-size: 1.2rem;
	margin-bottom: 10px;
}

.inquiry-button {
	text-align: left;
	margin-top: 20px;
}

.inquiry-button a {
	background-color: #e8e6e6;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

.inquiry-button a:hover {
	background-color: #d4d4d4;
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

.navbar-toggler {
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
}

.side-main-container {
	display: flex;
	justify-content: center;
}

/* 사이드바 스타일 */
#sidebar {
	background-color: white;
	padding: 15px;
	height: 100vh;
	position: relative;
	left: -250px;
	top: 0;
	width: 250px;
	transition: transform 0.5s ease;
}

/* 메인 콘텐츠는 고정 */
.main-content {
	padding: 20px;
	transition: margin-left 0.5s ease;
	margin-left: 0;
	padding-left: 15%; /* 좌우 15% 여백 */
	padding-right: 15%;
	flex: 1;
}
/* 사이드바 오른쪽 중간에 토글 버튼 스타일 */
#toggleSidebar {
	position: absolute;
	top: 50%; /* 수직 가운데 */
	right: -30px; /* 사이드바 오른쪽 밖으로 조금 나오게 */
	transform: translateY(-50%); /* 정확히 가운데 맞추기 */
	background-color: red;
	border: none;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
	border-radius: 50%; /* 버튼을 원형으로 만듦 */
	display: none; /* 기본적으로 숨김 */
}

/* 큰 화면에서 사이드바 항상 보이기 */
@media ( min-width : 1200px) {
	#sidebar {
		position: relative;
		transform: translateX(0);
		left: 0; /* 큰 화면에서는 항상 사이드바 보임 */
	}
	#toggleSidebar {
		display: none; /* 큰 화면에서는 토글 버튼 숨김 */
	}
	.main-content {
		padding-left: 5%;
		padding-right: 5%;
	}
	.sidebar-size-controll {
		width: 15%;
	}
}

/* 작은 화면에서 토글 버튼 보이게 하고, 사이드바 숨기기 */
@media ( max-width : 1199px) {
	#sidebar.show {
		transform: translateX(250px); /* 왼쪽에서 오른쪽으로 나옴 */
	}
	#toggleSidebar {
		display: block; /* 작은 화면에서 토글 버튼 보이게 */
	}
	#sidebar {
		left: -250px; /* 사이드바 숨기기 */
		z-index: 2;
		position: fixed;
	}
	.main-content {
		padding-left: 10%;
		padding-right: 10%;
		height: 700px;
		position: relative;
	}
	.footer {
		z-index: 1;
	}
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

	<div class="side-main-container">
		<div class="sidebar-size-controll"></div>
		<!-- 사이드바 -->
		<div id="sidebar" class="sidebar">
			<a href="/mypage">나의 경빈이네</a> <a href="/orderHistory">주문/배송 내역</a> <a
				href="/updateProfile">회원정보수정</a> <a href="/myInquiry" class="active">나의
				상품문의</a>
			<button id="toggleSidebar">>></button>
		</div>

		<!-- 메인 컨테이너 -->
		<div class="container-fluid main-content">
			<div class="row">
				<!-- 메인 콘텐츠 -->
				<form method="post">
				<div class="mt-4" id="main-content">
					<h1 class="dashboard-title mt-4">1:1 문의 상세</h1>

					<!-- 문의 상세 내용 -->
					<div class="inquiry-details">
						<h4>문의 제목: ${mivo.subject}</h4>
						<p>
							<strong>분류:</strong> ${mivo.category}
						</p>
						<p>
							<strong>작성일:</strong> ${mivo.write_date}
						</p>
						<p>
							<strong>제목:</strong> <a>${mivo.subject}</a>
						</p>
						<p>
							<strong>문의 내용:</strong> <a>${mivo.content}</a>
						</p>
						<p>
							<strong>파일 첨부:</strong>
						</p>
						<c:choose>
						<c:when test="${empty mivo.f_name}">
							<td><b>첨부파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<td><a href="/user_inquiry_down?f_name=${mivo.f_name}">
								<img alt="" src="resources/upload/${mivo.f_name}" style="width: 250px"></a>
									<br>${mivo.f_name} </td>
						</c:otherwise>
					</c:choose>
						<hr>
						<p>
							<strong>답변:</strong>
						</p>
						<c:choose>
							<c:when test="${empty answer}">
								<p>아직 답변이 등록되지 않았습니다.</p>
							</c:when>
							<c:otherwise>
								<p>${answer}</p>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- 돌아가기 버튼 -->
					<div class="inquiry-button mt-4">
						<a href="/myInquiry?cPage=${cPage}">목록</a>
					</div>
				</div>
				</form>
			</div>
		</div>
		<div class="sidebar-size-controll"></div>
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
				if ($("#toggleSidebar").text() == ">>") {
					$("#toggleSidebar").text("<<");
				} else {
					$("#toggleSidebar").text(">>");
				}
			});
		});
	</script>
</body>
</html>