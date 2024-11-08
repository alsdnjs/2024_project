<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>1:1 문의 작성</title>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

        .sidebar a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #e9ecef;
            border-radius: 5px;
        }

        .sidebar .active {
            background-color: #ffcccc;
            color: #fff;
            border-radius: 5px;
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

.side-main-container{
    display: flex;
    justify-content: center;
}
    /* 사이드바 스타일 */
    #sidebar {
        background-color: white;
        padding: 15px;
        height: 100vh;
        position: fixed ;
        left: 0;  /* 처음에 화면 밖에 숨김 */
        top: 0;
        width: 250px;
        transition: transform 0.5s ease;        
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
    /* 사이드바 오른쪽 중간에 토글 버튼 스타일 */
    #toggleSidebar {
        position: absolute;
        top: 50%;  /* 수직 가운데 */
        right: -30px;  /* 사이드바 오른쪽 밖으로 조금 나오게 */
        transform: translateY(-50%);  /* 정확히 가운데 맞추기 */
        background-color: red;
        border: none;
        color: white;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 50%;   /* 버튼을 원형으로 만듦 */
        display: none;  /* 기본적으로 숨김 */
    }



        @media (min-width: 1200px) {
            #sidebar {
                position: relative;
                transform: translateX(0);
                z-index: 1;
                width: 250px;
                margin-left: 0;
                left: 0;  /* 큰 화면에서는 항상 사이드바 보임 */
            }
            #toggleSidebar {
                display: none;  /* 큰 화면에서는 토글 버튼 숨김 */
            }
            .main-content {
                padding-left: 5%;
                padding-right: 5%;
            }
            .sidebar-size-controll{
                width: 15%;
            }
        }

        /* 작은 화면에서 토글 버튼 보이게 하고, 사이드바 숨기기 */
        @media (max-width: 1199px) {
            #sidebar.show {
                transform: translateX(250px); /* 왼쪽에서 오른쪽으로 나옴 */
            }
            #toggleSidebar {
                display: block ;  /* 작은 화면에서 토글 버튼 보이게 */
            }
            #sidebar {
                left: -250px;  /* 사이드바 숨기기 */
                z-index: 2;
                width: 250px;
                position: fixed;
            }
            .main-content {
                padding-left: 10%;
                padding-right: 10%;
                height: auto;
                position: relative;
                z-index: 1;
            }
            .footer{
                z-index: 1;
            }
        }

    </style>
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
    <div class="side-main-container">
        <div class="sidebar-size-controll"></div>
	<!-- 사이드바 -->
	<div id="sidebar" class="sidebar">
		<a href="/mypage">나의 경빈이네</a> 
        <a href="/orderHistory">주문/배송내역</a>
        <a href="/updateProfile">회원정보수정</a> 
        <a href="/myInquiry" class="active">나의 상품문의</a>
		<button id="toggleSidebar">>></button>
	</div>
    <div class="container-fluid main-content">
        <div class="row">

            <!-- 1:1 문의 작성 -->
            <div class="mt-4" id="main-content">
                <h1 class="dashboard-title">1:1 문의 작성</h1>

                <!-- 문의 작성 폼 -->
                <form method="post" action="/inquiryWrite_ok" encType="multipart/form-data">
                    <div class="mb-3">
                        <label for="category" class="form-label">분류</label>
                        <select class="form-select" id="category" name="category" required>
                            <option value="">선 택</option>
                            <option value="주문문의">주문문의</option>
                            <option value="배송문의">배송문의</option>
                            <option value="기타문의">기타문의</option>
                        </select>
                    </div>
                    <input type="hidden" value="user_id" name="user_id">
                    <div class="mb-3">
                        <label for="name" class="form-label">이름</label>
                        <input type="text" class="form-control" value="${username }" readonly >
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">이메일</label>
                        <input type="email" class="form-control" value="${email }" readonly >
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">핸드폰</label>
                        <input type="tel" class="form-control" value="${phone }" readonly >
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">제목</label>
                        <input type="text" class="form-control" name="subject" required>
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control"name="content" rows="5" id="content" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="file" class="form-label">파일첨부</label>
                        <input type="file" class="form-control" name="file_name">
                    </div>

                    <!-- 제출 버튼과 취소 버튼 -->
                    <div class="submit-buttons">
                        <button type="reset" onclick="/myInquiry" class="btn btn-cancel">취소</button>
                        <button type="submit" class="btn btn-danger" >문의하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="sidebar-size-controll"></div>
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
        $(document).ready(function() {
			// 토글 버튼 클릭 시 사이드바 열고 닫기 및 메인 콘텐츠 이동
			$('#toggleSidebar').click(function() {
				$('#sidebar').toggleClass('show');
                if($("#toggleSidebar").text() == ">>"){
                    $("#toggleSidebar").text("<<");
                }else{
                    $("#toggleSidebar").text(">>");
                }
			});
		});
    </script>
    <script type="text/javascript">
		function writeInquiry_ok(f) {
			f.action = "/inquiryWrite_ok";
			f.method = "post";
			f.submit();
		}
		function myInquiry() {
			location.href = "/myInquiry"
		}
	</script>
</body>
</html>