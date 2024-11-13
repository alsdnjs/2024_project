<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<style>
body {
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

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
.btn-spacing {
    margin-left: 5px;
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    text-align: center;
    text-decoration: none;
}

</style>

</head>

<body>
	<!-- Responsive navbar-->
	<header>
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

						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" onclick="toggleDropdown()">카테고리</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="/products?category_idx=24002">돼지고기</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item"
									href="/products?category_idx=24003">닭고기</a></li>
								<li><a class="dropdown-item"
									href="/products?category_idx=24001">소고기</a></li>
							</ul>
						</li>
					</ul>
					<div class="search-container">
						<input type="text" class="search-input" placeholder="검색어를 입력하세요">
						<button class="search-button">
							<img src="https://img.icons8.com/ios-filled/50/ffffff/search.png"
								alt="돋보기">
						</button>
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
		<!-- Header-->
	</header>


	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5">
			<div class="col-lg-7">
				<c:choose>
					<c:when test="${empty pvo.thumbnail_url}">
						<img class="img-fluid rounded mb-4 mb-lg-5" src="" alt="..." />
					</c:when>
					<c:otherwise>

						<img class="card-img-top"
							src="resources/upload/${pvo.thumbnail_url}" />
					</c:otherwise>
				</c:choose>
		
			</div>
			<div class="col-lg-5">
				<h1 class="font-weight-light" style="margin-top: -30px;">${pvo.product_name}
				</h1>
				<p>신선한 상품</p>
				<p>배송 : 2일 후에 도착</p>
				<p>배송 후 : 교환 및 반품 불가</p>
				<p>신선배송 : 포장비 없음</p>

				<div class="product-actions">				
					<input type="number" id="quantity" value="1" min="1" class="form-control d-flex">
					<input type="hidden" id="product_idx" value="${pvo.product_idx}">
					<button type="button" class="btn btn-primary btn-spacing" onclick="addToCart()">장바구니 담기</button> 
					<button type="button" class="btn btn-primary btn-spacing" onclick="location.href='${pageContext.request.contextPath}/paymentPage?product_idx=${pvo.product_idx}&amount=${pvo.price}'">구매하기</button>

				</div>
				
				
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
								class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
								href="#nav-contact" role="tab" aria-controls="nav-contact"
								aria-selected="false" onclick="loadReviews()">상품평</a> <a
								class="nav-item nav-link" id="nav-about-tab" data-toggle="tab"
								href="#nav-about" role="tab" aria-controls="nav-about"
								aria-selected="false">유의사항</a>
						</div>
					</nav>
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<p>상품설명</p>
							<p>${pvo.description}</p>
						</div>

						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">
							<p>상품평</p>
							<p>평점 :
							<pre> ${pvo.avg_rating} </pre>
							</p>

							<!-- 리뷰 폼 -->
							<form id="reviewForm" action="/insert_review" method="get">
								<div class="mb-3">
									<label for="reviewInput" class="form-label">상품평을
										작성해주세요:</label> <label for="volume">평점:</label> <input type="range"
										id="volume" name="rating" min="0" max="5" value="3">
									<p>
										Value: <span id="volumeValue">3</span>
									</p>
									<input type="hidden" name="user_idx" value="${mvo.user_idx}">
									<input type="hidden" name="product_idx"
										value="${param.product_idx}">
									<p>내용</p>
									<textarea style='width: 80%' name="comment"></textarea>
								</div>
								<button type="submit" class="btn btn-primary">등록</button>
							</form>



							<!--   product_id 받기 -->
							<div id="product-info" data-product-idx="${pvo.product_idx}"></div>
							<!-- 리뷰 리스트 보여주는 곳 -->
							<div id="reviewList"></div>
							<!-- 페이징 버튼 표시 -->
							<div id="pagination"></div>

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
	
	<!-- 장바구니 관련 -->
	<script type="text/javascript">
		function addToCart(){
			
			let product_idx = $("#product_idx").val();
			let quantity = $("#quantity").val();
			console.log("product_idx : " + product_idx);
			console.log(quantity);
		    // 서버에 장바구니 추가 요청 보내기
		    $.ajax({
		        url: '/add_to_cart',  // 서버의 장바구니 추가 URL
		        type: 'POST',
		        data: {
		            product_idx: product_idx,  // 예시 상품 ID (실제 데이터로 변경)
		    		quantity : quantity		   // 수량
		        },
		        success: function(response) {
			        	  // 로그인되지 않은 경우
			            if (response.redirect) {
			                // 로그인 페이지로 리다이렉트
			                window.location.href = response.loginUrl;
			            } else if (response.success) {
			                // 장바구니 추가가 성공하면
			                if (confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
			                    window.location.href = "/cart_list";  // 장바구니 페이지로 이동
			                }
			            } else {
			                alert("장바구니 추가에 실패했습니다.");
			            }
		       	  },
		        error: function() {
		            alert("서버와의 연결에 실패했습니다.");
		        }
		    });
		}
		
	</script>

	<script>

	let loggedInUserIdx = "${mvo.user_idx}";
	console.log("session  : " + loggedInUserIdx);
    let cPage = 1; // 현재 페이지
    const product_idx = $('#product-info').data('product-idx');
    const pagePerBlock = 5; // 한 번에 표시되는 블록 개수
    let numPerPage = 0;  // 한 번에 표시되는 리뷰 개수 (서버에서 값을 가지고 옴)
    let totalBlock = 1;		// 총 블록 개수
    let totalRecords = 0; // 총 리뷰 개수
    let totalPages = 0; // 총 페이지 수
    let nowBlock = 1; // 현재 블록
    let beginBlock = 1;
    let endBlock = pagePerBlock;
    
    
    const rangeInput = document.getElementById('volume');
    const volumeValue = document.getElementById('volumeValue');
    
    // rating 줄 바꾸면 숫자 바뀜
    rangeInput.addEventListener('input', function() {
        volumeValue.textContent = this.value; // 현재 슬라이더 값을 표시
    });
    
    
    // 리뷰 리스트를 가져오는 함수
    function loadReviews(page = 1) {
        $.ajax({
            url: '/reviews',
            type: 'get',
            data: {
                cPage: page,
                product_idx: product_idx
            },
            dataType: "json",
            success: function(response) {
                totalRecords = response.totalRecords;
                totalPages = response.totalPages;
                numPerPage = response.numPerPage;
                
                totalBlock = Math.ceil(totalRecords / numPerPage);

                // 리뷰 리스트 업데이트
                $("#reviewList").empty();
              
                let div = "<div style='border: 1px solid #cc00cc; width:580px; margin: 5px; padding:5px;'>";

                    for (let i = 0; i < response.reviews.length; i++) {
                        let username = response.reviews[i].username;
                        let user_idx = response.reviews[i].user_idx;
						let comment = response.reviews[i].comment;
						let created_at = response.reviews[i].created_at;
						let review_idx = (String)(response.reviews[i].review_idx);
						
						div += "<p>작성자 : " + username + "</p>";
						div += "<p>내용 : <pre>" + comment + "</pre></p>";
						div += "<p>날짜 : " + created_at + "</p>";
				        // 작성자와 로그인한 사용자 ID가 같을 때만 삭제 버튼 표시
				        if (user_idx === loggedInUserIdx) {
				            div += "<form action='/delete_review' method='get'>";
				            div += "<input type='hidden' name='review_idx' value='" + review_idx + "'/>";
				            div += "<input type='hidden' name='product_idx' value='" + product_idx + "'/>";
				            div += "<input type='submit' value='삭제' onclick='confirmDelete(event)'/></form>";

				        }
                        
                    }
                
				div += "</div>";

					$("#reviewList").append(div);
					
                // 페이징 버튼 업데이트
                updatePagination(beginBlock, endBlock);
                console.log("nowPage:" + cPage)
            },
            error: function() {
                alert('리뷰를 불러오는 데 실패했습니다.');
            }
        });
    }
    
    // 삭제버튼 누를 시 확인 절차
    function confirmDelete(event) {
        // 확인 창 표시
        if (!confirm("정말 삭제하시겠습니까?")) {
            // 취소를 누르면 이벤트 전파를 막아 폼 제출을 중지
            event.preventDefault();
        }
    }
    
 	// 처음 페이지 로드 시 버튼 생성
    const prevButton = $('<button id="prevButton" disabled>이전</button>');
    const nextButton = $('<button id="nextButton" disabled>다음</button>');
    const paginationContainer = $('#pagination');

    // 페이지 버튼 컨테이너
    const pageButtonsContainer = $('<div id="pageButtons"></div>');

    paginationContainer.append(prevButton).append(pageButtonsContainer).append(nextButton);
 
    // 시작과 끝 버튼 구하기
    function getbeginendBlock() {
    	console.log("nowBlock : " + nowBlock);
        beginBlock = (((nowBlock-1) / pagePerBlock) * pagePerBlock + 1); // 현재 블록의 시작 페이지
        endBlock = beginBlock + 4;// 현재 블록의 끝 페이지
        
        console.log("pro.beginBlock : " + beginBlock);

        // 블록의 끝 페이지가 총 페이지 수를 초과하지 않도록 조정
        if (endBlock > totalBlock) {
            endBlock = totalBlock;
        }
        
        return beginBlock, endBlock ;
    } 
	    
    // 페이지 버튼 생성
    function createPageButtons(beginBlock, endBlock) {
        pageButtonsContainer.empty(); // 기존 페이지 버튼 제거
        console.log("c:beginBlock : " + beginBlock);
        console.log("c:endBlock : " + endBlock);

        for (let i = beginBlock; i <= endBlock; i++) {
            const pageButton = $('<button>' + i + '</button>');
            pageButton.on('click', function() {
                cPage = i;
                loadReviews(cPage);
            });
            
            // 현재 페이지와 일치하면 활성화
            if (i === cPage) {
                pageButton.prop('disabled', true);
            }

            pageButtonsContainer.append(pageButton);
        }
    }

    // 다음 버튼 클릭 시
    nextButton.on('click', function() {
    	//다음 블록페이지에서 첫번쨰 페이지
       	beginBlock = endBlock + 1;
       	console.log("beginBlock : " + beginBlock);
       	// 다음 페이지의 마지막 블록이 총 블록보다 작을 때
        if (endBlock + pagePerBlock >= totalBlock) {
        	endBlock = totalBlock;
        	cPage = beginBlock;
            loadReviews(cPage);
        } else{
        	endBlock = beginBlock + pagePerBlock - 1;
        	cPage = beginBlock;
        	console.log("??" + cPage)
            loadReviews(cPage);
        }
       	
       	
    });

    // 이전 버튼 클릭 시
    prevButton.on('click', function() {
        if (beginBlock > pagePerBlock) {
            beginBlock = beginBlock - pagePerBlock;
            endBlock = beginBlock + pagePerBlock - 1;
            cPage = endBlock;
            loadReviews(cPage);
        }
    });

    // 페이지 로드 또는 리뷰 데이터 업데이트 시 호출
    function updatePagination(beginBlock, endBlock) {
    	
    	console.log("????" + endBlock)
    	console.log("????" + totalBlock)
    	
    	if(totalBlock <= beginBlock && beginBlock == 1){
    		endBlock = 1;
    	} else if(totalBlock > beginBlock && totalBlock < endBlock){
    		beginBlock = 1;
    		endBlock = totalBlock;
    	}
    	
        // 다음 버튼 활성화/비활성화
        if (endBlock < totalBlock) {
            nextButton.prop('disabled', false);
        } else {
            nextButton.prop('disabled', true);
        }

        // 이전 버튼 활성화/비활성화
        if (beginBlock > 1) {
            prevButton.prop('disabled', false);
        } else {
            prevButton.prop('disabled', true);
        }

        // 페이지 버튼 생성
        createPageButtons(beginBlock, endBlock);
    }
    
</script>
	<!-- jQuery and Bootstrap JS-->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>