<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<div class="cd1">
<h1>강사페이지</h1>
<div id= "all"><a href="/teacher/check" style="margin-left: 630px;">전체보기</a></div>
    <div class="border" style="width: 700px; min-height: 800px;">
    
     <c:forEach var="list" items="${list }">
	<div>     
    	<table>
    		<tr>
    			<td>${list.headImg }</td>
    			<td><div>${list.className }</div><div>${list.classInfo }</div></td>
    		</tr>
    	</table>
    </div>
     </c:forEach>
    
</div>
<hr>






  
<c:import url="/WEB-INF/views/layout/pagination.jsp" />


</div>	<!-- cd1 box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />