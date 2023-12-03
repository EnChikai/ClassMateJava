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
	
    $('.boardListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.boardListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

</script>

<%-- 클릭시 공지 상세보기로 --%>
<c:forEach var="questionList" items="${questionList }" > 
<script>
$(function(){
	
	$(".questionInfo${questionList.questionNo}").click(function(){
		
		location.href = '../admin/questionView?questionNo=${questionList.questionNo}';
		
	})
	
});
</script>
</c:forEach>

<%-- <% ============================================================================= %> --%>	
	
<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<a href="../admin/board"><button style="margin-left: 1px;" class="topMenuBtn">공지/이벤트</button></a>
<a href="../admin/freeBoardList"><button class="topMenuBtn">자유게시판</button></a>
<button class="topMenuBtn checked">1:1문의</button>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="boardInfo">&#x003C; 1:1 문의(Q&A) &#x003E;</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">

<form id="boardListForm" action="../admin/board" method="get">


<div style="position:relative; float: right; margin-right: 87px;" >
		
</div>

</form>
</div>
		
<table id="boardListTb">	
	
<tr>
	<th class="boardListTh" style="width: 50px;">번호</th>
	<th class="boardListTh" style="width: 400px;">제목</th>
	<th class="boardListTh" style="width: 100px;">등록일</th>
	<th class="boardListTh" style="width: 100px;">작성자</th>
	<th class="boardListTh" style="width: 70px;">답변</th>
</tr>

<c:forEach var="questionList" items="${questionList}">
<tr class="boardListTr" >
	<td class="boardListTd questionInfo${questionList.questionNo}">${questionList.questionNo }</td>
	<td class="boardListTd questionInfo${questionList.questionNo}">[${questionList.questionCategory }] ${questionList.questionName }</td>
	<td class="boardListTd questionInfo${questionList.questionNo}">${questionList.questionDate }</td>
	<td class="boardListTd questionInfo${questionList.questionNo}">${questionList.userName }</td>
	<td class="boardListTd questionInfo${questionList.questionNo}">${questionList.answer }</td>
<tr>
</c:forEach>

</table>

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