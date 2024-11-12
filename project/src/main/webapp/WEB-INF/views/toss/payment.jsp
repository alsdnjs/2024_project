<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제 페이지</title>

    <!-- 글꼴 및 아이콘 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />

    <style>
        body {
            font-family: "Single Day", cursive !important;
            font-weight: 400;
            font-style: normal;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            padding: 40px 0;
        }

        .container {
            max-width: 1200px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
            width: 100%;
            padding-bottom: 60px;
        }

        .order-info, .payment-info {
            width: 48%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            text-align: center; /* 제목 가운데 정렬 */
        }

        .order-item, .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #f0f0f0;
            font-size: 16px;
        }

        .total {
            font-weight: bold;
            font-size: 20px;
            color: red;
        }

        .payment-section {
            margin-top: 50px; /* 버튼을 더 아래로 */
            text-align: center;
        }

        .pay-button {
            background-color: #ff0000;
            color: white;
            padding: 15px;
            border: none;
            width: 100%;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .pay-button:hover {
            background-color: #d00000;
        }

        footer {
            background-color: LightCoral;
            padding: 20px;
            color: white;
            text-align: center;
            font-family: "Single Day", cursive;
            margin-top: auto;
        }

        .footer-text {
            margin: 5px 0;
        }
    </style>
</head>
<body>

<!-- 상단 네비게이션 -->
<nav class="navbar navbar-expand-lg">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/main">경빈이네</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/products?category_idx=24002">돼지고기</a></li>
                        <li><a class="dropdown-item" href="/products?category_idx=24003">닭고기</a></li>
                        <li><a class="dropdown-item" href="/products?category_idx=24001">소고기</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex" action="/cart_list" method="get">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i> Cart
                </button>
            </form>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="container">
        <!-- 주문 상품 정보 -->
        <div class="order-info">
            <h2>주문상품 정보</h2>
            <div class="order-item">
                <div>
                    <img src="path/to/product_image.jpg" alt="상품 이미지" style="width: 80px; height: 80px; margin-right: 10px;">
                </div>
                <div>
                    <p>상품명: ${product.product_name}</p>
                    <p>수량: 1개</p>
                    <p>가격: <fmt:formatNumber value="${product.price}" maxFractionDigits="0"/>원</p>
                </div>
            </div>
        </div>

        <!-- 결제 금액 정보 -->
        <div class="payment-info">
            <h2>결제 금액</h2>
            <div class="summary-item">
                <span>상품 금액</span>
                <span><fmt:formatNumber value="${product.price}" maxFractionDigits="0"/>원</span>
            </div>
            <div class="summary-item">
                <span>배송비</span>
                <span>0원 (무료)</span>
            </div>
           <div class="summary-item total">
                <span>최종 결제 금액</span>
                <span><fmt:formatNumber value="${product.price}" maxFractionDigits="0"/>원</span>
            </div>

            <!-- 결제하기 버튼 -->
            <div class="payment-section">
                <button class="pay-button" id="paymentButton">결제하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 하단 푸터 -->
<footer>
    <p class="footer-text">| 회사명: 경빈이네 주식회사 대표자: 3조 주소: 서울특별시 마포구 |</p>
    <p class="footer-text">| 전화: 1818-9797 팩스: 042-526-9289 | 개인정보보호책임자: 노종문 (jsfood5@naver.com) |</p>
    <p class="footer-text">| COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
</footer>

<script src="https://js.tosspayments.com/v1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // 결제하기 버튼 클릭 이벤트
        $("#paymentButton").click(function() {
            // Toss Payments 클라이언트 키 설정
            let clientKey = "test_ck_E92LAa5PVbPy2eE75QoB87YmpXyJ";
            let tossPayments = TossPayments(clientKey);

            // JSP에서 JavaScript로 변수 전달
            let productIdxLine = "${product.product_idx != null ? product.product_idx : 0}";
            let productIdx = productIdxLine;

            let orderNameLine = "${product.product_name != null ? product.product_name : ''}";
            let orderName = orderNameLine;

            let amountLine = "${product.price != null ? product.price : 0}";
            let amount = amountLine;

            // 디버깅용 콘솔 로그
            console.log("productIdx:", productIdx);
            console.log("orderName:", orderName);
            console.log("amount:", amount);

            // URL 인코딩 처리
            let encodedOrderName = encodeURIComponent(orderName);

            // 결제 요청 설정 객체를 한 줄씩 작성
            let paymentData = {};
            paymentData.amount = amount;
            paymentData.orderId = 'order-' + productIdx;
            paymentData.orderName = orderName;
            paymentData.customerName = '홍길동';
            paymentData.successUrl = 'http://localhost:8080/paymentSuccess?orderName=' + encodedOrderName + '&amount=' + amount + '&product_idx=' + productIdx;
            paymentData.failUrl = 'http://localhost:8080/toss/paymentFail.jsp';

            // 결제 요청
            tossPayments.requestPayment('카드', paymentData);
        });
    });
</script>


</body>
</html>
