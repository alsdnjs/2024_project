<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 정보 하나 보기 화면 </title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">>
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

    @media (max-width: 600px) {
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
		<h2>관리자 정보보기</h2>
		<hr>
		<p>[<a href="/manager_list">목록으로 이동]</a></p>
		<form method="post" >
			<table>
				<tr>
					<td>이름</td>
					<td>${gb2VO.manager_name }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${gb2VO.manager_id }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${gb2VO.manager_pw }</td>
				</tr>
				<tr>
					<td>type</td>
					<td>${gb2VO.manager_type }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${gb2VO.manager_email }</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="manager_id" value="${gb2VO.manager_id }">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function update_go(f) {
			f.action="/manager_update";
			f.submit();
		}
		function delete_go(f) {
			f.action="/manager_delete";
			f.submit();
		}
	</script>
</body>
</html>















