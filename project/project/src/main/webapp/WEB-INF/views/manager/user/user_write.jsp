<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 명 록 2</title>
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

#check_user_id_btn {
	background-color: transparent; /* 배경색 투명 */
	color: grey; /* 글자 색 */
	border: 1px solid lightgrey; /* 테두리 색과 두께 */
	padding: 3px 8px; /* 패딩 조정하여 크기 줄임 */
	font-size: 12px; /* 폰트 크기 조정 */
	border-radius: 4px; /* 모서리 둥글게 */
	cursor: pointer; /* 커서 변경 */
	transition: background-color 0.3s, color 0.3s;
}

#check_user_id_btn:hover {
	background-color: lightgrey;
	color: white; /* 글자 색 변경 */
}
</style>

</head>
<script type="text/javascript">
//페이지 로드 시 에러 메시지가 존재하면 출력
 window.onload = function() {
            var errorMessage = '<%= (String) request.getSession().getAttribute("errorMessage") != null ? request.getSession().getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                alert(errorMessage);
                <%
                    request.getSession().removeAttribute("errorMessage"); // 세션에서 에러 메시지 제거
                %>
            }
        };
</script>
<body>
	<div>
		<h2>회원 정보 입력하기 화면</h2>
		<hr>
		<p>
			[<a href="/user_list">목록으로 이동]</a>
		</p>
		<form method="post" enctype="multipart/form-data"
			action="/user_write_ok">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username" size="20" required></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="user_id" id="user_id" size="20"
						required> <input type="button" value="중복 검사"
						id="check_user_id_btn" onclick="checkUserId()"> <span
						id="id_check_result"></span></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="text" name="password" size="20" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone_number" size="20" required></td>
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
					<td><input type="text" name="email" size="20"></td>
				</tr>
				<tr>
					<td>기본 배송지주소</td>
					<td><input type="text" name="basic_address" size="20"></td>
				</tr>
				<tr>
					<td>회원 유형</td>
					<td><select name="user_role" id="user_role" required>
							<option value="일반 구매자">일반 구매자</option>
							<option value="판매자">판매자</option>
					</select></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="5"><input type="submit" value="저장" id="btn_join">
							<input type="hidden" name="isChecked" id="isChecked"
							value="false"> <input type="reset" value="취소"
							onclick="cancel_write()"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function cancel_write() {
			window.location.href = "/user_list";
		}
		
		let isIdChecked = false; // 중복 검사 여부

		function checkUserId() {
		    const user_id = document.getElementById("user_id").value;
		    if (!user_id) {
		        alert("아이디를 입력해주세요.");
		        return;
		    }

		    fetch(`/check_user_id`, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded',
		        },
		        body: new URLSearchParams({ user_id })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.exists) {
		            document.getElementById("id_check_result").innerText = "사용할 수 없는 아이디입니다.";
		            isIdChecked = false; // 중복
		        } else {
		            document.getElementById("id_check_result").innerText = "사용 가능한 아이디입니다.";
		            isIdChecked = true; // 사용 가능
		        }
		    });
		}
	</script>
</body>
</html>









