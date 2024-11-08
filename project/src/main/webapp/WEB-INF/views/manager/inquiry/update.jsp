<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<div>
		<h2>문의 상세보기</h2>
		<hr>
		<p>
			[<a href="/inquiry_list">목록으로 이동]</a>
		</p>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>제목:</td>
						<td>${mivo.subject }</td>
					</tr>
					<tr>
						<td>아이디:</td>
						<td>${mivo.user_id }</td>
					</tr>
					<tr>
						<td>카테고리:</td>
						<td>${mivo.category }</td>
					</tr>
					<tr>
						<td>이메일:</td>
						<td>${mivo.email }</td>
					</tr>
					<tr>
						<td>내용:</td>
						<td>${mivo.content }</td>
					</tr>
					<tr>
						<td>첨부파일:</td>
						<c:choose>
							<c:when test="${empty mivo.f_name}">
								<td><b>첨부파일없음</b></td>
							</c:when>
							<c:otherwise>
								<td><a href="/inquiry_down?f_name=${mivo.f_name }"> <img
										src="resources/upload/${mivo.f_name}" style="width: 80px"></a><br>${mivo.f_name}</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>답변:</td>
						<td><input type="text" name=answer size="20" value=${miavo.answer }></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="u_idx" value="${mivo.u_idx}"> 
							<input type="button" value="저장" onclick="inquiry_update_ok(this.form)"> 
							<input type="button" value="취소" onclick="cancel_update('${mivo.u_idx}')"> 
							<input type="hidden" name="admin_id" value="${sessionScope.manager_id}">
							</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>


	<script type="text/javascript">
		function inquiry_update_ok(f) {
			f.action="/inquiry_update_ok";
			f.submit();
		}
		function cancel_update(u_idx) {
				window.location.href = "/inquiry_detail?u_idx=" + u_idx;
			
		}
	</script>

</body>
</html>

