<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.page-link.active{

	background: rgb(250,224,120);
	border: 1px solid rgb(230,204,100);
	
}
</style>

<div>
	
	<ul class="pagination pagination-sm justify-content-center">
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="<%= request.getContextPath() %>">&larr; 처음</a>
		</li>
		</c:if>
		
		
		
		<%-- 이전 페이지 리스트로 이동 --%>
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
		
		
		
		
		<%-- 이전 페이지로 이동 --%>
		<c:if test="${paging.curPage > 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }">&lt;</a>
			</li>
		</c:if>
		
		
		
	
		<%-- 페이징 번호 목록 --%>
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
		
		
		
		
		<%-- 다음 페이지로 이동 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }">&gt;</a>
			</li>
		</c:if>
		
		
		
		
		<%-- 다음 페이지 리스트로 이동 --%>
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

		
		
		
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }">끝 &rarr;</a>
		</li>
		</c:if>
		
	</ul>
	
</div>