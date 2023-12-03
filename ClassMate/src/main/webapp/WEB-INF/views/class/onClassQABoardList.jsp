<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>질의응답 전체 조회 페이지</title>
<style>

.card {
	box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.badge-answer {
	font-size: 1rem;
}

.badge-complete {
	background-color: #ffc107;
	/* Bootstrap warning color for complete answers */
}

.badge-incomplete {
	background-color: #6c757d;
	/* Bootstrap secondary color for incomplete answers */
}

.header-title {
	text-align: center;
	padding-bottom: 20px; /* 구분선과 제목 사이의 간격 */
	border-bottom: 10px solid #FFF0B1; /* 노란색 구분선 */
	margin-bottom: 30px; /* 구분선 아래 컨텐츠와의 간격 */
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<div style="max-width: 1000px; margin: auto;">
		<div class="container mt-4">
			<div class="container mt-5">
				<div class="row mb-2">
					<div class="col-12">
						<h1 class="header-title">ON클래스 질문/답변</h1>
					</div>
				</div>
				<c:forEach var="questionAnswer" items="${questionAnswer}">
					<div class="card mb-3">
						<div class="card-body">
							<span
								class="badge badge-answer ${questionAnswer.answer == 1 ? 'badge-complete' : 'badge-incomplete'}">
								${questionAnswer.answer == 1 ? '답변완료' : '미답변'} </span>
							<h5 class="card-title">${questionAnswer.questionName }</h5>
							<p class="card-text">${questionAnswer.questionContent }</p>
							<c:if test="${questionAnswer.answer == 1}">
								<div class="card-text">
									<strong>답변: </strong>${questionAnswer.answerContent}
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
				<div class="text-right">
					<!-- 오른쪽 정렬을 위한 div -->
					<a href="/class/onClass?classNo=${classNo}" class="btn btn-secondary mt-3">뒤로가기</a>
					<a href="/class/onClassQAWrite?classNo=${classNo}" class="btn mt-3" style="background-color: #F1C40F; color: white;">등록하기</a>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- Include Bootstrap JS and its dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
