<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">

#underLineBlack{
border-bottom: 138px solid black;
width: 282px;
float: left;
}

#logo{
text-align: center;
height: 137px;

display: flex;
justify-content: center;
align-items: center;
}

#underLineGray{
border-bottom: 1px solid gray;
}

#flame{
width:1200px;
margin-left: auto;
margin-right: auto;
}

<%-- <% ============================================================================= %> --%>

#adminMenu{
width: 280px;
}

#menuTop{
background: black;
}

.underMenu{
background: rgb(158,158,158);
color: white;

}

.adminPage{
height: 102px;
text-align: right;
font-size: 22px;
}

.menuFontPadding{
padding-right: 17px;
padding-top: 20px;
padding-bottom: 20px;
width: 280px;
}

<%-- <% ============================================================================= %> --%>

.changeBack:hover:not(.active){

background: rgb(241,196,15) 

}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin: 0; overflow: auto; height: 100%;">

<div id="flame">
<div id="underLineBlack"></div>
<div id="logo"><a href="../admin/main"><img title="로고" alt="로고" src="/resources/img/4.jpg" width="150px;" height="80px;"></div></a>

<div id="underLineGray"></div>

<div id="adminMenu">

<div>
	<table style="border-spacing: 0;">
		<tr id="menuTop">
			<th class ="adminPage" style="color: white;">
				<div class="menuFontPadding">
				<a style="text-decoration: none; color: white;" href="./main">관리페이지</a>
				</div>
			</th>
			<td style="background: white; vertical-align: top;" rowspan='6'>

