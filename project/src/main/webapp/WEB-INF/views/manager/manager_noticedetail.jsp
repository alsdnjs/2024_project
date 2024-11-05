<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
	#manager table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#manager table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#manager table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#manager table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>

</head>
<body>
	<div id="manager">
	<form method="post">
		<table summary="게시판 상세보기">
			<caption>공지사항 상세보기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${nvo.subject }</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${nvo.writer }</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>${nvo.content }</td>
				</tr>
			
				<tr>
					<td colspan="2">
					    <input type="hidden" name="n_idx" value="${nvo.n_idx}">
					    <input type="hidden" name="cPage" value="${cPage}">
						<input type="button" value="수정" onclick="adminnotice_update(this.form)">
						<input type="button" value="삭제" onclick="adminnotice_delete(this.form)">
						<a href="/adminnotice_list" onclick="adminnotice_list(this.form)" class="btn">목록</a>
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

