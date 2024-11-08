<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등급 테이블</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
    }
    /* 좌우 여백 추가 */
      .main-content {
        padding-left: 15%; /* 좌우 15% 여백 */
        padding-right: 15%;
      }

    .table-container {
        max-width: 100%;
        margin: 0 auto;
    }

    .membership-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .membership-table th,
    .membership-table td {
        padding: 40px; 
        text-align: center;
        border: 1px solid #ddd;
    }

    .membership-table th {
        background-color: #f3f3f3;
        font-weight: bold;
    }

    .membership-table td {
        font-size: 16px;
        color: #333;
    }

    .membership-table .badge {
        font-size: 14px;
        font-weight: bold;
        color: white;
        padding: 5px 10px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .badge-vplus {
        background-color: #5669cc;
    }

    .badge-vip {
        background-color: #f05c5c;
    }

    .badge-gold {
        background-color: #d4af37;
    }

    .badge-silver {
        background-color: #b0b0b0;
    }

    .badge-family {
        background-color: #5abf5a;
    }
    
    /* 기존 스타일 유지 */
    .sidebar {
        background-color: white;
        padding: 15px;
        height: 100vh;
        position: sticky;
        top: 0;
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

    .dashboard-title {
        font-weight: bold;
        font-size: 1.5rem;
        margin-bottom: 20px;
    }

    </style>
</head>
<body>

<!-- 상단 네비게이션 바 -->
<header>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">경빈이네</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">신상품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">베스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">알뜰쇼핑</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">특가/혜택</a>
        </li>
      </ul>
      <div class="search-container">
        <input type="text" placeholder="검색어를 입력하세요" class="form-control d-inline-block" style="width: 200px;">
        <button class="btn search-button">검색</button>
      </div>
      <div class="user-actions">
        <a href="#" class="btn btn-light">사용자님 환영합니다</a>
        <a href="#" class="btn btn-light">로그아웃</a>
        <a href="#" class="btn btn-light">장바구니</a>
      </div>
    </div>
  </div>
</nav>
</header>

<!-- 메인 컨테이너 -->
<div class="container-fluid main-content">
  <div class="row">
    <!-- 사이드바 -->
    <div class="col-md-2 sidebar">
      <a href="" >공지사항</a>
      <a href="">자주 묻는 질문</a>
      <a href="" class="active">등급 혜택</a>
      <a href="">상품 문의</a>
      <a href="">1:1 문의</a>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-10">
      <div class="container mt-4">
        <h1 class="dashboard-title">등급 혜택</h1><hr><br><br>

        <div class="table-container">
            <table class="membership-table">
                <thead>
                    <tr>
                        <th>등급</th>
                        <th>달성 조건</th>
                        <th>혜택</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><span class="badge badge-vip">V</span> VIP</td>
                        <td>분기 중 월 300만원 구매</td>
                        <td>상품 구매 시 15% 할인</td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-gold">G</span> GOLD</td>
                        <td>분기 중 월 100만원 구매</td>
                        <td>상품 구매 시 8% 할인 </td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-silver">S</span> SILVER</td>
                        <td>분기 중 월 1회 구매</td>
                        <td>상품 구매 시 3% 할인</td>
                    </tr>
                    <tr>
                        <td><span class="badge badge-family">F</span> FAMILY</td>
                        <td>신규 회원가입 , 기존 회원</td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS, Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>