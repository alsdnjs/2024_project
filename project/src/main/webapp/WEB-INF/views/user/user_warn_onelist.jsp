<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 제지 페이지</title>
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
        return userId.substring(0, 1) + "***" + userId.substring(userId.length - 2);
    }
    return userId;
}
</script>
<body>
<div>
		<h2>제재된 회원 정보</h2>
		<hr>
		<p>
			[<a href="/user_list">목록으로 이동]</a>
		</p>
		<form method="post" enctype="multipart/form-data"
			action="/user_update_ok">
			<table>
				<tr>
					<td>회원 아이디</td>
					<td><script>document.write(maskUserId('${uvo.user_id}'));</script></td>
				</tr>
				<tr>
					<td>제재 담당 관리자</td>
					<td>${uvo.warned_user }</td>
				</tr>
				<tr>
					<td>제재 사유</td>
					<td colspan="2">
						${uvo.warn_cause }
					</td>
				</tr>
				<tr>
					<td>제재 시작 날짜</td>
					<td>${uvo.warn_start_at }</td>
				</tr>
				<tr>
					<td>제제 종료 날짜</td>
					<td>${uvo.warn_end_at }</td>
				</tr>
				
				<tfoot>
					<tr align="center">
						<td colspan="5">
						<input type="button" value="취소" onclick="cancel_warn()"></td>
						<input type="hidden" name="user_id" value="${uvo.user_id}">
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function cancel_warn() {
			window.location.href = "/user_detail?user_id=${uvo.user_id}";
		}
		
		
	</script>
</body>
</html>