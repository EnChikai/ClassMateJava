<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<style type="text/css">

#profile{
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin-right: 33px;
margin-left: 560px;
margin-top: 50px;
}

.profileTh, .profileTd{
border: 1px solid #ccc;
border-collapse:collapse;    
padding: 0;
}

#helloAdmin{
background: rgb(224,224,224) 
}

#img{
margin-right: 40px;
margin-left: 40px;
}

#logout{
margin-top: 10px; 
margin-bottom: 10px; 
}

#adminMenu{
width: 280px;
}

#menuTop{
background: black;
}

.underMenu{
background: rgb(158,158,158);
color: white;

}

.adminPage{
height: 102px;
text-align: right;
font-size: 22px;
}

.menuFontPadding{
padding-right: 17px;
padding-top: 20px;
padding-bottom: 20px;
width: 278px;
}

<%-- <% ============================================================================= %> --%>

.changeBack:hover:not(.active){

background: rgb(241,196,15) 

}

</style>

<div id="adminMenu">

<div>
	<table style="border-spacing: 0;">
		<tr id="menuTop">
			<th class ="adminPage" style="color: white;">
				<div class="menuFontPadding">
				<a style="text-decoration: none; color: white;" href="./main">관리페이지</a>
				</div>
			</th>
			<td style="background: white; vertical-align: top;" rowspan='6'>
<%-- <% ============================================================================= %> --%>
			
			<table id="profile" >
			<tr>
			<th class="profileTh">
				<div id="img" >
				<img title="미졌습니까? 휴먼?" alt="관리자 이미지" src="/resources/img/sample_img.png" width="130" height="150">
				</div>
			</th>
			</tr>
			
			<tr>
				<td id="helloAdmin" class="profileTd">
				관리자(   )님<br>
				반갑습니다
				</td>
			</tr>
			
<%-- <% ============================================================================= %> --%>			
			<tr>
				<td class="profileTd">
				<div id="logout">
				직급: (   ) 
					<a style="text-decoration: underline; color: red; " href="../board/board">로그아웃</a>
				</div>
				</td>
			</tr>
			</table>
			
			</td>
		</tr>
		<tr>
			<th class="adminPage underMenu">
				<div class="menuFontPadding changeBack">
				<a style="text-decoration: none; color: white;" href="./userList">회원 관리</a>
				</div>
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th class="adminPage underMenu">
				<div class="menuFontPadding changeBack">
				신청 관리
				</div>
			</th>
		</tr>
		<tr>
			<th class="adminPage underMenu">
				<div class="menuFontPadding changeBack">
				클래스 관리
				</div>
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th class="adminPage underMenu">
				<div class="menuFontPadding changeBack">
				게시판 관리
				</div>
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th class="adminPage underMenu" style="padding-bottom: 150px;">
			</th>
			<td>
			</td>
		</tr>
	</table>
</div>

</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div>