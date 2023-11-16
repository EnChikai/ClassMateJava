<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
<h1>질의응답작성페이지</h1>
<c:forEach var="lecture" items="${lecture}">
	클래스 번호: ${lecture.classNo}<br>
	
	클래스명: ${lecture.className}<br>
	
	<br>
</c:forEach>
<form action="/class/onClassQAWrite" method="post">
	<label>제목</label><input type="text" name="questionName" id="questionName"><br>
    <label>내용</label><input type="text" name="questionContent" id="questionContent"><br>
    <input type="submit">
</form>
<a href="/class/onClassQABoardList">취소</a>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />