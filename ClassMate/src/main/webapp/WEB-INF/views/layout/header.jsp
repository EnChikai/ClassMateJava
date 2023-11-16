<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<meta charset="UTF-8">
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

a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}

.defaultWidth {
    margin-left: 400px;
    margin-right: 400px;
    margin-top: 56px;
    margin-bottom: 80px;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body style="overflow: auto; height: 100%;">
<div id="logo">
<a href="/main/main"><img src="/resources/img/logo.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>
<div class="headerMenu">

<table style="margin-left: auto; margin-right: auto; font-size: 15px;">
	<tr>
	<c:if test="${isLogin!=null}">
		<th class="headerTh"><a href="/main/mainCategory" style="text-decoration: none;	color: black;">카테고리</a></th>
		<th class="headerTh"><a href="/board/board" style="text-decoration: none; color: black;">게시판</a></th>
		<th class="headerTh">검색</th>
		<th class="headerTh"><a href="/payment/basket" style="text-decoration: none; color: black;">장바구니</a></th>
		<th class="headerTh" id="login">ClassMate</th>
	</c:if>
	<c:if test="${isLogin==null}">
		<th class="headerTh"><a href="/user/login" style="text-decoration: none; color: black;">카테고리</a></th>
		<th class="headerTh"><a href="/user/login" style="text-decoration: none; color: black;">게시판</a></th>
		<th class="headerTh">검색</th>
		<th class="headerTh"><a href="/user/login" style="text-decoration: none; color: black;">장바구니</a></th>
		<th class="headerTh" id="login">ClassMate</th>
	</c:if>
	</tr>
</table>
<c:if test="${isLogin==null}">
<div style="text-align: center; margin-left: 338px; margin-top: 25px; font-size: small;">
	<span><strong><a href="/user/login" style="text-decoration: none; color: black;">로그인</a></strong></span>
</div>
</c:if>

<c:if test="${isLogin!=null && teacherNo==null}">
<div class="container " style="text-align: center; margin-left: 609px; margin-top: 25px; font-size: small;">
	<span class="col"><strong>마이페이지</strong></span>
	<span class="col"><strong>강사신청</strong></span>
	<span class="col"><strong>1:1문의</strong></span>
	<span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
</div>
</c:if>

<c:if test="${isLogin!=null && teacherNo!=null}">
<div class="container " style="text-align: center; margin-left: 609px; margin-top: 25px; font-size: small;">
	<span class="col"><strong>마이페이지</strong></span>
	<span class="col"><strong><a href="/teacher/main" style="text-decoration: none; color: black;">강사페이지</a></strong></span>
	<span class="col"><strong>1:1문의</strong></span>
	<span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
</div>
</c:if>

</div>

<div class="defaultWidth">

