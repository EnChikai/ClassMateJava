<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
	
hi

<table border="1">
    <tr>
        <th>질문 번호</th>
        <th>사용자 번호</th>
        <th>클래스 번호</th>
        <th>질문 이름</th>
        <th>질문 내용</th>
        <th>질문 날짜</th>
        <th>답변 여부</th>
        <th>답변 내용</th>
    </tr>
    <c:forEach var="item" items="${questionAnswerList}">
        <tr>
            <td>${item.questionNo}</td>
            <td>${item.userNo}</td>
            <td>${item.classNo}</td>
            <td>${item.questionName}</td>
            <td>${item.questionContent}</td>
            <td><fmt:formatDate value="${item.questionDate}" pattern="yyyy-MM-dd"/></td>
            <td>${item.answer}</td>
            <td>${item.answerContent}</td>
        </tr>
    </c:forEach>
</table>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />