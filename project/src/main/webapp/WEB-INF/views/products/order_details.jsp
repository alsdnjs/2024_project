<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Checkout Example</title>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
<jsp:include page="../header.jsp"></jsp:include>	

    <div class="container-fluid main-content">
        <h2 class="text-center m-4 fw-bold">주문 상세 내역</h2>
        <div class="p-3 row" style="justify-content: center;">
            <div class="col-xl-4">
                <div class="content-wrapper">
                    <h3 class="mb-3 fw-bold">주문 상품 정보</h3>
          			<c:forEach items="${cart_list}" var="c">
                  		<div class="d-flex g-0">
	                        <div>
	                            <img src="${c.thumbnail_url}" class="" alt="Sample Image">
	                        </div>
	                        <div class="card-body m-1">
	                            <h5 class="" style="text-align: left; margin-left: 4px;">${c.product_name}</h5>
	                            <pre> ${c.quantity} 개</pre>
	                            <input id="product_idx" type="hidden" value="${c.product_idx}">
	                            <input class="form-control mt-1 mx-1" type="text" name="productPrice" id="productPrice" value="${c.saledPrice*c.quantity}" disabled>
	                        </div>
	                    </div>
	                    <hr>
                  	</c:forEach>
                </div>
            
				<div class="content-wrapper">
				    <h3 class="mb-3 fw-bold">주문자 정보</h3>
				    <p id="orderRecipient">홍길동</p>
				    <p id="orderCountry">기존 국가</p>
				    <p id="orderState">기존 도</p>
				    <p id="orderPostalCode">기존 우편번호</p>
				    <p id="orderAddressLine">기존 상세주소</p>
				    <input type="hidden" id="orderAddress_idx">
				    
				    <button class="form-control mt-2" style="width: auto;" 
				            data-toggle="modal"
				            data-target="#addressInfoModal"> 수정 </button>
				</div>  


                <div class="content-wrapper" >
                    <h3>포인트</h3>
                
                        <div style="margin-left: 15px;">

                            <div class="d-flex">
                                <input type="text" id="usePoint" class="form-control" style="width: auto;">
                                <button type="button" class="btn btn-secondary mx-2" onclick="usePoint()">적용</button>
                            </div>
                            <span>
                                <em><span>보유 포인트</span></em>
                                <em><span id="totalPoint">${point}</span>p</em>
                            </span>

                        </div>
                </div>
        </div>

        <div class="col-xl-3">

            <div class="content-wrapper">
                <div class="payment-summary">
                    <div class="payment-item">
                        <span>상품가격</span>
                        <span><span id="totalPrice"></span>원</span>
                    </div>
                    <div class="payment-item">
                        <span>포인트 사용</span>
                        <span>-<span id="usingPoint"></span>원</span>
                    </div>
                    <div class="payment-item">
                        <span>배송비</span>
                        <span>3,000원</span>
                    </div>
            
                    <div class="total-amount">
                        <span>총 결제금액</span>
                        <span class="amount"><span id="finalTotal"></span>원</span>
                    </div>
            
                    <div class="points-info">
                        <p id="earnPoint"></p>포인트 적립예정
                    </div>
                </div>
            </div>

            <div class="content-wrapper" style="position: relative;padding-bottom: 100px;">
                <div class="row">
                    <label for="all"><input type="checkbox" id="all"> 전체 동의</label>
                </div>
				<div class="payment-section">
                	<button class="purchase pay-button" id="paymentButton">결제하기</button>
            	</div>
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


	<!-- Bootstrap Modal 1 -->
	<div class="modal fade" id="addressInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="addressInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="addressInfoModalLabel">적립금 내역</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
	
				<!-- Modal Body with Input Form -->
				<div class="modal-body">
	
					<!-- 배송지 정보 -->
					<div class="points-info">
									<h3>배송지 정보</h3>
						<c:choose>
							<c:when test="${empty user_addresses}">
								<h3 style="text-align: center;">배송지 정보가 없습니다.</h3>
							</c:when>
							<c:otherwise>
								<c:forEach items="${user_addresses}" var="a">
									<div class="container" style="text-align: left;">
										<p>수령자 : <span>${a.recipient_name}</span></p>
										<p>국가 : <span>${a.country}</span></p>
										<p>도 : <span>${a.state}</span></p>
										<p>우편번호 : <span>${a.postal_code}</span></p>
										<p>상세주소 : <span>${a.address_line}</span></p>
										<input type="hidden" name="address_idx" value="${a.address_idx}">
										<!-- 버튼 클릭 시 JavaScript 함수 호출 -->
						                <input type="button" 
								               data-dismiss="modal"
											   aria-label="Close"
						                	   onclick="selectAddress('${a.address_idx}', '${a.recipient_name}', '${a.country}', '${a.state}', '${a.postal_code}', '${a.address_line}')" 
						                       class="btn btn-outline-success" value="선택" data-bs-dismiss="modal">
									</div>
									<hr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 탭 메뉴 -->
					<div class="tabs">
						<button>전체</button>
					</div>
	
				</div>
	
				<!-- Modal Footer with Buttons -->
				<div class="modal-footer" style="justify-content: center;">
				
				</div>
			</div>
		</div>
	</div>

<script src="https://js.tosspayments.com/v1"></script>
<script>


// product_idx 값을 설정합니다 (JSP에서 JavaScript로 전달)
 const productIdx = ${product.product_idx != null ? product.product_idx : 0}; // JSP에서 product_idx가 null일 때 기본값 0 설정




    document.getElementById('paymentButton').addEventListener('click', function() {
        const clientKey = "test_ck_E92LAa5PVbPy2eE75QoB87YmpXyJ";
        const tossPayments = TossPayments(clientKey);
        
        
        const amount = $("#finalTotal").text();
        const orderName = "${cart_list[0].product_name}" + " 외 " + "${cart_list.size()}" + " 개";
        //	encodeURIComponent("${product.product_name}"); // JavaScript에서 인코딩
		const productIdxArray = Array.from(document.querySelectorAll('[id^="productPrice"]'));
    	console.log(productIdxArray);  // 배열 출력
    	console.log(orderName);  // 배열 출력
    	console.log(amount);  // 배열 출력

        tossPayments.requestPayment('카드', {
            amount: amount,
            orderId: "order-" + productIdxArray,
            orderName: orderName,
            customerName: $("#orderRecipient").text(),
            successUrl: `http://localhost:8080/paymentSuccess?orderName=${orderName}&amount=${amount}&product_idx=${productIdx}`,
            failUrl: "http://localhost:8080/toss/paymentFail.jsp"
        });
    });
</script>


<!-- 포인트 사용 -->
<script type="text/javascript">
	function usePoint() {
		
        const amount = $("#finalTotal").text();
        const orderName = "${cart_list[0].product_name}" + " 외 " + "${cart_list.size()}" + " 개";
        //	encodeURIComponent("${product.product_name}"); // JavaScript에서 인코딩
		const productIdxArray = Array.from(document.querySelectorAll('#product_idx')).map(input => input.value);
    	console.log("array : " + 	productIdxArray);  // 배열 출력
    	console.log(orderName);  // 배열 출력
    	console.log(amount);  // 배열 출력
		
	    let myPoint = parseFloat($("#totalPoint").text()); // 문자열을 숫자로 변환
	    let usePointAmount = parseFloat($("#usePoint").val()); // 문자열을 숫자로 변환
	    
	    if (usePointAmount > myPoint) {
	        alert("보유포인트가 부족합니다.");
	    } else {
	        $("#usingPoint").text(usePointAmount);
	        getTotalPrice();
	    }
	}
</script>


<!-- 합계 계산 메서드 -->
<script type="text/javascript">	
	window.onload = function() {
		getTotalPrice();
	}
	//페이지 로드 시 상태 변경
	history.pushState(null, null, location.href);
	
	// 뒤로 가기했을 때 처리하는 이벤트
	window.onpopstate = function(event) {
	    alert("뒤로가기 버튼이 클릭되었습니다.");
	    // 리다이렉트 처리
	    window.location.href = "/products"; // 원하는 페이지 URL로 변경
	};

  
	function getTotalPrice() {
	    // 보유 포인트를 숫자로 변환
	    let usingPoint = parseInt($("#usingPoint").text(), 10); // 기본값 0으로 설정되지 않으면
	    if (isNaN(usingPoint)) usingPoint = 0; // 만약 값이 없으면 0으로 설정

	    let grandTotal = 0;
	    const shippingFee = 3000; // 예시 배송비

	    let finalTotal = 0;
	    const totalPrices = document.querySelectorAll('[id^="productPrice"]'); // 가격이 표시된 요소들을 모두 선택
	    console.log("사용 포인트: ", usingPoint);
	    console.log("가격 요소들: ", totalPrices);

	    totalPrices.forEach(priceElement => {
	        // 가격을 추출
	        const priceValue = priceElement.textContent || priceElement.value;
	        console.log("상품 가격: ", priceValue);
	        
	        if (priceValue) {
	            // 금액에 있는 쉼표를 제거하고 숫자로 변환하여 grandTotal에 더하기
	            grandTotal += parseInt(priceValue.replaceAll(",", ""), 10); 
	        }
	    });

	    // 최종 금액 계산
	    if (usingPoint === 0) {
	        finalTotal = grandTotal + shippingFee; // 포인트가 없을 경우 배송비 포함
	    } else {
	        finalTotal = grandTotal + shippingFee - usingPoint; // 포인트가 있을 경우 적용
	    }

	    // 화면에 최종 금액, 총 금액, 적립 포인트 출력
	    $("#totalPrice").text(grandTotal.toLocaleString()); // 총 금액
	    $("#finalTotal").text(finalTotal.toLocaleString()); // 최종 금액
	    $("#earnPoint").text((grandTotal / 1000).toFixed(2)); // 적립금 계산 (예시로 1000원당 1포인트)
	}

</script>
<!-- 모달에서 주소 적용하는 코드 -->
<script>
	function selectAddress(address_idx, recipient, country, state, postalCode, addressLine) {
	    // 선택한 주소 정보를 부모 페이지의 요소에 업데이트
	    
	    $("#orderAddress_idx").val(address_idx);
	    $("#orderRecipient").text(recipient);
	    $("#orderCountry").text(country);
	    $("#orderState").text(state);
	    $("#orderPostalCode").text(postalCode);
	    $("#orderAddressLine").text(addressLine);
	/*     document.getElementById("orderRecipient").textContent = recipient;
	    document.getElementById("orderCountry").textContent = country;
	    document.getElementById("orderState").textContent = state;
	    document.getElementById("orderPostalCode").textContent = postalCode;
	    document.getElementById("orderAddressLine").textContent = addressLine; */
	
	    // 모달 닫기 (Bootstrap 5 방식)
	    var myModal = new bootstrap.Modal(document.getElementById('addressInfoModal'));
	    myModal.hide();
	}
</script>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
