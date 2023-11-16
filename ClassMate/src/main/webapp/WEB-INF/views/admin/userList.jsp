<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<style type="text/css">

#userListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 574px; 
margin: auto;

}

.userListTh{
background: rgb(234,234,234);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;

}

.userListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;

}

#delCheckbox{
position:absolute;
width:20px;
height:20px;
top:10%;
margin-left: 5px;

}


</style>

<script type="text/javascript">
$(function(){

	$(".dropTag").change(function(){
		
		$('#userListForm').submit();
		
		 <%-- var selectedValue = $(this).val();

        // 선택한 값에 따라 작업 수행
        if (selectedValue === "0") {
       		console.log('가입 날짜▲ 선택됨');
       	 	$( '#userListForm' ).submit();
       	 	
        } else if (selectedValue === "1") {
        	console.log('가입 날짜▼ 선택됨');
        	$( '#userListForm' ).submit();
        	
        } else if (selectedValue === "2") {
       		console.log('이름▲ 선택됨');
       		$( '#userListForm' ).submit();
       		
        } else if (selectedValue === "3") {
        	console.log('이름▼ 선택됨');
        	$( '#userListForm' ).submit();
        	
        }
        --%>
		
	})
	
});

$(function(){
	
	var delCheckbox = document.getElementById("delCheckbox");
	
	$("#delCheckbox").click(function(){
		if($(this).is(":checked")){
			delCheckbox.value = 1;
			$('#userListForm').submit();
		} else {
			delCheckbox.value = 0; 
			$('#userListForm').submit();
		}
	})
	
});
</script>	
	
<div style="border: 1px solid #ccc; text-align: center; width: 700px; margin-top: 60px; margin-left: 72px;">
<div style="font-size: 22px; font-weight:bold; margin-bottom: 17px; margin-top: 40px;">회원 관리</div>

<form id="userListForm" action="../admin/userList" method="get">
	<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">
		
		<input style="display: none" type="text" readonly="readonly" name="curPage" value="${paging.curPage}">
		
		<div>
		<c:if test="${sort eq 0}">
		<select class="dropTag" name="sort" id="sort">
			<option value="0">유저번호▲</option>
			<option value="1">유저번호▼</option>
			<option value="2">이름▲</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 1}">
		<select class="dropTag" name="sort" id="sort">
			<option value="1">유저번호▼</option>
			<option value="0">유저번호▲</option>
			<option value="2">이름▲</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 2}">
		<select class="dropTag" name="sort" id="sort">
			<option value="2">이름▲</option>
			<option value="0">유저번호▲</option>
			<option value="1">유저번호▼</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 3}">
		<select class="dropTag" name="sort" id="sort">
			<option value="3">이름▼</option>
			<option value="0">유저번호▲</option>
			<option value="1">유저번호▼</option>
			<option value="2">이름▲</option>
		</select>
		</c:if>
		
		<div style="position:relative; float: right; margin-right: 87px;" >
		
		<c:if test="${delCheckbox eq 0}">
        	탈퇴 회원 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="0">
        </c:if>
        <c:if test="${delCheckbox eq 1}">
        	탈퇴 회원 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="1" checked="checked">
		</c:if>
		
        </div>
        
        </div>
        
	</div>
</form>

<table id="userListTb">	
	
<tr>
	<th class="userListTh" width="7%">회원번호</th>
	<th class="userListTh" width="10%">아이디</th>
	<th class="userListTh" width="10%">회원명</th>
	<th class="userListTh" width="10%">가입일</th>
	<th class="userListTh" width="10%">강사 여부<br>
</tr>

<c:forEach items="${list }" var="list"> 
	<tr>
		<td class="userListTd">${list.userNo }</td>
		<td class="userListTd">${list.userId }</td>
		<td class="userListTd">${list.userName }</td>
		<td class="userListTd">${list.userDateCreated }</td>
		<td class="userListTd"></td>
	<tr>
</c:forEach>
</table>

<div style="margin-top: 30px;">

<div>
	
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
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}&delCheckbox=${delCheckbox}">&lt;</a>
			</li>
		</c:if>
		
		
		
	
		<%-- 페이징 번호 목록 --%>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}">${i }</a>
			</li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}">${i }</a>
			</li>
			</c:if>
		</c:forEach>
		
		
		
		
		<%-- 다음 페이지로 이동 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}&delCheckbox=${delCheckbox}">&gt;</a>
			</li>
		</c:if>
		
		
		
		
		<%-- 다음 페이지 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }&sort=${sort}&delCheckbox=${delCheckbox}">&raquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="page-item">
				<a class="page-link disabled">&raquo;</a>
			</li>
			</c:when>
		</c:choose>

	</ul>
	
</div>

</div>
</div>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />