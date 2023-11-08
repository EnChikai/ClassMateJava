<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
<div>
	<ul class="pagination justify-content-center pagination-sm">
	
	<!-- 처음으로 -->
		<c:if test="${paging.curPage ne 1 }">
	<li class="pagn-item"><a class="page-link" href="<%= request.getContextPath() %>?curPage=1">&larr; 처음</a>
	</c:if>
	
	<!-- 이전 페이지 리스트로 이동 -->
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="pagn-item">
		<a class="page-link" href="./userList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
		</li>
	</c:when>
		
	<c:when test="${paging.startPage eq 1 }">
		<li class="pagn-item">
		<a class="page-link disabled">&laquo;</a>
		</li>
	</c:when>
	</c:choose>
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage>1 }">
		<li class="page-item">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }">&lt;</a>
		</li>
	</c:if>
	
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		
	<c:if test="${paging.curPage eq i }">
		<li class="pagn-item"><a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a></li>
	</c:if>
	
	<c:if test="${param.curPage ne i }">
		<li class="pagn-item"><a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a></li>
	</c:if>
	
	</c:forEach>
		
	<!-- 앞 페이지로 이동 -->
	<c:if test="${paging.curPage<paging.totalPage }">
		<li class="page-item">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }">&gt;</a>
		</li>
	</c:if>
	
	<!-- 앞 페이지 리스트로 이동 -->
	<c:choose>
	<c:when test="${paging.curPage ne paging.totalPage }">
		<li class="pagn-item">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.startPage + paging.pageCount }">&raquo;</a>
		</li>
	</c:when>
		
	<c:when test="${paging.startPage <= paging.totalPage }">
		<li class="pagn-item">
		<a class="page-link disabled">&raquo;</a>
		</li>
	</c:when>
	</c:choose>
	
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="pagn-item"><a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }">끝 &rarr;</a>
	</c:if>
	
	</ul>

</div>