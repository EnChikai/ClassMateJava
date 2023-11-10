<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ON/OFF클래스 상세 조회</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
<hr>

<div style="width: 70px; height: 70px; background-color: red; margin-top: 10px;">사진</div>

<table class="table table-bordered">

<colgroup>
	<col style="width: 20%;">
	<col style="width: 80%;">
</colgroup>

<tr>
	<td class="table-info">강사</td><td>${classDetail.teacher }</td>
</tr>
<tr>
	<td class="table-info">클래스명</td><td>${classDetail.className }</td>
</tr>
<tr>
	<td class="table-info">클래스 기간</td><td><fmt:formatDate value="${classDetail.classStart }" pattern="yyyy - MM - dd"/> ~
		 <fmt:formatDate value="${class.classEnd }" pattern="yyyy - MM - dd"/></td>
</tr>
<tr>
	<td class="table-info">모집 정원</td><td>${classDetail.maxCount }</td>
</tr>
<tr>
	<td class="table-info">비용 및 안내</td><td>${classDetail.classInfo }</td>
</tr>
<tr>
	<td class="table-info">클래스 소개</td><td>${classDetail.content }</td>
</tr>
<tr>
	<td class="table-info">커리큘럼</td><td>${classDetail.curriculum }</td>
</tr>
<tr>
	<td class="table-info">영상 업로드</td><td>${classDetail.curriculum }</td>
	<td>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table>
	  <c:forEach items="${video }" var="video">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td>${video.videoLesson } 회차</td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	</td>
</tr>

<tr>
	<td colspan="2">${adress.adressNo }</td>
</tr>
</table> 

<button>목록</button>


<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />