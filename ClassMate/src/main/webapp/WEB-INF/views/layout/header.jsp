<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {


    $("#classMateMenu").mouseup(function () {
        // 토글 기능 추가
        $("#yourToggleElementId").toggle();

        // CSS 변경
        if ($("#yourToggleElementId").is(":visible")) {
            // 토글이 열린 경우
            $("#classMateMenu").css("color", "white");
        } else {
            // 토글이 닫힌 경우
            $("#classMateMenu").css("color", "black"); // 예시로 배경색을 원래 색으로 변경
        }
    });
});
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
    padding-bottom: 16px;
    
}

a{
   color: black;
   text-decoration: none;
}

.yourToggleClass {
    display: none; /* 초기에는 숨김 상태로 설정 */
    /* 추가적인 스타일이 필요하면 여기에 추가하십시오. */
}








</style>
<div id="logo">
<a href="/main/main"><img src="/resources/img/logo.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>

<div class="headerMenu">
<table style="margin-left: auto; margin-right: auto; font-size: 15px;">
   <tr>
      <th class="headerTh"><a href="/main/mainCategory" style="text-decoration: none; color: black; height: 55px;">카테고리</a></th>
      <th class="headerTh"><a href="/board/board" style="text-decoration: none; color: black; height: 55px;">게시판</a></th>
      <th class="headerTh" style="height: 55px;">검색</th>
      <c:if test="${isLogin!=null }">
      <th class="headerTh"><a href="/payment/basket" style="text-decoration: none; color: black; height: 55px;">장바구니</a></th>
      </c:if>
      <c:if test="${isLogin==null }">
      <th class="headerTh"><a href="/user/login" style="text-decoration: none; color: black; height: 55px;">장바구니</a></th>
      </c:if>
      <th class="headerTh" id="classMateMenu"><span style="cursor: pointer; height: 55px;">ClassMate</span></th>
   </tr>
</table>

<div id="yourToggleElementId" class="yourToggleClass">
   <c:if test="${isLogin==null}">
   <div style="text-align: center; margin-left: 334px; margin-top: 25px; font-size: small;">
      <span><strong><a href="/user/login" style="text-decoration: none; color: black;">로그인</a></strong></span>
   </div>
   </c:if>
   
   <c:if test="${isLogin!=null && teacherNo==null}">
   <div class="container " style="text-align: center; margin-left: 625px; margin-top: 25px; font-size: small;">
      <span class="col"><strong><a href="/user/mypageMain" style="text-decoration: none; color: black;">마이페이지</a></strong></span>
      <span class="col"><strong>강사신청</strong></span>
      <span class="col"><strong><a href="/board/question" style="text-decoration: none; color: black;">1:1문의</a></strong></span>
      <span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
   </div>
   </c:if>
   
   <c:if test="${isLogin!=null && teacherNo!=null}">
   <div class="container " style="text-align: center; margin-left: 625px; margin-top: 25px; font-size: small;">
      <span class="col"><strong><a href="/user/mypageMain" style="text-decoration: none; color: black;">마이페이지</a></strong></span>
      <span class="col"><strong><a href="/teacher/main" style="text-decoration: none; color: black;">강사페이지</a></strong></span>
      <span class="col"><strong><a href="/board/question" style="text-decoration: none; color: black;">1:1문의</a></strong></span>
      <span class="col"><strong><a href="/user/logout" style="text-decoration: none; color: black;">로그아웃</a></strong></span>
   </div>
   </c:if>

</div>

</div>
</head>
<body style="overflow: auto; height: 100%;">