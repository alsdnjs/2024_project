<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.taglibs.standard.functions.Functions"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	padding: 5px;
	background-color: lightgrey;
	color: white;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s, transform 0.2s;
}

.btn-custom:hover {
	background-color: #868e96;
	transform: scale(1.05);
}

.update-link {
	text-decoration: none;
	color: #007bff;
	padding: 5px 10px;
	background-color: #e9ecef;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.update-link:hover {
	background-color: #007bff;
	color: white;
	transform: scale(1.05);
}
/* 아이콘과 입력란 스타일 */
.search-container {
	position: relative;
	width: 80%; /* 검색 입력란의 넓이 조정 */
}

.search-container input {
	padding-right: 30px; /* 오른쪽에 아이콘이 들어갈 공간 확보 */
}
</style>
</head>
<script type="text/javascript">
	function maskUserId(userId) {
		if (userId && userId.length > 2) {
			return userId.substring(0, 1) + "***" + userId.substring(4);
		}
		return userId;
	}
</script>
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

				<c:set var="currentPage"
					value="${param.page != null ? param.page : 1}" scope="request" />
				<c:set var="pageSize" value="10" />

				<!-- 관리자 인사 및 로그아웃 -->
				<div class="admin-greeting">
					<%
					// 세션에서 로그인한 관리자 이름 가져오기
					String managerName = (String) session.getAttribute("manager_name");
					managerType = (String) session.getAttribute("manager_type");
					if (managerName != null) {
						if (managerType.equalsIgnoreCase("super")) {
							out.print("슈퍼관리자 " + managerName + "님 환영합니다.");
						} else {
							out.print("관리자 " + managerName + "님 환영합니다.");
						}
					} else {
						out.print("슈퍼관리자 님 환영합니다.");
					}
					%>
					<a href="/logout" class="btn btn-outline-secondary">로그아웃</a>
				</div>

				<!-- 검색 바 -->
				<div class="search-bar d-flex justify-content-between mb-4">
					<div class="search-container">
						<form action="/order_search" method="get">
							<input type="text" name="keyword" class="form-control w-50"
								placeholder="검색어를 입력하세요">
						</form>
					</div>
				</div>

				<h3>주문 정보 보기</h3>
				<div class="register-link">
					<p>
						<a href="/order_list" class="btn-custom">정보 새로고침</a>
					</p>
				</div>
				<table class="table table-striped table-bordered">
					<thead class="table-dark">
						<tr>
							<th></th>
							<th>주문번호</th>
							<th>주문자 id</th>
							<th>상품번호</th>
							<th>발송 주소 id</th>
							<th>주문 금액</th>
							<th>결제 상태</th>
							<th>발송 상태</th>
							<th>주문 일자</th>
							<th>주문 메모</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbody">

						<c:choose>
							<c:when test="${empty order_list }">
								<tr>
									<td colspan="8"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
								</tr>
							</c:when>
							<c:otherwise>

								<c:forEach items="${order_list}" var="k" varStatus="c">
									<tr>
										<td>${c.index + 1 + ((currentPage - 1) * pageSize)}</td>
										<td>${k.orders_idx }</td>

										<td><script>
											document
													.write(maskUserId('${k.user_idx}'));
										</script></td>

										<td>${k.product_idx }</td>
										<td>${k.address_idx }</td>
										<td>${k.total_amount }</td>
										<td>${k.payment_status }</td>
										<td>
										<c:choose>
											<c:when test="${k.status == '대기'}">
												<span style="color: red;">${k.status}</span>
											</c:when>
											<c:when test="${k.status == '발송'}">
												<span style="color: blue;">${k.status}</span>
											</c:when>
											<c:otherwise>
												<span style="color: black;">${k.status}</span>
											</c:otherwise>
										</c:choose>
										</td>
										<td>${k.order_date }</td>
										<td>${k.notes }</td>


										<td><a href="/order_detail?orders_idx=${k.orders_idx}"
											class="update-link">관리</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<c:if test="${currentPage > 1}">
						<a href="/order_list?page=${currentPage - 1}"
							class="btn btn-outline-primary mx-1">Previous</a>
					</c:if>
					<c:if test="${currentPage < totalPages}">
						<a href="/order_list?page=${currentPage + 1}"
							class="btn btn-outline-primary mx-1">Next</a>
					</c:if>
				</div>
			</main>
		</div>
	</div>

	<footer class="py-5 bg-dark">
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

</body>
</html>












