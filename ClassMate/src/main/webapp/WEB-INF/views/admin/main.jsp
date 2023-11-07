<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<style type="text/css">
#profile{

width: 100px;
height: 100px;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
    
}
.profileTh, .profileTd{

border: 1px solid #ccc;
border-collapse:collapse;    
    
}

#helloAdmin{
background:  rgb(224,224,224) 
}

#img{

margin-right: 20px;
margin-left: 20px;

}

#logout{

margin-top: 10px; 
margin-bottom: 10px; 

}


</style>

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
		<a href="/admin/main">로그아웃</a>
	</div>
	</td>
</tr>


</table>

<c:import url="/WEB-INF/views/layout/footer.jsp" />