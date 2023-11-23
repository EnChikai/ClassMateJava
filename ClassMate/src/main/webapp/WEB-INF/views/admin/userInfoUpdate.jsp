<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <% ============================================================================= %> --%>

<style type="text/css">

#userInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 720px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}


#userInfoTb th{
padding-left: 80px;
text-align: right;
vertical-align: top;

}

#userInfoTb td{
padding-left: 42px; 
padding-bottom: 7px;

}

#userInfoTb td input{
color: black;
padding-left: 13px;

}

.topMenuBtn{
background: white;
border-radius: 3px; 
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
font-size:14px;
padding-top : 12px;
padding-bottom : 12px;
padding-left: 14px; 
padding-right: 14px;
vertical-align: bottom;

}

.checked{
background: rgb(243,156,18);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(243,156,18);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

#updateBtn, #cancelBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#cancelBtn{
background: black;
box-shadow: 0 0 0 1px black

}

#cancelBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#updateBtn{
background: rgb(158,158,158); 
box-shadow: 0 0 0 1px #ccc; 
margin-right: 19px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

#postBtn{
border-radius: 3px; 
border-style: hidden;
width: 75px; 
height: 28px;
font-weight:bold;
background: black;

}

#postBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

</style>

<%-- <% ============================================================================= %> --%>

<script type="text/javascript">
$(function(){
	
	var gender = ${userdata.userGender};
	
	if(gender == 0){
		$("#genderM").prop('checked',true);
		
	}else{
		$("#genderM").prop('checked',false);
	}
	
	if(gender == 1){
		$("#genderW").prop('checked',true);
		
	}else{
		$("#genderW").prop('checked',false);
	}
	
})

$(function(){
	
	$("#genderW").click(function(){
		if($("#genderM").prop('checked',true)){
			$("#genderM").prop('checked',false)
			$("#genderW").prop('checked',true)
		}else{
			$("#genderM").prop('checked',true)
			$("#genderW").prop('checked',false)
		}
	})
	
	$("#genderM").click(function(){
		if($("#genderW").prop('checked',true)){
			$("#genderM").prop('checked',true)
			$("#genderW").prop('checked',false)
		}else{
			$("#genderM").prop('checked',false)
			$("#genderW").prop('checked',true)
		}
	})
	
})
</script>

<%-- 우편번호 --%>
<script>
    function postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("mainAddress").value = addr;
                document.getElementById("subAddress").focus();
                document.getElementById("subAddress").value = "";
            }
        }).open();
    }
</script>


<%-- <% ============================================================================= %> --%>

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<button style="margin-left: 1px;" class="topMenuBtn checked">회원정보 관리</button>
<button class="topMenuBtn">결제/수강 내역</button>
<button class="topMenuBtn">작성한 게시물</button>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">
<p id="userInfo">회원정보 수정</p>

<form action="../admin/userInfoUpdate" method="post">
<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">

<input type="text" name="userNo" style="display: none;" value="${userdata.userNo}" readonly="readonly">
<table id="userInfoTb">
	<tr>
		<th>아이디</th>
			<td>${userdata.userId}</td>
	<tr>
	
	<tr>
	<th>성별</th>
			<td>
				<input id="genderM" type="checkbox" name="userGender" value="0"> 남성
				<input id="genderW" style="margin-left: 35px;" type="checkbox" name="userGender" value="1"> 여성
			</td>
	</tr>
	
	<tr>
		<th>생년월일</th>
			<td><input type="text" name="userBirthday" style="width: 410px;" value="${userdata.userBirthday}"></td>
	</tr>
	
	<tr>
		<th>전화번호</th>
			<td><input type="text" name="userPhone" style="width: 410px;" value="${userdata.userPhone}"></td>
	</tr>
	
	<tr>
		<th>이름</th>
			<td><input type="text" name="userName" style="width: 410px;" value="${userdata.userName}"></td>
	</tr>
	
	<tr>
		<th>이메일</th>
			<td style="padding-bottom: 32px;"><input type="text" readonly="readonly" style="color: #999; width: 410px;" value="${userdata.userEmail}"></td>
	</tr>		
	
	<tr>
		<th>주소</th>
			<td>
				<input type="text" name="userPost" id="postcode" style="width: 75px; mar" value="${userdata.userPost}">
				<input type="button" id="postBtn" onclick="postcode()" style="color: white; padding-left: 5px; padding-right: 5px;" value="우편번호">
			</td>
	</tr>
	
	<tr>
		<th></th>
			<td><input type="text" name="mainAddress" id="mainAddress" style="width: 410px;" value="${userdata.mainAddress}"></td>
	</tr>
	
	<tr>		
		<th></th>
			<td><input type="text" name="subAddress" id="subAddress" style="width: 410px;" value="${userdata.subAddress}"></td>
	</tr>
</table>

</div>

<div style="margin-top: 72px; margin-bottom: 15px;">
<button id="updateBtn">확인</button>
<a href="../admin/userDetailedInfo?userNo=${userdata.userNo}"><button type="button" id="cancelBtn">취소</button></a>
</div>
</form>

</div>
<%-- <% ============================================================================= %> --%>			
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />