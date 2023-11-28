<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <c:forEach var="list" items="${list }" varStatus="loop">
    	<form id="form${loop.index }">
		<div>
		${list.answer }
		</div>
		<div>
		<div>
		${list.questionName }
		</div>
		<div>
		${list.questionContent }
		</div>
		</div>
		<div>
		<div>
		<textarea placeholder="본문 내용을 입력해주세요">${list.answerContent }</textarea>
		</div>
		<button id="registerButton${loop.index}">등록</button>
		</div>
		</form>
	</c:forEach>
	<c:import url="/WEB-INF/views/layout/ajaxPagination.jsp" />




