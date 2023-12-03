<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}

#boardInfo{
padding-bottom: 8px; 
text-align: center; 
margin-left: auto;
margin-right: auto;
margin-top: 20px;
margin-bottom: 17px; 
font-size: 22px; 
font-weight:bold;

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
background: rgb(241,196,15);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(231,186,5);
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
width: 690px; 
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
width: 484px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
height: 30px;
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

#delCheckbox{
position:absolute;
width:20px;
height:20px;
top:10%;
margin-left: 5px;

}

</style>


<%-- 페이징 CSS --%>
<style type="text/css">
#pagination {
   margin-bottom: 20px;
}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingNow {
   border-radius: 4px; 
   color: black; 
   background-color: rgb(251,206,25); 
   border: 1px solid rgb(241,196,15);
   margin: 3.5px; 
   text-align: center;"

}

#pagingAfter,#pagingBefore {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;
}
</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){

	$(".dropTag").change(function(){
		
		$('#boardListForm').submit();
		
	})
	
});

$(function(){
	
	var delCheckbox = document.getElementById("delCheckbox");
	
	$("#delCheckbox").click(function(){
		if($(this).is(":checked")){
			delCheckbox.value = 1;
			$('#boardListForm').submit();
		} else {
			delCheckbox.value = 0; 
			$('#boardListForm').submit();
		}
	})
	
});

$(function(){
	
    $('.boardListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.boardListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

</script>

<%-- 클릭시 공지 상세보기로 --%>
<c:forEach items="${announceBoardList }" var="announceBoardList"> 
<script>
$(function(){
	
	$(".announceInfo${announceBoardList.announceNo }").click(function(){
		
		location.href = '../admin/announceView?curPage=${paging.curPage}&sort=${sort}&delCheckbox=${delCheckbox}&announceNo=${announceBoardList.announceNo }';
		
	})
	
});
</script>
</c:forEach>

<%-- 클릭시 이벤트 상세보기로 --%>
<c:forEach items="${eventBoardList }" var="eventBoardList"> 
<script>
$(function(){
	
$(".eventInfo${eventBoardList.eventNo }").click(function(){
		
		location.href = '../admin/eventView?curPage=${paging.curPage}&sort=${sort}&delCheckbox=${delCheckbox}&eventNo=${eventBoardList.eventNo }';
		
	})
	
});
</script>
</c:forEach>
	
<%-- <% ============================================================================= %> --%>	
	
<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<button style="margin-left: 1px;" class="topMenuBtn checked">공지/이벤트</button>
<a href="../admin/freeBoardList"><button class="topMenuBtn">자유게시판</button></a>
<a href="../admin/questionList"><button class="topMenuBtn">1:1문의</button></a>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="boardInfo">&#x003C; 이벤트 및 공지사항 &#x003E;</p>

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

<div style="position:relative; float: right; margin-right: 87px;" >
		
		<c:if test="${delCheckbox eq 0}">
        	삭제 게시물 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="0">
        </c:if>
        <c:if test="${delCheckbox eq 1}">
        	삭제 게시물 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="1" checked="checked">
		</c:if>
		
</div>

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
		<td class="boardListTd announceInfo${announceBoardList.announceNo }"><fmt:formatDate value="${announceBoardList.announceDate }" pattern="yyyy-MM-dd" /></td>
	<tr>
</c:forEach>
</c:if>

<c:if test="${sort eq 1}">
<c:forEach items="${eventBoardList }" var="eventBoardList"> 
	<tr class="boardListTr" >
		<td class="boardListTd eventInfo${eventBoardList.eventNo }">${eventBoardList.eventNo }</td>
		<td id="boardNameInfo" class="boardListTd eventInfo${eventBoardList.eventNo }">${eventBoardList.eventName }</td>
		<td class="boardListTd eventInfo${eventBoardList.eventNo }"><fmt:formatDate value="${eventBoardList.eventDate }" pattern="yyyy-MM-dd" /></td>
	<tr>
</c:forEach>
</c:if>

</table>

<div style="text-align: right; padding-right: 70px; margin-top: 10px;">
<a href="../admin/writeEventAnno"><button id="insertBtn">등록</button></a>
</div>

<div style="margin-top: 8px;">

<%-- <% ============================================================================= %> --%>

<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	

<%-- <% ============================================================================= %> --%>

</div>	
</div>

<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />