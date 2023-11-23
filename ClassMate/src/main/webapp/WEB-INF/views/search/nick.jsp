<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    
    <table>
        <tr>
            <th>FREE_NO</th>
            <th>USER_NO</th>
            <th>FREE_HEAD</th>
            <th>FREE_DATE</th>
            <th>FREE_HIT</th>
            <th>FREE_NAME</th>
        </tr>
        <c:forEach items="${list}" var="free">
            <tr>
                <td>${free.freeNo}</td>
                <td>${free.userNo}</td>
                <td>${free.freeHead}</td>
                <td>${free.freeDate}</td>
                <td>${free.freeHit}</td>
                <td>${free.freeName}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>