<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">






<style type="text/css">


.col{
	width: 331px;
    margin-left: 16px;
    margin-right: 16px
    
}

.TOP5{
	background-color: #F0C610;
	display: inline-block;
	padding: 15px;
	border-radius:5% 5% 0 0;
	margin-left: 15px;
}

.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
	margin-top: 35px;
}







</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth">

<div class="container">
<span class="TOP5"><strong>이벤트 썸네일</strong></span><br>
<c:forEach var="list" items="${selectByEventFileList }">
<a href="/board/eventView?eventNo=${list.eventNo }"><img src="/upload/${list.headImg }"></a>
</c:forEach>
</div>

<br><br><br>


<div class="container">
<span class="TOP5"><strong>인기 ON TOP5</strong></span><br>
<c:forEach var="list" items="${onClassOrderTopList }">
<a href="/main/onClassView?classNo=${list.classNo }"><img src="/upload/${list.headImg }">
${list.className }</a>
</c:forEach>
</div>

<br><br><br>

<div class="on-container">
<span class="TOP5"><strong>인기 OFF TOP5</strong></span><br>
<c:forEach var="list" items="${offClassOrderTopList }">
<a href="/main/offClassView?classNo=${list.classNo }"><img src="/upload/${list.headImg }">
${list.className }</a>
</c:forEach>
</div>

<br><br><br>

<div class="on-container">
<span class="TOP5"><strong>추천 ON/OFF</strong></span><br>
  <c:forEach var="i" begin="0" end="4">
    <a href="/main/onClassView?classNo=${onRecommended[i].classNo }"><img src="/upload/${onRecommended[i].headImg}">
    ${onRecommended[i].className}</a>

    <a href="/main/offClassView?classNo=${offRecommended[i].classNo }"><img src="/upload/${offRecommended[i].headImg}">
    ${offRecommended[i].className}</a>
  </c:forEach>
</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
