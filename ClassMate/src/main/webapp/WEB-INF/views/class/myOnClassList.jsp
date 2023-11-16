<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
<h1>내가수강한클래스나열페이지</h1>
<%-- <c:forEach var="lecture" items="${lecture }"> --%>
<!--     <tr> -->
<%--         <td>${lecture.classNo }</td> --%>
<%--         <td>${lecture.teacherNo }</td> --%>
<%--         <td>${lecture.mainCategoryNo }</td> --%>
<%--         <td>${lecture.subCategoryNo }</td> --%>
<%--         <td>${lecture.teacher }</td> --%>
<%--         <td>${lecture.className }</td> --%>
<%--         <td>${lecture.classStart }</td> --%>
<%--         <td>${lecture.classEnd }</td> --%>
<%--         <td>${lecture.maxCount }</td> --%>
<%--         <td>${lecture.expence }</td> --%>
<%--         <td>${lecture.classInfo }</td> --%>
<%--         <td>${lecture.curriculum }</td> --%>
<%--         <td>${lecture.onOff }</td> --%>
<%--         <td>${lecture.headImg }</td> --%>
<%--         <td>${lecture.content }</td> --%>
<%--         <td>${lecture.deleteBoolean }</td> --%>
<%--         <td>${lecture.classDate }</td> --%>
<!--     </tr> -->
<%-- </c:forEach> --%>

<%-- <c:choose> --%>
<%--     <c:when test="${not empty classList}"> --%>
<!--         <ul> -->
<%--             <c:forEach var="classItem" items="${classList}"> --%>
<%--                 <li>${classItem.someProperty}</li> --%>
<%--             </c:forEach> --%>
<!--         </ul> -->
<%--     </c:when> --%>
<%--     <c:otherwise> --%>
<!--         <p>클래스 정보가 없습니다.</p> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>

<c:choose>
    <c:when test="${not empty lecture}">
        <ul>
            <c:forEach var="lecture" items="${lecture}">
                <li>
                    클래스 번호: ${lecture.classNo}<br>
                    강사 번호: ${lecture.teacherNo}<br>
                    주요 카테고리: ${lecture.mainCategoryNo}<br>
                    서브 카테고리: ${lecture.subCategoryNo}<br>
                    강사명: ${lecture.teacher}<br>
                    클래스명: ${lecture.className}<br>
                    개설 날짜: <fmt:formatDate value="${lecture.classDate}" pattern="yyyy-MM-dd"/><br>
                    시작 날짜: <fmt:formatDate value="${lecture.classStart}" pattern="yyyy-MM-dd"/><br>
                    종료 날짜: <fmt:formatDate value="${lecture.classEnd}" pattern="yyyy-MM-dd"/><br>
                    최대 인원: ${lecture.maxCount}<br>
                    비용: ${lecture.expense}<br>
                    클래스 정보: ${lecture.classInfo}<br>
                    커리큘럼: ${lecture.curriculum}<br>
                    온/오프라인: ${lecture.onOff}<br>
                    헤더 이미지: <img src="${lecture.headImg}" alt="Class Image"/><br>
                    내용: ${lecture.content}<br>
                    삭제 여부: ${lecture.deleteBoolean}<br>
                    <a href="/class/onClass">온클래스로 이동</a><br>
                    <a href="/class/offClass">오프클래스로 이동</a>
                    <hr>
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <p>클래스 정보가 없습니다.</p>
    </c:otherwise>
</c:choose>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />