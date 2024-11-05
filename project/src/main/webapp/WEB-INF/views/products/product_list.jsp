<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
            
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
	
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	    <style>
			body{
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
	    	border-bottom: 2px solid #ccc; /* 원하는 색상 및 두께로 조정 */
	    	padding-bottom: 10px; /* 필요시 여백 추가 */
			}
	
	.register-link {
	    display: flex;
	    justify-content: center; /* 버튼을 수평으로 가운데 정렬 */
	    margin-left: -44%; /* 더 왼쪽으로 이동 (값 조정 가능) */
	    margin-top: 40px; /* 아래로 내리기 (값 조정 가능) */
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
	    background-color: LightCoral; /* 원하는 색상으로 변경 */
	    text-align: center;
	    padding: 10px 0;
	   margin-top: auto;
	}
	
	       	</style>
	        
	    
	    <title>경빈이네</title>
	    <!-- Favicon-->
	    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	    <!-- Bootstrap icons-->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>   
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg ">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">경빈이네</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">로그인 / 회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach items="#{categoryList}" var="k">
                            	<li><a class="dropdown-item" href="/products?category=${k.category_id}">${k.category_name}</a></li>
                            </c:forEach>
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
                        <a href="/gb2_list" class="btn-custom">높은순</a>
                    </p>
                    <br>
                    <p>
                        <a href="/gb2_list" class="btn-custom">낮은순</a>
                    </p>
                </div>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:choose>
                	<c:when test="${empty ProductList}">
                		<h1>등록된 상품이 없습니다.</h1>
                	</c:when>
                	<c:otherwise>
	                	<c:forEach items="${ProductList}" var="k">
	                	
		                	<div class="col mb-5">
		                        <div class="card h-100">
		                            <!-- Product image-->
		                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
		                            <!-- Product details-->
		                            <div class="card-body p-4">
		                                <div class="text-center">
		                                    <!-- Product name-->
		                                    <h5 class="fw-bolder">${k.product_name}</h5>
		                                    <!-- Product price-->
		                                    ${k.price}
		                                </div>
		                            </div>
		                            <!-- Product actions-->
		                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
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
            <div class="container"><p class="m-0 text-center text-white">| 회사명: 경빈이네 주식회사    대표자: 3조    주소: 서울특별시 마포구 |</p>
            
            <div class="container"><p class="m-0 text-center text-white">| 전화: 1818-9797  |  팩스: 042-526-9289  |</p>
            
            <div class="container"><p class="m-0 text-center text-white">|  개인정보보호책임자: 노종문 (jsfood5@naver.com |</p>
            
            <div class="container"><p class="m-0 text-center text-white">|  COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
             </div>
             </div>
              </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>