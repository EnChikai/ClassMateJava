<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%int i = 1; %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>
<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
	
}

#userInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 720px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}

#userListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;
margin-bottom: 80px;

}

.userListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.userListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

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

</style>

<%-- 페이징 --%>
<style type="text/css">
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

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<a href="../admin/userDetailedInfo?userNo=${orderTb.userNo}"><button style="margin-left: 1px;" class="topMenuBtn">회원정보 관리</button></a>
<button class="topMenuBtn checked">결제/수강 내역</button>
<button class="topMenuBtn">작성한 게시물</button>
</div>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="userInfo">결제/수강 내역</p>

<div style="text-align: left; margin-bottom: 10px">
<table id="userListTb">

<tr>
	<th class="userListTh" width="7%">번호</th>
	<th class="userListTh" width="20%">클래스명</th>
	<th class="userListTh" width="10%">금액</th>
	<th class="userListTh" width="10%">결제카드</th>
	<th class="userListTh" width="10%">UID</th>
</tr>

<c:if test="${paging.totalCount <= 0}">
<tr>
<td colspan="5" style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
<h1>결제 내역이 없습니다</h1>
<p style="margin-top: 20px; padding-left: 40px"><img title="보노" alt=";;;;;;" src="/resources/img/bono.png" width="162px" height="156px"></p>
</td>
</tr>
</c:if>

<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="0" end="${paging.totalCount-1}" >
	<tr>
		<td class="userListTd">
			<%=i++ %>
		</td>
		<td class="userListTd">
			<c:set var="classList" value="${map.classList[i] }" />
			<c:out value="${classList.className }" />
		</td>
		<td class="userListTd">
			<c:set var="paymentList" value="${map.paymentList[i] }" />
			<fmt:formatNumber type="number" maxFractionDigits="3"><c:out value="${paymentList.payment }" /></fmt:formatNumber>원
		</td>
		<td class="userListTd">
			<c:set var="paymentList" value="${map.paymentList[i] }" />
			<c:out value="${paymentList.cardName }" />
			
		</td>
		<td class="userListTd">
			<c:set var="orderList" value="${map.orderList[i] }" />
			<c:out value="${orderList.merchantUid }" />
		</td>
	</tr>
</c:forEach>
</c:if>

</table>

<c:if test="${paging.totalCount > 0}">
<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${paging.curPage - 1 }" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${i }" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${i }" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${paging.curPage + 1 }" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	
</c:if>

</div>

</div>			
<%-- <% ============================================================================= %> --%>	
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />