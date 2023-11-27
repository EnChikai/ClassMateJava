<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">

.joinOk {
	text-align: center;
	margin-top: 220px	
	
}

button {
    font-size: 20px; font-weight: bold;
	color: rgb(255, 255, 255);
	background-color: black;
	line-height: 2.5em;
	border-radius: 4px;
	text-align: center;
	width: 400px;
	margin-top: 45px;
    margin-bottom: 150px;
}

</style>


<div class="joinOk">
<form action="./joinOk" method="post">
	<img src="/resources/img/check-circle.png" style="width: 45px; margin-bottom: 20px;">
	<h1>가입이 완료되었습니다</h1>
	<p style="color: rgb(127, 127, 127); font-size: 16px; margin-top: 14px">입력하신 정보로 로그인해주세요</p>

     <!-- 로그인 버튼을 누르면 join 페이지로 이동 -->
    <a href="${pageContext.request.contextPath}/user/login">
        <button type="button" style="cursor: pointer;">로그인 하기</button>
    </a>
</form>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
