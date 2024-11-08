<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 상품 등록하기 화면</title>
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
</style>

</head>
<body>
	<div>
		<h2>상품 등록 화면</h2>
		<hr>
		<p>
			[<a href="/product_list">목록으로 이동]</a>
		</p>
		<form method="post" enctype="multipart/form-data"
			action="/product_write_ok">
			<table>
				<tr>
					<td>제품 번호</td>
					<td><input type="number" name="product_idx" size="20" required
						oninput="limitInput(this)" onblur="checkProductId()"></td>
				</tr>
				<tr>
					<td>제품 이름</td>
					<td><input type="text" name="product_name" size="20" required></td>
				</tr>
				<tr>
					<td>판매자 id</td>
					<td><input type="hidden" name="sellers_idx" value="1">1</td>
				</tr>
				<tr>
					<td>판매 업체</td>
					<td>경빈이네</td>
				</tr>
				<tr>
					<td>상품 설명</td>
					<td colspan="2"><textarea rows="10" cols="60"
							name="description"></textarea></td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><input type="number" name="price" size="20" required></td>
				</tr>
				<tr>
					<td>상품 재고</td>
					<td><input type="number" name="stock" size="20" required></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><select name="category_id" required>
							<option value="4">돼지고기</option>
							<option value="3">소고기</option>
							<option value="2">양고기</option>
							<option value="1">가공육</option>
					</select></td>
				</tr>
				<tr>
					<td>판매 상태</td>
					<td><select name="is_active" required>
							<option value="1">판매</option>
							<option value="0">비판매</option>
					</select></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="File_name"></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="5"><input type="submit" value="저장" id="btn_join">
							<input type="reset" value="취소" onclick="cancel_write()">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function cancel_write() {
			window.location.href = "/product_list";
		}

		function limitInput(input) {
			if (input.value.length > 9) {
				input.value = input.value.slice(0, 9); // 9자리를 초과하면 잘라냄
			}
		}

		function checkProductId() {
			var product_idx = document.querySelector('input[name="product_idx"]').value;
			if (product_idx) {
				$.ajax({
					url : '/check_product_idx', // 중복 체크를 위한 서버 URL
					type : 'POST',
					data : {
						product_idx : product_idx
					},
					success : function(response) {
						if (response.exists) {
							alert('제품 번호가 이미 존재합니다. 다른 번호를 입력해주세요.');
						} else {
							alert('제품 번호가 사용 가능합니다.');
						}
					},
					error : function() {
						alert('중복 체크에 실패했습니다. 다시 시도해주세요.');
					}
				});
			}
		}
	</script>
</body>
</html>









