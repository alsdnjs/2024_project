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
<jsp:include page="../header.jsp"></jsp:include>

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
										<!-- 체크박스 -->
			                            <input 
			                            	type="checkbox" 
			                            	name="cartCheckbox"
			                            	id="checkbox${k.product_idx}"
											data-product_idx="${k.product_idx}" 
											data-quantity="${k.quantity}"
											class="form-check-input cart-checkbox" >
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
								            <button type="button" class="btn btn-secondary" onclick="changeQuantity(${k.product_idx}, -1)">-</button>
								            <input type="number" 
								            id="quantityInput${k.product_idx}" 
								            value="${k.quantity}" min="1" 
								            class="form-control mx-1 text-center" 
								            style="width: 60px;" onchange="updateTotal(${k.product_idx})">
								            <button type="button" class="btn btn-secondary" onclick="changeQuantity(${k.product_idx}, 1)">+</button>
								        </div>
			                        </td>
			                        <td class="text-center fw-bold">
			                            <span id="price${k.product_idx}"> ${k.price} </span>원</td>
			                        <td class="text-center fw-bold">
			                            <span id="discount${k.product_idx}"> ${k.saleprice} </span>원</td>
			                        <td class="text-center fw-bold">
			                            <span id="totalPrice${k.product_idx}"> ${k.saledPrice}  </span>원</td>
			                    </tr>
		                	
		                	</c:forEach>
	                	</c:otherwise>
	                </c:choose>
                </tbody>
            </table>
        </div>
        
        <div class="mt-5">
            <button type="button" class="btn btn-secondary mx-1" onclick="goToProductList()">쇼핑 계속하기</button>
            
            <div class="summary-section mt-4 text-end">
			    <strong>
			        <span>총 <span id="grandCount"></span> 개의 상품금액 <span id="grandTotal"></span>원</span>
			        <span class="mx-2">+ 배송비 <span id="shippingFee">3000</span>원</span>
			        <span class="mx-2">= 합계 <span id="finalTotal"></span>원</span>
			    </strong>
            </div>
            <div class="mt-3 mb-4 text-end">
	            <button type="button" class="btn btn-secondary mx-1" onclick="return deleteSelectedItems()">선택 상품 삭제</button>
            	<form action="/view_orders_detail" method="POST">
            		<input type="hidden" id="selectedItemsInput" name="selectedItems" value="">
		            <button type="submit" class="btn btn-custom" onclick="return viewOrderDetails();">전체 상품 주문</button>
            	</form>
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
    <script type="text/javascript">

	 
	 // 페이지 로드 시 data-quantity 값 최신화
	    $(document).ready(function() {
	        // 페이지가 로드될 때마다 수량 업데이트 (뒤로가기 후에도)
	        $(".cart-checkbox").each(function() {
	            var index = $(this).data("index");
	            var quantity = $("#quantityInput" + index).val();
	            $(this).attr("data-quantity", quantity);  // data-quantity 업데이트
	        });
	    });
    	
    	// 수량을 checkbox의 data로 저장 업데이트
	    function updateCheckboxQuantity(index) {
	        var quantity = $("#quantityInput" + index).val();  // 수량 입력값
	        var checkbox = $("#checkbox" + index);
			checkbox.attr("data-quantity", quantity);
			
			console.log("quantity : " + quantity);
	    }
	    
	    // 서버에 넘겨서 페이지 이동
	    function viewOrderDetails() {
	        var selectedItems = [];

	        // 체크된 상품들을 배열로 묶음
	        $(".cart-checkbox:checked").each(function() {
	        	//this = 체크박스
	            var product_idx = $(this).data("product_idx");  // 체크박스에서 product_id 가져오기
	            
	            console.log("product_idx : " + product_idx);
	            updateCheckboxQuantity(product_idx);
	            var quantity = $(this).data("quantity");  // 체크박스에서 product_id 가져오기
	            selectedItems.push({ product_idx: product_idx, quantity: quantity });  // 객체로 저장
	        });
	        
			
	        // 선택된 상품들이 없으면 알림 표시
	        if (selectedItems.length === 0) {
				alert("주문할 상품을 선택해주세요.");	
				return false; // 폼 제출 방지
	        }
			console.log(selectedItems);
			
		    // JSON 문자열로 변환하여 hidden input에 설정
		    $("#selectedItemsInput").val(JSON.stringify(selectedItems));
		    
		    return true; // 폼 제출
	    }

    </script>
    
    
    
    
	<!-- 선택 항목 삭제 -->
    <script type="text/javascript">
    function deleteSelectedItems() {
        const selectedIds = [];
        document.querySelectorAll('.cart-checkbox:checked').forEach(checkbox => {
            selectedIds.push(checkbox.value); // 체크된 상품의 ID를 수집
        });

        if (selectedIds.length === 0) {
            alert("삭제할 상품을 선택해 주세요.");
            return ;
        }
        // 서버로 삭제 요청
        $.ajax({
            url: '/deleteSelectedItems',
            type: 'POST',
            data: { product_ids: selectedIds },
            traditional: true, // 배열 데이터를 처리하기 위함
            success: function(response) {
                if (response.success) {
                	// 성공
                    alert("선택한 상품이 삭제되었습니다.");
                    location.reload(); // 페이지를 새로고침하여 장바구니 업데이트
                } else {
                	//실패
                	if(response.login){
	                    alert("삭제에 실패했습니다.");
                	} else{
                		alert("로그인해주세요.");
                		// 로그인 페이지 이동
                		location.href("login");
                	}
                }
            },
            error: function() {
                alert("서버와의 연결에 실패했습니다.");
            }
        });
        
	 }
    </script>
    
    <!-- onclick 이벤트 처리 -->
    <script type="text/javascript">
    	function goToProductList(){
    		location.href = "products";
    	}
    </script>
    <!-- 수량 변화 및 총합 금액 계산 javascript -->
	<script type="text/javascript">
	
		function updateGrandTotal() {
			//총 합계
		    let grandTotal = 0;
		    //총 개수
		    let grandCount = 0;
		    //배달비
		    let shippingFee = $("#shippingFee").text();
		    shippingFee = parseInt(shippingFee);
		    
		    
 		    // 모든 항목에 대해 totalPrice를 더합니다.
		    const totalPrices = document.querySelectorAll('[id^="totalPrice"]');
		    totalPrices.forEach(totalPriceElement => {
		    	console.log(totalPriceElement.textContent); 
		        grandTotal += parseInt(totalPriceElement.textContent.replaceAll(",","")	);
		        grandCount += 1;
		    }); 
		    
		    // 체크된 항목만 계산해서 최종 가격에 표시
/* 		    const totalPrices = document.querySelectorAll('[id^="totalPrice"]');
		    const checkedPrices = Array.from(totalPrices).filter(item => {
		        const checkbox = document.querySelector(`#checkbox${item.dataset.index}`);
		        return checkbox && checkbox.checked;
		    }); 

		    // 체크된 항목의 값을 확인
		    checkedPrices.forEach(item => {
		        console.log(`ID: ${item.id}, Total Price: ${item.textContent}`);
		    }); */
		    
		    // 배달비 포함 합계
		    let finalTotal = grandTotal + shippingFee;
		    console.log(grandTotal);
		    
		    // 총합을 표시합니다.
		    $('#grandTotal').text(grandTotal.toLocaleString());
		    $('#grandCount').text(grandCount);
		    $('#finalTotal').text(finalTotal.toLocaleString());
		}
	
	    // 수량을 변경하는 함수
	    function changeQuantity(index, delta) {
	        updateCheckboxQuantity(index);
	        const quantityInput = document.getElementById("quantityInput" + index);
	        const newQuantity = parseInt(quantityInput.value) + delta;
	        if (newQuantity >= 1) {
	            quantityInput.value = newQuantity;
	            updateTotal(index);
	           
	        }
	    }
	    
	    // 총합 금액을 업데이트하는 함수
	    function updateTotal(index) {
	        const quantity = document.getElementById("quantityInput" + index).value;
	        const price = document.getElementById("price" + index).textContent;
	        const discount = document.getElementById("discount" + index).textContent;
	        const discountedPrice = price - discount;
	        const totalPrice = quantity * discountedPrice;
	        
	        document.getElementById("totalPrice" + index).textContent = totalPrice.toLocaleString();
	        updateGrandTotal();
	        updateCheckboxQuantity(index);
	    }
	    
	    window.onload = function() {
	        const quantityInputs = document.querySelectorAll('[id^="quantityInput"]');
	        quantityInputs.forEach(input => {
	            const index = input.id.replace('quantityInput', '');
	            updateTotal(index);  // 페이지 로드 시 각 항목의 총합을 계산합니다.
	        });
	        // 모든 상품 총합 초기화
	        updateGrandTotal();
	    }
	    

	</script>
    
    <script>
        function toggleNavbar() {
            const navbar = document.getElementById("navbarSupportedContent");
            navbar.classList.toggle("show");
        }

        function toggleDropdown() {
            const dropdown = document.querySelector(".dropdown-menu");
            dropdown.style.display = dropdown.style.display === "block" ? "none"
                    : "block";
        }

        // Close dropdown when clicking outside
        window.onclick = function(event) {
            const dropdown = document.querySelector(".dropdown-menu");
            if (!event.target.matches('.dropdown-toggle')) {
                dropdown.style.display = "none";
            }
        }
    </script>
</body>
</html>
