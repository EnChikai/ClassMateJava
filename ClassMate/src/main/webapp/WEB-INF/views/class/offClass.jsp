<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
	
hi

<c:choose>
    <c:when test="${not empty classItem}">
        <p>클래스 번호: ${classItem.classNo}</p>
        <p>클래스 이름: ${classItem.className}</p>
        <p>클래스 설명: ${classItem.classDescription}</p>
        <p>개설 날짜: <fmt:formatDate value="${classItem.startDate}" pattern="yyyy-MM-dd"/></p>
    </c:when>
    <c:otherwise>
        <p>클래스 정보를 찾을 수 없습니다.</p>
    </c:otherwise>
</c:choose>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />