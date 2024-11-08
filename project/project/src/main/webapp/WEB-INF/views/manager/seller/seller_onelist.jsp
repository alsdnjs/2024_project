<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보 하나 보기 화면</title>
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
	word-wrap : break-word;
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
th:nth-child(1), td:nth-child(1) {
    width: 30%;
}

th:nth-child(2), td:nth-child(2) {
    width: 70%;
}
</style>

</head>
<script type="text/javascript">
	function maskSellerRepName(seller_rep_name) {
		if (seller_rep_name && seller_rep_name.length >= 2) {
			return seller_rep_name.charAt(0) + "*"
					+ seller_rep_name.substring(2);
		}
		return seller_rep_name;
	}
</script>
<body>
	<div>
		<h2>판매자 정보보기</h2>
		<hr>
		<p>
			[<a href="/seller_list">목록으로 이동]</a>
		</p>
		<form method="post">
			<table>
				<tr>
					<td>판매자 id</td>
					<td>${msvo.sellers_idx }</td>
				</tr>
				<tr>
					<td>상호명</td>
					<td>${msvo.store_name }</td>
				</tr>
				<tr>
					<td>업체 전화번호</td>
					<td>${msvo.contact_number }</td>
				</tr>
				<tr>
					<td>대표자 이름</td>
					<td><script>
						document
								.write(maskSellerRepName('${msvo.seller_rep_name}'));
					</script></td>
				</tr>
				<tr>
					<td>등록일자</td>
					<td>${msvo.create_at }</td>
				</tr>
				<tr>
					<td>업체 설명</td>
					<td>${msvo.store_description }</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2"><input type="hidden" name="sellers_idx"
							value="${msvo.sellers_idx }"> 
							 <input type="button" value="삭제" onclick="delete_ok(this.form)">
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	
		function delete_ok(f) {
			if (confirm("정말 삭제할까요? 판매자 정보를 삭제하면 관련 상품도 전부 삭제됩니다. 이 과정은 되돌릴 수 없습니다.")) {
				f.action = "/seller_delete_ok";
				f.submit();

			} else {
				alert("삭제가 취소되었습니다.")
			}
		}
	</script>
</body>
</html>















