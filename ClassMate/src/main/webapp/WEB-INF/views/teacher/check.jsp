<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

function submitForm() {
    document.getElementById("onOffForm").submit();
}

</script>
<style type="text/css">

.checkTable {
	border: 1px solid black;
	text-align: center;
	width: 700px;
}

.checkTable th{
	border: 1px solid black;
	text-align: center;
	font-weight: 600;
	font-size: large;
	background-color: #000000;
	color: white;
	max-width: 92px;
	height: 50px;
		
}

.checkTable td{
	border: 1px solid black;
	text-align: center;
	height: 45px;
		
}

.tdNum {
	color: 834683;
	width="42"
}

</style>

<div class="cd1" style="width: 700px; min-height: 800px; margin-left: 600px;">
<h1 style="text-align: center; height: 60px;">클래스 조회</h1>
<form id="onOffForm" action="/teacher/check" method=post>
    <div class="dropdown" style="float: right;">
        <select name="onOff" id="onOff" onchange="submitForm()">
            <option value="99" ${allPayDetail eq 1 ? 'selected' : ''}>전체보기</option>
            <option value="1" ${onPayDetail eq 2 ? 'selected' : ''}>ON클래스</option>
            <option value="0" ${offPayDetail eq 3 ? 'selected' : ''}>OFF클래스</option>
        </select>
    </div>
</form>
  

<c:choose>
        <c:when test="${empty classList}">
            <div style="text-align: center; margin-top: 110px; width: 700px; height: 500px;">
                <p style="font-size: xx-large; font-weight: bold;">클래스가 없습니다</p>
            </div>
        </c:when>
        <c:otherwise>
            <table class="checkTable" style="border-radius: 5px;">
                <tr>
                    <th width="42">번호</th>
                    <th>강좌명</th>
                    <th>모집 현황</th>
                    <th>기간</th>
                    <th>강의 금액</th>
                </tr>
                <c:forEach var="classItem" items="${classList}" varStatus="classStatus">
                    <c:forEach var="num" begin="1" end="${classStatus.count}">
                        <c:if test="${num == classStatus.count}">
                            <tr>
                                <td class="tdNum">${num}</td>
                                <td><a href="/teacher/detail?classNo=${classItem.classNo }">${classItem.className }</a></td>
                                <td>${classItem.classStart}/${classItem.classEnd }</td>
                                <td>${classItem.expense}</td>
                                <td>
                                    <c:if test="${classItem.onOff == 1}">
                                        ON
                                    </c:if>
                                    <c:if test="${classItem.onOff == 0}">
                                        OFF
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

  
   <div id="checkPage"  style="margin-top: 20px; margin-bottom: 10px; display: ${empty classList ? 'none' : 'block'};">
	
	<ul class="pagination pagination-sm justify-content-center">
 		<!-- 첫 페이지로 이동 -->
		<c:if test="${paging.curPage ne 1 }">
 		<li class="page-item">
			<a class="page-link" href="<%= request.getContextPath() %>">&larr; 처음</a>
 		</li>
		</c:if>
		
		
		
		<!-- 이전 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.startPage eq 1 }">
			<li class="page-item">
				<a class="page-link disabled">&laquo;</a>
			</li>
			</c:when>
		</c:choose>
		
		
		
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${paging.curPage > 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }">&lt;</a>
			</li>
		</c:if>
		
		
		
	
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a>
			</li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }">${i }</a>
			</li>
			</c:if>
		</c:forEach>
		
		
		
		
		<!-- 다음 페이지로 이동 -->
		<c:if test="${paging.curPage < paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }">&gt;</a>
			</li>
		</c:if>
		
		
		
		
		<!-- 다음 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }">&raquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.endPage eq paging.totalPage }">
			<li class="page-item">
				<a class="page-link disabled">&raquo;</a>
			</li>
			</c:when>
		</c:choose>

		
		
		
		<!-- 끝 페이지로 이동 -->
 		<c:if test="${paging.curPage ne paging.totalPage }">
 		<li class="page-item">
 			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }">끝 &rarr;</a>
 		</li>
 		</c:if>
		
	</ul>
	
</div> 




</div>	<!-- total box -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />