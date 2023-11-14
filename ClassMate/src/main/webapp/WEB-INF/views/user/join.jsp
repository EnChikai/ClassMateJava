<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
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

function checkDuplicateId() {
    var userId = $("#userId").val();
    
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
            }
        },
        error: function() {
            alert("중복 확인 중 오류가 발생했습니다.");
        }
    });
}


</script>
<style type="text/css">

.defaultWidth {
	width: 100%;
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
		<span id="title">회원가입</span>
		<div class="decobox"></div>
		</div>
	
		<div class="arrayDiv">
		
			<label for="userId">아이디</label>
			<input type="text" id="userId" name="userId" placeholder="아이디 입력" style="width: 393px;">			
			<input type="button" value="중복확인" onclick="checkDuplicateId()"
					style="float: right; text-align: center;
					background-color: rgb(158, 158, 158); color: rgb(255, 255, 255);
					border-radius: 4px; width: 73px; font-size: 16px; border: 1px solid #ccc; 
					margin-top: 15px; height: 30px; cursor: pointer;"><br>
			
			<label for="userPw">비밀번호</label>
			<input type="password" id="userPw" name="userPw" placeholder="비밀번호 입력"><br>
			
			<label for="userPwChk">비밀번호 확인</label>
			<input type="text" id="userPwChk" name="userPwChk" placeholder="비밀번호 확인"><br>
			
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
		
			
			
			<label>약관관련</label>
			<input type="checkbox" id="cb3" value="agree" name="agree" style="cursor: pointer; width: 20px; vertical-align: middle;">
			<label for="agree" style="text-align: left; width: 120px;">약관 동의 여부</label>
			<a href="javascript:openModal('modal1');"><button style="float: right;
		    		border: none; font-size: 14px;
		   			border-radius: 4px; height: 33px; width: 90px; text-align: center;
		   			margin-top: 18px; padding: 2px 4px;
		   			background-color: rgb(224, 224, 224); color: rgb(64, 64, 64); font-weight: bold;
		    		cursor: pointer;">자세히 보기</button></a><br><br>
		
		<div class="Btn" style="text-align:center;">
			<button 
				style="border: none; font-size: 22px; border-radius: 4px;
				background-color: #929292; width: 95px; color: rgb(255, 255, 255);
				height: 40px;
				cursor: pointer;">취소</button>
			<button onclick="location.href='joinOk.jsp'"
				style="border: none; font-size: 22px; border-radius: 4px;
				background-color: #F1C40F; width: 95px; color: rgb(255, 255, 255);
				height: 40px; cursor: pointer;">등록</button>
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
