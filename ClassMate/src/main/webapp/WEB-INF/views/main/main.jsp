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

<img style="height: 300; width: -webkit-fill-available;" src="/resources/img/event.png">

<h1 style="text-align: center;"><strong>메인입니다.</strong></h1>
<c:forEach var="list" items="${list }">
	${list }<br>
</c:forEach>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
