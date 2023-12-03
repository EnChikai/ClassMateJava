<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>질의응답 작성 페이지</title>
<style>
.container {
	max-width: 600px;
}

.header {
	background-color: #FFF0B1;
	padding: 20px;
	text-align: center;
	margin-bottom: 30px;
}

.btn-custom {
	background-color: #FFC107; /* Yellow color */
	border: none;
	padding: 10px 20px;
	margin-top: 10px;
	margin-right: 10px; /* Spacing between buttons */
	color: #000; /* Text color */
}

.btn-custom:hover {
	background-color: #e6b800; /* Slightly darker yellow on hover */
	color: #000;
}

.btn-cancel {
	background-color: #6c757d; /* Bootstrap's default gray */
	padding: 10px 20px;
	margin-top: 10px;
	color: #fff; /* White text color */
	text-decoration: none;
}

.btn-cancel:hover {
	background-color: #5a6268; /* Slightly darker gray on hover */
	color: #fff;
}

.header-title {
	text-align: center;
	padding-bottom: 20px; /* 구분선과 제목 사이의 간격 */
	border-bottom: 10px solid #FFF0B1; /* 노란색 구분선 */
	margin-bottom: 30px; /* 구분선 아래 컨텐츠와의 간격 */
}

.label-highlight {
	background-color: #FFF0B1; /* 노란색 배경 */
	display: inline-block;
	padding: .375rem .75rem; /* 패딩으로 라벨 주위 공간을 추가 */
	margin-bottom: .5rem; /* 라벨 아래 마진을 추가 */
	width: 100%; /* 라벨 너비를 부모 요소에 맞춤 */
	box-sizing: border-box; /* 패딩과 보더가 너비에 포함되도록 설정 */
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
						<h1 class="header-title">ON클래스 질문 작성</h1>
					</div>
				</div>
				<form action="/class/onClassQAWrite" method="post">
					<div class="form-group">
						<select class="form-control" name="classNo" id="classNo">
							<c:forEach var="lecture" items="${lecture}">
								<c:if test="${lecture.classNo == selectedClassNo}">
									<option value="${lecture.classNo}" selected="selected">${lecture.className}</option>
								</c:if>
								<c:if test="${lecture.classNo != selectedClassNo}">
									<option value="${lecture.classNo}">${lecture.className}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="form-group row">
						<label for="questionName"
							class="col-form-label col-sm-2 label-highlight">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="questionName"
								id="questionName">
						</div>
					</div>
					<div class="form-group row">
						<label for="questionContent"
							class="col-form-label col-sm-2 label-highlight">내용</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="questionContent"
								id="questionContent" rows="5"></textarea>
						</div>
					</div>
					<div class="form-group text-center">
						<a href="/class/onClassQABoardList?classNo=${selectedClassNo}"
							class="btn btn-cancel">취소</a>
						<button type="submit" class="btn btn-custom">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- Bootstrap JS and other necessary scripts-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
