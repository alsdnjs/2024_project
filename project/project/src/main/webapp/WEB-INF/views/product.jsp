<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>경빈이네</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/styles2.css"
	rel="stylesheet" />
	<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">

</head>
<style>
header {
font-family: "Single Day", cursive !important;
	font-weight: 400;
	font-style: normal;
}
footer {
	background-color: LightCoral; /* 원하는 색상으로 변경 */
	font-family: "Single Day", cursive !important;
	font-weight: 400;
	font-style: normal;
}
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

</style>



<body>
	<!-- Responsive navbar-->
	<header>
	  <nav class="navbar navbar-expand-lg ">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">경빈이네</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">로그인 / 회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/notice">고객센터</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">돼지고기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">닭고기</a></li>
                                <li><a class="dropdown-item" href="#!">소고기</a></li>
                            </ul>
                        </li>
                    </ul>
                          <div class="search-container">
        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <button class="search-button">
            <img src="https://img.icons8.com/ios-filled/50/ffffff/search.png" alt="돋보기">
        </button>
    </div>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
       </header>

	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-5" src="../upload/bg.jpg"
					alt="..." />
			</div>
			<div class="col-lg-5">
				<h1 class="font-weight-light" style="margin-top: -30px;">소고기</h1>
				<p>신선한 상품</p>
				<p>배송 : 2일 후에 도착</p>
				<p>배송 후 : 교환 및 반품 불가</p>
				<p>신선배송 : 포장비 없음</p>

				<a class="btn btn-primary1 btn-spacing" href="#!">장바구니 담기</a> <a
					class="btn btn-primary2 btn-spacing" href="#!">구매하기</a>
			</div>
		</div>

		<!-- Tab Navigation -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab"
								data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">상품설명</a> <a
								class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
								href="#nav-profile" role="tab" aria-controls="nav-profile"
								aria-selected="false">상품문의</a> <a class="nav-item nav-link"
								id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
								role="tab" aria-controls="nav-contact" aria-selected="false">상품평</a>
							<a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab"
								href="#nav-about" role="tab" aria-controls="nav-about"
								aria-selected="false">유의사항</a>
						</div>
					</nav>
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<p>상품설명</p>
							<p>갈비잡뼈 국산 제품으로, 업소용 및 대량 구매에 적합합니다. 3등급 품질로 신선하게 제공됩니다.</p>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<p>상품문의</p>
							<p>********************</p>
						</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">
							<p>상품평</p>
							<form id="reviewForm">
								<div class="mb-3">
									<label for="reviewInput" class="form-label">상품평을 작성해주세요:</label>
									<textarea class="form-control" id="reviewInput" rows="3"
										placeholder="여기에 상품평을 입력하세요"></textarea>
								</div>
								<button type="submit" class="btn btn-primary">등록</button>
							</form>
						</div>

						<div class="tab-pane fade" id="nav-about" role="tabpanel"
							aria-labelledby="nav-about-tab">
							<p>배송지 선택시 주의사항</p>
							<p>• 저희 경빈이네는 전국 시,구에서 주문하신 상품은 냉동차량(신선물류)을 통해 신선함을 유지하여 배송
								하고 있습니다. (일부 지역 제외) • 대량구매시 배송비는 상품,상품수량(중량),배송지역에 따라 차이가 있을 수
								있습니다. • 대량구매시 배송지 상황 또는 배송기사님의 배송 외 업무에 따라 추가 배송비가 발생할 수 있습니다. •
								대량구매시 배송지가 제주도, 울릉군, 백령도인 경우 유선상으로 주문이 가능합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer-->
	 <footer class="py-5">
            <div class="container"><p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사    대표자: 3조    주소: 서울특별시 마포구 |</p>
            
            <div class="container"><p class="m-0 text-center text-white">| 전화: 1818-9797  |  팩스: 042-526-9289  |</p>
            
            <div class="container"><p class="m-0 text-center text-white">|  개인정보보호책임자: 노종문 (jsfood5@naver.com |</p>
            
            <div class="container"><p class="m-0 text-center text-white">|  COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
             </div>
             </div>
              </div>
            </div>
        </footer>

	<!-- jQuery and Bootstrap JS-->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>
