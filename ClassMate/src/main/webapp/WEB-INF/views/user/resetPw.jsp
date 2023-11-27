<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
function togglePasswordVisibility(inputId, iconId) {
    // 비밀번호 가리기/보이기 토글 로직
    var passwordInput = document.getElementById(inputId);
    var togglePasswordButton = document.getElementById(iconId);

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        togglePasswordButton.src = '/resources/img/open_eye.png'; // 열린 눈 모양 이미지의 경로로 대체하세요
    } else {
        passwordInput.type = 'password';
        togglePasswordButton.src = '/resources/img/close_eye.png'; // 닫힌 눈 모양 이미지의 경로로 대체하세요
    }
}

// //함수 호출을 폼 제출 이벤트에 바인딩
// $(document).ready(function () {
//     $('#resetPwForm').submit(function (event) {
//         event.preventDefault(); // 기본 제출 동작 방지
//         checkPasswordMatch();
//     });
// });

// function checkPasswordMatch() {
//     var password = document.getElementById('userPw').value;
//     var confirmPassword = document.getElementById('userPwChk').value;

//     if (password !== confirmPassword) {
//         alert('비밀번호가 일치하지 않습니다.');
//         return false;
//     }

//     // 서버로 비밀번호 확인 요청
//    $.ajax({
//         type: 'POST',
//         url: '/user/resetPw',
//         contentType: 'application/json',  // 데이터 전송 형식 설정
//         dataType: 'json',  // 데이터 수신 형식 설정
//         data: JSON.stringify({
//             userPw: password
//         }),
//         success: function (data) {
//             if (data.success) {
//                 // 서버에서 비밀번호 확인 성공 시 처리
//                 alert('비밀번호 재설정이 완료되었습니다.');
//                 window.location.href = '/user/updatePw';
//             } else {
//                 // 서버에서 비밀번호 확인 실패 시 처리
//                 alert('비밀번호 확인에 실패했습니다.');
//             }
//         },
//         error: function () {
//             // 통신 오류 시 처리
//             alert('서버와의 통신 중 오류가 발생했습니다.');
//         }
//     });

//     return false; // 기존의 동작 방지
// }
</script>

<style>

.resetPw {
    text-align: center;
    border: 1px solid #ccc;
    width: 600px;
    height: 400px;
    margin: 145px auto 145px auto;
}

.resetPw2 {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    line-height: 3;
}

#confirmButton {
    margin-top: 40px;
    background-color: #F1C40F;
    font-size: 17px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2em;
    border: none;
    border-radius: 4px;
    width: 100px;
}

input {
    border: 1px solid #ccc;
    height: 40px;
    width: 250px;
    margin: 0 -6px;
    border-radius: 3px;
    padding-right: 30px; /* 오른쪽 여백을 주어 이미지가 겹치지 않도록 함 */
}

.eyeIcon {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}
</style>

<div class="resetPw">
    <h1 style="margin-top: 70px;">비밀번호 확인</h1>
    <h3 style="color: #333; margin-bottom: 16px; font-size: 17px;">비밀번호를 재설정합니다</h3>

    <div class="resetPw2">
    <form id="resetPwForm" method="post" action="/user/resetPw">
    	<input type="hidden" name="userId" value="${userInfo.userId }">
        <div style="position: relative;">
            <label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white; padding: 9px 21px; vertical-align: middle;">비밀번호</label>
            <input type="password" id="userPw" name="userPw">
            <img src="/resources/img/close_eye.png" class="eyeIcon" id="togglePassword"
                onclick="togglePasswordVisibility('userPw', 'togglePassword')">
        </div>

        <div style="position: relative;">
            <label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white; padding: 9px 5px; vertical-align: middle;">비밀번호확인</label>
            <input type="password" id="userPwChk" name="userPwChk">
            <img src="/resources/img/close_eye.png" class="eyeIcon" id="togglePasswordChk"
                onclick="togglePasswordVisibility('userPwChk', 'togglePasswordChk')">
        </div>

        <button id="confirmButton" type="submit">확인</button>
	</form>
    </div><!-- .resetPw2 -->
</div><!-- .resetPw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
