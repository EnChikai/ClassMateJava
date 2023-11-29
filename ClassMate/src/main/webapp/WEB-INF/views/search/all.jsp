<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

<c:if test="${not empty list}">
    <h1>${search }에 대한 서브 카테고리 검색결과</h1>
    
    <table>
        <tr>
            <th>SUB CATEGORY NO</th>
            <th>MAIN CATEGORY NO</th>
            <th>SUB CATEGORY NAME</th>
        </tr>
        <c:forEach items="${list}" var="category">
            <tr>
                <td>${category.subCategoryNo}</td>
                <td>${category.mainCategoryNo}</td>
                <td>${category.subCategoryName}</td>
            </tr>
        </c:forEach>
    </table>
<br><br><br>
</c:if>

<c:if test="${not empty list1}">
    <h1>서브 카테고리 ${search }에 대한 클래스 목록 검색결과</h1>
       
     <table class="table">
     	<thead class="table-dark">
	        <tr>
	            <th>Class No</th>
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
        <c:forEach items="${list1}" var="lecture">
            <tr>
                <td>${lecture.classNo}</td>
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

<c:if test="${not empty list2}">
    <h1>클래스 제목 ${search }에 대한 클래스 목록 검색결과</h1>
    
    <table>
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
    <h1>${search }에 대한 작성자 제목 검색결과</h1>
    
    <table>
        <tr>
            <th>FREE_NO</th>
            <th>USER_NO</th>
            <th>FREE_HEAD</th>
            <th>FREE_DATE</th>
            <th>FREE_HIT</th>
            <th>FREE_NAME</th>
        </tr>
        <c:forEach items="${list3}" var="free">
            <tr>
                <td>${free.freeNo}</td>
                <td>${free.userNo}</td>
                <td>${free.freeHead}</td>
                <td>${free.freeDate}</td>
                <td>${free.freeHit}</td>
                <td>${free.freeName}</td>
            </tr>
        </c:forEach>
    </table>
<br><br><br>
</c:if>

<c:if test="${not empty list4}">
    <h1>${search }에 대한 게시글 검색결과</h1>

        <c:forEach items="${list4}" var="free">
		${free }<br><br>
        </c:forEach>
    </table>
<br><br><br>
</c:if>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />