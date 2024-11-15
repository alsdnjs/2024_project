<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>결제 성공 - 경빈이네</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet"> 
    
    <!-- Bootstrap Icons and CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: "Single Day", cursive;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;

        }
        .container {
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }
        .confirmation-message {
            color: LightCoral;
            font-size: 24px;
            margin: 20px 0;
        }
        .return-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: LightCoral;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .return-btn:hover {
          background-color: LightCoral;
        }
    </style>
</head>

<body>   

    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg ">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="/main">경빈이네</a>
            <!-- Remaining Navbar code here... -->
        </div>
    </nav>
    
    <!-- Confirmation Content -->
    <div class="container">
        <h2 class="confirmation-message">결제가 성공적으로 완료되었습니다!</h2>
     
    </div>

    <!-- Footer-->
    <footer class="mt-auto py-5 bg-dark">
        <div class="container text-center text-white">
            <p>| 회사명: 경빈이네 주식회사    대표자: 3조    주소: 서울특별시 마포구 |</p>
            <p>| 전화: 1818-9797  |  팩스: 042-526-9289  |</p>
            <p>|  개인정보보호책임자: 노종문 (jsfood5@naver.com) |</p>
            <p>|  COPYRIGHT (c) 경빈이네 주식회사 ALL RIGHTS RESERVED. |</p>
        </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
