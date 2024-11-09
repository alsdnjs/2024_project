<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>경빈이네</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Core theme CSS (includes Bootstrap) -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />

<style>
body {
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

.border-bottom {
	border-bottom: 2px solid #ccc;
	padding-bottom: 10px;
}

.register-link {
	display: flex;
	justify-content: center;
	margin-left: -44%;
	margin-top: 40px;
}

.btn-custom {
	display: inline-block;
	padding: 5px;
	background-color: lightgrey;
	color: white;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s, transform 0.2s;
}

.footer {
	z-index: 10;
	background-color: LightCoral;
	text-align: center;
	padding: 10px 0;
	margin-top: auto;
}

.dropdown-menu {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	margin-top: 5px;
}

.dropdown-item {
	padding: 10px 20px;
	color: #333;
	text-decoration: none;
}

.dropdown-item:hover {
	background-color: #ddd;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg">
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
					<!-- 로그인 상태에 따른 메뉴 표시 -->
					<c:choose>
						<c:when test="${sessionScope.loginStatus == 'ok'}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/main">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/user_login">로그인 /
									회원가입</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="/notice">고객센터</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" onclick="toggleDropdown()">카테고리</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/products?category_idx=24002">돼지고기</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item"
								href="/products?category_idx=24003">닭고기</a></li>
							<li><a class="dropdown-item"
								href="/products?category_idx=24001">소고기</a></li>
						</ul></li>
				</ul>
				<div class="search-container">
				<form action="product_search_main" method = "get">
					<input type="text" class="search-input" name="keyword" placeholder="검색어를 입력하세요">
					
				</form>
				</div>
				<!-- 장바구니 리스트 -->
				<form class="d-flex" action="/cart_list" method="get">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart
					</button>
				</form>
			</div>
		</div>
	</nav>
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
	<!-- Bootstrap Bundle with Popper (includes all plugins) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Header-->

	<!--   <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">경빈이네</h1>
                    <p class="lead fw-normal text-white-50 mb-0">소고기 ... 매일 변화하는 데이터, "MIT"가 비지니스를 스마트하게 만들어 드립니다.</p>
                </div>
            </div>
       </header>  -->

	<div class="register-link">
		<p>
			<a href="/product_search_main?orderBy=desc&keyword=${keyword}"
				class="btn-custom">높은순</a>
		</p>
		<br>
		<p>
			<a href="/product_search_main?orderBy=asc&keyword=${keyword}"
				class="btn-custom">낮은순</a>
		</p>
	</div>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:choose>
					<c:when test="${empty ProductList}">
						<h1>등록된 상품이 없습니다.</h1>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ProductList}" var="k">

							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->
									<c:choose>
										<c:when test="${empty k.thumbnail_url}">
											<img class="card-img-top"
										src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
										alt="..." />
										</c:when>
										<c:otherwise>
					
											<img class="card-img-top" src="resources/upload/${k.thumbnail_url}"
													/>
										</c:otherwise>
									</c:choose>
									
									<div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- 상품 이름 -->
                                        <div class="product-label">
                                            <h5 class="product-name">${k.product_name}</h5>
                                            <div class="heart-container">
                                                <input type="hidden" value="${k.product_idx}">
                                                <button type="button" class="product-like-btn" data-product-idx="${k.product_idx}">
                                                    <i class="far fa-heart"></i>
                                                </button>
                                            </div>
                                        </div>
											<!-- Product price-->
											${k.price}
										</div>
										<div>${k.avg_rating}</div>

									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto"
												href="/products_detail?product_idx=${k.product_idx}">View
												options</a>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 footer">
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
	<!-- jQuery 로드 (Bootstrap 이전에 로드되어야 함) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap 5.3.3 (jQuery는 제외) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
    // 페이지 로드 시 서버에서 좋아요 상태를 가져와서 버튼 상태를 설정
    $.ajax({
        url: "/get_product_likes", // 서버에서 좋아요 상태를 받아옴
        type: "GET",
        success: function(response) {
            console.log(response); // [1, 2, 3]과 같은 형태로 반환됨 (상품의 product_idx 값들)

            // 각 상품에 대해 버튼 상태를 업데이트
            response.forEach(function(product_idx) {
                var $button = $("button[data-product-idx='" + product_idx + "']");
                $button.addClass('liked'); // 'liked' 클래스를 추가
                $button.find('i').removeClass('far').addClass('fas'); // 아이콘을 채워진 하트로 변경
            });
        },
        error: function(xhr, status, error) {
            console.error("서버에서 좋아요 상태를 가져오는 데 실패했습니다.", status, error);
        }
    });

    // 좋아요 버튼 클릭 시 좋아요 추가/삭제 처리
    $(document).on('click', '.product-like-btn', function() {
        var product_idx = $(this).data('product-idx');
        var $this = $(this);

        alert("버튼 눌림");  // 클릭 여부 확인

        // 현재 상태에 따라 좋아요 추가/삭제 처리
        if ($this.hasClass('liked')) {
        	alert("좋아요 있음");
            // 좋아요 삭제
            $.ajax({
                url: "/remove_like",
                type: "POST",
                data: { product_idx: product_idx },
                success: function(response) {
                    $this.removeClass('liked');
                    $this.find('i').removeClass('fas').addClass('far'); // 아이콘 상태 변경
                    alert("관심상품에서 삭제되었습니다.");
                },
                error: function(xhr, status, error) {
                    console.error("관심상품 삭제 실패", status, error);
                }
            });
        } else {
            // 좋아요 추가
       		alert("좋아요 없음");
            $.ajax({
                url: "/add_like",
                type: "POST",
                data: { product_idx: product_idx },
                success: function(response) {
                    $this.addClass('liked');
                    $this.find('i').removeClass('far').addClass('fas'); // 아이콘 상태 변경
                    alert("관심상품에 추가했습니다.");
                },
                error: function(xhr, status, error) {
                    console.error("관심상품 추가 실패", status, error);
                }
            });
        }
    });
</script>
</body>
</html>