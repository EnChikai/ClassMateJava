<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<%-- <% ============================================================================= %> --%>
<style type="text/css">
.teacherApplyManagement{
background: rgb(241,196,15);

}

#applyInfo{
padding-bottom: 8px; 
text-align: center; 
margin-left: auto;
margin-right: auto;
margin-top: 20px;
margin-bottom: 17px; 
font-size: 22px; 
font-weight:bold;


}

#applyListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;

}

.applyListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.applyListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

}

#passCheckbox{
position:absolute;
width:20px;
height:20px;
top:10%;
margin-left: 5px;

}

.applyListTd:hover:not(.active){
cursor:pointer;

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
<script type="text/javascript">
$(function(){
	
    $('.applyListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.applyListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

$(function(){
	
	var passCheckbox = document.getElementById("passCheckbox");
	
	$("#passCheckbox").click(function(){
		if($(this).is(":checked")){
			passCheckbox.value = 1;
			$('#applyListForm').submit();
		} else {
			passCheckbox.value = 0; 
			$('#applyListForm').submit();
		}
	})
	
});


</script>
<%-- <% ============================================================================= %> --%>
<%-- 클릭시 강사신청 상세보기로 --%>
<c:forEach var="teacherList" items="${map.teacherList }" > 
<script>
$(function(){
	
	$(".applyId${teacherList.teacherNo }").click(function(){
		
		
		location.href = '../admin/teacherApplyView?curPage=${paging.curPage}&passCheckbox=${passCheckbox}&teacherNo=${teacherList.teacherNo}';
		
	})
	
});
</script>
</c:forEach>
<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">



<p id="applyInfo">< 강사 신청 내역></p>

<form id="applyListForm" action="../admin/teacherApply" method="get">
	<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">
		
		<input style="display: none" type="text" readonly="readonly" name="curPage" value="${paging.curPage}">
		
		<div style="position:relative; float: right; margin-right: 87px; margin-bottom: 5px;" >
		
		<c:if test="${passCheckbox eq 0}">
        	합격자 조회<input id="passCheckbox" type="checkbox" name="passCheckbox" value="0">
        </c:if>
        <c:if test="${passCheckbox eq 1}">
        	합격자 조회<input id="passCheckbox" type="checkbox" name="passCheckbox" value="1" checked="checked">
		</c:if>
		
        </div>
        
	</div>
</form>

<div style="text-align: left; margin-bottom: 10px">
<table id="applyListTb">

<tr>
	<th class="applyListTh" width="7%">번호</th>
	<th class="applyListTh" width="20%">신청목록</th>
	<th class="applyListTh" width="10%">등록일</th>
	<th class="applyListTh" width="10%">처리상태</th>
</tr>

<c:if test="${paging.totalCount <= 0}">
<tr>
<td colspan="5" style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
<h1>신청 내역이 없습니다</h1>
<p style="margin-top: 20px; padding-left: 40px"><img title="보노" alt=";;;;;;" src="/resources/img/bono.png" width="162px" height="156px"></p>
</td>
</tr>
</c:if>

<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">
<c:set var="teacherList" value="${map.teacherList[i] }" />
<c:set var="teacherApplyList" value="${map.teacherApplyList[i] }" />
<c:set var="teacherApplyList" value="${map.teacherApplyList[i] }" />

	<tr class="applyListTr">
		<td class="applyListTd applyId${teacherList.teacherNo }">
			${i+1 }
		</td>
		<td class="applyListTd applyId${teacherList.teacherNo }">
			<c:out value="${teacherList.teacherTitle }" />
		</td>
		<td class="applyListTd applyId${teacherList.teacherNo }">
			<fmt:formatDate value="${teacherApplyList.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		</td>
		<td class="applyListTd applyId${teacherList.teacherNo }">
			
			<c:if test="${teacherApplyList.passOrNot eq 0}">
				미처리
			</c:if>
			<c:if test="${teacherApplyList.passOrNot eq 1}">
				완료
			</c:if>
		</td>
	</tr>
</c:if>
</c:forEach>
</c:if>

</table>

</div>

<%-- <% ============================================================================= %> --%>	
<%-- 페이징 --%>	

<c:if test="${paging.totalCount > 0}">
<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&passCheckbox=${passCheckbox}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&passCheckbox=${passCheckbox}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&passCheckbox=${passCheckbox}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&passCheckbox=${passCheckbox}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	
</c:if>

</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />