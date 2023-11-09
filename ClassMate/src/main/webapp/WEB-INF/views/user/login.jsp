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

.idpw{
    margin: 0 auto 10px;
}

.join {
	width: 227px;
	border: 1px solid rgba(0, 0, 0, .12);
    padding: 8px;
	margin: 15px auto 40px;
	font-size: 12px;
	font-weight: bold;
	box-sizing: border-box;
	display: inline-block;
	text-align: center;
	color: rgb(94, 94, 94);
}

#loginDiv {
	border: 1px solid #ccc;
    width: 481px;
    height: 325px;
    margin: 0 auto;
    margin-top: 6px;
}

#loginDiv1 {
	border: 1px solid #ccc;
	width: 500px;
    height: 341px;
    margin: 90px auto 10px auto;
}

#loginh1 {
	margin-top: 50px;
	margin-bottom: 20px;
}


#search {	
	text-align: center;
	margin-left: 327px;
    text-decoration: underline;
    color: rgb(41, 90, 221);
    font-size: 14px;
}

#searchDiv {
    margin-bottom: 100px;
}

</style>

<div class="defaultWidth">

<div id="loginDiv1">
<div id="loginDiv">

<h1 id="loginh1" style="font-family: Impact; font-style: normal; font-weight: normal;
	color: #F0C610; font-size: 30px;">ClassMate</h1>

<form action="./login" method="post">
	
	<div class="idpw">
	
	<label><img style="width: 20px;" src="/resources/img/userId.png">
		<input type="text" name="userId" style="padding: 6px 12px; border: 1px solid #ccc;
		    border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0,0,0,.075);"></label><br>
	<div style="margin-bottom: 8px;"></div>
	<label><img style="width: 20px;" src="/resources/img/key_1.png">
		<input type="password" name="userPw" style="padding: 6px 12px; border: 1px solid #ccc;
		    border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0,0,0,.075);"></label><br><br>
	</div>

	<div style="text-align: center;">
		<button
			style="background-color: #F0C610; border-radius: 4px; color: white; 
			font-size: 14px; text-align: center; cursor:pointer; 
			display: inline-block; border: none; width: 70px; height: 32px;">로그인</button>
	</div>

	<div>
		<a class="join" href="/user/join">계정이 없으신가요? 가입하기</a>
	</div>

</form>
</div><!-- .loginDiv -->	
</div><!-- .loginDiv1 -->


	<div id="searchDiv">
		<a id="search" href="" >아이디/비밀번호 찾기</a>
	</div>

</div><!-- .defaultWidth -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
