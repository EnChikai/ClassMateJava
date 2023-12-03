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
<title>내가 수강한 클래스 나열 페이지</title>
<style>
.container {
	max-width: 1000px;
	margin: auto;
	padding: 0 20px;
}

.header-title {
	text-align: center;
	padding-bottom: 20px; /* 구분선과 제목 사이의 간격 */
	border-bottom: 10px solid #FFF0B1; /* 노란색 구분선 */
	margin-bottom: 30px; /* 구분선 아래 컨텐츠와의 간격 */
}

.card-custom {
	border: 1px solid #dee2e6; /* 테두리 색상 */
	border-radius: 0.25rem; /* 모서리 둥글기 */
	background-color: #fff; /* 배경색 */
	box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* 그림자 효과 */
	margin-bottom: 20px; /* 카드 사이의 간격 */
}

.img-fluid {
	border-top-left-radius: 0.25rem; /* 이미지 왼쪽 위 모서리 둥글기 */
	border-bottom-left-radius: 0.25rem; /* 이미지 왼쪽 아래 모서리 둥글기 */
}

.col-md-8 {
	padding: 20px; /* 텍스트 컨텐츠 패딩 */
}

/* 반응형 뷰를 위한 추가 스타일 */
@media ( max-width : 768px) {
	.img-fluid {
		border-top-right-radius: 0.25rem; /* 모바일 뷰에서 이미지 오른쪽 위 모서리 둥글게 */
	}
	.col-md-8 {
		border-top: 1px solid #dee2e6; /* 모바일 뷰에서 내용 상단에 테두리 추가 */
	}
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/header.jsp" />

	<div class="container mt-5">
		<div class="row mb-2">
			<div class="col-12">
				<h1 class="header-title">진행중인 ON클래스</h1>
			</div>
		</div>

		<!-- 각 클래스 카드를 반복 -->
		<c:forEach var="lecture" items="${lecture}">
			<c:if test="${lecture.onOff eq '1'}">
				<!-- 카드 전체에 링크 적용 -->
				<a href="/class/onClass?classNo=${lecture.classNo}"
					class="text-decoration-none">
					<div class="card-custom">
						<div class="row no-gutters">
							<!-- 이미지 열 -->
							<div class="col-md-4">
								<img src="/upload/${lecture.headImg}" alt="강의 이미지"
									class="img-fluid">
							</div>
							<!-- 제목과 내용 열 -->
							<div class="col-md-8">
								<div class="card-body">
									<h3 class="card-title">${lecture.className}</h3>
									<p class="card-text">${lecture.classInfo}</p>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:if>
		</c:forEach>

		<!-- ... 이후 코드 생략 ... -->

	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- Bootstrap JS and other necessary scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>