<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<%-- <% ============================================================================= %> --%>
<style type="text/css">
.teacherApplyManagement{
background: rgb(241,196,15);

}

#teacherViewInfo{
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
display: block;

}

#teacherViewInfoTb th{
text-align: center;
vertical-align: top;
background: rgb(224,224,224);
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
padding-left: 30px;
padding-right: 30px;
vertical-align: middle;
width: 124px;

}

#teacherViewInfoTb td{
padding-left: 15px; 
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);

}

#teacherViewInfoTb td input{
color: #999;
padding-left: 13px;

}
</style>

<%-- 모달창 css --%>
<style type="text/css">
#passBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#passBtn{
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 19px;

}

#passBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: 1px rgb(241,196,15);
	
}

#failBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#failBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#passModal, #failModal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.passModal-con, .failModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 700px;;
  min-height: 470px;
  background:#fff;
}
.passModal-con .con, .failModal-con .con{
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

#passOkBtn, #failOkBtn{
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

#passOkBtn:hover:not(.active), #failOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
<%-- 합격 --%>
//비활성화 모달 열기
function openPassModal(modalname) {
  $("#passModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".passModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#passModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closePassModal").click(function (e) {
		    var modal = $(".passModal-con");
		      $("#passModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});

<%-- 탈락 --%>
//비활성화 모달 열기
function openFailModal(modalname) {
  $("#failModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".failModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#failModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeFailModal").click(function (e) {
		    var modal = $(".failModal-con");
		      $("#failModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});
</script>
<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">

<p id="teacherViewInfo" style="margin-bottom: 1rem">강사신청 상세보기</p>


	
<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="teacherViewInfoTb" style="width: 695px;">
		
	<tr>
	<th rowspan='3'>
		강사<br>
		사진
	</th>
	<td rowspan='3' style="text-align: center;">
		<img title="미졌습니까? 휴먼?" alt="관리자 이미지" src="/resources/img/sample_img.png" width="130" height="150">
	</td>
	
	<th>
		제목
	</th>
	<td>
		${teacher.teacherTitle }
	</td>
	</tr>
	
	<tr>
	<th style="padding-left: 20px;; padding-right: 20px;">
			강사 이름
		</th>
			<td colspan="3">
			${userInfo.userName }
		</td>
	</tr>
	
	<tr>
		<th style="width: 123px;">
			등록일
		</th>
		<td style="padding-bottom: 0px;">
			<fmt:formatDate value="${teacherApply.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		</td>	
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">${teacher.teacherInfo }</td>
	</tr>
	
	<tr>
		<th>
			관련된<br>
			자격사항
		</th>
		<td colspan="3">
		<c:if test="${not empty teacher.teacherCareer }">
			${teacher.teacherCareer }
		</c:if>
		<c:if test="${empty teacher.teacherCareer }">
			해당 사항이 없습니다
		</c:if>
		</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
			<td colspan="3">
			
<%-- 			파일 있을경우 --%>
			<c:if test="${not empty teacherLicence }">
			<c:forEach var="teacherLicence" items="${teacherLicence }">
			<a href="./annoFileDownload?teacherNo=${teacherLicence.teacherNo }">${teacherLicence.origin_name }</a><br>			
			<a>파일이름</a><br>			
			</c:forEach>
			</c:if>

<%-- 			파일 없을 경우 --%>
			<c:if test="${empty teacherLicence }">
			<a>파일이 없습니다</a><br>	
			</c:if>
			</td>
	</tr>
	
</table>
</div>

<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="javascript:openPassModal('passModal');" class="terms" style="text-decoration: none;"><button id="passBtn">합격</button></a>
<a href="javascript:openFailModal('failModal');" class="terms" style="text-decoration: none;"><button id="failBtn">탈락</button></a>
</div>

</div>

<%-- <% ============================================================================= %> --%>
<%-- 승인 --%>	
<div id="passModal" class="close">
  <div class="passModal-con passModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">${userInfo.userName }님을 합격시키겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/teacherApplyView" method="Post">
	<button id="passOkBtn">예</button>
	<input type="number" name="teacherNo" style="display: none;" value="${teacherApply.teacherNo}" readonly="readonly">
	<input type="text" name="passOrNot" style="display: none;" value="1" readonly="readonly">
    <a href="javascript:return false;" class="closePassModal" id="closePassModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>
</div> 
 
<%-- 탈락 --%>	
<div id="failModal" class="close">
  <div class="failModal-con failModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">${userInfo.userName }님을 탈락시키겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/teacherApplyView" method="Post">
	<button id="failOkBtn">예</button>
	<input type="number" name="teacherNo" style="display: none;" value="${teacherApply.teacherNo}" readonly="readonly">
	<input type="text" name="passOrNot" style="display: none;" value="0" readonly="readonly">
    <a href="javascript:return false;" class="closeFailModal" id="closeFailModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
	
    </div>
</div>   
 
<%-- <% ============================================================================= %> --%>

</div>
  
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />