<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 명 록 2</title>
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
select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	padding: 8px;
	padding-right : 20px;
	background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="gray" d="M2 5L0 0h4z"/></svg>');
	background-repeat: no-repeat;
	background-position: right 10px center;
	background-size: 6px;
	cursor: pointer;
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
		<h2>관리자 정보 입력하기 화면</h2>
		<hr>
		<p>
			[<a href="/manager_list">목록으로 이동]</a>
		</p>
		<form method="post" enctype="multipart/form-data"
			action="/manager_write_ok">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="manager_name" size="20" required></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="manager_id" size="20" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="manager_pw" size="20" required></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="manager_email" size="20"></td>
				</tr>
				<tr>
					<td>관리자 유형</td>
					<td><select name="manager_type" id="manager_type">
							<option value="common">일반 관리자</option>
							<option value="super">Super 관리자</option>
					</select></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="5"><input type="submit" value="저장" id="btn_join">
							<input type="reset" value="취소" onclick="cancel_write()">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function cancel_write() {
			window.location.href = "/manager_list";
		}
	</script>
</body>
</html>









