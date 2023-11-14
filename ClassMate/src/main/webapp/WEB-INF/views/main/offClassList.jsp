<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">


</script>





<style type="text/css">

.defaultWidth{
   margin-left: 400px;
   margin-right: 400px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth" >

<!-- 토글 버튼 -->
<button id="onClass">ON 전체보기</button><button id="offClass">OFF 전체보기</button>
<c:forEach var="offClass" items="${offClassList}">
<c:if test="${offClass.deleteBoolean == 0}">
<h1>offClassList</h1><br>
${offClass.headImg }<br>
<h3>${offClass.className }</h3><br>
${offClass.classInfo }<br>
${offClass.expense }<br>
${offClass.classStart }<br>
${offClass.classEnd }<br>
${offClass.maxCount }<br>
</c:if>
</c:forEach>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />