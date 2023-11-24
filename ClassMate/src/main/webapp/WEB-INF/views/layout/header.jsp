<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    // ClassMateMenu 클릭 이벤트
    $("#classMateMenu").click(function () {
        // 토글 기능 추가
        $("#yourToggleElementId").toggle();

        // CSS 변경
        if ($("#yourToggleElementId").is(":visible")) {
            // 토글이 열린 경우
            $("#classMateMenu").css("color", "white");
            $("#classMateMenu").css("text-decoration", "underline");
        } else {
            // 토글이 닫힌 경우
            $("#classMateMenu").css("color", "black");
            $("#classMateMenu").css("text-decoration", "none");
        }
    });

    // 마우스를 올리면 글자색과 언더라인 변경
    $(".headerTh").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
            $(this).css("text-decoration", "underline");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
            $(this).css("text-decoration", "none");
        }
    });

    // 클릭 시 스타일 고정 및 토글
    $(".headerTh").click(function () {
        $(this).toggleClass("clicked");
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
            $(this).css("text-decoration", "none");
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
      <th class="headerTh" id=""><a href="/main/mainCategory">카테고리</a></th>
      <th class="headerTh"><a href="/board/board">게시판</a></th>
      <th class="headerTh">검색</th>
      <c:if test="${isLogin!=null }">
      <th class="headerTh"><a href="/payment/basket">장바구니</a></th>
      </c:if>
      <c:if test="${isLogin==null }">
      <th class="headerTh"><a href="/user/login">장바구니</a></th>
      </c:if>
      <th class="headerTh" id="classMateMenu"><span style="cursor: pointer;">ClassMate</span></th>
   </tr>
</table>

<div id="yourToggleElementId" class="yourToggleClass">
   <c:if test="${isLogin==null}">
   <div style="text-align: center; margin-left: 334px; margin-top: 25px; font-size: small;">
      <span><strong><a href="/user/login">로그인</a></strong></span>
   </div>
   </c:if>
   
   <c:if test="${isLogin!=null && teacherNo==null}">
   <div class="container " style="text-align: center; margin-left: 625px; margin-top: 25px; font-size: small;">
      <span class="col"><strong><a href="/user/mypageMain">마이페이지</a></strong></span>
      <span class="col"><strong>강사신청</strong></span>
      <span class="col"><strong><a href="/board/question">1:1문의</a></strong></span>
      <span class="col"><strong><a href="/user/logout">로그아웃</a></strong></span>
   </div>
   </c:if>
   
   <c:if test="${isLogin!=null && teacherNo!=null}">
   <div class="container " style="text-align: center; margin-left: 625px; margin-top: 25px; font-size: small;">
      <span class="col"><strong><a href="/user/mypageMain">마이페이지</a></strong></span>
      <span class="col"><strong><a href="/teacher/main">강사페이지</a></strong></span>
      <span class="col"><strong><a href="/board/question">1:1문의</a></strong></span>
      <span class="col"><strong><a href="/user/logout">로그아웃</a></strong></span>
   </div>
   </c:if>

</div>

</div>
</head>
<body style="overflow: auto; height: 100%;">