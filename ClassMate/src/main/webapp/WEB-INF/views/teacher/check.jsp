<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div>
<h1>클래스 조회</h1>
<br>
<hr>

<div class="title">
<h3 style="display: inline-block;">클래스 목록</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
	
<%-- <table>
<thead>
	<tr>
		<th>번호</th>
		<th>강좌명</th>
		<th>모집현황</th>
		<th>기간</th>
		<th>등록일</th>
	</tr>
</thead>

<tbody>
<c:forEach var="class" items="${list }">
	<tr>
		<td>${class.classNo }</td>
		<td>
			<a href="./detail?classNo=${class.classNo }">${class.className }</a>
		</td>
		<td>null / ${class.maxCount } 명</td>
		<td><fmt:formatDate value="${class.classStart }" pattern="yyyy년 MM월 dd일"/> ~
		 <fmt:formatDate value="${class.classEnd }" pattern="yyyy년 MM월 dd일"/></td>
		<td><fmt:formatDate value="${class.classDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
</c:forEach>
</tbody>		
</table> --%>




<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>
</div>
</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />