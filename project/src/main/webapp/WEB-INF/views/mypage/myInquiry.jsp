<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.inquiry-button {
	text-align: right;
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
/* 아코디언 스타일 조정 */
.accordion {
	width: 80%; /* 원하는 너비로 설정 (예: 80%) */
	max-width: 700px; /* 최대 너비 설정 (예: 700px) */
}

/* 아코디언 버튼 스타일 */
.accordion-button {
	text-align: left; /* 텍스트 정렬을 왼쪽으로 */
	white-space: nowrap; /* 텍스트를 한 줄로 유지 */
	overflow: hidden; /* 넘치는 텍스트는 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트에 '...' 표시 */
}

/* 아코디언 바디 스타일 */
.accordion-body {
	font-size: 14px; /* 글자 크기 설정 */
	white-space: normal; /* 본문 텍스트는 여러 줄에 걸쳐 표시 */
}

/* 아코디언 항목 간격 조정 */
.accordion-item {
	margin-bottom: 10px; /* 항목 간의 간격 설정 */
}

hr {
	width: 800px;
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
.subjecth{
	text-decoration: none;
	color: black;
}
/* 페이징 컨테이너를 한 줄로 정렬 */
.paging {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5px; /* 각 요소 간격 */
}

/* << >> 버튼 및 페이지 번호 스타일 */
.paging a, .paging p {
	margin: 0 5px;
	padding: 5px 10px;
	color: #333;
	text-decoration: none;
	border: 1px solid transparent;
	border-radius: 4px;
	transition: all 0.3s;
	cursor: pointer;
}
/* 페이지 번호 기본 스타일 */
.paging a {
	margin: 0 5px;
	padding: 5px 10px;
	color: #333;
	text-decoration: none;
	border: 1px solid transparent;
	border-radius: 4px;
	transition: all 0.3s;
}

.paging a:hover {
	background-color: #f0f0f0;
	border-color: #ddd;
}

/* 선택된 페이지 스타일 */
.paging .now {
	padding: 5px 10px;
	color: #fff;
	background-color: #ffcccc;
	border: 2px solid #fcb6b6; /* 테두리도 동일한 색상 */
	border-radius: 4px;
}
/* << >> 버튼 비활성화 상태 스타일 */
.paging .disable {
	color: #ccc;
	cursor: not-allowed;
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
						<li class="nav-item dropdown">   <a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
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
                            placeholder="검색어를 입력하세요">
                    </form>
                </div>
				 <form class="d-flex" action="/cart_list" method="get">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
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
			<a href="/mypage">나의 경빈이네</a> 
			<a href="/orderHistory">주문/배송 내역</a> 
			<a href="/updateProfile">회원정보수정</a>
			 <a href="/myInquiry" class="active">나의 1:1 문의</a>
        <%
        String userRole = (String) session.getAttribute("user_role");
        if (userRole != null) {
        if (userRole.equalsIgnoreCase("사업자")) {
        %> <a href="/sellerProfileChk">판매자정보수정</a> <%
         }
        }
         %>
			<button id="toggleSidebar">>></button>
		</div>

		<!-- 메인 컨테이너 -->
		<div class="container-fluid main-content">
			<div class="row">

				<!-- 메인 콘텐츠 -->
				<div class="mt-4" id="main-content">
					<h1 class="dashboard-title mt-4">나의 1:1 문의</h1>

					<!-- 등록된 문의 목록 -->
					<div class="inquiry-list">
						<c:choose>
							<c:when test="${empty list}">
								<br>
								<br>
								<h6>나의 문의가 존재하지 않습니다.</h6>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${list}" varStatus="c">
									<p>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + c.index)}&nbsp;
										<strong>${k.category}</strong><br> <a
											href="/inquiryDetail?u_idx=${k.u_idx}&cPage=${paging.nowPage}">${k.subject}</a>
										&nbsp;&nbsp;&nbsp;${k.write_date}
									</p>

									<!-- 아코디언 적용 -->
									<div class="accordion" id="accordionExample">
										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${c.index}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${c.index}" aria-expanded="false"
													aria-controls="collapse${c.index}">답변 보기</button>
											</h2>

											<div id="collapse${c.index}"
												class="accordion-collapse collapse"
												aria-labelledby="heading${c.index}"
												data-bs-parent="#accordionExample${c.index}">
												<div class="accordion-body">
													관리자 답변: <a>${answerList[c.index].answer}</a>
												</div>
											</div>

										</div>
									</div>
									<hr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- 페이지기법 -->
					<div class="paging">
						<!-- 이전 -->
						<c:choose>
							<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
								<p class="disable"></p>
							</c:when>
							<c:otherwise>
								<p>
									<a
										href="/myInquiry?cPage=${paging.beginBlock - paging.pagePerBlock}"></a>
								</p>
							</c:otherwise>
						</c:choose>
						<!-- 블록안에 들어간 페이지번호들 -->
						<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
							step="1" var="k">

							<%-- 현재페이지(링크X)와 현패페이지가 아닌 것을 구분하자 --%>
							<c:if test="${k == paging.nowPage}">
								<a class="now">${k}</a>
							</c:if>
							<c:if test="${k != paging.nowPage}">
								<a href="/myInquiry?cPage=${k}">${k}</a>
							</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:choose>
							<c:when test="${paging.endBlock >= paging.totalPage}">
								<p class="disable">>></p>
							</c:when>
							<c:otherwise>
								<p>
									<a
										href="/myInquiry?cPage=${paging.beginBlock + paging.pagePerBlock}">>></a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 1:1 문의하기 버튼 -->
					<div class="inquiry-button">
						<a href="/inquiryWrite">1:1 문의하기</a>
					</div>


				</div>
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