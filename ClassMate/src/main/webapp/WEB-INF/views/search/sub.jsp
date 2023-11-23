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
    <h1>클래스 목록</h1>
    
    <table>
        <tr>
            <th>Class No</th>
            <th>Teacher No</th>
            <th>Main Category No</th>
            <th>Sub Category No</th>
            <th>Teacher</th>
            <th>Class Name</th>
            <th>Class Date</th>
            <th>Class Start</th>
            <th>Class End</th>
            <th>Max Count</th>
            <th>Expense</th>
            <th>Class Info</th>
            <th>Curriculum</th>
            <th>On/Off</th>
            <th>Head Img</th>
            <th>Delete Boolean</th>
        </tr>
        <c:forEach items="${list}" var="lecture">
            <tr>
                <td>${lecture.classNo}</td>
                <td>${lecture.teacherNo}</td>
                <td>${lecture.mainCategoryNo}</td>
                <td>${lecture.subCategoryNo}</td>
                <td>${lecture.teacher}</td>
                <td>${lecture.className}</td>
                <td>${lecture.classDate}</td>
                <td>${lecture.classStart}</td>
                <td>${lecture.classEnd}</td>
                <td>${lecture.maxCount}</td>
                <td>${lecture.expense}</td>
                <td>${lecture.classInfo}</td>
                <td>${lecture.curriculum}</td>
                <td>${lecture.onOff}</td>
                <td>${lecture.headImg}</td>
                <td>${lecture.deleteBoolean}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>