<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<style >
.resetPw {
	text-align: center;
	border: 1px solid #ccc;
	width: 600px;
	height: 400px;
	margin: auto;
	
}

.resetPw2 {
	line-height: 3;
}

button {
    display: block;
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

</style>

<div class="resetPw">

<h1 style="margin-top: 70px;">비밀번호 확인</h1>
<h3 style="color: #333; margin-bottom: 16px; font-size: 17px;">비밀번호를 재설정합니다</h3>

	<div class="resetPw2">
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 9px 21px; vertical-align: middle;">비밀번호</label>
	<input><br>
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 9px 5px; vertical-align: middle;">비밀번호확인</label>
	<input><br>

	<button>확인</button>






</div><!-- .restPw2 -->
</div><!-- .resetPw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
