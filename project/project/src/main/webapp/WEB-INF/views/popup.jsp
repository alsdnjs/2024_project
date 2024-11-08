<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팝업</title>
    <style>
  #popup-container {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 20%;
    left: 20%;
    transform: translate(-50%, -50%);
    width: 500px; /* 팝업 넓이 확대 */
    padding: 30px; /* 여백 확대 */
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
    z-index: 1000;
    font-size: 1.2em; /* 텍스트 크기 확대 */
}

#popup-container img {
    width: 100%; /* 이미지가 팝업 넓이에 맞게 표시 */
    max-height: 300px; /* 이미지 높이 확대 */
    margin-bottom: 15px;
}

#popup-container button {
    padding: 10px 20px;
    font-size: 0.8em;
   border-radius: 10px; /* 버튼의 모서리를 둥글게 */
}

    </style>
</head>
<body>

<div id="popup-overlay"></div>
<div id="popup-container">
  <p>
    <img src="${pageContext.request.contextPath}/resources/images/aa.png" alt="팝업 이미지" style="width:auto; max-height:200px;">
       안전 배송 해드립니다
        </p>
    <button onclick="disablePopup()">오늘 하루 보지 않기</button>
    <button onclick="closePopup()">닫기</button>
</div>

<script>
    // 팝업 쿠키 여부 확인 후 표시
    window.onload = function () {
        fetch('/popup/allowed')
            .then(response => response.json())
            .then(isAllowed => {
                if (isAllowed) {
                    document.getElementById("popup-overlay").style.display = "block";
                    document.getElementById("popup-container").style.display = "block";
                }
            });
    };

    // 오늘 하루 보지 않기 클릭 시
    function disablePopup() {
        fetch('/popup/disable', { method: 'POST' })
            .then(() => closePopup());
    }

    // 팝업 닫기
    function closePopup() {
        document.getElementById("popup-overlay").style.display = "none";
        document.getElementById("popup-container").style.display = "none";
    }
</script>

</body>
</html>
