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
<div id= "all"><a href="/teacher/check"><img src="/resources/img/listIcon.png" id="allImg" alt="더하기" width="30" height="30" style="margin-bottom: 5px;"></a>
<a href="/teacher/check" style="background-color: FFF0F0">전체보기</a></div>
  
    <div style="width: 700px; min-height: 800px;">
    

     <c:forEach var="mainList" items="${mainList }">
	<div style="margin-bottom: 10px;">     
    	<table style="border: 1px #d2d2d2 solid; border-radius: 5px;">
    		<tr>
    			<td rowspan="2">
    			<img alt="썸네일 이미지" src="/upload/${mainList.headImg }" width="155" height="200" style="margin-right: 5px; border-right: 1px #d2d2d2 solid;">
    			</td>
    			<td style="height: 50px; text-align: center;">
    				<div style="width: 530; margin-left: 10px; font-weight:600; font-size: large;">
    					<a href="/teacher/detail?classNo=${mainList.classNo }">${mainList.className }</a>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td><div style="margin-left: 10px;">${mainList.classInfo }</div></td>
    		</tr>
    	</table>
    </div>
     </c:forEach>
    
</div>

 

  <div style="margin-top: 10px; margin-bottom: 10px;">
	
	<ul class="pagination pagination-sm justify-content-center">
 		<!-- 첫 페이지로 이동 -->
		<c:if test="${paging.curPage ne 1 }">
 		<li class="page-item">
			<a class="page-link" href="<%= request.getContextPath() %>">&larr; 처음</a>
 		</li>
		</c:if>
		
		
		
		<!-- 이전 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.startPage eq 1 }">
			<li class="page-item">
				<a class="page-link disabled">&laquo;</a>
			</li>
			</c:when>
		</c:choose>
		
		
		
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${paging.curPage > 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }">&lt;</a>
			</li>
		</c:if>
		
		
		
	
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a>
			</li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a>
			</li>
			</c:if>
		</c:forEach>
		
		
		
		
		<!-- 다음 페이지로 이동 -->
		<c:if test="${paging.curPage < paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }">&gt;</a>
			</li>
		</c:if>
		
		
		
		
		<!-- 다음 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }">&raquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="page-item">
				<a class="page-link disabled">&raquo;</a>
			</li>
			</c:when>
		</c:choose>

		
		
		
		<!-- 끝 페이지로 이동 -->
 		<c:if test="${paging.curPage ne paging.totalPage }">
 		<li class="page-item">
 			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }">끝 &rarr;</a>
 		</li>
 		</c:if>
		
	</ul>
	
</div> 

</div>	<!-- cd1 box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />