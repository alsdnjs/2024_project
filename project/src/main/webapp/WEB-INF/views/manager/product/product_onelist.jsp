<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 상품 정보 하나 보기 화면</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Roboto', sans-serif;
	background-color: gray;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
	font-weight: 500;
}

a:hover {
	color: #2980b9;
}

div {
	width: 600px;
	margin: 50px auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h2 {
	margin-bottom: 20px;
	color: black;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	table-layout: fixed;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
	background-color: blue;
	font-size: 14px;
	word-wrap: break-word;
}

th {
	background-color: #333333;
	color: white;
	font-weight: 500;
	text-align: center;
}

td {
	background-color: white;
	color: #333;
	font-size: 14px;
	text-align: center;
}

/* 각 열의 너비를 비율로 설정 */
th:nth-child(1), td:nth-child(1) {
    width: 30%;
}

th:nth-child(2), td:nth-child(2) {
    width: 70%;
}

input[type="text"] {
	width: 90%;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

input[type="button"], input[type="reset"] {
	background-color: #333333; /* 회색 */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	margin: 0 5px;
}

input[type="button"], input[type="submit"] {
	background-color: #333333; /* 회색 */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	margin: 0 5px;
}

input[type="button"]:hover, input[type="reset"]:hover {
	background-color: #222222; /* 더 어두운 회색 */
}

p {
	margin-bottom: 20px;
}

@media ( max-width : 600px) {
	div {
		width: 90%;
	}
	input[type="text"] {
		width: 100%;
	}
}
</style>

</head>
<body>
	<div>
		<h2>상품 정보보기</h2>
		<hr>
		<p>
			[<a href="/product_list">목록으로 이동]</a>
		</p>
		<form method="post">
			<table>
				<tr>
					<td>상품 번호</td>
					<td>${mpvo.product_idx }</td>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td>${mpvo.product_name }</td>
				</tr>
				<tr>
					<td>판매자 id</td>
					<td>${mpvo.sellers_idx }</td>
				</tr>
				<tr>
					<td>판매 업체</td>
					<td>${mpvo.store_name}</td>
				</tr>
				<tr>
					<td>상품 설명</td>
					<td colspan="2">${mpvo.description }</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${mpvo.price }</td>
				</tr>
				<tr>
					<td>재고</td>
					<td>${mpvo.stock }</td>
				</tr>
				<tr>
					<td>카테고리 id</td>
					<td>${mpvo.category_id }</td>
				</tr>
				<tr>
					<td>등록일자</td>
					<td>${mpvo.created_at }</td>
				</tr>
				<tr>
						<td>첨부파일:</td>
						<c:choose>
							<c:when test="${empty mpvo.thumbnail_url}">
								<td><b>첨부파일없음</b></td>
							</c:when>
							<c:otherwise>
								<td><a href="/inquiry_down?f_name=${mpvo.thumbnail_url }"> <img
										src="resources/upload/${mpvo.thumbnail_url}" style="width: 200px"></a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				<tr>
					<td>상태</td>
					<c:choose>
						<c:when test="${mpvo.stock == 0}">
							<td style="color : red;">품절</td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${mpvo.is_active == 1}">
									<td>판매중</td>
								</c:when>
								<c:otherwise>
									<td>비판매중</td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>

				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2"><input type="hidden" name="product_idx"
							value="${mpvo.product_idx }"> 
							<input type="button" value="상품 삭제" onclick="delete_ok(this.form)">
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function delete_ok(f) {
			if (confirm("정말 삭제할까요? 삭제하면 되돌릴 수 없습니다.")) {
				f.action = "/product_delete_ok";
				f.submit();

			} else {
				alert("삭제가 취소되었습니다.")
			}
		}
	</script>
</body>
</html>















