<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송 내역</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: "Single Day", cursive !important;
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

.dashboard-title {
	font-weight: bold;
	font-size: 1.5rem;
	margin-bottom: 20px;
}

.main-content {
	padding-left: 15%;
	padding-right: 15%;
}

.table-header {
	background-color: red !important; /* 빨간색 배경 적용 */
	color: white !important;
}

.table td, .table th {
	vertical-align: middle;
	text-align: center;
}

.order-info {
	font-size: 0.9rem;
}

/* 사이드바 스타일 */
#sidebar {
	background-color: white;
	padding: 15px;
	height: 100vh;
	position: fixed;
	left: -250px; /* 처음에 화면 밖에 숨김 */
	top: 0;
	width: 250px;
	transition: transform 0.3s ease;
}

/* 사이드바가 보일 때 */
#sidebar.show {
	transform: translateX(250px); /* 왼쪽에서 오른쪽으로 나옴 */
}

/* 메인 콘텐츠는 고정 */
#main-content {
	padding: 20px;
	transition: margin-left 0.3s ease;
	margin-left: 0;
	padding-left: 18%; /* 좌우 15% 여백 */
	padding-right: 15%;
	z-index: -1;
}

/* 사이드바 오른쪽 중간에 토글 버튼 스타일 */
#toggleSidebar {
	position: absolute;
	top: 50%; /* 수직 가운데 */
	right: -30px; /* 사이드바 오른쪽 밖으로 조금 나오게 */
	transform: translateY(-50%); /* 정확히 가운데 맞추기 */
	background-color: #007bff;
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
		margin-top: 103px;
		left: 0; /* 큰 화면에서는 항상 사이드바 보임 */
		transform: translateX(0);
		left: 15%;
	}
	#toggleSidebar {
		display: none; /* 큰 화면에서는 토글 버튼 숨김 */
	}
	#main-content {
		margin-left: 100px; /* 메인 콘텐츠도 사이드바 크기만큼 밀림 */
	}
}

/* 작은 화면에서 토글 버튼 보이게 하고, 사이드바 숨기기 */
@media ( max-width : 1199px) {
	#toggleSidebar {
		display: block; /* 작은 화면에서 토글 버튼 보이게 */
		background-color: red;
	}
	#sidebar {
		left: -250px; /* 사이드바 숨기기 */
	}
	#main-content {
		margin-left: 0; /* 작은 화면에서는 메인 콘텐츠가 기본 위치 */
		position: fixed;
	}
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

/* 푸터의 css */
footer {
	z-index: 10;
	background-color: LightCoral; /* 원하는 색상으로 변경 */
	text-align: center;
	padding: 10px 0;
	margin-top: auto;
}

.navbar-brand {
	margin-left: -42px;
}

.d-flex {
	margin-right: -60px;
}
</style>
</head>
<body>

	<!-- 상단 네비게이션 바 -->
	<header>
		<nav class="navbar navbar-expand-lg">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="/main">경빈이네</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa-solid fa-bars"></i>
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
						<li class="nav-item"><a class="nav-link" href="/notice">고객센터</a></li>
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

	<!-- 사이드바 -->
	<div id="sidebar" class="sidebar">
		<a href="/mypage">나의 경빈이네</a> <a href="#" class="active">주문/배송 내역</a>
		<a href="/updateProfile">회원정보수정</a> <a href="/myInquiry">나의 상품문의</a>
		<button id="toggleSidebar">☰</button>
	</div>

	<!-- 메인 컨테이너 -->
	<div class="container-fluid main-content">
		<div class="row">
			<!-- 주문/배송 내역 콘텐츠 -->
			<div class="col-md-10" id="main-content">
				<div class="container mt-4">
					<h1 class="dashboard-title">주문/배송 내역</h1>
					<hr>
					<br>
					<c:choose>
						<c:when test="${empty list}">
							<p>주문/배송 내역이 없습니다.</p>
						</c:when>
						<c:otherwise>
								<table class="table table-bordered" style="align-items: center">
									<thead class="table-header">
										<tr>
											<th>no.</th>
											<th>운송장번호</th>
											<th>주문일</th>
											<th>상품정보</th>
											<th>총금액</th>
											<th>주문상태</th>
										</tr>
									</thead>
							<c:forEach var="k" items="${list}" varStatus="c">
									<tbody>
										<tr>
										<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + c.index)}</td>
											<td>${k.tracking_number}</td>
											<td>${k.order_date}</td>
											<td class="order-info">${k.product_name}</td>
											<td><fmt:formatNumber value="${k.total_amount}" type="number" />원</td>
											<td>${k.status}</td>
										</tr>
									</tbody>
							</c:forEach>
								</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- 여기서부터 푸터 -->
	<footer class="footer py-5">
		<div class="container">
			<p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조
				주소: 서울특별시 마포구 |</p>

			<div class="container">
				<p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스:
					042-526-9289 |</p>

				<div class="container">
					<p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문
						(jsfood5@naver.com |</p>

					<div class="container">
						<p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네
							주식회사 ALL RIGHTS RESERVED. |</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script>
		$(document).ready(function() {
			// 토글 버튼 클릭 시 사이드바 열고 닫기 및 메인 콘텐츠 이동
			$('#toggleSidebar').click(function() {
				$('#sidebar').toggleClass('show');
				$('#main-content').toggleClass('shifted');
			});
		});
	</script>
	<!-- jQuery 및 최신 Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
