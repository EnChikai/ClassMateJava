<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">

#evnetInfo{
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

#evnetInfoTb th{
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

#evnetInfoTb td{
padding-left: 15px; 
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);

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

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){
   let headImg = "${eventBoard.headImg}";
   
   var trimmedPart = headImg.slice(-12);
   
   headImg = headImg.replace(trimmedPart,'');
   
   $("#fileName").text(headImg)
   
});
</script>
<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">

<p id="evnetInfo" style="margin-bottom: 1rem">이벤트 조회</p>

<!-- 썸네일 테스트 -->
<!-- <div> -->
<%-- <img src="/upload/${eventBoard.headImg }" width="100px;" height="100px;"> --%>
<!-- </div> -->


<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="evnetInfoTb" style="width: 695px;">
	<tr>
		<th>제목</th>
			<td colspan="3">${eventBoard.eventName}</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${eventBoard.userName}</td>
		<th style="width: 124px;">등록일</th>
			<td style="padding-bottom: 0px;">
				${eventBoard.eventDate }
			</td>	
	</tr>
	
	<c:if test="${not empty eventBoard.headImg }">
	<tr>
		<th>썸네일</th>
			<td colspan="3"><p id="fileName"></p></td>
	</tr>
	</c:if>
	
	<c:if test="${not empty eventBoardFile }">
	<tr>
		<th>첨부파일</th>
			<td colspan="3">
			<c:forEach var="eventBoardFile" items="${eventBoardFile }">
			<a>${eventBoardFile.originName }</a><br>			
			</c:forEach>
			</td>
	</tr>
	</c:if>
	
	<tr>
		<th>내용</th>
			<td colspan="3">${eventBoard.eventContent}</td>
	</tr>
</table>
</div>

<div style="margin-top: 72px; margin-bottom: 15px;">
<a href="../admin/eventUpdate?eventNo=${eventBoard.eventNo}"><button id="updateBtn" type="button">수정</button></a>
</div>

</div>
<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />