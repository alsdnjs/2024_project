<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
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

.id_wrap, .pw_wrap, .pwck_wrap, .user_wrap, .mail_wrap, .address_wrap,
	.col-12 {
	margin-bottom: 15px;
}

.id_name, .pw, .pwck_name, .user_name, .mail_name, .address_name,
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
			<form action="/join" method="post">
				<div class="wrap">
					<div class="subjecet"><span>회원가입</span></div>
					
					<!-- 아이디 -->
					 <div class="id_wrap">
                    	<div class="id_name">아이디 <span class="text-danger">*</span></div>
                   	 <div class="id_input_box">
                        <input class="id_input" type="text" name="user_id" placeholder="아이디 입력" required></div>
                	</div>
					
					<!-- 이름 -->
					<div class="user_wrap">
						<div class="user_name"> 이름 <span class="text-danger">*</span></div>
					<div class="user_input_box">
						<input class="user_input" type="text" name="username" placeholder="홍길동" required></div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="pw_wrap">
						<div class="pw"> 비밀번호 <span class="text-danger">*</span></div>
					<div class="pw_input_box">
						<input class="pw_input" type="password" name="password" placeholder="영문 대소문자/숫자/특수문자를 혼용하여 8~12자 입력" required></div>
					</div>
					<div class="pwck_wrap">
						<div class="pwck_name"> 비밀번호 확인 <span class="text-danger">*</span></div>
						<div class="pwck_input_box">
							<input class="pwck_input" type="password" name="confirmPassword" placeholder="동일 비밀번호를 입력히세요" required></div>
					</div>
					
					<!-- 이메일 -->
					<div class="mail_wrap">
						<div class="mail_name"> 이메일 <span class="text-danger">*</span></div>
					<div class="mail_input_box">
						<input class="mail_input" type="email" name="email" placeholder="비밀번호 받을 이메일을 넣어주세요"
							   pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식" required>
					<button class="emailbutton" type="button">이메일 전송</button></div>

				
					<div class="mail_check_wrap">
						<div class="mail_check_input_box"> 이메일 인증번호 <span class="text-danger">*</span></div>
						<input class="mail_check_input" type="text" name="authNumber" placeholder="인증번호" maxlength="6" required>
						</div>

					<div class="mail_check_button">
						<button class="checkbutton" type="button">인증확인</button></div>
					</div>
				


				<!-- 주소 입력 폼 -->
				<div class="col-12">
					<label for="postcode" class="form-label">주소</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control" id="postcode"
							placeholder="우편번호" readonly>
						<button type="button" class="btn btn-outline-secondary"
							onclick="execDaumPostcode()">우편번호 검색</button>
					</div>
					<input type="text" class="form-control mb-2" id="address"
						placeholder="주소" name="basic_address" readonly> <input type="text" class="form-control"
						id="address2" placeholder="상세 주소">
				</div>

				<!-- 휴대전화 입력 폼 -->
				<div class="col-12">
				    <label for="phone_number" class="form-label">휴대 전화 <span class="text-danger">*</span></label>
				    <div class="input-group">
				        <span class="input-group-text">010</span> <!-- 기본값 010 표시 -->
				        <input type="text" class="form-control" id="phone_number" name="phone_number"
				               placeholder="12345678" pattern="\d{4}-\d{4}" maxlength="9" required>
				    </div>
				</div>

				<hr class="my-4">

				<!-- 개인정보 수집·이용 (필수) -->
				<div class="mb-4">
					<h5 class="section-title">개인정보 수집·이용 (필수)</h5>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>구분</th>
								<th>목적</th>
								<th>항목</th>
								<th>보유기간</th>
								<th><span>동의</span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>필수정보</td>
								<td>회원제 서비스 이용 / 본인확인</td>
								<td>이름, 아이디, 비밀번호, 이메일, 생년월일, 성별, 휴대 전화</td>
								<td>회원 탈퇴 후 <br>즉시
								</td>
								<td><input type="checkbox" class="agree-checkbox"></td>
							</tr>
							<tr>
								<td>필수정보</td>
								<td>서비스 이용을 위한 이용자식별 / 중복가입방지</td>
								<td>CI / DI</td>
								<td>회원 탈퇴 후 <br>즉시
								</td>
								<td><input type="checkbox" class="agree-checkbox"></td>
							</tr>
						</tbody>
					</table>
					<p class="small-text">* 본 서비스에서는 최소한의 개인정보를 수집하고 있습니다. 개인정보 수집
						및 이용에 대한 동의를 거부할 권리가 있으며, 동의 거부시 서비스 이용이 제한될 수 있습니다.</p>
				</div>
				<input type="hidden" name="user_role" value="${user_role}">
    		<!-- 가입하기 버튼 -->
   			 <div class="join_button_wrap">
       			 <button type="submit" id="joinButton" class="join_button" disabled>가입하기</button>
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


	
				<!-- Daum 우편번호 API 스크립트 -->
				<script
					src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					function execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										document.getElementById('postcode').value = data.zonecode;
										document.getElementById('address').value = data.address;
									}
								}).open();
					}
	
				$(document).ready(function() {
				    // 동의 체크박스가 모두 체크되었는지 확인하여 가입 버튼 활성화
				    $('.agree-checkbox').change(function() {
				        const allChecked = $('.agree-checkbox:checked').length === $('.agree-checkbox').length;
				        $('#joinButton').prop('disabled', !allChecked);
				    });
				
				    // 비밀번호 확인
				    $('.pwck_input').on('input', function() {
				        const password = $('.pw_input').val();
				        const confirmPassword = $(this).val();
				        if (password !== confirmPassword) {
				            $(this).get(0).setCustomValidity("비밀번호가 일치하지 않습니다.");
				        } else {
				            $(this).get(0).setCustomValidity("");
				        }
				    });
				});



				//이메일 스크립트
				$(document).ready(function() {
			    	let isEmailVerified = false; // 이메일 인증 여부
			
			    // 동의 체크박스가 모두 체크되었는지 확인하여 가입 버튼 활성화
			    $('.agree-checkbox').change(function() {
			        const allChecked = $('.agree-checkbox:checked').length === $('.agree-checkbox').length;
			        $('#joinButton').prop('disabled', !(allChecked && isEmailVerified)); // 이메일 인증도 완료되었을 때만 활성화
			    });
			
			    // 비밀번호 확인
			    $('.pwck_input').on('input', function() {
			        const password = $('.pw_input').val();
			        const confirmPassword = $(this).val();
			        if (password !== confirmPassword) {
			            $(this).get(0).setCustomValidity("비밀번호가 일치하지 않습니다.");
			        } else {
			            $(this).get(0).setCustomValidity("");
			        }
			    });
			
			    // 이메일 전송 버튼 클릭 시
			    $('.emailbutton').on('click', function(event) {
			        event.preventDefault();
			        const userMail = $("input[name='email']").val();
			        if (!userMail) {
			            alert("이메일을 입력해주세요.");
			            return;
			        }
			
			        // 이메일 전송 요청
			        $.ajax({
			            url: "/send_email_code",  // 이메일 인증번호 전송 요청 경로
			            type: "POST",
			            data: { userMail: userMail },
			            success: function(response) {
			                alert("인증 이메일이 전송되었습니다. 이메일을 확인해 주세요.");
			                isEmailVerified = false;
			                $("#joinButton").prop("disabled", true);
			            },
			            error: function() {
			                alert("이메일 전송에 실패했습니다. 다시 시도해 주세요.");
			            }
			        });
			    });
			
			    // 인증 확인 버튼 클릭 시
			    $('.checkbutton').on('click', function(event) {
			        event.preventDefault();
			        const authNumber = $("input[name='authNumber']").val();
			        if (!authNumber) {
			            alert("인증번호를 입력해 주세요.");s
			            return;
			        }
			
			        // 인증번호 확인 요청
			        $.ajax({
			            url: "/judge_code_match",  // 인증번호 확인 요청 경로
			            type: "POST",
			            data: { authNumber: authNumber },
			            success: function(response) {
			                if (response.status === "success") {
			                    alert(response.message);
			                    isEmailVerified = true; // 인증 성공 시
			                    $("#joinButton").prop("disabled", false);
			                } else {
			                    alert(response.message);
			                    isEmailVerified = false;
			                    $("#joinButton").prop("disabled", true);
			                }
			            },
			            error: function() {
			                alert("다시 시도해 주세요.");
			            }
			        });
			    });
			});
</script>
</body>
</html>
