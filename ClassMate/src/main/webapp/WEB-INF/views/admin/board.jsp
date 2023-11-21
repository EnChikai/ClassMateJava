<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">

#boardInfo{
font-size: 17px; 
padding-bottom: 8px; 
text-align: center; 
width: 620px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}


#boardInfoTb th{
padding-left:30px;
text-align: right;
vertical-align: top;

}

#boardInfoTb td{
padding-left: 42px; 
padding-bottom: 7px;

}

.topMenuBtn{
background: white;
border-radius: 3px; 
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
font-size:14px;
padding-top : 12px;
padding-bottom : 12px;
padding-left: 14px; 
padding-right: 14px;
vertical-align: bottom;

}

.checked{
background: rgb(243,156,18);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(243,156,18);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

#boardListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 574px; 
margin: auto;

}

.boardListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.boardListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

}

#boardNameInfo{
display: inline-block;
width: 420px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
padding-top: 1px;

}

#insertBtn{
border-radius: 3px; 
border-style: hidden;
width: 44px; 
height: 30px;
color: white;
font-size: 13px;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#insertBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

.boardListTd:hover:not(.active){
cursor:pointer;

}

</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){

	$(".dropTag").change(function(){
		
		$('#boardListForm').submit();
		
	})
	
});

</script>

<%-- 클릭시 공지 상세보기로 --%>
<c:forEach items="${announceBoardList }" var="announceBoardList"> 
<script>
$(function(){
	
	$(".announceInfo${announceBoardList.announceNo }").click(function(){
		
		location.href = '../admin/announceView?announceNo=${announceBoardList.announceNo }';
		
	})
	
});
</script>
</c:forEach>
	
<%-- <% ============================================================================= %> --%>	
	
<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<button style="margin-left: 1px;" class="topMenuBtn checked">공지/이벤트</button>
<button class="topMenuBtn">회원게시판</button>
<button class="topMenuBtn">1:1문의</button>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 700px; margin-left: 72px; margin-bottom: 20px;">

<p id="boardInfo">< 이벤트 및 공지사항 ></p>

<div style="text-align: left; margin-left: auto; margin-bottom: 10px">

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">

<form id="boardListForm" action="../admin/board" method="get">

<c:if test="${sort eq 0}">
<select class="dropTag" name="sort" id="sort">
	<option value="0">공지사항</option>
	<option value="1">이벤트</option>
</select>
</c:if>

<c:if test="${sort eq 1}">
<select class="dropTag" name="sort" id="sort">
	<option value="1">이벤트</option>
	<option value="0">공지사항</option>
</select>
</c:if>

</form>
</div>
		
<table id="boardListTb">	
	
<tr>
	<th class="boardListTh" width="10%">번호</th>
	<th class="boardListTh" width="70%">제목</th>
	<th class="boardListTh" width="20%">등록일</th>
</tr>

<c:if test="${sort eq 0}">
<c:forEach items="${announceBoardList }" var="announceBoardList"> 
	<tr class="boardListTr" >
		<td class="boardListTd announceInfo${announceBoardList.announceNo }">${announceBoardList.announceNo }</td>
		<td id="boardNameInfo" class="boardListTd announceInfo${announceBoardList.announceNo }">${announceBoardList.announceName }</td>
		<td class="boardListTd announceInfo${announceBoardList.announceNo }">${announceBoardList.announceDate }</td>
	<tr>
</c:forEach>
</c:if>

<c:if test="${sort eq 1}">
<c:forEach items="${eventBoardList }" var="eventBoardList"> 
	<tr class="boardListTr" >
		<td class="boardListTd eventInfo${eventBoardList.eventNo }">${eventBoardList.eventNo }</td>
		<td id="boardNameInfo" class="boardListTd eventInfo${eventBoardList.eventNo }">${eventBoardList.eventName }</td>
		<td class="boardListTd eventInfo${eventBoardList.eventNo }">${eventBoardList.eventDate }</td>
	<tr>
</c:forEach>
</c:if>

</table>

<div style="text-align: right; padding-right: 70px; margin-top: 10px;">
<a href="../admin/writeEventAnno"><button id="insertBtn">등록</button></a>
</div>

<%-- <% ============================================================================= %> --%>

<div style="margin-top: 8px;">
	
	<ul class="pagination pagination-sm justify-content-center">
		
		
		<%-- 이전 페이지 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath() %>?curPage=${paging.startPage - paging.pageCount }&sort=${sort}&delCheckbox=${delCheckbox}">&laquo;</a>
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
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}">&lt;</a>
			</li>
		</c:if>
		
		
		
	
		<%-- 페이징 번호 목록 --%>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}">${i }</a>
			</li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}">${i }</a>
			</li>
			</c:if>
		</c:forEach>
		
		
		
		
		<%-- 다음 페이지로 이동 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}">&gt;</a>
			</li>
		</c:if>
		
		
		
		
		<%-- 다음 페이지 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }&sort=${sort}">&raquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="page-item">
				<a class="page-link disabled">&raquo;</a>
			</li>
			</c:when>
		</c:choose>

	</ul>	

<%-- <% ============================================================================= %> --%>
	
</div>

</div>
</div>
	
<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />