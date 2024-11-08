<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 수정</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">
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

.form-container {
	margin-top: 20px;
}

.dashboard-title {
	font-weight: bold;
	font-size: 1.5rem;
	margin-bottom: 20px;
}

.accordion-body {
	font-size: 14px;
}

/* 좌우 여백 추가 */
.main-content {
	padding-left: 15%; /* 좌우 15% 여백 */
	padding-right: 15%;
	flex: 1;
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

/* 메인 콘텐츠는 고정 */
#main-content {
	padding: 20px;
	margin-left: 0;
	padding-left: 15%; /* 좌우 15% 여백 */
	padding-right: 15%;
	display: flex;
	justify-content: center;
}

.wrapper {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 600px;
	height: auto;
	padding: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.wrap {
	display: flex;
	flex-direction: column;
}

.subjecet {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
	border-bottom: 2px solid #e74c3c;
	padding-bottom: 10px;
}

.id_wrap, .pw_wrap, .pwck_wrap, .seller_wrap, .mail_wrap, .address_wrap,
	.col-12 {
	margin-bottom: 15px;
}

.id_name, .pw_name, .pwck_name, .seller_name, .mail_name, .address_name,
	.mail_check_input_box, .form-label {
	font-size: 14px;
	color: #555;
	margin-bottom: 5px;
}

input {
	width: calc(100% - 10px);
	padding: 6px;
	margin: 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.mail_input_box button, .mail_check_button button {
	background-color: white;
	border: 1px solid black;
	color: gray;
	border-radius: 4px;
	margin-top: 5px;
}

.join_button_wrap {
	text-align: center;
	margin-top: 20px;
}

.join_button {
	background-color: #e74c3c;
	color: white;
	border: none;
	padding: 12px 0;
	width: 100%;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

/* 추가된 스타일: 이메일과 주소 입력 필드 간의 간격 설정 */
.mail_check_wrap {
	margin-top: 10px; /* 간격 설정 */
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

.table {
	width: 100%;
	table-layout: fixed;
	font-size: 14px;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.section-title {
	font-weight: bold;
	margin-top: 30px;
	margin-bottom: 15px;
}

.small-text {
	font-size: 0.8rem;
	color: #6c757d;
}

.agree {
	white-space: nowrap; /* 셀 안에서 줄바꿈 방지 */
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
					<!-- <span class="navbar-toggler-icon"></span> -->
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


	<!-- 메인 컨테이너 -->
	<div class="container-fluid main-content" id="main-content">
		<div class="wrapper">
			<form method="post" action="/seller_profile_update_ok" onsubmit="combinePhoneNumber()">
				<div class="wrap">
					<div class="subjecet">
						<span>판매자 정보수정</span>
					</div>

					<div class="seller_wrap">
						<div class="store_name">
							대표자명 <span class="text-danger">*</span>
						</div>
						<div class="seller_input_box">
							<input class="seller_input" type="text" name="seller_rep_name"
								value="${seller_rep_name }" readonly>
						</div>
					</div>

					<div class="id_wrap">
						<div class="id_name">
							업체명 <span class="text-danger">*</span>
						</div>
						<div class="id_input_box">
							<input class="id_input" type="text" name="store_name"
								value="${store_name}" required>
						</div>
					</div>

					<div class="pw_wrap">
						<div class="pw_name">
							업체 소개 <span class="text-danger">*</span>
						</div>
						<div class="pw_input_box">
							<input class="pw_input" type="text" name="store_description"
								value="${store_description }" required>
						</div>
					</div>
					<!-- 휴대전화 입력 폼 -->
					<div class="col-12">
						<label for="phone" class="form-label">업체 전화번호 <span
							class="text-danger">*</span></label>
						<div class="input-group">

							<input type="text" class="form-control" name="phone_first"
								style="width: 20%" placeholder="010" maxlength="3">
							<span class="input-group-text">-</span>
							<input type="text" class="form-control" name="phone_mid" style="width: 20%"
								placeholder="1234" maxlength="4" required>
							<span class="input-group-text">-</span>
							<input type="text" class="form-control" name="phone_last" style="width: 20%"
								placeholder="5678" maxlength="4" required>
						</div>
					</div>

					<div class="join_button_wrap">
						<input type="submit" class="join_button" value="수정완료">
						<input type="hidden" name="contact_number" id="contact_number"> 
						<input type="hidden" name="seller_idx" value="${seller_idx}" required>
					</div>
				</div>
			</form>
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

			});
		});
		// 폰번호 합치는 javascript
		function combinePhoneNumber() {
			alert("함수 눌림");
			const phoneFirst = document
					.querySelector('input[name="phone_first"]').value;
			const phoneMid = document.querySelector('input[name="phone_mid"]').value;
			const phoneLast = document
					.querySelector('input[name="phone_last"]').value;
			// 세 부분을 결합하여 contact_number에 설정
			const contactNumber = phoneFirst + phoneMid + phoneLast;

			document.getElementById('contact_number').value = contactNumber;
		}
	</script>
</body>
</html>