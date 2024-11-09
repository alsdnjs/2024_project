<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
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


.faq-section {
	width: 80%;
	margin: 0 auto;
	border: 1px solid #ddd;
	background-color: #fff;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	padding: 15px;
}

.faq-item {
	border-bottom: 1px solid #ddd;
	padding: 20px 10px;
	cursor: pointer;
}

.faq-item:last-child {
	border-bottom: none;
}

.faq-question {
	display: flex;
	align-items: center;
	font-size: 18px;
	font-weight: bold;
	color: #d73b3b;
	margin-bottom: 10px;
}

.faq-question span {
	margin-right: 10px;
}

.faq-answer {
	display: none;
	font-size: 16px;
	color: #333;
	line-height: 1.6;
	background-color: #f9f9f9;
	padding: 15px;
	border-radius: 5px;
}

.faq-answer p {
	margin: 10px 0;
}

.faq-note {
	color: #888;
	font-size: 14px;
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
					<c:choose>
                            <c:when test="${sessionScope.loginStatus == 'ok'}">
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user_logout">로그아웃</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user_login">로그인 / 회원가입</a></li>
                            </c:otherwise>
                        </c:choose>

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
                <a href="/questions" class="active">자주 묻는 질문</a>
                <a href="/rank">등급 혜택</a>
              
            </div>

			<!-- 메인 콘텐츠 -->
			<div class="col-md-10 notice-section">
				<div class="container mt-4">
					<h1 class="dashboard-title">자주 묻는 질문</h1>
					<hr>
<br>
					<br>

					<div class="faq-section">
						<div class="faq-item">
							<div class="faq-question">
								<span>Q.</span> 반품 하고 싶어요.
							</div>
							<div class="faq-answer">
								<p>저희 사이트는 취소만 가능합니다 </p>
								<p>주문 시키기 전 신중하게 고르시고 주문 해주시면 감사하겠습니다.</p>
								<!-- 예시 텍스트 -->
							</div>
						</div>
						
						

						<div class="faq-item">
							<div class="faq-question">
								<span>Q.</span> 배송 방법은 어떻게 되나요?
							</div>
							<div class="faq-answer">
								<p>A. 배송은 기본적으로 신선물류(냉동탑차)배송 
								/택배 배송이 있으며, 신선물류지역은 오뚜기물류서비스와 
								제휴관계 맺고 있어 냉동차로 배송되며 택배 배송지역은 상품 주문시 일반적인 택배로 배송됩니다.
								</p>
								<p>사업장이 아닌 아파트나 빌라, 개인주택의 경우 택배로 배송이 되며 2층 이상의 건물도 택배로 배송이 됩니다.</p>
								<p class="faq-note">※ *하절기 경우 냉장상품의 택배 배송은 일시적으로 중단 됩니다.
									</p>
							</div>
						</div>
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
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<script>
		$(document).ready(function() {
			// 클릭 시 토글
			$(".faq-item").click(function() {
				$(this).find(".faq-answer").slideToggle(); // 답변 열기/닫기
				$(this).siblings().find(".faq-answer").slideUp(); // 다른 항목은 닫기
			});
		});
	</script>
</body>
</html>
