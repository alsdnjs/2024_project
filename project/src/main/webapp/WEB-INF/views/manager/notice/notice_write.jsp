<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 공지사항 등록 페이지</title>
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
	padding-right: 20px;
	background-image:
		url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="gray" d="M2 5L0 0h4z"/></svg>');
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
	<div id="notice">
			<h2>공지사항 등록</h2>
			<hr>
			<p>
				[<a href="/adminnotice_list">목록으로 이동</a>]
			</p>
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<tbody>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" size="45"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="<%= session.getAttribute("manager_id") %>" size="12" disabled></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" cols="50" rows="8"></textarea></td>
				</tr>
			
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" size="12"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file_name"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="보내기" onclick="adminnotice_write_ok(this.form)">
						<input type="reset" value="취소" onclick="cancel_write()">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>

	<script type="text/javascript">
		function adminnotice_write_ok(f) {
			f.action = "/adminnotice_write_ok";
			f.submit();
		}
		function cancel_write() {
			window.location.href = "/adminnotice_list";
		}

	</script>
	
</body>
</html>

