<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">

.updatePw {
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
	margin-top: 115px;
    margin-bottom: 150px;
}

</style>


<div class="updatePw">
	<img src="/resources/img/check-circle.png" style="width: 45px; margin-bottom: 20px;">
	<h1>비밀번호 재설정이 완료되었습니다</h1>
	<p style="color: rgb(127, 127, 127); font-size: 16px; margin-top: 14px">설정된 비밀번호로 로그인이 가능합니다</p>

    <!-- JavaScript를 사용하여 버튼 클릭 시 로그인 페이지로 이동 -->
    <button onclick="redirectToLoginPage()">로그인 하기</button>
</div>

<script>
    function redirectToLoginPage() {
        // 로그인 페이지로 이동
        window.location.href = './login';
    }
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
