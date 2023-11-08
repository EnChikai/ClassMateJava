<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>			
			
			<div style="border: 1px solid #ccc;">
			<div>회원 관리</div>
			<table class="table table-bordered border-primary table-hover">
			
			<tr class="table-primary border-primary">
				<th>회원 번호</th>
				<th>회원 아이디</th>
				<th>회원명</th>
				<th>가입일</th>
				<th>강사 여부<br>
			</tr>
			
			<c:forEach items="${list }" var="list"> 
				<tr>
					<td>${list.userNo }</td>
					<td>${list.userId }</td>
					<td>${list.userName }</td>
					<td>${list.userDateCreated }</td>
					<td></td>
				<tr>
			</c:forEach>
			</table>
			
			<c:import url=".././layout/pagination.jsp"/>
			</div>
			
<%-- <% ============================================================================= %> --%>	
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />