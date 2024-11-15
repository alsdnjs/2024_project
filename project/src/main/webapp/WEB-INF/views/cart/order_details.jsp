<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Checkout Example</title>
	
	<!-- Font Awesome -->
	<link rel="stylesheet"
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	      crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
	
	<!-- Bootstrap CSS v5.3 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

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

        .submit-buttons {
            text-align: center;
            margin-top: 30px;
        }

        .submit-buttons .btn {
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-cancel {
            background-color: gray;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #6c757d;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .dashboard-title {
            font-weight: bold;
            font-size: 1.5rem;
            margin-bottom: 20px;
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


.navbar-toggler{
    z-index: 1;
}

.box {
	white-space: nowrap;
	overflow: hidden;
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
    footer {
        z-index: 10;
        background-color: LightCoral; /* 원하는 색상으로 변경 */
        text-align: center;
        padding: 10px 0;
        margin-top: auto;
    }
    



    </style>

  <style>
    hr {
        border-top: 2px solid #e0e0e0; /* 두께와 색상 지정 */
        opacity: 1; /* 투명도 제거 */
    }
    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }

    .btn-bd-primary {
      --bd-violet-bg: #712cf9;
      --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

      --bs-btn-font-weight: 600;
      --bs-btn-color: var(--bs-white);
      --bs-btn-bg: var(--bd-violet-bg);
      --bs-btn-border-color: var(--bd-violet-bg);
      --bs-btn-hover-color: var(--bs-white);
      --bs-btn-hover-bg: #6528e0;
      --bs-btn-hover-border-color: #6528e0;
      --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
      --bs-btn-active-color: var(--bs-btn-hover-color);
      --bs-btn-active-bg: #5a23c8;
      --bs-btn-active-border-color: #5a23c8;
    }

    .bd-mode-toggle {
      z-index: 1500;
    }

    .bd-mode-toggle .dropdown-menu .active .bi {
      display: block !important;
    }
    
    
    .ckbox{
      width: 3%;
    }
    th {
      text-align: center;
      align-items: center;
    }

    td, .align-middle {
      vertical-align: middle;
    }

    /* 스피너 제거 */
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
      -webkit-appearance: none; /* 크롬 및 사파리 */
      margin: 0; /* 마진 제거 */
    }

    input[type="number"] {
      -moz-appearance: textfield; /* 파이어폭스 */
    }

    .summary-section {
      background-color: #f8f9fa; /* 배경색 */
      border-radius: 10px; /* 둥근 모서리 */
      padding: 15px; /* 패딩 */
    }
    .total-amount {
      font-weight: bold; /* 두껍게 */
      font-size: 1.25rem; /* 크기 */
    }
    .btn-custom {
      background-color: #6f42c1; /* 버튼 색상 */
      color: white; /* 텍스트 색상 */
    }
    .x {
      display: inline-flexbox;
    }


    th {
        text-align: center;
        align-items: center;
    }

    td, .align-middle {
        vertical-align: middle;
    }

    .total-amount {
        font-weight: bold; /* 두껍게 */
        font-size: 1.25rem; /* 크기 */
    }
    .btn-custom {
        background-color: #6f42c1; /* 버튼 색상 */
        color: white; /* 텍스트 색상 */
    }
    thead{
        background-color: #f5f5f5;
    }
    .main-container{
        background-color: #f0f0f0;
    }
    .backgrou{
        background-color: white;
    }
    .content-wrapper{
        padding: 20px;
        margin-top: 15px;
        border:1px solid #e0e0e0;
    }
    .min-width-120{
        min-width: 120px;
    }
    .min-width-min-content{
        min-width: min-content;
    }
    td{
        text-align: center;
    }
    .border-right{
        border-right: 1px solid #e0e0e0;
        margin-right: 15px;
    }
    div.content-wrapper>p{
        margin-bottom: 0;
    }
    img{
        width: 120px;
    }
    .min-width-100{
        min-width: 100px;
    }
    .payment-summary {
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #fafafa;
    }

    .payment-item {
        display: flex;
        justify-content: space-between;
        padding: 5px 0;
    }

    .total-amount {
        display: flex;
        justify-content: space-between;
        font-weight: bold;
        font-size: 1.2em;
        padding-top: 10px;
        border-top: 1px solid #ddd;
    }

    .total-amount .amount {
        color: #007bff;  /* 파란색 텍스트 */
    }

    .points-info {
        font-size: 0.9em;
        color: #007bff;
        text-align: right;
        margin-top: 10px;
    }
    .purchase{
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        padding: 15px;
        background-color: #007bff;
        color: white;
        text-align: center;
        font-size: 18px;
        border: none;
        cursor: pointer;
    }
        
  </style>


    
  <!-- Custom styles for this template -->
</head>
<body>
    <header>
		<nav class="navbar navbar-expand-lg ">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="#!">경빈이네</a>
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
						<li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
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

    <div class="container-fluid main-content">
        <h2 class="text-center m-4 fw-bold">Shopping Cart</h2>
        <div class="p-3 row" style="justify-content: center;">
            <div class="col-xl-4">
                <div class="content-wrapper">
                    <h3 class="mb-3 fw-bold">주문 상품 정보</h3>
    

                    <div class="d-flex g-0">
                        <div class="">
                            <img src="https://via.placeholder.com/400" class="" alt="Sample Image">
                        </div>
                        <div class="card-body m-1">
                            <h5 class="" style="text-align: left; margin-left: 4px;">Product Name</h5>
                            <input class="form-control mt-1 mx-1" type="text" name="product" id="product">
                        </div>
                    </div>
                    <hr>
                    <div class="d-flex g-0">
                        <div class="">
                            <img src="https://via.placeholder.com/400" class="" alt="Sample Image">
                        </div>
                        <div class="card-body m-1">
                            <h5 class="" style="text-align: left; margin-left: 4px;">Product Name</h5>
                            <input class="form-control mt-1 mx-1" type="text" name="product" id="product">
                        </div>
                    </div>
                </div>
            
                <div class="content-wrapper">
                    <h3 class="mb-3 fw-bold">주문자 정보</h3>
                    <p>홍길동</p>
                    <p>01030515121</p>
                    <p>user12@naver.com</p>
                    <button class="form-control mt-2" style="width: auto;"> 수정 </button>
                </div>

                <div class="content-wrapper" >
                    <h3>포인트</h3>
                
                        <div style="margin-left: 15px;">

                            <div class="d-flex">
                                <input type="text" class="form-control" readonly style="width: auto;">
                                <button type="button" class="btn btn-secondary mx-2" disabled="">적용</button>
                            </div>
                            <span>
                                <em><span id="dispOrderProductCouponText">보유 포인트</span></em>
                                <em><span>0</span>p</em>
                            </span>

                        </div>
        
        
                </div>
        </div>

        <div class="col-xl-3">

            <div class="content-wrapper">
                <div class="payment-summary">
                    <div class="payment-item">
                        <span>상품가격</span>
                        <span>18,000원</span>
                    </div>
                    <div class="payment-item">
                        <span>쿠폰 할인</span>  
                        <span>-1,000원</span>
                    </div>
                    <div class="payment-item">
                        <span>포인트 사용</span>
                        <span>-0원</span>
                    </div>
                    <div class="payment-item">
                        <span>배송비</span>
                        <span>+2,500원</span>
                    </div>
            
                    <div class="total-amount">
                        <span>총 결제금액</span>
                        <span class="amount">19,500원</span>
                    </div>
            
                    <div class="points-info">
                        <p>700</p> 
                        포인트 적립예정
                    </div>
                </div>
            </div>

            <div class="content-wrapper">
                <h3 class="fw-bold">결제 방법</h3>
                <div>
                    <div class="d-flex mt-3" style="flex-wrap: wrap;">
                        <div class="form-check mt-1" style="padding-left: 12px;">
                            <input type="radio" class="btn-check min-width-100" name="options" id="option1" autocomplete="off">
                            <label class="btn btn-outline-primary w-100" for="option1">카드 결제</label>
                        </div>
                            
                        <div class="form-check mt-1" style="padding-left: 12px;">
                            <input type="radio" class="btn-check min-width-100" name="options" id="option2" autocomplete="off">
                            <label class="btn btn-outline-primary w-100" for="option2">무통장 입금</label>
                        </div>
                            
                        <div class="form-check mt-1" style="padding-left: 12px;">
                            <input type="radio" class="btn-check min-width-100" name="options" id="option3" autocomplete="off">
                            <label class="btn btn-outline-primary w-100" for="option3">Option 3</label>
                        </div>
                    </div>
                    <!-- 라디오에 따라 바뀌는 결제 창 -->
                    <div class="container">

                        <div id="content1" class="content mt-3" style="height: auto; display: none;">
                            <div class="mb-3 row">
                                <!-- 작은 화면에서는 세로, md 이상에서는 가로 정렬 -->
                                <div class="col-12 col-md-4"> <!-- md 이상의 화면에서는 col-4, 작은 화면에서는 col-12 -->
                                    <select class="form-select" id="exampleSelect">
                                        <option selected>카드사 선택</option>
                                        <option value="1">농협</option>
                                        <option value="2">국민</option>
                                        <option value="3">신한</option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-8 mt-2 mt-md-0"> <!-- md 이상의 화면에서는 col-8, 작은 화면에서는 col-12 -->
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                        

                        <div id="content2" class="content mt-3" style="display:none; height: auto;">
                            <div class="mb-3">
                                <select class="form-select" id="exampleSelect">
                                    <option selected>은행 선택</option>
                                    <option value="1">농협</option>
                                    <option value="2">국민</option>
                                    <option value="3">신한</option>
                                </select>
                            </div>
                            <input type="text" class="form-control" placeholder="입금자명(미입력시 주문자명)">
                        </div>

                        <div id="content3" class="content mt-3" style="display:none;">이것은 Option 3에 해당하는 내용입니다.</div>

                    </div>
                </div>
            </div>

            <div class="content-wrapper" style="position: relative;padding-bottom: 100px;">
                <div class="row">
                    <label for="all"><input type="checkbox" id="all"> 전체 동의</label>
                </div>
            
                <input class="purchase" type="submit" value="결제하기">
            </div>
        </div>
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
  // 라디오 버튼에 이벤트 추가
  document.addEventListener('DOMContentLoaded', function () {
    const option1 = document.getElementById('option1');
    const option2 = document.getElementById('option2');
    const option3 = document.getElementById('option3');
  
    document.getElementById('content1').style.display = 'none';
    document.getElementById('content2').style.display = 'none';
    document.getElementById('content3').style.display = 'none';
    // 라디오 버튼 클릭 시 해당 내용 보여주기
    option1.addEventListener('click', function() {
      showContent(1);
    });
  
    option2.addEventListener('click', function() {
      showContent(2);
    });
  
    option3.addEventListener('click', function() {
      showContent(3);
    });
  });
  
  // 해당 내용을 보여주는 함수
  function showContent(optionNumber) {
    // 모든 content 숨기기
    document.getElementById('content1').style.display = 'none';
    document.getElementById('content2').style.display = 'none';
    document.getElementById('content3').style.display = 'none';
    
    // 선택된 content만 보여주기
    document.getElementById('content' + optionNumber).style.display = 'block';
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
