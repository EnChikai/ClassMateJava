<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">



</script>

<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
}


.headerMenu {
	background-color: #F0C610;
	height: 55px;
}

#logo {
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	
}

.headerTh{
    padding-top: 16px;
    padding-right: 17px;
    padding-left: 17px;
}




</style>
</head>
<body style="overflow: auto; height: 100%;">
<div id="logo">
<a href="/main/main"><img src="/resources/img/logo.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>
<div class="headerMenu">

<table style="margin-left: auto; margin-right: auto; font-size: 15px;">
	<tr>
		<th class="headerTh"><a href="/main/mainCategory" style="text-decoration: none; color: black;">카테고리</a></th>
		<th class="headerTh"><a href="/board/board" style="text-decoration: none; color: black;">게시판</a></th>
		<th class="headerTh">검색</th>
		<th class="headerTh"><a href="/payment/basket" style="text-decoration: none; color: black;">장바구니</a></th>
		<th class="headerTh">ClassMate</th>
	</tr>
</table>
<c:if test="${isLogin==null}">
<div style="text-align: center; margin-left: 338px; margin-top: 25px; font-size: small;">
	<span><strong><a href="/user/login" style="text-decoration: none; color: black;">로그인</a></strong></span>
</div>
</c:if>

<c:if test="${isLogin!=null && teacherNo==null}">
<div class="container " style="text-align: center; margin-left: 609px; margin-top: 25px; font-size: small;">
	<span class="col"><strong><a href="/user/mypageMain" style="text-decoration: none; color: black;">마이페이지</a></strong></span>
	<span class="col"><strong>강사신청</strong></span>
	<span class="col"><strong>1:1문의</strong></span>
	<span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
</div>
</c:if>

<c:if test="${isLogin!=null && teacherNo!=null}">
<div class="container " style="text-align: center; margin-left: 609px; margin-top: 25px; font-size: small;">
	<span class="col"><strong><a href="/user/mypageMain" style="text-decoration: none; color: black;">마이페이지</a></strong></span>
	<span class="col"><strong><a href="/teacher/main" style="text-decoration: none; color: black;">강사페이지</a></strong></span>
	<span class="col"><strong>1:1문의</strong></span>
	<span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
</div>
</c:if>

</div>



