<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.popup {
    overflow: hidden;
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 12px;
    transform: translate(-50%, -50%);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.popup .content {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 300px;
    height: 200px;
}

.popup .btn_wrap {
    display: flex;
    align-items: center;
    padding: 15px;
    background: #000;
}

.popup .btn_wrap label {
    font-size: 14px;
    color: #fff;
}

.popup .btn_wrap .today_chk {
    margin-right: 5px;
}

.popup .btn_wrap .close {
    margin-left: auto;
    font-size: 14px;
    color: #fff;
    text-decoration: none;
}

</style>




<body>


<div class="popup">
    <div class="content">팝업 콘텐츠</div>
    <div class="btn_wrap">
        <label><input type="checkbox" class="today_chk">오늘 하루 보지 않기</label>
        <a href="/manager_list" class="close">닫기</a>
    </div>
</div>


	<script type="text/javascript">
	const $popup = $('.popup');
	const hour = 24; // 24시간 동안 팝업 숨기기

	// 닫기 버튼 클릭 시 팝업 숨기기와 쿠키 설정
	$popup.on('click', '.close', function(e) {
	    e.preventDefault();
	    const hidePopup = $('.today_chk').prop('checked'); // 팝업을 숨길지 여부
	    if (hidePopup) {
	        const d = new Date();
	        d.setTime(d.getTime() + (hour * 60 * 60 * 1000));
	        const expires = `expires=${d.toUTCString()}`;
	        document.cookie = `hidePopup=true; ${expires}; path=/`; // 쿠키 설정
	    }
	    $popup.hide();
	});

	// 쿠키 확인하여 팝업을 보여줄지 결정
	if (document.cookie.indexOf('hidePopup=true') >= 0) {
	    $popup.hide(); // 팝업 숨기기
	} else {
	    $popup.show(); // 쿠키가 없으면 팝업을 보여줌
	}
	</script>
</body>
</html>