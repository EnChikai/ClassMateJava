<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="overflow: auto; height: 100%;">
<head>
<title>ClassMate</title>
<link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {

    //ClassMate 메인메뉴
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#classMateMenu").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });

    //카테고리
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu1").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //게시판
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu2").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //검색
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu3").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //장바구니
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu4").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "white");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //로그인
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu5").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "#F0C610");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //마이페이지
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu6").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "#F0C610");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //강사신청, 강사페이지
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu7").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "#F0C610");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //1:1문의
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu8").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "#F0C610");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });
    
    //로그아웃
    // 마우스를 올리면 글자색과 언더라인 변경
    $("#mainMenu9").mouseover(function () {
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "#F0C610");
        }
    }).mouseout(function () {
        // 마우스를 떼면 초기 스타일로 변경
        if (!$(this).hasClass("clicked")) {
            $(this).css("color", "black");
        }
    });

    // 클릭 시 스타일 고정 및 토글
    $("#classMateMenu").click(function () {
        $(this).toggleClass("clicked");
    });
    
    
    
    // ClassMateMenu 클릭 이벤트
    $("#classMateMenu").click(function () {
        // ClassMateMenu 토글 기능 추가
        $("#yourToggleElementId").toggle();

        // CSS 변경
        if ($("#yourToggleElementId").is(":visible")) {
            // ClassMateMenu 토글이 열린 경우
            $("#classMateMenu").css("color", "white");

            // 검색 메뉴 숨기기
            $("#searchInput").hide();
            $("#searchIcon").hide(); // 이미지도 함께 토글
            // 검색 메뉴 스타일 초기화
            $("#mainMenu3").css("color", "black");
        } else {
            // ClassMateMenu 토글이 닫힌 경우
            $("#classMateMenu").css("color", "black");
        }
    });

    // 검색 메뉴 클릭 시 토글
    $("#mainMenu3").click(function () {
        // 검색 메뉴 토글 기능 추가
        $("#searchInput").toggle();
        $("#searchIcon").toggle(); // 이미지도 함께 토글

        // CSS 변경
        if ($("#searchInput").is(":visible")) {
            // 검색 메뉴가 열린 경우
            $("#mainMenu3").css("color", "white");

            // ClassMateMenu 숨기기
            $("#yourToggleElementId").hide();
            // ClassMateMenu 스타일 초기화
            $("#classMateMenu").css("color", "black");
        } else {
            // 검색 메뉴가 닫힌 경우
            $("#mainMenu3").css("color", "black");
        }
    });

    // 마이페이지 메뉴 클릭 시 토글
    $("#mainMenu6").click(function () {
        // 마이페이지 메뉴 토글 기능 추가
        $("#yourToggleElementId").toggle();

        // CSS 변경
        if ($("#yourToggleElementId").is(":visible")) {
            // 마이페이지 메뉴가 열린 경우
            $("#mainMenu6").css("color", "#F0C610");

            // 검색 메뉴 숨기기
            $("#searchInput").hide();
            $("#searchIcon").hide(); // 이미지도 함께 토글
            // 검색 메뉴 스타일 초기화
            $("#mainMenu3").css("color", "black");
        } else {
            // 마이페이지 메뉴가 닫힌 경우
            $("#mainMenu6").css("color", "black");
        }
    });
    
    // 이미지 클릭 시 이벤트
    $("#searchIcon").click(function () {
        sendSearchRequest();
    });

    // Enter 키 입력 시 이벤트
    $("#searchInput").keypress(function (event) {
        if (event.which == 13) { // Enter 키 입력
            sendSearchRequest();
        }
    });

    // 검색 요청 보내는 함수
    function sendSearchRequest() {
        var searchText = $("#searchInput").val();
        if (searchText.trim() !== "") {
            // 경로로 데이터 전송
            window.location.href = "/search/all?search=" + encodeURIComponent(searchText);
        }
    }

});
</script>



<style type="text/css">

*{
   margin: 0px;
   padding: 0px;   
}

a{
   color: black;
   text-decoration: none;
}

.mainCol{
    margin-left: 16px;
    margin-right: 16px;
}

.search {
  position: relative;
  width: 300px;
  margin-top: 12px;
}

#searchInput {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

#searchIcon {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}

@media (min-width: 1100px) {
 .mainContainer {
 	margin-left: 625px;
 }

}



</style>
<div id="logo" style="padding-top: 40px;padding-bottom: 40px;text-align: center;position:relative; z-index: 10;">
<a href="/main/main"><img src="/resources/img/logo.jpg" width="150px;" height="80px;" title="로고"/></a>
</div>

<div class="headerMenu" style="background-color: #F0C610;height: 55px;position:relative; z-index: 10;">
<table style="margin-left: auto; margin-right: auto; font-size: 15px; position:relative; z-index: 10;">
   <tr>
      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
      	<a href="/main/mainCategory" id="mainMenu1" style="color: black; text-decoration: none;">카테고리</a></th>
      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
      	<a href="/board/board" id="mainMenu2" style="color: black; text-decoration: none;">게시판</a></th>
      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
      	<a id="mainMenu3" style="color: black; text-decoration: none; cursor: pointer;">검색</a></th>
	      <c:if test="${isLogin!=null }">
	      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
	      	<a href="/payment/basket" id="mainMenu4" style="color: black; text-decoration: none;">장바구니</a></th>
	      </c:if>
	      <c:if test="${isLogin==null }">
	      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
	      	<a href="/user/login" id="mainMenu4" style="color: black; text-decoration: none;">장바구니</a></th>
	      </c:if>
      <th class="headerTh" style="padding-top: 16px;padding-right: 17px;padding-left: 17px;padding-bottom: 16px;position:relative; z-index: 10;">
      	<span style="cursor: pointer;" id="classMateMenu">ClassMate</span></th>
   </tr>
</table>
<div style="text-align: -webkit-center;">
	<div class="search">
	    	<input id="searchInput" name="search" type="text" style=" display: none;" placeholder="검색어 입력">
	    	<img id="searchIcon" style="width: 25px; margin-bottom: 5px; display: none; cursor: pointer;" src="/resources/img/search1.png">
	</div>
</div>

<div id="yourToggleElementId" class="yourToggleClass" style="display: none;">
   <c:if test="${isLogin==null}">
   <div style="text-align: center; margin-left: 334px; margin-top: 25px; font-size: small; position:relative; z-index: 10;">
      <span><strong><a href="/user/login" id="mainMenu5" style="color: black; text-decoration: none;">로그인</a></strong></span>
   </div>
   </c:if>
   
   
   <c:if test="${isLogin!=null && teacherNo==null}">
   <div class="mainContainer" style="text-align: center; margin-top: 25px; font-size: small; position:relative; z-index: 10;">
      <span class="mainCol"><strong><a href="/user/mypageMain" id="mainMenu6" style="color: black; text-decoration: none;">마이페이지</a></strong></span>
      <span class="mainCol"><strong><a href="/teacher/apply" id="mainMenu7" style="color: black; text-decoration: none;">강사신청</a></strong></span>
      <span class="mainCol"><strong><a href="/board/question" id="mainMenu8" style="color: black; text-decoration: none;">1:1문의</a></strong></span>
      <span class="mainCol"><strong><a href="/user/logout" id="mainMenu9" style="color: black; text-decoration: none;">로그아웃</a></strong></span>
   </div>
   </c:if>
   
   <c:if test="${isLogin!=null && teacherNo!=null}">
   <div class="mainContainer" style="text-align: center; margin-top: 25px; font-size: small; position:relative; z-index: 10;">
      <span class="mainCol"><strong><a href="/user/mypageMain" id="mainMenu6" style="color: black; text-decoration: none;">마이페이지</a></strong></span>
      <span class="mainCol"><strong><a href="/teacher/main" id="mainMenu7" style="color: black; text-decoration: none;">강사페이지</a></strong></span>
      <span class="mainCol"><strong><a href="/board/question" id="mainMenu8" style="color: black; text-decoration: none;">1:1문의</a></strong></span>
      <span class="mainCol"><strong><a href="/user/logout" id="mainMenu9" style="color: black; text-decoration: none;">로그아웃</a></strong></span>
   </div>
   </c:if>

</div>

</div>
</head>
<body style="overflow: auto; height: 100%;">