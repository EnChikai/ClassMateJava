<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.resetPw {
	text-align: center;
	border: 1px solid #ccc;
	width: 545px;
	height: 400px;
    margin: 145px auto 145px auto;	
}

.resetPw2 {
	line-height: 3;
}

.resetPw2 

button {
    margin: 0 auto;
    margin-top: 40px;
    background-color: #F1C40F;
    font-size: 17px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2em;
    border: none;
    border-radius: 4px;
    width: 100px;
}

input {
	border: 1px solid #ccc;
	height: 40px;
    margin-left: -6px;
    width: 250px;
    border-radius: 3px;
}

h3 {
	color: #333; 
	margin-bottom: 25px; 
	font-size: 17px;
}

#title {
	border: 1px solid;
	width: 543px;
	height: 60px;
	background-color: black;
	margin-top: 30px;
    margin-bottom: 55px;
}

#title label {
	color: white;
	font-size: 25px;
    font-weight: bold;
    display: inline-block;
    margin-top: 11px;
}

</style>

<div class="resetPw">

	<div id="title"><label>정보확인</label></div>
	<h3>개인정보 확인을 위해 비밀번호를 입력해주세요.</h3>

	<div class="resetPw2">
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 9px 21px; vertical-align: middle;">비밀번호</label>
	<input type="password"><br>
	
	<button>확인</button>
	<button style="background-color: #9E9E9E;">취소</button>






</div><!-- .restPw2 -->
</div><!-- .resetPw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
