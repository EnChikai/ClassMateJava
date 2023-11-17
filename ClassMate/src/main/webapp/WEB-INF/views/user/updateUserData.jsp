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

	$("#outUser").on('click', function(){
		console.log('클릭됨')
		
		withdrawUser();
	})
	
	
}); // 제이쿼리 펑션 끝


function togglePasswordVisibility( idByInput , idByIcon) {
 	var pwInput = document.getElementById(idByInput);
    var eyeIcon = document.getElementById(idByIcon);
    
    if (pwInput.type === 'password') {
    	pwInput.type = 'text';
    	eyeIcon.src = '/resources/img/open_eye.png'; // 열린 눈 모양 이미지의 경로로 대체하세요
    } else {
    	pwInput.type = 'password';
        eyeIcon.src = '/resources/img/close_eye.png'; // 닫힌 눈 모양 이미지의 경로로 대체하세요
    }
    
}

//"탈퇴하시겠습니까?" 클릭 시 팝업창 표시
function showWithdrawalPopup() {
    var isWithdrawal = confirm("회원 탈퇴를 진행하시겠습니까?");
    if (isWithdrawal) {
        // 실제 탈퇴 처리를 위해 서버로 요청
    }
}


//실제 탈퇴를 위한 AJAX 요청
function withdrawUser() {
 $.ajax({
     type: "POST",
     url: "/user/updateUserDataOut", // 실제 탈퇴 처리를 위한 서블릿 URL로 변경
     data: {
         "userNo" : ${userInfo.userNo}// 여기에 회원 정보나 탈퇴에 필요한 파라미터를 전달
     },
     success: function (res) {
    	 console.log( res )
         if (res === "success") {
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

// 팝업을 보여주는 함수
function showWithdrawalPopup() {
    document.getElementById('withdrawalPopup').style.display = 'block';
}

// 팝업을 닫는 함수
function closeWithdrawalPopup() {
    document.getElementById('withdrawalPopup').style.display = 'none';
}

//회원 정보 수정 버튼 클릭 시 호출되는 함수
function updateUserInfo() {
    // 수정된 회원 정보를 읽어와서 변수에 저장
    var updatedUserInfo = {
        userId: $("#userId").val(),
        // 생년월일 등 다른 필드도 유사하게 추가
    };

    // AJAX 요청을 통해 서버로 수정된 회원 정보 전송
    $.ajax({
        type: "POST",
        url: "/user/updateUserData", // 수정된 정보를 전송할 서블릿 URL로 변경
        data: updatedUserInfo,
        success: function (res) {
            // 서버에서의 응답에 따라 적절한 처리
            if (res.success) {
                alert("회원 정보가 성공적으로 수정되었습니다.");
                // 성공했을 때의 추가 처리 (예: 화면 갱신 등)
            } else {
                alert("회원 정보 수정에 실패했습니다.");
                // 실패했을 때의 추가 처리
            }
        },
        error: function () {
            alert("서버 오류로 인해 회원 정보 수정에 실패했습니다.");
        }
    });
}

</script>

<style type="text/css">

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
	height: 35px;
}

#title {
	font-size: 40px;
	font-weight: bold;
    margin: 50px;
    line-height: 2.5;
}

.popup {
    display: none; /* 처음에는 숨김 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #ffffff;
    border: 2px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
    z-index: 1000; /* 다른 요소 위에 나타나도록 z-index 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    line-height: 2.5; /* 글자 위아래 간격 */
    height: 340px;
    width: 540px;
}

#titleInfo {
	font-size: 22px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.9em;
    border-radius: 4px;
    background-color: rgb(0, 0, 0);
    font-style: normal;
    font-family: HanSans;
    font-weight: bold;
    margin-top: 25px;
    margin-bottom: 20px;
}

.popup button {
    background-color: #F1C40F;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    width: 80px;
    font-size: 16px;
    margin-right: 10px;
    cursor: pointer;
    margin-top: 45px;
}

.popup button.cancel {
    background-color: #929292;
}

.togglePw {
 cursor: pointer; 
 position: absolute; 
 right: 5px; 
 top: 50%; 
 transform: translateY(-50%);"
}

#chkCert {
	background-color: rgb(158, 158, 158);
	color: rgb(255, 255, 255);
	border-radius: 4px; 
	width: 73px; 
	font-size: 16px; 
	border: 1px solid #ccc; 
	margin-top: 6px; height: 30px; cursor: pointer;" 
}

#btnPost {
	  background-color: rgb(158, 158, 158); 
	  color: rgb(255, 255, 255);
	  border-radius: 4px; 
	  width: 73px; 
	  font-size: 16px; 
	  margin-top: 6px; 
	  height: 30px; 
	  cursor: pointer; 
	  text-align: center;"
}

.Btn button {
	border: none; 
	font-size: 22px; 
	border-radius: 4px;
	width: 95px; 
	color: rgb(255, 255, 255);
	height: 40px;
	cursor: pointer;"
}

input[type="checkbox"] {
   cursor: pointer; 
   width: 20px; 
   vertical-align: middle;
}

</style>



	<div class="joinDiv">
		<div class="title">
		<span id="title">회원정보수정</span>
		<div class="decobox"></div>
		</div>
	
		<div class="arrayDiv">
		
			<label for="userId">아이디</label>
			<input type="text" id="userId" name="userId" style="width: 470px;" placeholder="${userInfo.userId }">	
			
			<label for="userPw">비밀번호</label>
			
			<div style="position: relative; display: inline-block;">
			    <input type="password" id="userPw" name="userPw" value="${userInfo.userPw }">
			    <img src="/resources/img/close_eye.png" id="togglePw" class="togglePw" onclick="togglePasswordVisibility('userPw', 'togglePw')">
			</div><br>
			
			<label for="userPwChk">비밀번호 확인</label>
			<div style="position: relative; display: inline-block;">
			    <input type="password" id="userPwChk" name="userPwChk" value="${userInfo.userPw }">
			    <img src="/resources/img/close_eye.png" id="togglePwChk" class="togglePw" onclick="togglePasswordVisibility('userPwChk', 'togglePwChk')">
			</div><br>
			
			<label>성별</label>
			<input type="checkbox" id="cb1" value="0" name="userGender" ${userInfo.userGender eq '0' ? 'checked' : ''}>
			<label for="cb1" style="text-align: left; width: 40px" >남성</label>
			<input type="checkbox" id="cb2" value="1" name="userGender" ${userInfo.userGender eq '1' ? 'checked' : ''}>
			<label for="cb2" style="text-align: left; width: 40px" >여성</label><br>
				
			<label for="userBirthday">생년월일</label>
			<input type="date" id="userBirthday" name="userBirthday" placeholder="${userInfo.userBirthday }"><br>
			
			<label for="userPhone">전화번호</label>
			<input type="text" id="userPhone" name="userPhone" placeholder="${userInfo.userPhone }"><br>
			
			<label for="userName">이름</label>
			<input type="text" id="userName" name="userName" placeholder="${userInfo.userName }"><br>
			
			<label for="userEmail">이메일</label>
			<input type="email" id="userEmail" name="userEmail" placeholder="${userInfo.userEmail }" style="width: 200px">
			<button id="chkCert">인증확인</button><br>
			
			<label for="postcode">주소</label>
			<input type="text" id="postcode" name="userPost" placeholder="${userInfo.userPost }" style="width: 200px; text-align: left;">
			<input type="button" id="btnPost" onclick="execDaumPostcode()" value="우편번호"><br>
			<label></label>
			<input type="text" id="address" name="mainAddress" placeholder=${userInfo.mainAddress } style="text-align: left;"><br>
			<label></label>
			<input type="text" id="detailAddress" name="subAddress" placeholder="${userInfo.subAddress }" style="text-align: left;"><br>
			
			
			<!-- 팝업을 나타내는 div 요소 -->
			<div class="popup" id="withdrawalPopup">
				<div id="titleInfo"><span>ClassMate</span></div>
			    <h2>회원 탈퇴를 진행하시겠습니까?</h2>
			    <h4 style="color: #BEBEBE;">탈퇴 시 ClassMate의 모든 서비스를 이용할 수 없게됩니다</h4>
			    <button id="outUser">확인</button>
			    <button class="cancel"  onclick="closeWithdrawalPopup()">취소</button>
			</div>
			<span style="color: red; text-decoration: underline; float: right; cursor: pointer;" onclick="showWithdrawalPopup();">탈퇴하시겠습니까?</span>
		
		<div class="Btn" style="text-align:center; margin-top: 80px;">
			<button  id="btnCancle" style="background-color: #929292;">취소</button>
			<button id="btnUpdate" style="background-color: #F1C40F;" onclick="updateUserInfo()">수정</button>
		</div>
		
		</div><!-- .arrayDiv -->
	</div><!-- .joinDiv -->

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

