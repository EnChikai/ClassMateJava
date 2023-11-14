<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
h2 {
	text-align: center;
    margin-top: 60px;
}
 
.idpw {
	border: 1px solid #ccc;
    width: 680px;
    height: 600px;
   	margin: 120px auto;
	margin-bottom: 160px;
}

h4 {
    margin-left: 185px;
    margin-top: 40px;
    font-weight: bold;
}

input {
	border: 1px solid #ccc;
	height: 25px;
    margin-left: -6px;
    width: 252px;
    border-radius: 3px;
}

label {
    margin-left: 185px;
    text-align: center;
}

.findId {
	line-height: 2;
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
	<h2>아이디/비밀번호 찾기</h2>
	
	<div>
	<h4>아이디로 찾기</h4>
	
	<div class="findId">
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 1.7px 9px; vertical-align: middle;">이메일</label>
	<input><br>
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 1.7px 17px; vertical-align: middle;">이름</label>
	<input><br>
	
	<button>아이디 찾기</button><br>
	
	<hr
	style="
	border: none;
    border-top: 1px solid gray;
    text-align: center;
    width: 43%;
    margin: 0 auto; /* 가운데 정렬을 위해 추가 */
    margin-bottom: 50px;">
	
	
	<h4>비밀번호로 찾기</h4>

	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 1.7px 9px; vertical-align: middle;">아이디</label>
	<input><br>
	<label style="border: 1px solid black; border-radius: 4px; background-color: black; color: white;
		   padding: 1.7px 17px; vertical-align: middle;">이름</label>
	<input><br>
	
	<button>비밀번호 찾기</button>

	</div><!-- .findId -->

	</div>
	
	
</div><!-- .idpw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />