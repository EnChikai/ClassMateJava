<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.subCategoryNo{
	text-decoration: none;
	color: black;
}
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
	margin-top: 35px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

<h1>subCategory</h1>

<c:forEach var="list" items="${list }">
<a href="/main/onClassList?subCategoryNo=${list.subCategoryNo}" class="subCategoryNo">${list.subCategoryNo }</a><br>
</c:forEach>


</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />