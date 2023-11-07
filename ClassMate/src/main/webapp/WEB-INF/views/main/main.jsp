<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<style type="text/css">

.defaultWidth{
   margin-left: 300px;
   margin-right: 300px;
}
</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth" >



<c:forEach var="list" items="${list }">
	${list }<br>
</c:forEach>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
