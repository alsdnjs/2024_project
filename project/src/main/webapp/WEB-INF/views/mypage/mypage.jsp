<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 경빈이네(메인)</title>
<%
String user_id = (String) session.getAttribute("user_id");
%>
<script>
	const user_id = "<%= user_id %>";
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">
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

.dashboard-title {
	font-weight: bold;
	font-size: 1.5rem;
	margin-bottom: 20px;
}

/* 박스 스타일 */
.dashboard-card {
	padding: 20px;
	margin-left: -120px;
	border-radius: 10px;
	background-color: #f8f9fa;
	text-align: center;
	font-size: 1.1rem;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 */
	width: 100%;
	max-width: 220px;
	min-height: 130px; /* 일정한 크기 */
	display: flex;
	justify-content: center;
	align-items: center;
	transition: 0.3s ease-in-out;
	text-decoration: none !important;
	color: black !important;
	flex-direction: column; /* 두 줄로 표시 */
}

.dashboard-card2 {
	padding: 5px;
	margin-left: 10px; border-radius : 10px;
	background-color: #f8f9fa;
	text-align: center;
	font-size: 1.1rem;
	width: 100%;
	min-height: 110px; /* 일정한 크기 */
	display: flex;
	justify-content: center;
	align-items: center;
	transition: 0.3s ease-in-out;
	color: black;
	flex-direction: column;
	border-radius: 10px; /* 두 줄로 표시 */
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
	color: balck !important;
	background-color: #e9ecef;
	box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
}

.dashboard-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.dashboard-div {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

/* 배송단계 내역 여백 추가 */
.shipping-status {
	margin-top: 60px;
}

/* 고객센터 스타일 */
.customer-center {
	text-align: center;
	margin-top: 50px;
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

/* 적립금 내역 스타일 */
.no-history {
	text-align: center;
	color: #999;
	margin: 30px 0;
}

.point_img {
	width: 40px;
	height: 40px;
	margin-right: 10px;
}

.tabs button.active {
	background-color: red;
}
/* 탭 스타일 */
.tabs {
	display: flex;
	justify-content: space-around;
	margin: 20px 0;
}

.tabs button {
	background-color: #fd0000;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 14px;
	border-radius: 20px;
}

/* 적립금 정보 스타일 */
.points-info {
	text-align: center;
	margin: 20px 0;
}

.points-info h3 {
	font-size: 18px;
	color: black;
}

.points-amount {
	font-size: 24px;
	color: red;
	margin: 10px 0;
}

.product_img {
	width: 100%;
	height: auto;
	display: block;
	margin-right: 10px;
}

.box {
	white-space: nowrap;
	overflow: hidden;
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
	z-index: 1;
}

/* 사이드바가 보일 때 */

/* 메인 콘텐츠는 고정 */
#main-content {
	padding: 20px;
	transition: margin-left 0.3s ease;
	margin-left: 0;
	padding-left: 18%; /* 좌우 15% 여백 */
	padding-right: 15%;
	flex: 1;
}

/* 사이드바 오른쪽 중간에 토글 버튼 스타일 */
#toggleSidebar {
	position: absolute;
	top: 50%; /* 수직 가운데 */
	right: -30px; /* 사이드바 오른쪽 밖으로 조금 나오게 */
	transform: translateY(-50%); /* 정확히 가운데 맞추기 */
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
	#sidebar.show {
		transform: translateX(250px); /* 왼쪽에서 오른쪽으로 나옴 */
	}
	#toggleSidebar {
		display: block; /* 작은 화면에서 토글 버튼 보이게 */
		background-color: red;
	}
	#sidebar {
		left: -250px; /* 사이드바 숨기기 */
	}
	#main-content {
		margin-left: 0; /* 작은 화면에서는 메인 콘텐츠가 기본 위치 */
	}
}
/* 좌우 여백 추가 */
.main-content {
	padding-left: 15%; /* 좌우 15% 여백 */
	padding-right: 15%;
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
.footer {
	z-index: 10;
	background-color: LightCoral; /* 원하는 색상으로 변경 */
	text-align: center;
	padding: 10px 0;
	margin-top: auto;
}

.navbar-brand {
	margin-left: -35px;
}

.d-flex {
	margin-right: -70px;
}
.product_img{
        width: 100%;
        aspect-ratio: 4 / 3;  /* 1:1 비율 */
    }
.history-item {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
    color: #333;
}
.no-history hr{
    color: black;
}

.history-item hr {
    background-color: black;
    border: none; /* 기본 테두리를 제거하고 배경색만 남깁니다 */
    height: 1px; /* hr 요소의 두께 */
}
.no-history hr{
    color: black;
}

.history-item hr {
    background-color: black;
    border: none; /* 기본 테두리를 제거하고 배경색만 남깁니다 */
    height: 1px; /* hr 요소의 두께 */
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
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="products?category_idx=24002">돼지고기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="products?category_idx=24003">닭고기</a></li>
                                <li><a class="dropdown-item" href="products?category_idx=24001">소고기</a></li>
                            </ul>
                        </li>
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
		<a href="#" class="active">나의 경빈이네</a> <a href="/orderHistory">주문/배송
			내역</a> <a href="/updateProfile">회원정보수정</a> <a href="/myInquiry">나의
			1:1문의</a>
		<button id="toggleSidebar">☰</button>
	</div>

	<!-- 메인 컨테이너 -->
	<div class="container-fluid main-content">
		<div class="row">

			<!-- 메인 콘텐츠 -->
			<div class="col-md-12" id="main-content">
				<div class="container mt-4">
					<h1 class="dashboard-title box">나의 경빈이네</h1>
					<hr>

					<div class="row dashboard-container text-center mb-4 mt-xl-5"
						style="align-items: center">
						<div class="col-xl-3 col-md-6 dashboard-div">
							<a class="dashboard-card box" data-toggle="modal"
								data-target="#pointInfoModal" onclick="openPointsModal()">
								<p>적립금</p> <span id="totalPointsDisplay">0원</span>
							</a>
						</div>
						<div class="col-xl-3 col-md-6 dashboard-div">
							<a class="dashboard-card box" data-toggle="modal"
								data-target="#orderInfoModal" onclick="openLikesModal()">
								<p>관심 상품</p> <i class="fa-regular fa-heart"></i>
							</a>
						</div>
						<div class="col-xl-3 col-md-6 dashboard-div">
							<a href="/membership" class="dashboard-card box">
								<p>회원등급</p> <span class="badge badge-gold">G GOLD</span> <span
								class="discount-text">(8% 할인혜택)</span> <!-- 연한 주황색으로 할인혜택 표시 -->
							</a>
						</div>
					</div>
					<!-- 배송 상태 카드들 -->
					<div class="shipping-status">
						<i class="fa-solid fa-truck">진행중 주문</i>

						<div class="row text-center">
							<!-- 상태별 개수 변수 초기화 -->
							<c:set var="paymentCompletedCount" value="0" />
							<c:set var="preparingProductCount" value="0" />
							<c:set var="preparingShippingCount" value="0" />
							<c:set var="shippingPreparingCount" value="0" />
							<c:set var="shippingCompletedCount" value="0" />

							<!-- 목록을 반복하며 상태별 개수 누적 -->
							<c:forEach var="k" items="${clist}" varStatus="c">
								<c:if test="${k.status == '결제완료'}">
									<c:set var="paymentCompletedCount"
										value="${paymentCompletedCount + 1}" />
								</c:if>
								<c:if test="${k.status == '상품준비중'}">
									<c:set var="preparingProductCount"
										value="${preparingProductCount + 1}" />
								</c:if>
								<c:if test="${k.status == '배송준비중'}">
									<c:set var="shippingPreparingCount"
										value="${shippingPreparingCount + 1}" />
								</c:if>
								<c:if test="${k.status == '배송중'}">
									<c:set var="preparingShippingCount"
										value="${preparingShippingCount + 1}" />
								</c:if>
								<c:if test="${k.status == '배송완료'}">
									<c:set var="shippingCompletedCount"
										value="${shippingCompletedCount + 1}" />
								</c:if>
							</c:forEach>

							<!-- 결과 출력 -->
							<div class="col-xl-2 col-md-4 col-sm-6 mt-3">
								<div class="dashboard-card2 box">
									<p>결제완료</p>
									<span>${paymentCompletedCount}건</span>
								</div>
							</div>
							<div class="col-xl-2 col-md-4 col-sm-6 mt-3">
								<div class="dashboard-card2 box">
									<p>상품준비 중</p>
									<span>${preparingProductCount}건</span>
								</div>
							</div>
							<div class="col-xl-2 col-md-4 col-sm-6 mt-3">
								<div class="dashboard-card2 box">
									<p>배송준비 중</p>
									<span>${shippingPreparingCount}건</span>
								</div>
							</div>
							<div class="col-xl-2 col-md-4 col-sm-6 mt-3">
								<div class="dashboard-card2 box">
									<p>배송 중</p>
									<span>${preparingShippingCount}건</span>
								</div>
							</div>
							<div class="col-xl-2 col-md-4 col-sm-6 mt-3">
								<div class="dashboard-card2 box">
									<p>배송완료</p>
									<span>${shippingCompletedCount}건</span>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap Modal 1 -->
	<div class="modal fade" id="pointInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="pointInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="pointInfoModalLabel">적립금 내역</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
				</div>

				<!-- Modal Body with Input Form -->
				<div class="modal-body">
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
				<script type="text/javascript">
				// 페이지가 로드될 때 실행하여 적립금 표시 업데이트
				$(document).ready(function() {
				    loadTotalPoints();
				});

				function loadTotalPoints() {
				    $.ajax({
				        url: '/getpoint', 
				        method: 'GET',
				        data: { user_id: user_id }, // userIdx 변수가 사용자 ID를 저장하고 있어야 함
				        dataType: "json",
				        success: function(data) {
				            let totalPoints = 0;
				            for (let i = 0; i < data.length; i++) {
				                if (data[i].points_type === '적립') {
				                    totalPoints += data[i].points_amount;
				                } else if (data[i].points_type === '사용') {
				                    totalPoints -= data[i].points_amount;
				                }
				            }

				            // 0원 부분을 업데이트
				            $('#totalPointsDisplay').text(totalPoints.toLocaleString() + "원");
				        },
				        error: function(error) {
				            console.error("Error loading total points:", error);
				        }
				    });
				}

				function openPointsModal() {
				    $.ajax({
				        url: '/getpoint', 
				        method: 'GET',
				        data: { user_idx: user_id },
				        dataType: "json",
				        success: function(data) {
				            let modalBody = $('#pointInfoModal .modal-body');
				            modalBody.empty();

				            // 총 적립금 계산
				            let totalPoints = 0;
				            for (let i = 0; i < data.length; i++) {
				                if (data[i].points_type === '적립') {
				                    totalPoints += data[i].points_amount;
				                } else if (data[i].points_type === '사용') {
				                    totalPoints -= data[i].points_amount;
				                }
				            }

				            // 모달 내 적립금 표시 업데이트
				            let pointsInfo = "<div class='points-info'>";
				            pointsInfo += "<h3>사용 가능 적립금</h3>";
				            pointsInfo += "<div class='points-amount'>" + totalPoints.toLocaleString() + "원</div>";
				            pointsInfo += "</div>";
				            pointsInfo += "<div class='tabs'><button>전체내역</button></div>";
				            pointsInfo += "<hr>";
				            modalBody.append(pointsInfo);

				            // 적립금 내역 반복 표시
				            if (data.length === 0) {
				                modalBody.append("<div class='no-history'><hr>적립/사용 내역이 없습니다.</div>");
				            } else {
				                for (let i = 0; i < data.length; i++) {
				                    let description = data[i].description;
				                    let points_type = data[i].points_type;
				                    let points_amount = data[i].points_amount;
				                    let created_at = data[i].created_at;

				                    let pointDiv = "<div class='history-item'><hr>";
				                    pointDiv += "<span>" + description + "</span>&ensp;";
				                    pointDiv += "<span>" + points_amount.toLocaleString() + "원</span>&ensp;";
				                    pointDiv += "<span>" + points_type + "</span>&ensp;";
				                    pointDiv += "<span>" + created_at + "</span>";
				                    pointDiv += "</div>";

				                    modalBody.append(pointDiv);
				                }
				            }

				            // 모달 열기
				            $('#pointInfoModal').modal('show');
				        },
				        error: function(error) {
				            console.error("Error loading point:", error);
				        }
				    });
				}

				</script>

				</div>

			</div>
		</div>
	</div>


	<!-- Bootstrap Modal 2 -->
	<div class="modal fade" id="orderInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="orderInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			.
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="orderInfoModalLabel">관심 상품</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				 <!-- Modal Body with dynamic content added through AJAX -->
				<div class="modal-body">
					<div class="row">
					
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
					<script type="text/javascript">
					    function openLikesModal() {
					        $.ajax({
					            url: '/getLikes', // getLikes 컨트롤러의 URL
					            method: 'GET',
					            data: { user_id: user_id }, // userId 값을 전달
					            dataType: "json",
					            success: function(data) {
					                console.log(data);
					                let modalBody = $('#orderInfoModal .modal-body .row');
					                modalBody.empty(); // 기존 내용을 초기화
					
					                // 관심 상품 데이터를 모달에 추가
					                if (data.length === 0) {
					                    modalBody.append('<p>관심상품을 담아주세요.</p>');
					                } else {
					                    for (let i = 0; i < data.length; i++) {
					                        let product_name = data[i].product_name;
					                        let description = data[i].description;
					                        let price = data[i].price;
					                        let thumbnail_url = data[i].thumbnail_url;
					
					                        // 상품 데이터를 모달에 하나씩 추가
					                        let productDiv = "<div class='col-xl-3 col-md-6 mb-3'><div class='product-card'>";
					                        productDiv += "<img src=" + thumbnail_url + " class='product_img' alt='상품 이미지'>";
					                        productDiv += "<div class='product-info'>";
					                        productDiv += "<h5>" + product_name + "</h5>";
					                        productDiv += "<p>" + description + "</p>"
					                        productDiv += "<p class='price'>" + Number(price).toLocaleString() + "원</p>";
					                        productDiv += "<div class='btn-group' style='float: right;'>"
					                        productDiv += "<button class='btn btn-primary'>"+ "담기" +"</button>"
					                        productDiv += "<button class='btn btn-danger'>"+ "삭제" +"</button>"
					                        productDiv += "</div></div></div></div>";
					                        
					                        modalBody.append(productDiv); // 하나씩 추가
					                    }
					                }
					
					                // 모달 열기
					                $('#orderInfoModal').modal('show');
					            },
					            error: function(error) {
					                console.error("Error loading likes:", error);
					            }
					        });
					    }
					</script>
					</div>
				</div>

				<!-- Modal Footer with Buttons -->
				<div class="modal-footer" style="justify-content: center;"></div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// 토글 버튼 클릭 시 사이드바 열고 닫기 및 메인 콘텐츠 이동
			$('#toggleSidebar').click(function() {
				$('#sidebar').toggleClass('show');
				$('#main-content').toggleClass('shifted');
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
</body>
</html>