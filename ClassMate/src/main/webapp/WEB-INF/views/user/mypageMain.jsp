<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.title {
	border: 1px solid #ccc;
	background-color: black;
	width: 900px;
	height: 175px;
	margin: auto;
	margin-top: 100px;
}

#member {
	color: white;
	font-size: 25px;
	font-weight: bold;
}

#member2 {
	color: white;
	font-size: 25px;
	font-weight: bold;
}

.title1 {
	margin-top: 87px;
	margin-left: 46px;
}

.titleBtn {
	float: right;
	margin-right: 37px;
}

button {
	height: 40px;
	border-radius: 4px;
	background-color: #F0C610;
	font-weight: bold;
	padding: 5px;
	font-size: 16px;
	border: outset;
	border-color: ghostwhite;
	cursor: pointer;
}

.OnOff {
	border: 1px solid #ccc;
	width: 900px;
	height: 400px;
	margin: auto;
	margin-top: 60px;
}

.pay {
	border: 1px solid #ccc;
	width: 900px;
	height: 400px;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 140px;
}

#text {
	border: 1px solid #ccc;
	width: 900px;
	height: 60px;
	background-color: #F1C40F;
	text-align: center;
}

#text2 {
	border: 1px solid #ccc;
	width: 900px;
	height: 60px;
	background-color: black;
	text-align: center;
}

#classIng {
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
	padding: 14px;
}

#history {
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
	padding: 14px;
	color: white;
}
</style>


<div class="title">
	<div class="title1">
		<label id="member">'OOO'님 의</label><br> <label id="member2">마이페이지입니다</label>

		<div class="titleBtn">
			<a href="/class/myOnClassList"><button
					style="background-color: #9E9E9E;">ON클래스 강의실</button></a> <a
				href="/user/updateUserData"><button>회원정보수정</button></a>
		</div>
	</div>
	<!-- .title1 -->
</div>
<!-- .title -->


<div class="OnOff">
	<div id="text">
		<label id="classIng">진행중인 ON/OFF 클래스</label>
	</div><!-- .text -->
	<c:choose>
		<c:when test="${not empty lecture}">
			<c:forEach var="lecture" items="${lecture}">
				<a href="${lecture.onOff eq '1' ? '/class/onClass?classNo=' : '/class/offClass?classNo='}${lecture.classNo}"
					class="stretched-link" style="color: inherit; text-decoration: none;">
					${lecture.className}</a>
					<br>
			</c:forEach>
		</c:when>
	</c:choose>
</div><!-- .OnOff -->

<div class="pay">
	<div id="text2">
		<label id="history">결제/수강 내역</label>
	</div>
	<!-- #tex2 -->
</div>
<!-- .pay -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />
