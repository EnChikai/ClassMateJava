<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">

#profile{
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin-right: 33px;
margin-left: 580px;
margin-top: 30px;

}

#userCount{
width:300px;
height: 200px;
float: left;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin-left: 33px;
margin-top: 30px;

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

#logout:hover:not(.active){
	cursor:pointer
}

</style>

<script type="text/javascript">

$(function(){
	
	$("#logoutText").click(function(){
		$("#logoutForm").submit();
	})
	
}); 

</script>

<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px; height: 500px;">

<div id="userCount">
그래프로 만들기<br>
유저수 : ${userCount }<br>
탈퇴 유저수 : ${secessionUserCount }<br>
</div>

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
	관리자(${userId})님<br>
	반갑습니다
	</td>
</tr>
<tr>
	<td class="profileTd">
	<div id="logout">
		<form id="logoutForm" action="./main" method="post">
		<p id="logoutText" style="text-decoration: underline; color: red;">로그아웃</p>
		</form>
	</div>
	</td>
</tr>
</table>

</div>			
<%-- <% ============================================================================= %> --%>		
	
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />