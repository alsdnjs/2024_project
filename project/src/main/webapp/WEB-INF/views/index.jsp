<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
         <!-- 글꼴  -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/
		css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family
		=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet"> 
        
       	<style>
		
		body{
  			/* 글꼴  */
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
        
    
        <title>경빈이네</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
       <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body>   
    
 <jsp:include page="popup.jsp"></jsp:include>

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg ">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">경빈이네</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <!-- 로그인 상태에 따른 메뉴 표시 -->
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
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="/products" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
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
                            placeholder="검색어를 입력하세요">
                    </form>
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
          
        <!-- Header-->
        <header >
        
       <!--   <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">경빈이네</h1>
                    <p class="lead fw-normal text-white-50 mb-0">소고기 ... 매일 변화하는 데이터, "MIT"가 비지니스를 스마트하게 만들어 드립니다.</p>
                </div>
            </div>
       </header>  -->

 <div style="display: flex; justify-content: center;">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="width: 100%; height: 500px; background-color: LightCoral;">
        <!-- Carousel indicators -->
        <ol class="carousel-indicators">
            <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
        </ol>

        <!-- Wrapper for carousel items -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/resources/images/aa.png" class="d-block w-100" alt="Slide 1" style="height: 500px; object-fit: contain;">
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/resources/images/ee.png" class="d-block w-100" alt="Slide 2" style="height: 500px; object-fit: contain;">
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/resources/images/tt.png" class="d-block w-100" alt="Slide 3" style="height: 500px; object-fit: contain;">
            </div>
        </div>

        <!-- Carousel controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>



            
        </header> 
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/소고기 이미지 1번.PNG" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" >
                                    <a href="/product" class="text-decoration-none text-dark">잡뼈 - 국산 | 신선P&F - 3등급</a>
                                    </h5>
                                    <!-- Product price-->
                                    870원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=123">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                         
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/소고기 이미지 2번.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">치마+토시+제비 - 국산 | 신선P&F - 3등급</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">45000원</span>
                                   40000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=124">View Options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/소고기 이미지 3번.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">목심 - 국산 | 더미트한우 - 1+등급</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">20000원</span>
                                    19000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=125">View Options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/돼지고기 이미지 1번.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">삼겹살10mm - 국산 | 당당한돈</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    12340원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=126">View Options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/돼지고기 이미지 2번.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">3팩갈비 - 국산 | 프리미엄 - 암퇘지</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">8000원</span>
                                    7800원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=127">View Options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/돼지고기 이미지 3번.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">목심20mm - 국산</h5>
                                    <!-- Product price-->
                                    11200원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=128">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/닭고기 이미지 1번.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">[업소용] 닭다리살(정육) 2kg*5 - 국산</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    	108200원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=129">View Options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/images/닭고기 이미지 2번.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">통닭8호 [벌크포장 20수] - 국산</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    5003원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products_detail?product_idx=130">View Options</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사    대표자: 3조    주소: 서울특별시 마포구 |</p>
            </div>
            
            <div class="container"><p class="m-0 text-center text-white">| 전화: 1818-9797  |  팩스: 042-526-9289  |</p>
            </div>
            
            <div class="container"><p class="m-0 text-center text-white">|  개인정보보호책임자: 노종문 (jsfood5@naver.com |</p>
            </div>
            
            <div class="container"><p class="m-0 text-center text-white">|  COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
             </div>
             
             
            
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Core theme JS-->
       
    </body>
</html>
