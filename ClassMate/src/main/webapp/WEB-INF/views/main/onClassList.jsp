<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
/*     $(function () {
        $("#onClass").click(function () {
            $.ajax({
                type: "GET",
                url: "/main/onClassList",
                data: { subCategoryNo: "${subCategoryNo}" },
                dataType: "html",
                success: function (data) {
                    console.log("onClassList 성공", data);
                    $("#onClassList").html(data); // 변경된 부분: displayClassList 함수 대신 직접 데이터를 HTML로 설정
                    $("#offClassList").hide();
                    $("#defaultOnClassList").hide();
                    
                },
                error: function () {
                    console.log("onClassList 실패");
                }
            });
        });

        $("#offClass").click(function () {
            $.ajax({
                type: "GET",
                url: "/main/offClassList",
                data: { subCategoryNo: "${subCategoryNo}" },
                dataType: "html",
                success: function (data) {
                    console.log("offClassList 성공", data);
                    $("#offClassList").html(data); // 변경된 부분: displayClassList 함수 대신 직접 데이터를 HTML로 설정
                    $("#onClassList").hide();
                    $("#defaultOnClassList").hide();
                    
                },
                error: function () {
                    console.log("offClassList 실패");
                }
            });
        });

    }); */
    
    function submitForm() {
        document.getElementById('sortForm').submit();
    }
    
</script>

<style type="text/css">
    
    .page-link.active{

	background: rgb(250,224,120);
	border: 1px solid rgb(230,204,100);
	
}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

    <!-- 토글 버튼 -->
    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
    <input type="button" onclick="location.href='/main/onClassList?subCategoryNo=${subCategoryNo}'" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
    <label style="background-color: #F0C610; color: black;" class="btn btn-outline-warning" for="btnradio1" id="onClass">ON 전체보기</label>

 	<input type="button" onclick="location.href='/main/offClassList?subCategoryNo=${subCategoryNo}'" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
    <label style="color: black; background-color: #00000059; border: none;" class="btn btn-secondary" for="btnradio2" id="offClass">OFF 전체보기</label>
    </div>
        
<form id="sortForm" action="/main/onClassList" method="get">
    <div class="dropdown" style="float: right;">
        <select name="sort" id="sortOrderSelect" onchange="submitForm()">
            <option value="class_no desc" ${classDescNo eq 2 ? 'selected' : ''}>최신순</option>
            <option value="order_no desc" ${orderNoDesc eq 4 ? 'selected' : ''}>인기순</option>
            <option value="expense" ${expenseNo eq 1 ? 'selected' : ''}>낮은 금액</option>
            <option value="expense desc" ${expenseDescNo eq 3 ? 'selected' : ''}>높은 금액</option>
        </select>
        <input type="text" value="${subCategoryNo}" name="subCategoryNo" style="display: none;" readonly="readonly">
    </div>
</form>
<script>
    function submitForm() {
        document.getElementById('sortForm').submit();
    }
</script>

	
	<div id="defaultOnClassList">
		<c:forEach var="c" items="${onClassList}">
	    	<c:if test="${c.deleteBoolean == 0}">
	    		<a href="/main/onClassView?classNo=${c.classNo }">
			        <h1>onClassList</h1><br>
			        ${c.headImg }<br>
			        <h3>${c.className }</h3><br>
			        ${c.classInfo }<br>
			        ${c.expense }<br>
			        ${c.classStart }<br>
			        ${c.classEnd }<br>
			        ${c.maxCount }<br>
		        </a>
	    	</c:if>
		</c:forEach>
    
 	        <div>
    	<ul class="pagination pagination-sm justify-content-center">
			<%-- 첫 페이지로 이동 --%>
			<c:if test="${paging.curPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?sort=${sort}&subCategoryNo=${subCategoryNo}">&larr; 처음</a>
			</li>
			</c:if>
			
			
			
			<%-- 이전 페이지 리스트로 이동 --%>
			<c:choose>
				<c:when test="${paging.startPage ne 1 }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.startPage - paging.pageCount }&sort=${sort}&subCategoryNo=${subCategoryNo}">&laquo;</a>
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
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}&subCategoryNo=${subCategoryNo}">&lt;</a>
				</li>
			</c:if>
			
			
			
		
			<%-- 페이징 번호 목록 --%>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
				<li class="page-item">
					<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&subCategoryNo=${subCategoryNo}">${i }</a>
				</li>
				</c:if>
				
				<c:if test="${paging.curPage ne i }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&subCategoryNo=${subCategoryNo}">${i }</a>
				</li>
				</c:if>
			</c:forEach>
			
			
			
			
			<%-- 다음 페이지로 이동 --%>
			<c:if test="${paging.curPage < paging.totalPage }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}&subCategoryNo=${subCategoryNo}">&gt;</a>
				</li>
			</c:if>
			
			
			
			
			<%-- 다음 페이지 리스트로 이동 --%>
			<c:choose>
				<c:when test="${paging.endPage ne paging.totalPage }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }&sort=${sort}&subCategoryNo=${subCategoryNo}">&raquo;</a>
				</li>
				</c:when>
				<c:when test="${paging.endPage eq paging.totalPage }">
				<li class="page-item">
					<a class="page-link disabled">&raquo;</a>
				</li>
				</c:when>
			</c:choose>
	
			
			
			
			<%-- 끝 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }&sort=${sort}&subCategoryNo=${subCategoryNo}">끝 &rarr;</a>
			</li>
			</c:if>
		
		</ul>
    </div>
    
   </div>
   
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />
