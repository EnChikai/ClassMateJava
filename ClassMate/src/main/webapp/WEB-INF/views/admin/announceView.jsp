<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">

#announceInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 620px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}


#announceInfoTb th{
padding-left:30px;
text-align: right;
vertical-align: top;

}

#announceInfoTb td{
padding-left: 42px; 
padding-bottom: 7px;

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
background: rgb(158,158,158); 
box-shadow: 0 0 0 1px #ccc; 
margin-right: 19px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

</style>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 700px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">

<p id="announceInfo">공지사항 조회</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="userInfoTb">
	<tr>
		<th>제목</th>
			<td>${announceBoard.announceName}</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
			<td></td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td>${announceBoard.announceContent}</td>
	</tr>
</table>
</div>

<div style="margin-top: 72px; margin-bottom: 15px;">
<a><button id="updateBtn" type="button">수정</button></a>
</div>

</div>


<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />