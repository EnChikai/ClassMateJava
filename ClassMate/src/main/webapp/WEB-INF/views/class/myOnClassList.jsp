<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>내가 수강한 클래스 나열 페이지</title>
    <style>
    	body {
            background-color: #f8f9fa;
        }
        .header {
            text-align: center;
            padding: 20px;
            margin-bottom: 30px;
        }
        .card-custom {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .card-header-custom {
            background-color: #FFF0B1;
            color: #000;
        }
        .card-body-custom {
            background-color: #ffffff;
            color: #000;
        }
        .img-thumbnail {
            width: 100%;
            border-radius: 10px;
        }
        .page-navigation {
            justify-content: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">
    <div class="header">
        <h1>내가 수강한 클래스</h1>
    </div>

    <c:choose>
        <c:when test="${not empty lecture}">
            <c:forEach var="lecture" items="${lecture}">
                <!-- 온라인 클래스(onOff 값이 1)인 경우만 표시 -->
                <c:if test="${lecture.onOff eq '1'}">
                    <div class="card card-custom">
                        <div class="card-header card-header-custom">
                            <h3>
                                <a href="/class/onClass?classNo=${lecture.classNo}" 
                                   class="stretched-link" 
                                   style="color: inherit; text-decoration: none;">
                                    ${lecture.className}
                                </a>
                            </h3>
                        </div>
                        <div class="card-body card-body-custom">
                            <img src="/upload/${lecture.headImg}" alt="강의 이미지" class="img-thumbnail">
                            <p class="mt-2">${lecture.classInfo}</p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>클래스 정보가 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

<!-- Bootstrap JS and other necessary scripts-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
