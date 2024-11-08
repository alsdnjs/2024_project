<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정화면</title>
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

<script type="text/javascript">
	<c:if test="${pwdchk == 'fail'}">
	alert("비밀번호 틀림");
	</c:if>
</script>

</head>
<body>
	<div>
		<h2>공지사항 수정</h2>
		<hr>
		<p>
			[<a href="/adminnotice_list">목록으로 이동</a>]
		</p>

		<form method="post" encType="multipart/form-data"
			action="/adminnotice_update_ok">
			<table>
				<tbody>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" size="45"
							value="${nvo.subject}"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size="12"
							value="<%=session.getAttribute("manager_id")%>" size="12"
							disabled></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" cols="50" rows="8">${nvo.content}</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<c:choose>
							<c:when test="${empty nvo.f_name}">
								<td><input type="file" name="file_name"><b>이전
										파일 없음</b> <input type="hidden" name="old_f_name" value="">
								</td>
							</c:when>
							<c:otherwise>
								<td><input type="file" name="file_name"><b>이전
										파일 있음<br>(nvo.f_name)
								</b> <input type="hidden" name="old_f_name" value="${nvo.f_name }">
								</td>
							</c:otherwise>
						</c:choose>

					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd" size="12"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" name="n_idx"
							value="${nvo.n_idx}"> <input type="submit" value="수정완료">
							<input type="button" value="취소" onclick="cancel_update()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		function cancel_update() {
			window.location.href = "/adminnotice_detail?n_idx=${nvo.n_idx}";
		}
		
		function adminnotice_update_ok(f) {
			f.action = "/adminnotice_update_ok";
			f.submit();
		}
		function adminnotice_list(f) {
			f.action = "/adminnotice_list";
			f.submit();
		}
	</script>

</body>
</html>

