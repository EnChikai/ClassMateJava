<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>

.userSecession {
	text-align: center;
	border: 1px solid #ccc;
	width: 600px;
	height: 400px;
	margin: 100px auto 100px;
}

.ClassMate {
	font-size: 22px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.9em;
    border-radius: 4px;
    background-color: rgb(0, 0, 0);
    font-style: normal;
    font-family: HanSans;
    font-weight: bold;
    margin-top: 25px;
}

.title {
    margin-top: 70px;
    line-height: 2;
}

.title h4 {
	color: rgb(190, 190, 190);
}

button {
	font-size: 16px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2.2em;
    border-radius: 4px;
    border: none;
    background-color: rgb(241, 196, 15);
    width: 65px;
    margin-top: 45px;
}

</style>


<div class="userSecession">

	<div class="ClassMate">
		<span>ClassMate</span>
	</div><!-- .ClassMate -->

	<div class="title">
	<h2>회원 탈퇴를 진행하시겠습니까?</h2>
	<h4>탈퇴 시 ClassMate의 모든 서비스를 이용할 수 없게됩니다</h4>
	</div><!-- .title -->	

	<button>예</button>
	<button>아니요</button>


</div><!-- .userSecession -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
    