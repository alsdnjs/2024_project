<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정화면</title>
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
</head>
<script type="text/javascript">
    function maskUserId(userId) {
        if (userId && userId.length > 2) {
            return userId.substring(0, 1) + "***" + userId.substring(userId.length - 2);
        }
        return userId;
    }

    function maskUsername(username) {
        if (username && username.length >= 2) {
            return username.charAt(0) + "*" + username.substring(2);
        }
        return username;
    }

    function maskPhoneNumber(phoneNumber) {
        if (phoneNumber && phoneNumber.length > 3) {
            return phoneNumber.substring(0, 3) + "****" + phoneNumber.substring(7);
        }
        return phoneNumber;
    }

    function maskEmail(email) {
        if (email && email.includes("@")) {
            const parts = email.split("@");
            const localPart = parts[0];
            if (localPart.length > 3) {
                return localPart.substring(0, 3) + "***@" + parts[1];
            } else {
                return localPart + "***@" + parts[1];
            }
        }
        return email;
    }
</script>
<body>
	<div>
		<h2>회원 정보 수정</h2>
		<hr>
		<p>
			[<a href="/user_list">목록으로 이동]</a>
		</p>
		<form method="post" enctype="multipart/form-data"
			action="/user_update_ok">
			<table>
				<tr>
					<td>이름</td>
					<td><script>document.write(maskUsername('${uvo.username}'));</script></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><script>document.write(maskUserId('${uvo.user_id}'));</script></td>
				</tr>
				<tr>
					<td>회원 유형</td>
					<td>${uvo.user_role }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><script>document.write(maskPhoneNumber('${uvo.phone_number}'));</script></td>
				</tr>
				<tr>
					<td>회원 등급</td>
					<td><select name="userrank" id="userrank" required>
							<option value="FAMILY">FAMILY</option>
							<option value="SILVER">SILVER</option>
							<option value="GOLD">GOLD</option>
							<option value="VIP">VIP</option>
					</select></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><script>document.write(maskEmail('${uvo.email}'));</script></td>
				</tr>
				<tr>
					<td>기본 배송지 주소</td>
					<td><input type="text" name=basic_address size="20" value=${uvo.basic_address }></td>
				</tr>

				
				<tfoot>
					<tr align="center">
						<td colspan="5">
						<input type="submit" value="수정완료">
						<input type="button" value="취소" onclick="cancel_update()"></td>
						<input type="hidden" name="user_id" value="${uvo.user_id}" required>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function cancel_update() {
			window.location.href = "/user_detail?user_id=${uvo.user_id}";
		}
		
	</script>
</body>
</html>



