<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.defaultWidth{
   margin-left: 400px;
   margin-right: 400px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth" >

<h1>Main Category</h1>

<a href="/main/subCategory?mainCategoryNo=${list[0].mainCategoryNo}">${list[0].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[1].mainCategoryNo }">${list[1].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[2].mainCategoryNo }">${list[2].mainCategoryNo }</a><br>
<a href="/main/subCategory?mainCategoryNo=${list[3].mainCategoryNo }">${list[3].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[4].mainCategoryNo }">${list[4].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[5].mainCategoryNo }">${list[5].mainCategoryNo }</a><br>
<a href="/main/subCategory?mainCategoryNo=${list[6].mainCategoryNo }">${list[6].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[7].mainCategoryNo }">${list[7].mainCategoryNo }</a>
<a href="/main/subCategory?mainCategoryNo=${list[8].mainCategoryNo }">${list[8].mainCategoryNo }</a>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />