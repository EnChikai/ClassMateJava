<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">



.mainCategoryNo{
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

<h1>Main Category</h1>

<a href="/main/subCategory?mainCategoryNo=${list[0].mainCategoryNo}" class="mainCategoryNo">${list[0].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[1].mainCategoryNo }" class="mainCategoryNo">${list[1].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[2].mainCategoryNo }" class="mainCategoryNo">${list[2].mainCategoryNo }</a><br>
<a href="/main/subCategory?mainCategoryNo=${list[3].mainCategoryNo }" class="mainCategoryNo">${list[3].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[4].mainCategoryNo }" class="mainCategoryNo">${list[4].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[5].mainCategoryNo }" class="mainCategoryNo">${list[5].mainCategoryNo }</a><br>
<a href="/main/subCategory?mainCategoryNo=${list[6].mainCategoryNo }" class="mainCategoryNo">${list[6].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[7].mainCategoryNo }" class="mainCategoryNo">${list[7].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[8].mainCategoryNo }" class="mainCategoryNo">${list[8].mainCategoryNo }</a>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />