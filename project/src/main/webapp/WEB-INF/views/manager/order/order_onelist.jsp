<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 하나 보기 화면</title>
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
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
	background-color: blue;
	font-size: 14px;
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
<script type="text/javascript">
	function maskUserId(userId) {
		if (userId && userId.length > 2) {
			return userId.substring(0, 1) + "***"
					+ userId.substring(userId.length - 2);
		}
		return userId;
	}
</script>
<body>
	<div>
		<h2>주문 정보보기</h2>
		<hr>
		<p>
			[<a href="/order_list">목록으로 이동]</a>
		</p>
		<form method="post">
			<table>
				<tr>
					<td>주문 id</td>
					<td>${movo.orders_idx }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><script>
						document.write(maskUserId('${movo.user_idx}'));
					</script></td>
				</tr>
				<tr>
					<td>제품 id</td>
					<td>${movo.product_idx }</td>
				</tr>
				<tr>
					<td>배송지 주소</td>
					<td>${movo.country }&nbsp;${movo.city }&nbsp;${movo.state }</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>${movo.postal_code }</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>${movo.address_line }</td>
				</tr>				
				<tr>
					<td>주문 금액</td>
					<td>${movo.total_amount }</td>
				</tr>
				<tr>
					<td>결제 상태</td>
				<td>
					<c:choose>
						<c:when test="${movo.status == '대기'}">
							<span style="color: red;">${movo.status}</span>
						</c:when>
						<c:when test="${movo.status == '발송'}">
							<span style="color: blue;">${movo.status}</span>
						</c:when>
						<c:otherwise>
							<span style="color: black;">${movo.status}</span>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td>주문 일자</td>
					<td>${movo.order_date }</td>
				</tr>
				<tr>
					<td>주문 메모</td>
					<td>${movo.notes }</td>
				</tr>

				<tfoot>
					<tr align="center">
						<td colspan="2">
						<input type="hidden" name="orders_idx" value="${movo.orders_idx }"> 
						<input type="button" value="삭제" onclick="delete_ok(this.form)">
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function delete_ok(f) {
			if (confirm("정말 삭제할까요? 삭제하면 되돌릴 수 없습니다.")) {
				f.action = "/order_delete_ok";
				f.submit();

			} else {
				alert("삭제가 취소되었습니다.")
			}
		}
	</script>
</body>
</html>















