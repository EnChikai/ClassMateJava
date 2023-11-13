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
    width: 745px;
    height: 700px;
   	margin: 120px auto;
	margin-bottom: 160px;
}

h4 {
    margin-left: 211px;
    margin-top: 40px;
    font-weight: bold;
}

input {
	border: 1px solid #ccc;
	height: 24px;
    margin-left: -6px;
}

label {
    margin-left: 212px;
    text-align: center;
}

.findId {
	line-height: 2;
	
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
	<input>
	</div><!-- .findId -->

	</div>
	
	
</div><!-- .idpw -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
