<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

$(function(){
    $(document).on('click', "input[type='checkbox']", function(){
        // 성별 체크박스인 경우에만 로직 수행
        if (this.name === 'userGender') {
            if (this.checked) {
                // 선택된 경우 다른 성별 체크박스들을 선택 해제
                $("input[name='userGender']").not(this).prop('checked', false);
            } 
            // 선택이 해제된 경우에는 아무런 처리 필요 없음
        } else if (this.name === 'agree') {
            // 약관 동의 체크박스를 클릭한 경우에는 아무런 처리 필요 없음
        } else {
            // 다른 모든 체크박스인 경우 성별 체크박스를 선택 해제하지 않음
        }
    });
});

function checkDuplicateId() {
   // 사용자 아이디를 가져옵니다.
    var userId = $("#userId").val();
   
    // 사용자 아이디가 비어 있는지 체크
    if (!userId) {
        alert("아이디를 입력하세요.");
        return;
    }
    
    // AJAX를 사용하여 Controller에게 중복 확인 요청
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/user/checkDuplicateId",
        data: { "userId": userId },
        success: function(response) {
            if (response.duplicate) {
                alert("이미 사용 중인 아이디입니다.");
            } else {
                alert("사용 가능한 아이디입니다.");
             
                // 중복 확인이 완료되었으므로 userIdChecked를 true로 설정
                $("#userId").data("checked", true);
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 중 오류 발생:", status, error);
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}

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

function validateForm() {
    // 필드 값 가져오기
    var userId = $("#userId").val();
    var userPw = $("#userPw").val();
    var userPwChk = $("#userPwChk").val();
    var userBirthday = $("#userBirthday").val();
    var userPhone = $("#userPhone").val();
    var userName = $("#userName").val();
    var userEmail = $("#userEmail").val();
    var postcode = $("#postcode").val();
    var address = $("#address").val();
    var detailAddress = $("#detailAddress").val();

    // 선택된 성별 항목의 개수를 가져옵니다
    var userGender = $("input[name='userGender']:checked").length;
    
    // 아이디 중복 확인 여부를 가져옵니다.
    var userIdChecked = $("#userId").data("checked");
    
    // 약관 동의 여부를 가져옵니다.
    var agree = $("#cb3:checked").length;
    
    // 모든 필수 필드가 비어 있는지 확인
   if (   userId === "" ||
      userPw === "" ||
      userPwChk === "" ||
      userGender === 0 ||
        userBirthday === "" ||
        userPhone === "" ||
        userName === "" ||
        userEmail === "" ||
        postcode === "" ||
        address === "" ||
        detailAddress === ""
        || agree === 0
    ) {
        alert("모든 필수 항목을 입력하세요.");
        return false; // 폼 제출 방지
    }else{
        // 추가 유효성 검사
        if (!userIdChecked) {
            alert("아이디 중복 확인을 해주세요.");
            return false; // 폼 제출 방지
        } else if (userPw !== userPwChk) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false; // 폼 제출 방지
       }else {
            // 모든 검사가 통과되면 폼을 수동으로 제출
            document.getElementById("loginForm").submit();
       }
   }
}

$(document).ready(function () {
    // Enter 키 감지
$(document).on('keydown', function (e) {
    if (e.which === 13) {
        e.preventDefault(); // 엔터 키의 기본 동작 방지
        validateForm();
    }
});

    // 등록 버튼 클릭 시 폼 유효성 검사 후 리다이렉션
    $("#registerButton").click(function () {
        if (validateForm()) {
            location.href = '${pageContext.request.contextPath}/user/joinOk';
        }
    });
});

function registerButtonClick() {
    if (validateForm()) {
        location.href = '${pageContext.request.contextPath}/user/joinOk';
    }
}

</script>
<style type="text/css">


.joinDiv {
   border: 1px solid #ccc;
   width: 900px;
   height: 1130px;
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
   vertical-align: middle;
}

button {
   height: 25px;
   width: 95px;
   height: 40px;
   color: rgb(255, 255, 255);
   cursor: pointer;
   border: none;
   font-size: 22px;
   border-radius: 4px;
}

#title {
   font-size: 40px;
   font-weight: bold;
   margin-left: 50px;
   line-height: 3.5;
}

</style>



<div class="joinDiv">
   <div class="title">
   <span id="title">회원가입</span>
   <div class="decobox"></div>
   </div><!-- .title -->

   <div class="arrayDiv">
   <form id="loginForm" action="./join" method="post">
   
      <label for="userId">아이디</label>
      <input type="text" id="userId" name="userId" placeholder="아이디 입력" style="width: 393px;">         
      <input type="button" value="중복확인" onclick="checkDuplicateId()"
            style="float: right;
            text-align: center;
            background-color: rgb(158, 158, 158);
            color: rgb(255, 255, 255);
            border-radius: 4px;
            width: 73px; font-size: 16px; border: 1px solid #ccc; 
            margin-top: 15px; height: 30px; cursor: pointer;"><br>
      
      <label for="userPw">비밀번호</label>
      <div style="position: relative; display: inline-block;">
          <input type="password" id="userPw" name="userPw" placeholder="비밀번호 입력">
          <img src="/resources/img/close_eye.png" id="togglePassword"
              onclick="togglePasswordVisibility('userPw', 'togglePassword')"
              style="cursor: pointer;
              position: absolute;
              right: 5px; top: 50%;
              transform: translateY(-50%);">
      </div>
      <br>
      
      <label for="userPwChk">비밀번호 확인</label>
      <div style="position: relative; display: inline-block;">
          <input type="password" id="userPwChk" name="userPwChk" placeholder="비밀번호 확인">
          <img src="/resources/img/close_eye.png" id="togglePasswordChk"
              onclick="togglePasswordVisibility('userPwChk', 'togglePasswordChk')"
              style="cursor: pointer;
              position: absolute;
              right: 5px; top: 50%;
              transform: translateY(-50%);">
      </div>
      <br>
      
      <label>성별</label>
      <input type="checkbox" id="cb1" value="0" name="userGender" style="cursor: pointer; width: 20px; vertical-align: middle;">
      <label for="cb1" style="text-align: left; width: 40px" >남성</label>
      <input type="checkbox" id="cb2" value="1" name="userGender" style="cursor: pointer; width: 20px; vertical-align: middle;" >
      <label for="cb2" style="text-align: left; width: 40px" >여성</label><br>
         
      <label for="userBirthday">생년월일</label>
      <input type="date" id="userBirthday" name="userBirthday"><br>
      
      <label for="userName">이름</label>
      <input type="text" id="userName" name="userName"><br>
      
      <label for="userPhone">전화번호</label>
      <input type="text" id="userPhone" name="userPhone" placeholder="전화번호 입력"><br>
      
      <label for="userEmail">이메일</label>
      <input type="email" id="userEmail" name="userEmail" style="width: 200px">
      <button type="button"
            style="background-color: rgb(158, 158, 158);
            color: rgb(255, 255, 255);
            border-radius: 4px;
            width: 73px; font-size: 16px;
            border: 1px solid #ccc; 
            margin-top: 6px; height: 30px; cursor: pointer;" >인증확인</button><br>
      
      <label for="postcode">주소</label>
      <input type="text" id="postcode" name="userPost" placeholder="우편번호"
            style="width: 200px; text-align: left;">
      <input type="button" onclick="execDaumPostcode()" value="우편번호"
            style="background-color: rgb(158, 158, 158);
            color: rgb(255, 255, 255);
            border-radius: 4px; width: 73px; font-size: 16px; 
            margin-top: 6px; height: 30px; cursor: pointer; text-align: center;"><br>
      <label></label>
      <input type="text" id="address" name="mainAddress" placeholder="주소" style="text-align: left;"><br>
      <label></label>
      <input type="text" id="detailAddress" name="subAddress" placeholder="상세주소" style="text-align: left;"><br>
   
      
      
      <label>약관관련</label>
      <input type="checkbox" id="cb3" value="agree" name="agree"
            style="cursor: pointer; width: 20px; vertical-align: middle;">
      <label for="agree" style="text-align: left; width: 120px;">약관 동의 여부</label>
      <a href="javascript:openModal('modal1');"><button type="button"
            style="float: right;
             border: none; font-size: 14px;
               border-radius: 4px; height: 33px;
               width: 90px; text-align: center;
               margin-top: 18px; padding: 2px 4px;
               background-color: rgb(224, 224, 224);
               color: rgb(64, 64, 64); font-weight: bold;
             cursor: pointer;">자세히 보기</button></a><br><br>
      
      <div class="Btn" style="text-align:center;">
	      <button type="button" style="background-color: #929292;" onclick="window.history.back();">취소</button>
	      <button id="registerButton" style="background-color: #F1C40F;" type="button">등록</button>
      </div>
      
      
      </form>
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