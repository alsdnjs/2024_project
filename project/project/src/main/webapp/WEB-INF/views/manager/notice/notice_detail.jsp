<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h2>공지사항 정보보기</h2>
	<hr>
	<p>
		[<a href="/adminnotice_list">목록으로 이동</a>]
	</p>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<td>제목</td>
					<td>${nvo.subject }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${nvo.writer }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${nvo.content }</td>
				</tr>
				<tr>
					<td>첨부파일:</td>
						<c:choose>
							<c:when test="${empty nvo.f_name}">
								<td><b>첨부파일없음</b></td>
							</c:when>
							<c:otherwise>
								<td> <img src="resources/upload/${nvo.f_name}" style="width: 200px"></td>
							</c:otherwise>
						</c:choose>
				</tr>
			
				<tr>
					<td colspan="2">
					    <input type="hidden" name="n_idx" value="${nvo.n_idx}">
						<input type="button" value="수정" onclick="adminnotice_update(this.form)">
						<input type="button" value="삭제" onclick="adminnotice_delete(this.form)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	
	
	<script type="text/javascript">
		function adminnotice_update(f) {
			f.action = "/adminnotice_update";
			f.submit();
		}
		function adminnotice_delete(f) {
			f.action = "/adminnotice_delete";
			f.submit();	
		}
		function adminnotice_list(f) {
			f.action = "/adminnotice_list";
			f.submit();
		}
	</script>
	
</body>
</html>

