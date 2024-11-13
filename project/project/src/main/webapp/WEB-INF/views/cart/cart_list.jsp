<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script>
        function toggleCheckboxes(source) {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
        }

        function updateQuantity(inputId, change) {
            const input = document.getElementById(inputId);
            const currentValue = parseInt(input.value);
            const newValue = currentValue + change;
            if (newValue >= 0) { // 수량은 0 이상이어야 함
                input.value = newValue;
            }
        }
    </script>
    <style>
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
        thead{
            background-color: #ebe9e9;
        }
    </style>
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
</head>
<body>

    <header>
		<nav class="navbar navbar-expand-lg ">
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
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="products">돼지고기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="products">닭고기</a></li>
                                <li><a class="dropdown-item" href="products">소고기</a></li>
                            </ul>
                        </li>
                    </ul>
					</ul>
					<div class="search-container">
						<input type="text" class="search-input" placeholder="검색어를 입력하세요">
						<button class="search-button">
							<img src="https://img.icons8.com/ios-filled/50/ffffff/search.png"
								alt="돋보기">
						</button>
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

    <div class="container mt-5">
        <h2 class="text-center mb-4 fw-bold">Shopping Cart</h2>
        
        <div class="border">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 3%;">
                            <input class="form-check-input ps-1" type="checkbox" onchange="toggleCheckboxes(this)">
                        </th>
                        <th class="col-5 col-sm-3">상품/옵션 정보</th>
                        <th class="col-1">수량</th>
                        <th class="col-1">상품 금액</th>
                        <th class="col-1">할인 금액</th>
                        <th class="col-1">합계 금액</th>
                    </tr>
                </thead>
                <tbody>
	                <c:choose>
	                	<c:when test="${empty cart_list}">
	                		<tr>
		                		<h2>등록된 상품이 없습니다.</h2>	                		
	                		</tr>
	                	</c:when>
	                	<c:otherwise>
		                	<c:forEach items="${cart_list}" var="k" varStatus="s">
		                	
					           	<tr>
			                        <td class="text-center ">
			                            <input type="checkbox" class="form-check-input" >
			                        </td>
			
			                        <td>
			                            <div class="row g-0">
			                                <div class="col-3">
			                                    <img src="https://via.placeholder.com/400" class="img-fluid rounded-start" alt="Sample Image">
			                                </div>
			                                <div class="col-9">
			                                    <div class="card-body m-1">
			                                        <h5 class="card-title">${k.product_name}</h5>
			                                        <div class="form-group">
			                                            <label for="productSelect">Select a Product</label>
			                                            <select class="form-select" id="productSelect">
			                                                <option selected>Choose a product...</option>
			                                                <option value="1">Product 1</option>
			                                                <option value="2">Product 2</option>
			                                                <option value="3">Product 3</option>
			                                                <option value="4">Product 4</option>
			                                                <option value="5">Product 5</option>
			                                            </select>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </td>
			                        <!-- 수량(quantity) -->
			                        <td class="text-center">
								        <div class="d-flex justify-content-center align-items-center">
								            <button class="btn btn-secondary" onclick="updateQuantity('quantityInput${s.index}', -1)">-</button>
								            <input type="number" id="quantityInput${s.index}" value="0" min="0" class="form-control mx-1 text-center" style="width: 60px;">
								            <button class="btn btn-secondary" onclick="updateQuantity('quantityInput${s.index}', 1)">+</button>
								        </div>
			                        </td>
			                        <td class="text-center fw-bold">
			                            <p id="price1">${k.price}</p>원</td>
			                        <td class="text-center fw-bold">
			                            <p id="discount1">${k.saleprice}</p>원</td>
			                        <td class="text-center fw-bold">
			                            <p id="totalPrice1"> ${k.saledPrice} </p>원</td>
			                    </tr>
		                	
		                	</c:forEach>
	                	</c:otherwise>
	                </c:choose>
                </tbody>
            </table>
        </div>
        
        <div class="mt-5">
            <button class="btn btn-secondary mx-1">쇼핑 계속하기</button>
            
            <div class="summary-section d-flex justify-content-between align-items-center mt-4">
                <div>
                    <span class="total-amount">중 5 개의 상품금액 1,000,000원</span>
                    <span class="mx-2">+ 배송비 0원</span>
                    <span class="mx-2">= 합계 1,000,000원</span>
                </div>
            </div>
            <div class="mt-3 mb-4 text-end">
                <button class="btn btn-secondary mx-1">선택 상품 삭제</button>
                <button class="btn btn-secondary mx-1">선택 상품 품절</button>
                <button class="btn btn-custom">전체 상품 주문</button>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        let quantity = $("#quantityInput1").val();
        let price = $("#price1").text();
        let discount = $("#discount1").text();


        let totalPrice1 = price*quantity-discount;
        $("#totalPrice1").append(totalPrice1);
    </script>
</body>
</html>
