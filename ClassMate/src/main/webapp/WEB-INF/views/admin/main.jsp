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

</style>


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
			<tr>
				<td class="profileTd">
				<div id="logout">
				직급: (   ) 
					<a style="text-decoration: underline; color: red; " href="../main/main">로그아웃</a>
				</div>
				</td>
			</tr>
			</table>
			
<%-- <% ============================================================================= %> --%>			

<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />