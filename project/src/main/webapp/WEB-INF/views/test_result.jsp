<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width: 800px; border-collapse: collapse;}
	table, th, td { border: 1px solid red; text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	
	<button id="btn4">듀걔재..</button>
	
	
	<hr>
	<div id="result"></div>
	
	<script type="text/javascript">
		
		$("#btn4").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/project_test",        // 서버주소   
				method : "post",        // 전달방식 
				dataType:"xml",         // 가져오는 결과 데이터 타입    
			   success : function(data) {
				 console.log(data);
				 let table = "<table>"
				 table += "<thead><tr><td>가격</td><td>재고</td><td>생성날짜</td><td>품종</td></tr></thead>"
				 table += "<tbody>";
				 $(data).find("item").each(function() {
					table += "<tr>";
					table += "<td>" +$(this).find("CCityAmt").text() + "</td>";
					table += "<td>" +$(this).find("CCityCnt").text() + "</td>";
					table += "<td>" +$(this).find("startYmd").text() + "</td>";
					table += "<td>" +$(this).find("judgeBreedCd").text() + "</td>";
					
					table += "</tr>";
				});
				 table += "</tbody>";
				 table += "</table>";
				 $("#result").append(table);
			   },
			   error:function() {
				 alert("읽기실패")
			   }
			});
		});
		
	</script>
</body>
</html>