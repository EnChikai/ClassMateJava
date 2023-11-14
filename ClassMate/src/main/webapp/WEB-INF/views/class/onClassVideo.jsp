<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
	
hi

<c:choose>
    <c:when test="${not empty classVideo}">
        <p>비디오 번호: ${classVideo.videoNo}</p>
        <p>클래스 번호: ${classVideo.classNo}</p>
        <p>비디오 강의: ${classVideo.videoLesson}</p>
        <p>원본 파일명: ${classVideo.originName}</p>

        <%-- 동영상 파일 링크 또는 임베드 --%>
        <p>동영상: <a href="path/to/video/${classVideo.storedName}">동영상 보기</a></p>
        <%-- 여기서 'path/to/video/'는 실제 동영상 파일이 저장된 경로를 나타냅니다. --%>
    </c:when>
    <c:otherwise>
        <p>동영상 정보를 찾을 수 없습니다.</p>
    </c:otherwise>
</c:choose>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />