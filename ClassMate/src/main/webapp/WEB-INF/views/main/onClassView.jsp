<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

</script>
<c:import url="/WEB-INF/views/layout/header.jsp" />


<h1>ON클래스 상세보기</h1>

<c:forEach var="list" items="${list }">
	${list.teacher }<br>
	${list.className }<br>
	${list.classStart }
	${list.classEnd }
	${list.maxCount }<br>
	${list.expense }<br>
	${list.classInfo }<br>
	${list.curriculum }<br>
	${list.onOff }<br>
	${list.headImg }<br>
	${list.content }<br>
</c:forEach>
<a href="../payment/basket"><h1>수강 시작하기</h1></a>

<c:import url="/WEB-INF/views/layout/footer.jsp" />