<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

    function submitForm() {
        document.getElementById('sortForm').submit();
    }
    
</script>

<style type="text/css">
    
.page-link.active{

	background: rgb(250,224,120);
	border: 1px solid rgb(230,204,100);
	
}

.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}

a:hover{
	color: #F0C610;
}

.classMenu{
    display: flex;
    align-items: center;
    justify-content: space-between;
}

#offClassPaging1 {
	background-color: rgb(241, 196, 15);
	border-color: rgb(241, 196, 15);
	border-radius: 4px;
	margin: 3.5px;
	text-align: center;
	color: white;
}

#offClassPaging2 {
	border-radius: 4px;
	color: black;
	background-color: #f1f3f5;
	border-color: #f1f3f5;
	margin: 3.5px;
	text-align: center;
}

#offClassPaging3,#offClassPaging4,#offClassPaging5,#offClassPaging6 {
	border-radius: 4px;
	color: black;
	background-color: #f1f3f5;
	border-color: #f1f3f5;
	margin: 3.5px;
	text-align: center;
}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

<div class="classMenu">
    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
    <input type="button" onclick="location.href='/main/onClassList?subCategoryNo=${subCategoryNo}'" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
    <label style="font-size: 30px; color: black; background-color: #00000059;" class="btn btn-secondary" for="btnradio1" id="onClass"><strong>ON</strong></label>
	
 	<input type="button" onclick="location.href='/main/offClassList?subCategoryNo=${subCategoryNo}'" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
    <label style="font-size: 30px; background-color: #F0C610; color: black; border: none;" class="btn btn-outline-warning" for="btnradio2" id="offClass"><strong>OFF</strong></label>
    </div>
    
<form id="sortForm" action="/main/offClassList" method="get">
    <div class="dropdown" style="float: right;">
        <select name="sort" id="sortOrderSelect" onchange="submitForm()" style="padding: 7px; padding-right: 52px;">
            <option value="class_no desc" ${classDescNo eq 2 ? 'selected' : ''}>최신순</option>
            <option value="count(CL.list_no) desc" ${orderNoDesc eq 4 ? 'selected' : ''}>인기순</option>
            <option value="expense" ${expenseNo eq 1 ? 'selected' : ''}>낮은 금액</option>
            <option value="expense desc" ${expenseDescNo eq 3 ? 'selected' : ''}>높은 금액</option>
        </select>
        <input type="text" value="${subCategoryNo}" name="subCategoryNo" style="display: none;" readonly="readonly">
    </div>
</form>
</div>
<hr style="margin-top: 0;">

<c:if test="${error eq 1 }">
	<h1 style="text-align: center;">등록된 클래스가 없습니다.</h1>
</c:if>

	<div id="defaultOffClassList">
		<c:forEach var="c" items="${offClassList}">
	    	<c:if test="${c.deleteBoolean == 0}">
	    		<a href="/main/offClassView?classNo=${c.classNo }">
			       <div style="display: flex; margin-top: 35px;">
		    				<div><img style="width: 250px; height: 177px;" src="/upload/${c.headImg }"></div>
			    			<div style="margin-left: 15px; width: 1103px;">
						        <span style="font-size: 25px;"><strong>${c.className }</strong></span>
						        <span style="margin-left: 350px; font-size: 25px; float: right;"><fmt:formatNumber value="${c.expense }" pattern="#,###" />원</strong></span>
						        <div>${c.classInfo }</div><br>
						        <div style="margin-top: margin-top: 33px;">
							        <div style="float: right;">모집인원 : ${c.maxCount }명</div><br>
							        <div style="float: right;">모집기간 : ${c.classStart }~${c.classEnd }</div>
						        </div>
					        </div>
				        </div><br>
		        </a><hr>
	    	</c:if>
		</c:forEach>
    
    	<div id="offClassPagination">
    	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">	
			
			<%-- 이전 페이지로 이동 --%>
			<c:if test="${paging.curPage > 1 }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}&subCategoryNo=${subCategoryNo}" id="offClassPaging6">&lt;</a>
				</li>
			</c:if>
				
			<%-- 페이징 번호 목록 --%>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&subCategoryNo=${subCategoryNo}" id="offClassPaging1">${i }</a>
				</li>
				</c:if>
				
				<c:if test="${paging.curPage ne i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&subCategoryNo=${subCategoryNo}" id="offClassPaging2">${i }</a>
				</li>
				</c:if>
			</c:forEach>
			
			<%-- 다음 페이지로 이동 --%>
			<c:if test="${paging.curPage < paging.totalPage }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}&subCategoryNo=${subCategoryNo}" id="offClassPaging3">&gt;</a>
				</li>
			</c:if>
		</ul>
    </div>
   </div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />