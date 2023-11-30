<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>
<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
	
}

.userInfo{
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

#questionListTb, #freeBoardListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;

}

.questionListTh, .freeBoardListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.questionListTd, .freeBoardListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

}

.questionListTd:hover:not(.active), .freeBoardListTd:hover:not(.active){
cursor:pointer;

}
</style>

<%-- 페이징 CSS --%>
<style type="text/css">
#questionPaging {
   margin-top: -40px;
   margin-bottom: 50px;
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
   background-color: rgb(241,196,15); 
   border: 1px solid rgb(251,206,25);
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
	
    $('.questionListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.questionListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });
    
    $('.freeBoardListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.freeBoardListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})
</script>

<%-- 클릭시 클래스 상세보기로 --%>
<c:forEach items="${questionList }" var="questionList"> 
<script>
$(function(){
	
	$(".questionInfo${questionList.questionNo }").click(function(){
		
		location.href = '../admin/userQuestionView?questionNo=${questionList.questionNo}';
		
	})
	
});
</script>
</c:forEach>

<c:forEach items="${freeBoardList }" var="freeBoardList"> 
<script>
$(function(){
	
	$(".freeBoardInfo${freeBoardList.freeNo }").click(function(){
		
		location.href = '../admin/userFreePostView?freeNo=${freeBoardList.freeNo}';
		
	})
	
});
</script>
</c:forEach>

<%-- <% ============================================================================= %> --%>

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<a href="../admin/userDetailedInfo?userNo=${userInfo.userNo}"><button style="margin-left: 1px;" class="topMenuBtn">회원정보 관리</button></a>
<a href="../admin/userPaymentList?userNo=${userInfo.userNo}"><button class="topMenuBtn">결제/수강 내역</button></a>
<a href="../admin/userPostList?userNo=${userInfo.userNo}"><button class="topMenuBtn checked">작성한 게시물</button></a>
</div>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p class="userInfo">&#x003C; 1:1문의(Q&A) &#x003E;</p>

<%-- 1:1문의(Q&A) --%>
<table id="questionListTb">	
<tr>
	<th class="questionListTh">번호</th>
	<th class="questionListTh">제목</th>
	<th class="questionListTh">등록일</th>
	<th class="questionListTh">답변여부</th>
</tr>

<c:forEach items="${questionList }" var="questionList"> 
	<tr class="questionListTr" >
		<td class="questionListTd questionInfo${questionList.questionNo }">${questionList.questionNo }</td>
		<td class="questionListTd questionInfo${questionList.questionNo }">${questionList.questionName }</td>
		<td class="questionListTd questionInfo${questionList.questionNo }"><fmt:formatDate value="${questionList.questionDate }" pattern="yyyy-MM-dd" /></td>
		<td class="questionListTd questionInfo${questionList.questionNo }">${questionList.answer }</td>
	<tr>
</c:forEach>
</table>

<%-- <% ============================================================================= %> --%>

<div id="questionPaging">
	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${questionPaging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage - 1 }&freeBoardCurPage${freeBoardPaging.curPage}=&userNo=${userInfo.userNo}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${questionPaging.startPage }" end="${questionPaging.endPage }">
		<c:if test="${questionPaging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?questionCurPage=${i }&freeBoardCurPage=${freeBoardPaging.curPage}&userNo=${userInfo.userNo}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${questionPaging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${i }&freeBoardCurPage=${freeBoardPaging.curPage}&userNo=${userInfo.userNo}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${questionPaging.curPage < questionPaging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage + 1 }&freeBoardCurPage=${freeBoardPaging.curPage}&userNo=${userInfo.userNo}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	

<hr><%-- <% ============================================================================= %> --%>
<%-- 자유게시판 --%>
<p class="userInfo">&#x003C; 자유게시판 &#x003E;</p>

<table id="freeBoardListTb">	
<tr>
	<th class="freeBoardListTh">번호</th>
	<th class="freeBoardListTh">종류</th>
	<th class="freeBoardListTh">제목</th>
	<th class="freeBoardListTh">등록일</th>
</tr>

<c:forEach items="${freeBoardList }" var="freeBoardList"> 
	<tr class="freeBoardListTr" >
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">${freeBoardList.freeNo }</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">[<span>${freeBoardList.freeHead }</span>]</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">${freeBoardList.freeName }</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }"><fmt:formatDate value="${freeBoardList.freeDate }" pattern="yyyy-MM-dd" /></td>
	<tr>
</c:forEach>
</table>

<%-- <% ============================================================================= %> --%>



<div id="questionPaging">
	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${freeBoardPaging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage}&freeBoardCurPage=${freeBoardPaging.curPage - 1 }&userNo=${userInfo.userNo}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${freeBoardPaging.startPage }" end="${freeBoardPaging.endPage }">
		<c:if test="${freeBoardPaging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage}&freeBoardCurPage=${i }&userNo=${userInfo.userNo}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${freeBoardPaging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage}&freeBoardCurPage=${i }&userNo=${userInfo.userNo}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${freeBoardPaging.curPage < freeBoardPaging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?questionCurPage=${questionPaging.curPage}&freeBoardCurPage=${freeBoardPaging.curPage + 1 }&userNo=${userInfo.userNo}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	

</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />