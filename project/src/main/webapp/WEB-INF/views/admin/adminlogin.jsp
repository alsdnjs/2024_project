<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여기는 로그인 화면</title>
<script type="text/javascript">
	<c:if test="${loginchk == '0'}">
		alert("로그인 실패");
	</c:if>
</script>
<style type="text/css">
/* 공통 스타일 */
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

h4 {
	text-align: center;
	margin: 0 0 20px 0; /* 위쪽 여백 제거, 아래쪽 여백 추가 */
	font-weight: normal;
	color: #333;
}

.login-container {
	width: 350px;
	padding: 20px;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

table {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: center;
}

input[type="text"], input[type="password"], select {
	width: 90%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: red;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
}

.links {
	text-align: center;
	margin: 15px 0;
}

.links a {
	color: #888;
	text-decoration: none;
}

.links a:hover {
	text-decoration: underline;
}

</style>
</head>
<body>
	<div class="login-container">
	<h4>관리자 로그인 화면</h4>
		<form method="post" action="/login">
			<table>
				<tbody>
					<tr>
						<td><input type="text" name="manager_id" id="manager_id" placeholder="아이디"> </td>
					</tr>
					<tr>
						<td><input type="password" name="manager_pw" id="manager_pw" placeholder="패스워드"></td>
					</tr>
					<tr>
						<td colspan="2">
							<select name="manager_type" id="manager_type">
								<option value="common">일반 관리자</option>
								<option value="super">Super 관리자</option>
							</select>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><input type="submit" value="로그인"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>
