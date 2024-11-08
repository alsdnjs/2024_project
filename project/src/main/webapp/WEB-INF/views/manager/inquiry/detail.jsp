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
										src="resources/upload/${mivo.f_name}" style="width: 200px"></a></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>답변:</td>
						<td><c:choose>
								<c:when test="${empty answer}">
									<b>아직 답변을 하지 않으셨습니다.</b>
								</c:when>
								<c:otherwise>
  					              ${answer}
					            </c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="u_idx" value="${mivo.u_idx}"> 
							<input type="button" value="삭제" onclick="inquiry_delete(this.form)"> 
							<input type="button" value="취소" onclick="inquiry_list(this.form)"> 
							<input type="hidden" name="admin_id" value="${sessionScope.manager_id}">
							<c:choose>
								<c:when test="${answer == null}">
									<input type="button" value="답변하기"
										onclick="location.href='/inquiry_answer?u_idx=${mivo.u_idx}'">
								</c:when>
								<c:otherwise>
									<input type="button" value="답변수정"
										onclick="inquiry_update(this.form)">
								</c:otherwise>
							</c:choose></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>


	<script type="text/javascript">
		function inquiry_delete(f) {
			if (confirm("정말 삭제할까요?")) {
			f.action = "/inquiry_delete_ok";
			f.submit();
				
			} else {
				alert("취소되었습니다");
			}
		}
		function inquiry_list(f) {
			f.action = "/inquiry_list";
			f.submit();
		}
		function inquiry_update(f) {
			f.action = "/inquiry_update";
			f.submit();
		}
	</script>

</body>
</html>

