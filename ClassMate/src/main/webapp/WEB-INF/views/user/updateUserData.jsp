<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

$(function(){
	$(document).on('click', "input[type='checkbox']", function(){
	    if(this.checked) {
	        const checkboxes = $("input[name='userGender']");
	        for(let ind = 0; ind < checkboxes.length; ind++){
	            checkboxes[ind].checked = false;
	        }
	        this.checked = true;
	    } else {
	        this.checked = false;
	    }
	});

});


function togglePasswordVisibility(inputId, iconId) {
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

//"탈퇴하시겠습니까?" 클릭 시 팝업창 표시
function showWithdrawalPopup() {
    var isWithdrawal = confirm("회원 탈퇴를 진행하시겠습니까?");
    if (isWithdrawal) {
        // 실제 탈퇴 처리를 위해 서버로 요청
        withdrawUser();
    }
}


//실제 탈퇴를 위한 AJAX 요청
function withdrawUser() {
 $.ajax({
     type: "POST",
     url: "/yourWithdrawalServlet", // 실제 탈퇴 처리를 위한 서블릿 URL로 변경
     data: {
         // 여기에 회원 정보나 탈퇴에 필요한 파라미터를 전달
     },
     success: function (response) {
         if (response === "success") {
             alert("탈퇴되었습니다.");
             // 탈퇴가 성공했을 때의 처리 (예: 로그아웃 등)
         } else {
             alert("탈퇴에 실패했습니다.");
             // 탈퇴가 실패했을 때의 처리
         }
     },
     error: function () {
         alert("서버 오류로 인해 탈퇴에 실패했습니다.");
     }
 });
}
</script>

<style type="text/css">
.defaultWidth {
	width: 100%;
}

.popup {
    display: none; /* 처음에는 숨김 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 2px solid #ccc;
    z-index: 1000; /* 다른 요소 위에 나타나도록 z-index 설정 */
}

.joinDiv {
	border: 1px solid #ccc;
	width: 900px;
	height: 1040px;
	margin: 120px auto;
	margin-bottom: 160px;
}

.decobox {
	width: 100%;
	height: 10px;
	background-color: rgb(255, 240, 177);
	margin-bottom: 45px;
}

.arrayDiv {
	margin: 0 auto;
	width: 600px;
    line-height: 3.7;
}

input {
    text-align: left;
    width: 470px;
    height: 40px;
    margin: 2px 0px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

label {
	display:inline-block;
	text-align:right;
	width:120px;
	font-weight:bold;
}

button {
	height: 25px;
}

#title {
	font-size: 40px;
	font-weight: bold;
    margin: 50px;
    line-height: 2.5;
}

</style>


<div class="defaultWidth">

	<div class="joinDiv">
		<div class="title">
		<span id="title">회원정보수정</span>
		<div class="decobox"></div>
		</div>
	
		<div class="arrayDiv">
		
			<label for="userId">아이디</label>
			<input type="text" id="userId" name="userId" style="width: 470px;">	
			
			<label for="userPw">비밀번호</label>
			<div style="position: relative; display: inline-block;">
			    <input type="password" id="userPw" name="userPw" placeholder="비밀번호 입력">
			    <img src="/resources/img/close_eye.png" id="togglePassword" onclick="togglePasswordVisibility('userPw', 'togglePassword')"
			    	 style="cursor: pointer; position: absolute; right: 5px; top: 50%; transform: translateY(-50%);">
			</div>
			<br>
			
			<label for="userPwChk">비밀번호 확인</label>
			<div style="position: relative; display: inline-block;">
			    <input type="password" id="userPwChk" name="userPwChk" placeholder="비밀번호 확인">
			    <img src="/resources/img/close_eye.png" id="togglePasswordChk" onclick="togglePasswordVisibility('userPwChk', 'togglePasswordChk')"
			    	 style="cursor: pointer; position: absolute; right: 5px; top: 50%; transform: translateY(-50%);">
			</div>
			<br>
			
			<label>성별</label>
			<input type="checkbox" id="cb1" value="man" name="userGender" style="cursor: pointer; width: 20px; vertical-align: middle;">
			<label for="cb1" style="text-align: left; width: 40px" >남성</label>
			<input type="checkbox" id="cb2" value="woman" name="userGender" style="cursor: pointer; width: 20px; vertical-align: middle;" >
			<label for="cb2" style="text-align: left; width: 40px" >여성</label><br>
				
			<label for="userBirthday">생년월일</label>
			<input type="text" id="userBirthday" name="userBirthday" placeholder="생년월일 8자리 (YYYYMMDD)"><br>
			
			<label for="userPhone">전화번호</label>
			<input type="text" id="userPhone" name="userPhone" placeholder="전화번호 입력"><br>
			
			<label for="userName">이름</label>
			<input type="text" id="userName" name="userName"><br>
			
			<label for="userEmail">이메일</label>
			<input type="email" id="userEmail" name="userEmail" style="width: 200px">
			<button style="background-color: rgb(158, 158, 158); color: rgb(255, 255, 255);
					border-radius: 4px; width: 73px; font-size: 16px; border: 1px solid #ccc; 
					margin-top: 6px; height: 30px; cursor: pointer;" >인증확인</button><br>
			
			<label for="postcode">주소</label>
			<input type="text" id="postcode" placeholder="우편번호" style="width: 200px; text-align: left;">
			<input type="button" onclick="execDaumPostcode()" value="우편번호"
				   style="background-color: rgb(158, 158, 158); color: rgb(255, 255, 255);
				   border-radius: 4px; width: 73px; font-size: 16px; 
				   margin-top: 6px; height: 30px; cursor: pointer; text-align: center;"><br>
			<label></label>
			<input type="text" id="address" placeholder="주소" style="text-align: left;"><br>
			<label></label>
			<input type="text" id="detailAddress" placeholder="상세주소" style="text-align: left;"><br>
			
			
			
			<div id="withdrawalPopup" class="popup">
		    <p>회원 탈퇴를 진행하시겠습니까?</p>
		    <button onclick="withdrawUser()">예</button>
		    <button onclick="closeWithdrawalPopup()">아니요</button>
			</div>
			<span style="color: red; text-decoration: underline; float: right; cursor: pointer;" onclick="showWithdrawalPopup();">탈퇴하시겠습니까?</span>
		
		<div class="Btn" style="text-align:center; margin-top: 80px;">
			<button 
				style="border: none; font-size: 22px; border-radius: 4px;
				background-color: #929292; width: 95px; color: rgb(255, 255, 255);
				height: 40px;
				cursor: pointer;">취소</button>
			<button onclick="location.href='joinOk.jsp'"
				style="border: none; font-size: 22px; border-radius: 4px;
				background-color: #F1C40F; width: 95px; color: rgb(255, 255, 255);
				height: 40px; cursor: pointer;">수정</button>
		</div>
		
		
		</div><!-- .arrayDiv -->
	
	</div><!-- .joinDiv -->
</div><!-- .defaultWidth -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

