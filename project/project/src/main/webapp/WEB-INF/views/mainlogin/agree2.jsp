<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 약관 동의</title>
    <!-- 글꼴 -->
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+And+White+Picture&family=East+Sea+Dokdo&family=Gaegu&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Single Day", cursive !important; /* 위에서 사용한 글꼴 적용 */
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 900px; /* 기존 800px에서 900px로 확장 */
            background-color: white;
            padding: 50px; /* 기존 40px에서 50px로 확장 */
            border-radius: 10px; /* 기존 8px에서 10px로 확장 */
            box-shadow: 0 5px 8px rgba(0, 0, 0, 0.15); /* 그림자 확장 */
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .left-section {
            width: 45%; /* 기존 40%에서 45%로 확장 */
        }

        .right-section {
            width: 60%; /* 기존 55%에서 60%로 확장 */
            background-color: #f5f5f5;
            padding: 30px; /* 기존 20px에서 30px으로 확장 */
            border-radius: 10px; /* 기존 8px에서 10px으로 확장 */
        }

        h2 {
            font-size: 24px; /* 기존 20px에서 24px로 확장 */
            margin-bottom: 15px; /* 기존 10px에서 15px로 확장 */
        }

        .highlight {
            color: red;
        }

        .agreement-box {
            margin-top: 25px; /* 기존 20px에서 25px로 확장 */
        }

        .agreement-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px; /* 기존 10px에서 15px로 확장 */
        }

        .optional {
            font-size: 14px; /* 기존 12px에서 14px로 확장 */
            color: gray;
        }

        .agreement-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .agreement-list li {
            margin-bottom: 15px; /* 기존 10px에서 15px로 확장 */
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .agreement-list li input {
            margin-right: 10px; /* 기존 8px에서 10px로 확장 */
        }

        .icon {
            cursor: pointer;
            color: gray;
        }

        .contact-options {
            margin-top: 15px; /* 기존 10px에서 15px로 확장 */
            display: flex;
        }

        .contact-options label {
            margin-right: 25px; /* 기존 20px에서 25px로 확장 */
        }

        .notice {
            font-size: 14px; /* 기존 12px에서 14px로 확장 */
            color: gray;
            margin-top: 25px; /* 기존 20px에서 25px로 확장 */
            line-height: 1.5; /* 기존 1.4에서 1.5로 확장 */
        }

        .next-button {
            display: block;
            width: 100%;
            text-align: center;
            padding: 16px; /* 기존 13px에서 16px로 확장 */
            background-color: #ff4d4d;
            border: none;
            border-radius: 8px; /* 기존 5px에서 8px로 확장 */
            color: white;
            font-size: 16px; /* 기존 14px에서 16px로 확장 */
            cursor: pointer;
            margin: 25px auto 0; /* 기존 20px에서 25px로 확장 */
            text-decoration: none;
        }

        .next-button.disabled {
            background-color: #e0e0e0;
            cursor: not-allowed;
            pointer-events: none;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 25px; /* 기존 20px에서 25px로 확장 */
            border-radius: 10px; /* 기존 8px에서 10px으로 확장 */
            width: 350px; /* 기존 300px에서 350px로 확장 */
            text-align: center;
        }

        .close-button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 8px; /* 기존 5px에서 8px로 확장 */
            padding: 12px 25px; /* 기존 10px에서 12px로 확장 */
            cursor: pointer;
            margin-top: 15px; /* 기존 10px에서 15px로 확장 */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <h2>개인 회원가입</h2>
            <p>
                <span class="highlight">이용약관</span>을 확인하신 후 동의해 주세요
            </p>
        </div>
        <div class="right-section">
            <div class="agreement-box">
                <div class="agreement-header">
                    <input type="checkbox" id="allAgree"> <label for="allAgree">모두 동의</label> <span class="optional">*선택 정보 포함</span>
                </div>
                <ul class="agreement-list">
                    <li>
                        <div>
                            <input type="checkbox" class="required"> (필수) 만 14세 이상입니다.
                        </div> <span class="icon" data-modal="modal1">></span>
                    </li>
                    <li>
                        <div>
                            <input type="checkbox" class="required"> (필수) 이용약관 동의
                        </div> <span class="icon" data-modal="modal2">></span>
                    </li>
                    <li>
                        <div>
                            <input type="checkbox" class="required"> (필수) 개인정보 수집 및 이용 동의
                        </div> <span class="icon" data-modal="modal3">></span>
                    </li>
                    <li>
                        <div>
                            <input type="checkbox" class="optional-checkbox"> (선택) 개인정보 수집 및 이용 동의
                        </div> <span class="icon" data-modal="modal4">></span>
                    </li>
                    <li>
                        <div>
                            <input type="checkbox" class="optional-checkbox"> (선택) 광고성 정보 수신 동의
                        </div> <span class="icon" data-modal="modal5">></span>
                    </li>
                </ul>
                <div class="contact-options">
                    <label><input type="checkbox" class="optional-checkbox"> 문자</label> 
                    <label><input type="checkbox" class="optional-checkbox"> 이메일</label>
                </div>
                <p class="notice">
                    * 고객은 이용약관 관련 항목에 대한 동의를 거부할 권리가 있으며, 동의를 거부할 경우 사이트 가입 또는 일부 서비스 이용이 제한됩니다. <br> * 구매정보, 배송 안내, 주요 정책 안내는 광고성 정보 수신 동의와는 관계없이 발송해 드립니다.
                </p>
            </div>
            <a href="/join" class="next-button disabled" id="nextButton">다음 단계로</a>
        </div>
    </div>

    <div class="modal" id="myModal">
        <div class="modal-content">
            <p id="modalText">모달 내용입니다. 다른 내용을 여기에 넣을 수 있습니다.</p>
            <button class="close-button" id="closeButton">닫기</button>
        </div>
    </div>

    <script>
        const allAgreeCheckbox = document.getElementById('allAgree');
        const requiredCheckboxes = document.querySelectorAll('.required');
        const allCheckboxes = document.querySelectorAll('.required, .optional-checkbox');
        const nextButton = document.getElementById('nextButton');
        const modal = document.getElementById('myModal');
        const closeButton = document.getElementById('closeButton');
        const modalText = document.getElementById('modalText');
        const icons = document.querySelectorAll('.icon');

        function updateButtonState() {
            const allRequiredChecked = Array.from(requiredCheckboxes).every(checkbox => checkbox.checked);
            const allChecked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
            allAgreeCheckbox.checked = allChecked;
            nextButton.classList.toggle('disabled', !allRequiredChecked);
        }

        allAgreeCheckbox.addEventListener('change', () => {
            const isChecked = allAgreeCheckbox.checked;
            allCheckboxes.forEach(checkbox => checkbox.checked = isChecked);
            updateButtonState();
        });

        allCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                updateButtonState();
            });
        });

        icons.forEach(icon => {
            icon.addEventListener('click', () => {
                const modalId = icon.getAttribute('data-modal');
                let content = '';
                switch (modalId) {
                    case 'modal1':
                        content = '만 14세 이상 확인에 대한 설명입니다.';
                        break;
                    case 'modal2':
                        content = '이용약관 동의에 대한 설명입니다.';
                        break;
                    case 'modal3':
                        content = '개인정보 수집 및 이용 동의에 대한 설명입니다.';
                        break;
                    case 'modal4':
                        content = '선택 개인정보 수집 및 이용 동의에 대한 설명입니다.';
                        break;
                    case 'modal5':
                        content = '광고성 정보 수신 동의에 대한 설명입니다.';
                        break;
                }
                modalText.textContent = content;
                modal.style.display = 'flex';
            });
        });

        closeButton.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        updateButtonState();
    </script>

</body>
</html>
