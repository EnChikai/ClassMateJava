<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
}


.headerMenu {
	background-color: #F0C610;
	height: 60px;
	margin-bottom: 50px;
}

#logo {
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	
}

.headerTh{
    padding-top: 12px;
    padding-right: 17px;
    padding-left: 17px;
}

a{
	text-decoration: none;
	color: black;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body style="overflow: auto; height: 100%;">
<div id="logo">
<a href="/main/main"><img src="/resources/img/logo.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>
<div class="headerMenu">
<table style="margin-left: auto; margin-right: auto; font-size: 20px;">
	<tr>
		<th class="headerTh"><a href="">카테고리</a></th>
		<th class="headerTh"><a href="/board/board">게시판</a></th>
		<th class="headerTh">검색</th>
		<th class="headerTh"><a href="/payment/basket">장바구니</a></th>
		<th class="headerTh">ClassMate</th>
	</tr>
</table>

<div>
<ul>
	<li>마이페이지</li>
	<li>강사신청</li>
	<li>1:1문의</li>
	<li>로그인</li>
</ul>
</div>
</div>


