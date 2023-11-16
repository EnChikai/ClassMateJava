<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div>
<h1>온클래스메인페이지</h1>
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

<hr>

<c:forEach var="classVideo" items="${classVideo}">
    영상번호:${classVideo.videoNo }<br>
    클래스번호:${classVideo.classNo }<br>
    회차번호:${classVideo.videoLesson }<br>
    원본명:${classVideo.originName }<br>
    <br>
</c:forEach>

<hr>
<a href="/class/onClassQABoardList">질의응답 전체보기</a><br>
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

<hr>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />