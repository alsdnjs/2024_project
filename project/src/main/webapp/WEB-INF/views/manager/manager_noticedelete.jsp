<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
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

<script type="text/javascript">
	 <c:if test="${pwdchk == 'fail'}">
	 	alert("비밀번호 틀림");
	 </c:if>
</script>

</head>
<body>
	<div id="bbs">
	<form method="post">
		<table summary="공지사항 삭제">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th style="width: 40%">비밀번호확인 : </th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="n_idx" value="${n_idx}">
						<input type="hidden" name="cPage" value="${cPage}">
						<input type="button" value="삭제" onclick="adminnotice_delete_ok(this.form)">
						<a href="/adminnotice_list" onclick="adminnotice_list(this.form)" class="btn">목록</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script type="text/javascript">
		function adminnotice_delete_ok(f) {
			f.action="/adminnotice_delete_ok";
			f.submit();
			
		}
		function adminnotice_list(f) {
			f.action = "/adminnotice_list";
			f.submit();
		}
	</script>
	
</body>
</html>

























