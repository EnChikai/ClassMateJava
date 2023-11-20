<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">

/* 아이디/비밀번호 찾기 */
.idpw2 h1 {
	text-align: center;
    margin-top: 60px;
    font-weight: bold;
}
 
.idpw {
	border: 1px solid #ccc;
    width: 680px;
    height: 660px;
   	margin: 120px auto;
	margin-bottom: 160px;
}

.idpw2 h4 {
    margin-left: 185px;
    margin-top: 40px;
    font-weight: bold;
    font-size: 18px;
}

.idpw input {
	border: 1px solid #ccc;
	height: 35px;
    margin-left: -6px;
    width: 252px;
    border-radius: 3px;
    vertical-align: middle;
}

.idpw label {
    margin-left: 185px;
    text-align: center;
}

.findId {
	line-height: 2.5;
}

.findId button {
    display: block;
    margin: 0 auto;
    margin-top: 40px;
    background-color: #F1C40F;
    font-size: 13px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2em;
    border: none;
    border-radius: 4px;
    width: 100px;
}

</style>


<div class="idpw">
<div class="idpw2">

<form action="${pageContext.request.contextPath}/user/searchIdPw" method="post">

	<h1>아이디/비밀번호 찾기</h1>
	 
	<div>
	<h4>아이디로 찾기</h4>
	
	<div class="findId">
	<label style="border: 1px solid black; 
		   border-radius: 4px;
		   background-color: black;
		   color: white;
		   padding: 7px 9px;
		   vertical-align: middle;">이메일</label>
	<input type="text" name="userEmail"><br>
	
	<label style="border: 1px solid black;
		   border-radius: 4px;
		   background-color: black;
		   color: white;
		   padding: 7px 17px;
		   vertical-align: middle;">이름</label>
	<input type="text" name="userName"><br>
	
	<button>아이디 찾기</button><br>
	
	<hr style=" border: none; border-top: 1px solid gray;
    text-align: center; width: 43%;
    margin: 0 auto; /* 가운데 정렬을 위해 추가 */
    margin-bottom: 50px;">
	
	
	<h4>비밀번호로 찾기</h4>

	<label style="border: 1px solid black;
		   border-radius: 4px;
		   background-color: black;
		   color: white;
		   padding: 7px 9px;
		   vertical-align: middle;">아이디</label>
	<input type="text" name="userId"><br>
	
	<label style="border: 1px solid black;
	  	   border-radius: 4px;
	  	   background-color: black;
	  	   color: white;
		   padding: 7px 17px;
		   vertical-align: middle;">이름</label>
	<input type="text" name="userName"><br>
	
	<button>비밀번호 찾기</button>

	</div><!-- .findId -->

	</div>
	</form>
	
</div><!-- .idpw2 -->
</div><!-- .idpw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
