<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}

#announceInfo{
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

#announceInfoTb th{
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

#announceInfoTb td{
padding-left: 15px; 
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);

}

#announceInfoTb td input{
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

p{
margin-bottom: 0px;

}
</style>


<!-- 비할성화 모달 -->
<style type="text/css">
#existBtn{
border-radius: 3px; 
border-style: hidden;
width: 65px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(158,158,158); 
box-shadow: 0 0 0 1px #ccc; 
margin-right: 19px;

}

#existBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

#delBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#delBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#existModal, #delModal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.existModal-con, .delModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 650px;;
  min-height: 470px;
  background:#fff;
}
.existModal-con .con, .delModal-con .con{
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

#existOkBtn, #delOkBtn{
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

#existOkBtn:hover:not(.active), #delOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>

<%-- <% ============================================================================= %> --%>

<script type="text/javascript">
// 비활성화 모달 열기
function openExistModal(modalname) {
  $("#existModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".existModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#existModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeExistModal").click(function (e) {
		    var modal = $(".existModal-con");
		      $("#existModal").fadeOut(300);
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
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">

<p id="announceInfo" style="margin-bottom: 1rem">공지사항 조회</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="announceInfoTb" style="width: 695px;">
	<tr>
		<th>제목</th>
			<td colspan="3">${announceBoard.announceName}</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${announceBoard.userName}</td>
		<th style="width: 123px;">등록일</th>
			<td style="padding-bottom: 0px;">
				${announceBoard.announceDate }
			</td>	
	</tr>
	
	<tr>
		<th>첨부파일</th>
			<td colspan="3">
			<c:if test="${not empty announceBoardFile }">
				<c:forEach var="announceBoardFile" items="${announceBoardFile }">
				<a href="./annoFileDownload?fileNo=${announceBoardFile.fileNo }">${announceBoardFile.originName }</a><br>			
				</c:forEach>
			</c:if>
			
			<c:if test="${empty announceBoardFile }">
				파일이 없습니다
			</c:if>
			</td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">${announceBoard.announceContent}</td>
	</tr>
</table>
</div>

<c:if test="${announceBoard.announceExist eq 0}">
<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="../admin/announceUpdate?announceNo=${announceBoard.announceNo}"><button id="updateBtn" type="button">수정</button></a>
<a href="javascript:openExistModal('existModal');" class="terms" style="text-decoration: none; color: black;"><button id="existBtn">비활성화</button></a>
</div>
</c:if>

<c:if test="${announceBoard.announceExist eq 1}">
<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="javascript:openDelModal('delModal');" class="terms" style="text-decoration: none; color: black;"><button id="delBtn">삭제</button></a>
</div>
</c:if>

</div>
<%-- <% ============================================================================= %> --%>	
<%-- 비활성화 --%>	
<div id="existModal" class="close"></div>
  <div class="existModal-con existModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">공지사항 게시물을</p>
    <p>비활성화 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/setAnnounceExist" method="get">
	<button id="existOkBtn">예</button>
	<input type="text" name="announceNo" style="display: none;" value="${announceBoard.announceNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeExistModal" id="closeExistModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>
  
<%-- 삭제 --%>	
<div id="delModal" class="close"></div>
  <div class="delModal-con delModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">공지사항 게시물을</p>
    <p>삭제 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/announceDelete" method="post">
	<button id="delOkBtn">예</button>
	<input type="text" name="announceNo" style="display: none;" value="${announceBoard.announceNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeDelModal" id="closeDelModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>			
<%-- <% ============================================================================= %> --%>	
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />