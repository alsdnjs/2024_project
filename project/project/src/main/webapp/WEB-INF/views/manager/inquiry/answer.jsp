<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	<div>
		<h2>문의 답변</h2>
		<hr>
		<p>
			[<a href="/inquiry_list">목록으로 이동]</a>
		</p>
		<form method="post" encType="multipart/form-data">
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
						<td><textarea name="answer" id="answer" cols="50" rows="8">
					</textarea></td>
					</tr>

					<tr>
						<td colspan="2"><input type="button" value="보내기"
							onclick="inquiry_answer_ok(this.form)"> <input
							type="button" value="취소" onclick="cancel_answer('${mivo.u_idx}')">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="u_idx" value="${mivo.u_idx}">
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , jQuery가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data : frm,
				method : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					console.log(path, fname);
					$("#content").summernote("editor.insertImage",
							path + "/" + fname);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
	</script>
	<script type="text/javascript">
		function inquiry_answer_ok(f) {
			const u_idx = document.getElementById("u_idx").value; // hidden 필드에서 u_idx 값을 가져옵니다.
			f.action = "/inquiry_answer_ok?u_idx=" + u_idx;
			f.submit();
		}
		function cancel_answer(u_idx) {
			window.location.href = "/inquiry_detail?u_idx=" + u_idx;
		}
	</script>

</body>
</html>

