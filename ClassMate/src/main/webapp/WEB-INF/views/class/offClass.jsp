<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
<h1>오프클래스메인페이지</h1>
<%-- <c:choose> --%>
<%--     <c:when test="${not empty map}"> --%>
        <ul>
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
                주소 번호: ${address.addressNo }<br>
               	상세 주소: ${address.mainAddress }<br>
               	도로명 주소: ${address.subAddress }
                <hr>
            </li>
        </ul>
<%--     </c:when> --%>
<%--     <c:otherwise> --%>
<!--         <p>클래스가 없습니다.</p> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />