<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<style type="text/css">

#userInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 14px; 
text-align: left; 
padding-left: 27px;
width: 620px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}


#userInfoTb th{
padding-left:30px; ; 
text-align: right;
vertical-align: top;

}

#userInfoTb td{
padding-left: 42px; 
padding-bottom: 7px;

}

#userInfoTb td input{
color: #aaa;
padding-left: 13px;

}

.topMenuBtn{
background: white;
border-radius: 3px; 
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
font-size:14px;
padding-top : 10px;
padding-bottom : 10px;
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

}

</style>

<%-- <% ============================================================================= %> --%>

<div style="margin-top: 60px; margin-left: 72px; font-size: 5px;">
<button class="topMenuBtn checked">회원정보 관리</button>
<button class="topMenuBtn">결제/수강 내역</button>
<button class="topMenuBtn">작성한 게시물</button>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 700px; margin-left: 72px;">

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
				<input type="checkbox"> 남성
				<input style="margin-left: 35px;" type="checkbox"> 여성
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

</div>
			
<%-- <% ============================================================================= %> --%>			
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />