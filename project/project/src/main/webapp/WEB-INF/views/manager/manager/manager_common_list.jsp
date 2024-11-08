<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>super 관리자의 관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}

.sidebar {
	height: 100vh;
	background-color: #ececec;
}

.sidebar h3 {
	font-size: 18px;
	margin-bottom: 15px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin: 10px 0;
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
	display: block;
	padding: 10px;
}

.sidebar ul li a:hover {
	background-color: #ddd;
	border-radius: 5px;
}

.admin-greeting {
	text-align: right;
	margin-bottom: 20px;
}

.admin-greeting a {
	color: #333;
	text-decoration: none;
	margin-left: 20px;
}

table {
	margin-bottom: 20px;
}

.resgister-link {
	text-decoration: none;
	color: #333;
	font-size: 16px;
	display: block;
	padding: 10px;
}

.btn-custom {
	display: inline-block;
	padding: 5px; /* Add padding for a better clickable area */
	background-color: lightgrey; /* Bootstrap primary color */
	color: white; /* Text color */
	border: none; /* Remove default border */
	border-radius: 5px; /* Rounded corners */
	text-decoration: none; /* Remove underline */
	transition: background-color 0.3s, transform 0.2s;
}

.btn-custom:hover {
	background-color: #868e96;
	transform: scale(1.05); /* Slightly enlarge on hover */
}
/* 아이콘과 입력란 스타일 */
.search-container {
	position: relative;
	width: 80%; /* 검색 입력란의 넓이 조정 */
}

.search-container input {
	padding-right: 30px; /* 오른쪽에 아이콘이 들어갈 공간 확보 */
}

.search-button {
	position: absolute;
	top: 50%;
	right: 390px;
	transform: translateY(-50%);
	background-color: transparent;
	border: none;
	color: #888;
	cursor: pointer;
	padding: 5px;
	transition: color 0.3s ease;
}

.search-button:hover {
	color: #333;
}
</style>
</head>
<body>
	<div class="container-fluid">

		<div class="row">
			<nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar p-3">

				<ul>
					<li>
						<%
						String managerType = (String) session.getAttribute("manager_type");
						if (managerType != null) {
							if (managerType.equalsIgnoreCase("super")) {
						%> <a href="/manager_list">관리자 권한관리</a> <%
						 } else if (managerType.equalsIgnoreCase("common")) {
 						%> <a href="/manager_common">관리자 권한관리</a> <%
 						}
 						}
						 %>
					</li>
					<li><a href="/user_list">회원관리</a></li>
					<li class="nav-item"><a href="/seller_list" class="nav-link">판매자관리</a></li>
					<li class="nav-item"><a href="/product_list" class="nav-link">상품관리</a></li>
					<li class="nav-item"><a href="/order_list" class="nav-link">주문정보</a></li>
					<li class="nav-item"><a href="/inquiry_list" class="nav-link">1:1 문의</a></li>
					<li class="nav-item"><a href="/adminnotice_list" class="nav-link">공지사항</a></li>

				</ul>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<!-- 관리자 인사 및 로그아웃 -->
				<div class="admin-greeting">
					<%
					// 세션에서 로그인한 관리자 이름 가져오기
					String managerName = (String) session.getAttribute("manager_name");
					if (managerName != null) {
						out.print("관리자 " + managerName + "님 환영합니다.");
					} else {
						out.print("관리자 님 환영합니다.");
					}
					%>
					<a href="/logout" class="btn btn-outline-secondary">로그아웃</a>
				</div>

				<!-- 검색 바 -->
				<div class="search-bar d-flex justify-content-between mb-4">
					<div class="search-container">
						<input type="text" class="form-control w-50"
							placeholder="검색어를 입력하세요">
						<button type="button" class="search-button">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<h3>관리자 정보 보기</h3>

				<table class="table table-striped table-bordered">
					<thead class="table-dark">
						<tr>
							<th></th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>관리자 유형</th>
							<th>이메일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td colspan="7"><h5>관리자님은 이 정보에 대한 접근 권한이 없습니다.</h5></td>
						</tr>

					</tbody>
				</table>
			</main>
		</div>
	</div>
</body>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조 주소:
			서울특별시 마포구 |</p>

		<div class="container">
			<p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스:
				042-526-9289 |</p>

			<div class="container">
				<p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문
					(jsfood5@naver.com |</p>

				<div class="container">
					<p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사
						ALL RIGHTS RESERVED. |</p>
				</div>
			</div>
		</div>
	</div>
</footer>
</html>












