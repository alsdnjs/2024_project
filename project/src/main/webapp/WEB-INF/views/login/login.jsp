<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경빈이네</title>
<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet">

<style>
/* 글꼴 적용 */
body {
	font-family: "Single Day", cursive !important;
	font-weight: 400;
	font-style: normal;
	background-color: #f9f9f9;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
}

/* 메인 컨텐츠 영역 설정 */
.content {
	flex: 1;
}

.login-container {
	width: 300px;
	margin: 100px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.tab {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
}

.tab button {
	background-color: #f1f1f1;
	border: none;
	padding: 10px;
	cursor: pointer;
	width: 100%;
}

.tab button.active {
	background-color: white;
	border-bottom: 2px solid red;
}

.tabcontent {
	display: none;
}

/* 텍스트 입력 창 */
input {
	width: 100%;
	padding: 9px;
	margin: 9px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.login-btn,
.kakao-login-btn,
.admin-btn {
	width: 100%;
	padding: 10px;
	margin: 10px 0; /* 버튼 간격 추가 */
	text-align: center;
	border-radius: 5px;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
	display: block;
}

/* 로그인 버튼 스타일 */
.login-btn {
	background-color: red;
	color: white;
	border: none;
}

/* 카카오 로그인 버튼 스타일 */
.kakao-login-btn {
	background-color: #FEE500;
	color: #3C1E1E;
	font-size: 16px;
}

.kakao-login-btn:hover {
	background-color: #E5C800; /* 카카오 로그인 버튼 호버 효과 */
}

/* 관리자 로그인 버튼 스타일 */
.admin-btn {
	background-color: gray;
	color: white;
	border: none;
}

.admin-btn:hover {
	background-color: #5e5e5e; /* 관리자 로그인 버튼 호버 효과 */
}

/* 링크 스타일 */
.links {
	text-align: center;
	margin: 15px 0;
}

.links a {
	color: #888;
	text-decoration: none;
}

.links a:hover {
	text-decoration: underline;
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

/* 푸터 스타일 */
footer {
	background-color: LightCoral;
	padding: 20px 0;
	margin-top: auto;
}

footer .container {
	text-align: center;
}

footer p {
	margin: 5px 0;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
						<li class="nav-item"><a class="nav-link" href="/notice">고객센터</a></li>
						<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
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
                            placeholder="검색어를 입력하세요"></form>
                    <button class="search-button">
							<img src="https://img.icons8.com/ios-filled/50/ffffff/search.png"
								alt="돋보기">
						</button> 
						
                </div>
    
           
    
    </div>
                     <form class="d-flex" action="/cart_list" method="get">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                    </form>
				</div>
		</nav>
	</header>
	<!-- Main Content -->
	<div class="content">
	
		<div class="login-container">
			<div class="tab">
				<button class="tablinks active" onclick="openTab(event, 'member')">회원</button>
			</div>

			<div id="member" class="tabcontent" style="display: block;">
			 <form action="/user_login2" method="post">
				<input type="text" id="memberId"  name="user_id" placeholder="아이디"> 
				<input type="password" id="memberPw"  name="password"placeholder="비밀번호">
				
				<!-- 로그인 버튼 -->
				<button class="login-btn" type="submit">로그인</button>
</form>
				
				<!-- 관리자 로그인 버튼 -->
				<form id="adminForm" method="get">
    				<button type="button" class="admin-btn" onclick="adminLogin()">관리자 로그인</button>
			

</form>
				<div class="links">
					<a href="/find_id">아이디 찾기</a> | <a href="/find_password">비밀번호 찾기</a> | <a href="/mini">회원가입</a>
				</div>
			</div>


			<script type="text/javascript">
				function openTab(evt, tabName) {
					let i, tabcontent, tablinks;
					tabcontent = document.getElementsByClassName("tabcontent");
					for (i = 0; i < tabcontent.length; i++) {
						tabcontent[i].style.display = "none";
					}
					tablinks = document.getElementsByClassName("tablinks");
					for (i = 0; i < tablinks.length; i++) {
						tablinks[i].className = tablinks[i].className.replace(" active", "");
					}
					document.getElementById(tabName).style.display = "block";
					evt.currentTarget.className += " active";
				}

				function login(userType) {
					if (userType === 'member') {
						const id = document.getElementById('memberId').value;
						const pw = document.getElementById('memberPw').value;
						if (id === 'user' && pw === 'password') {
							alert('회원 로그인 성공!');
						} else {
							alert('회원 로그인 실패');
						}
					}
				}

				  function adminLogin() {
				    
				        const form = document.getElementById('adminForm');
				        form.action = "/adminlogin"; // 관리자 로그인 페이지로 이동
				        form.submit();
				}
			</script>
			<script>
 /*    function adminLogin(f) {
        // 로그인 처리 로직을 여기에 작성하세요.
        // 예: 로그인 페이지로 이동
       f.action = "/adminlogin"; // 관리자 로그인 페이지로 이동
       f.submit();
    } */
</script>
		</div>
	</div>

	<!-- Footer -->
	<footer class="py-5">
		<div class="container">
			<p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사 대표자: 3조 주소: 서울특별시 마포구 |</p>
			<p class="m-0 text-center text-white">| 전화: 1818-9797 | 팩스: 042-526-9289 |</p>
			<p class="m-0 text-center text-white">| 개인정보보호책임자: 노종문 (jsfood5@naver.com) |</p>
			<p class="m-0 text-center text-white">| COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
		</div>
	</footer>

	<!-- Bootstrap core JS -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
