<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>카테고리 목록</h1>
    
    <table>
        <tr>
            <th>SUB CATEGORY NO</th>
            <th>MAIN CATEGORY NO</th>
            <th>SUB CATEGORY NAME</th>
        </tr>
        <c:forEach items="${list}" var="category">
            <tr>
                <td>${category.subCategoryNo}</td>
                <td>${category.mainCategoryNo}</td>
                <td>${category.subCategoryName}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>