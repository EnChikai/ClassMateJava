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
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/header.jsp" />

	<div class="container">
		<div class="header">
			<h1>ON클래스 질문 작성</h1>
		</div>
		<form action="/class/onClassQAWrite" method="post">
			<div class="form-group">
				<label for="classNo" class="form-label">클래스</label> <select
					class="form-control" name="classNo" id="classNo">
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
			<div class="form-group">
				<label for="questionName" class="form-label">제목</label> <input
					type="text" class="form-control" name="questionName"
					id="questionName">
			</div>
			<div class="form-group">
				<label for="questionContent" class="form-label">내용</label>
				<textarea class="form-control" name="questionContent"
					id="questionContent" rows="5"></textarea>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-custom">등록</button>
				<a href="/class/onClassQABoardList" class="btn btn-cancel">취소</a>
			</div>
		</form>
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
