<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.defaultWidth {
	margin-left: 300px;
	margin-right: 300px;
	text-align: center;
}

.button {
	margin: auto;
}



.join {
	width: 350px;
	border: 1px solid rgba(0, 0, 0, .12);
	padding: 0 69px;
	margin: 30px auto 40px;
	font-size: 15px;
	box-sizing: border-box;
	display: inline-block;
}
</style>

<div class="defaultWidth">


<h1
	style="font-family: Impact; font-style: normal; font-weight: normal;
	color: #F0C610; font-size: 34px;">ClassMate</h1>

<form action="./login" method="post">
	<div class="idpw">
	
		<label><img style="width: 20px;" src="/resources/img/userId.png"><input type="text" name="userId"
			style="padding: 6px 12px;"></label><br>
		<label><input type="text" name="userPw" style="padding: 6px 12px;"></label><br>
		<br>
	</div>

	<div style="text-align: center;">
		<button
			style="background-color: #F0C610; border-radius: 4px; color: white; 
			font-size: 16px; padding: 10px; text-align: center; 
			display: inline-block; border: none;">로그인</button>
	</div>

	<div class="join">
		<a href="">계정이 없으신가요? 가입하기</a>
	</div>

	<div class="search">
		<a href="">아이디/비밀번호 찾기</a>
	</div>

</form>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
