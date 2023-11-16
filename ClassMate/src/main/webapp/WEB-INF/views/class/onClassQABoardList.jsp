<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
<h1>질의응답전체조회페이지</h1>
<c:forEach var="questionAnswer" items="${questionAnswer}">
    질문번호:${questionAnswer.questionNo }<br>
    유저번호:${questionAnswer.userNo }<br>
    클래스번호:${questionAnswer.classNo }<br>
    질문명:${questionAnswer.questionName }<br>
    질문본문:${questionAnswer.questionContent }<br>
    질문시간:<fmt:formatDate value="${questionAnswer.questionDate }" pattern="yyyy-MM-dd"/><br>
    답변명:${questionAnswer.answer }<br>
    답변본문:${questionAnswer.answerContent }<br>
    <br>
</c:forEach>
<a href="/class/onClassQAWrite">질의 작성</a><br>
<a href="/class/onClass">온클래스페이지</a>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />