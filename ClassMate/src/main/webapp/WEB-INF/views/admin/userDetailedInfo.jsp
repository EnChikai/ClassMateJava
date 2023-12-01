<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
	
}

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
color: #999;
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
background: rgb(241,196,15);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(231,186,5);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

#updateBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#updateBtn{
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 19px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: 1px rgb(241,196,15);
	
}

</style>

<!-- 모달 -->
<style type="text/css">
#secessionBtn, #delBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#secessionBtn:hover:not(.active), #delBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#secessionModal, #delModal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.secessionModal-con, .delModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 650px;;
  min-height: 470px;
  background:#fff;
}
.secessionModal-con .con, .delModal-con .con{
  font-size:26px; 
  line-height:1.3;
  padding-top: 50px;
  padding-left: 100px;
  padding-right: 100px;
  padding-bottom: 50px;
  height: 400px;
  overflow-y: auto;
  text-align: center; 
}

.closeModalBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black;
font-size: 14px;

}

.closeModalBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
cursor:pointer
	
}

#secessionOkBtn, #delOkBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(241,196,15); 
box-shadow: 0 0 0 1px rgb(230,204,100); 
margin-right: 19px;
font-size: 14px;

}

#secessionOkBtn:hover:not(.active), #delOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>
<%-- <% ============================================================================= %> --%>

<script type="text/javascript">
$(function(){
	
	var gender = ${userdata.userGender};
	
	if(gender == 0){
		$("#genderM").prop('checked',true);
		$("#genderW").prop('checked',false);
	}else{
		$("#genderW").prop('checked',true);
		$("#genderM").prop('checked',false);
	}
	
})
</script>

<script type="text/javascript">
// 모달 열기
function openSecessionModal(modalname) {
  $("#secessionModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".secessionModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#secessionModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeSecessionModal").click(function (e) {
		    var modal = $(".secessionModal-con");
		      $("#secessionModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});

//삭제 모달 열기
function openDelModal(modalname) {
  $("#delModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".delModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#delModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeDelModal").click(function (e) {
		    var modal = $(".delModal-con");
		      $("#delModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});
</script>

<%-- <% ============================================================================= %> --%>

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<button style="margin-left: 1px;" class="topMenuBtn checked">회원정보 관리</button>
<a href="../admin/userPaymentList?userNo=${userdata.userNo}"><button class="topMenuBtn">결제/수강 내역</button></a>
<a href="../admin/userPostList?userNo=${userdata.userNo}"><button class="topMenuBtn">작성한 게시물</button></a>
</div>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="userInfo">회원정보</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">
<table id="userInfoTb">
	<tr>
		<th>아이디</th>
			<td>${userdata.userId}</td>
	<tr>
	
	<tr>
	<th>성별</th>
			<td>
				<input id="genderM" type="checkbox" disabled="disabled"> 남성
				<input id="genderW" style="margin-left: 35px;" type="checkbox" disabled="disabled"> 여성
			</td>
	</tr>
	
	<tr>
		<th>생년월일</th>
			<td><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.userBirthday}"></td>
	</tr>
	
	<tr>
		<th>전화번호</th>
			<td><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.userPhone}"></td>
	</tr>
	
	<tr>
		<th>이름</th>
			<td><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.userName}"></td>
	</tr>
	
	<tr>
		<th>이메일</th>
			<td style="padding-bottom: 32px;"><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.userEmail}"></td>
	</tr>		
	
	<tr>
		<th>주소</th>
			<td><input type="text"  readonly="readonly" style="width: 75px;" value="${userdata.userPost}"></td>
	</tr>
	
	<tr>
		<th></th>
			<td><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.mainAddress}"></td>
	</tr>
	
	<tr>		
		<th></th>
			<td><input type="text" readonly="readonly" style="width: 410px;" value="${userdata.subAddress}"></td>
	</tr>
</table>
</div>

<c:if test="${userdata.userSecession eq 0}">
<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="../admin/userInfoUpdate?userNo=${userdata.userNo}"><button id="updateBtn" type="button">수정</button></a>
<a href="javascript:openSecessionModal('secessionModal');" class="terms" style="text-decoration: none; color: black;"><button id="secessionBtn">탈퇴</button></a>
</div>
</c:if>

<c:if test="${userdata.userSecession eq 1}">
<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="javascript:openDelModal('delModal');" class="terms" style="text-decoration: none; color: black;"><button id="delBtn">삭제</button></a>
</div>
</c:if>

</div>

<%-- <% ============================================================================= %> --%>	

<div id="secessionModal" class="close"></div>
  <div class="secessionModal-con secessionModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p>입력된 회원정보를</p>
    <p>수정/탈퇴 처리 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/secessionUser" method="post">
	<button id="secessionOkBtn">예</button>
	<input type="text" name="userNo" style="display: none;" value="${userdata.userNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeSecessionModal" id="closeSecessionModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>

<%-- 삭제 --%>	
<div id="delModal" class="close"></div>
  <div class="delModal-con delModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">해당 이용자를</p>
    <p>삭제 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 28px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/userDelete" method="post">
	<button id="delOkBtn">예</button>
	<input type="text" name="userNo" style="display: none;" value="${userdata.userNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeDelModal" id="closeDelModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>						
<%-- <% ============================================================================= %> --%>	
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />