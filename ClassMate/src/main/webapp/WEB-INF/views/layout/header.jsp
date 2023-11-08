<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
}

.header{
	width: 100%;
	height: 100px;
	margin: 10px auto;
	
}

.menu {
	background-color: #F0C610;
	height: 60px;
	margin-bottom: 50px;
}

#logo {
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	
}

th{
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
<body>
<div id="logo">
<a href="./main"><img src="/resources/img/4.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>
<div class="menu">
<table style="margin-left: auto; margin-right: auto; font-size: 20px;">
	<tr>
		<th><a href="">카테고리</a></th>
		<th><a href="">게시판</a></th>
		<th>검색</th>
		<th><a href="./basket">장바구니</a></th>
		<th><a href="">ClassMate</a></th>
	</tr>
</table>
</div>


