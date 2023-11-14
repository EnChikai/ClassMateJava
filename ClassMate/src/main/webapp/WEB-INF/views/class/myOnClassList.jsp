<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
	
hi
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
<!--         <p>클래스가 없습니다.</p> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>

<c:choose>
    <c:when test="${not empty classList}">
        <ul>
            <c:forEach var="classItem" items="${classList}">
                <li>
                    클래스 번호: ${classItem.classNo}<br>
                    강사 번호: ${classItem.teacherNo}<br>
                    주요 카테고리: ${classItem.mainCategoryNo}<br>
                    서브 카테고리: ${classItem.subCategoryNo}<br>
                    강사명: ${classItem.teacher}<br>
                    클래스명: ${classItem.className}<br>
                    개설 날짜: <fmt:formatDate value="${classItem.classDate}" pattern="yyyy-MM-dd"/><br>
                    시작 날짜: <fmt:formatDate value="${classItem.classStart}" pattern="yyyy-MM-dd"/><br>
                    종료 날짜: <fmt:formatDate value="${classItem.classEnd}" pattern="yyyy-MM-dd"/><br>
                    최대 인원: ${classItem.maxCount}<br>
                    비용: ${classItem.expense}<br>
                    클래스 정보: ${classItem.classInfo}<br>
                    커리큘럼: ${classItem.curriculum}<br>
                    온/오프라인: ${classItem.onOff}<br>
                    헤더 이미지: <img src="${classItem.headImg}" alt="Class Image"/><br>
                    내용: ${classItem.content}<br>
                    삭제 여부: ${classItem.deleteBoolean}
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <p>클래스가 없습니다.</p>
    </c:otherwise>
</c:choose>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />