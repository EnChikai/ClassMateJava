<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.classManagement{
background: rgb(241,196,15);

}

#classInfo{
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

#classListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;

}

.classListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.classListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

}

#classNameInfo{
width: 484px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
height: 30px;
}

.classListTd:hover:not(.active){
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
		
		$('#classListForm').submit();
		
	})
	
});

$(function(){
	
	var delCheckbox = document.getElementById("delCheckbox");
	
	$("#delCheckbox").click(function(){
		if($(this).is(":checked")){
			delCheckbox.value = 1;
			$('#classListForm').submit();
		} else {
			delCheckbox.value = 0; 
			$('#classListForm').submit();
		}
	})
	
});

$(function(){
	
    $('.classListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.classListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

</script>

<%-- 클릭시 클래스 상세보기로 --%>
<c:forEach items="${classList }" var="classList"> 
<script>
$(function(){
	
	$(".classInfo${classList.classNo }").click(function(){
		
		location.href = '../admin/classView?classNo=${classList.classNo }';
		
	})
	
});
</script>
</c:forEach>

<%-- <% ============================================================================= %> --%>	
	
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">
<p id="classInfo">&#x003C; On / Off 클래스 관리 &#x003E;</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">

<form id="classListForm" action="../admin/classList" method="get">

<c:if test="${sort eq 0}">
<select class="dropTag" name="sort" id="sort">
	<option value="0">Off클래스</option>
	<option value="1">On클래스</option>
</select>
</c:if>

<c:if test="${sort eq 1}">
<select class="dropTag" name="sort" id="sort">
	<option value="1">On클래스</option>
	<option value="0">Off클래스</option>
</select>
</c:if>

<div style="position:relative; float: right; margin-right: 87px;" >
		
		<c:if test="${delCheckbox eq 0}">
        	종강 클래스 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="0">
        </c:if>
        <c:if test="${delCheckbox eq 1}">
        	종강 클래스 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="1" checked="checked">
		</c:if>
		
</div>

</form>
</div>
	
	
		
<table id="classListTb">	
	
<tr>
	<th class="classListTh" width="15%">클래스 번호</th>
	<th class="classListTh" width="60%">제목</th>
	<th class="classListTh" width="25%">등록일</th>
</tr>

<c:forEach items="${classList }" var="classList"> 
	<tr class="classListTr" >
		<td class="classListTd classInfo${classList.classNo }">${classList.classNo }</td>
		<td id="classNameInfo" class="classListTd classInfo${classList.classNo }">${classList.className }</td>
		<td class="classListTd classInfo${classList.classNo }">${classList.classDate }</td>
	<tr>
</c:forEach>

</table>

<div style="text-align: right; padding-right: 70px; margin-top: 18px;">

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