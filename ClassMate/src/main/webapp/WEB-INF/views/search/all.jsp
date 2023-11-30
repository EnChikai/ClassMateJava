<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	// 마우스를 올리면 글자색과 언더라인 변경
	$(".subCategoryItem").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "#F0C610");
	        $(this).find("#subFont").css("color", "white");
	        $(this).find("#subImg").css("filter", "invert(100%)");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "#ccc");
	        $(this).find("#subFont").css("color", "black");
	        $(this).find("#subImg").css("filter", "invert(0%)");
	    }
	});
	
});

function submitForm() {
    document.getElementById('sortForm').submit();
}
</script>


</script>

<style type="text/css">
.subCategoryNo{
	text-decoration: none;
	color: black;
}

.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}

.subCateTitle{
	border: 1px solid #ccc;
	margin-bottom: 20px;
    padding-right: 50px;
    margin-right: 200px;
    margin-left: 200px;
    display: flex;
    align-items: center;
}

.subCategoryContainer {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: 180px 180px 180px;
    grid-template-rows: 180px 180px 180px;
    align-items: center;
    justify-content: center;
    grid-column-gap: 15px;
    grid-row-gap: 10px;
}

.subCategoryItem {
    text-align: center;
    padding: 23px;
    transition: background-color 0.3s, color 0.3s;
    background-color: #ccc;
}

#subImg {
    width: 70px;
}

p {
    font-size: 18px;
    color: black;
}

.page-link.active{

	background: rgb(250,224,120);
	border: 1px solid rgb(230,204,100);
	
}

a:hover{
	color: #F0C610;
}

.classMenu{
    display: flex;
    align-items: center;
    justify-content: space-between;
}

#onClassPaging1 {
	background-color: rgb(241, 196, 15);
	border-color: rgb(241, 196, 15);
	border-radius: 4px;
	margin: 3.5px;
	text-align: center;
	color: white;
}

#onClassPaging2 {
	border-radius: 4px;
	color: black;
	background-color: #f1f3f5;
	border-color: #f1f3f5;
	margin: 3.5px;
	text-align: center;
}

#onClassPaging3,#onClassPaging4,#onClassPaging5,#onClassPaging6 {
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

<c:if test="${not empty list}">
    
	            <th><h1 style="text-align: center;">${search }에 대한 카테고리 검색결과</h1></th>
	            
	            <div class="subCateTitle">
    	<img style="float: left; margin-top: -1px; margin-left: -1px;" width="50px;" height="50px;" src="/resources/img/mainCategory.png">
    	<strong style="font-size:22px; margin-left: 260px;">카테고리</strong>
    </div>
    
    
    <c:choose>
        <c:when test="${list[0].mainCategoryNo == 1 }">
            <c:set var="subCategoryPath" value="/WEB-INF/views/main/art.jsp" />
        </c:when>
        
        <c:when test="${list[0].mainCategoryNo == 2 }">
            <c:set var="subCategoryPath" value="/WEB-INF/views/main/sports.jsp" />
        </c:when>
        
        <c:when test="${list[0].mainCategoryNo == 3 }">
        	<c:set var="subCategoryPath" value="/WEB-INF/views/main/cook.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 4 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/travel.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 5 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/growth.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 6 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/it.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 7 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/fashion.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 8 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/create.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 9 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/culture.jsp" />
	    </c:when>
    
        <c:otherwise>
            <c:set var="subCategoryPath" value="" />
        </c:otherwise>
    </c:choose>
    
    <c:if test="${not empty subCategoryPath}">
        <c:import url="${subCategoryPath}" />
    </c:if>

<br><br><br>
</c:if>

<c:if test="${not empty list1}">
    <h1 style="text-align: center;">서브 카테고리 ${search }에 대한 클래스 목록 검색결과</h1>
   
	<div id="defaultOnClassList">
		<c:forEach var="c" items="${list1}">
		    	<c:if test="${c.deleteBoolean == 0}">
		    		<a href="/main/onClassView?classNo=${c.classNo }">
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
 		<div id="onClassPagination">
    	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
			
			<%-- 이전 페이지로 이동 --%>
			<c:if test="${paging.curPage > 1 }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }subCategoryNo=${subCategoryNo}" id="onClassPaging6">&lt;</a>
				</li>
			</c:if>			
		
			<%-- 페이징 번호 목록 --%>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&subCategoryNo=${subCategoryNo}" id="onClassPaging1">${i }</a>
				</li>
				</c:if>
				
				<c:if test="${paging.curPage ne i }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&subCategoryNo=${subCategoryNo}" id="onClassPaging2">${i }</a>
				</li>
				</c:if>
			</c:forEach>
					
			<%-- 다음 페이지로 이동 --%>
			<c:if test="${paging.curPage < paging.totalPage }">
				<li class="page-item" style="width: 45px;">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&subCategoryNo=${subCategoryNo}" id="onClassPaging3">&gt;</a>
				</li>
			</c:if>
		</ul>
   	</div>
   </div>
</div>
<br><br><br>
</c:if>

<c:if test="${not empty list2}">
    <h1 style="text-align: center;">클래스 제목 ${search }에 대한 클래스 목록 검색결과</h1>
    
    <table class="table">
    	<thead class="table-dark">
	        <tr>
	            <th>Class No</th>
	            <th>Teacher No</th>
	            <th>Main Category No</th>
	            <th>Sub Category No</th>
	            <th>Teacher</th>
	            <th>Class Name</th>
	            <th>Class Date</th>
	            <th>Class Start</th>
	            <th>Class End</th>
	            <th>Max Count</th>
	            <th>Expense</th>
	            <th>Class Info</th>
	            <th>Curriculum</th>
	            <th>On/Off</th>
	            <th>Head Img</th>
	            <th>Delete Boolean</th>
	        </tr>
        </thead>
	        <c:forEach items="${list2}" var="lecture">
	            <tr>
	                <td>${lecture.classNo}</td>
	                <td>${lecture.teacherNo}</td>
	                <td>${lecture.mainCategoryNo}</td>
	                <td>${lecture.subCategoryNo}</td>
	                <td>${lecture.teacher}</td>
	                <td>${lecture.className}</td>
	                <td>${lecture.classDate}</td>
	                <td>${lecture.classStart}</td>
	                <td>${lecture.classEnd}</td>
	                <td>${lecture.maxCount}</td>
	                <td>${lecture.expense}</td>
	                <td>${lecture.classInfo}</td>
	                <td>${lecture.curriculum}</td>
	                <td>${lecture.onOff}</td>
	                <td>${lecture.headImg}</td>
	                <td>${lecture.deleteBoolean}</td>
	            </tr>
	        </c:forEach>
	    </table>
<br><br><br>
</c:if>

<c:if test="${not empty list3}">
    <h1 style="text-align: center;">${search }에 대한 작성자 제목 검색결과</h1>
    
    <table class="table">
    	<thead class="table-dark">
	        <tr>
	            <th>FREE_NO</th>
	            <th>USER_NO</th>
	            <th>FREE_HEAD</th>
	            <th>FREE_DATE</th>
	            <th>FREE_HIT</th>
	            <th>FREE_NAME</th>
	            <th>FREE_CONTENT</th>
	            <th>FREE_USERNAME</th>
	        </tr>
	    </thead>
	        <c:forEach items="${list3}" var="free">
	            <tr>
	                <td>${free.freeNo}</td>
	                <td>${free.userNo}</td>
	                <td>${free.freeHead}</td>
	                <td>${free.freeDate}</td>
	                <td>${free.freeHit}</td>
	                <td>${free.freeName}</td>
	                <td>${free.freeContent}</td>
	                <td>${free.userName}</td>
	            </tr>
	        </c:forEach>
    	</table>
<br><br><br>
</c:if>

<c:if test="${not empty list4}">
    <h1 style="text-align: center;">${search }에 대한 게시글 검색결과</h1>

        <table class="table">
    	<thead class="table-dark">
	        <tr>
	            <th>FREE_NO</th>
	            <th>USER_NO</th>
	            <th>FREE_HEAD</th>
	            <th>FREE_DATE</th>
	            <th>FREE_HIT</th>
	            <th>FREE_NAME</th>
	            <th>FREE_CONTENT</th>
	            <th>FREE_USERNAME</th>
	        </tr>
	    </thead>
	        <c:forEach items="${list4}" var="free">
	            <tr>
	                <td>${free.freeNo}</td>
	                <td>${free.userNo}</td>
	                <td>${free.freeHead}</td>
	                <td>${free.freeDate}</td>
	                <td>${free.freeHit}</td>
	                <td>${free.freeName}</td>
	                <td>${free.freeContent}</td>
	                <td>${free.userName}</td>
	            </tr>
	        </c:forEach>
    </table>
<br><br><br>
</c:if>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />