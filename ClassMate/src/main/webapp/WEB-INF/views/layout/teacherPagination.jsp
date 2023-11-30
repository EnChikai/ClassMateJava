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



#onClassPaging1 {
	background-color: rgb(241, 196, 15);
	border-color: rgb(241, 196, 15);
	border-radius: 4px;
	margin: 3.5px;
	text-align: center;
	color: white;
}

#onClassPaging2 {
	border-radius: 4px;
	color: black;
	background-color: #f1f3f5;
	border-color: #f1f3f5;
	margin: 3.5px;
	text-align: center;
}

#onClassPaging3,#onClassPaging4,#onClassPaging5,#onClassPaging6 {
	border-radius: 4px;
	color: black;
	background-color: #f1f3f5;
	border-color: #f1f3f5;
	margin: 3.5px;
	text-align: center;
}

</style>


 	<div id="onClassPagination">
    	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
			
			<%-- 이전 페이지로 이동 --%>
			<c:if test="${paging.curPage > 1 }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }" id="onClassPaging6">&lt;</a>
				</li>
			</c:if>			
		
			<%-- 페이징 번호 목록 --%>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }" id="onClassPaging1">${i }</a>
				</li>
				</c:if>
				
				<c:if test="${paging.curPage ne i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }" id="onClassPaging2">${i }</a>
				</li>
				</c:if>
			</c:forEach>
					
			<%-- 다음 페이지로 이동 --%>
			<c:if test="${paging.curPage < paging.totalPage }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }" id="onClassPaging3">&gt;</a>
				</li>
			</c:if>
		</ul>
   	</div>