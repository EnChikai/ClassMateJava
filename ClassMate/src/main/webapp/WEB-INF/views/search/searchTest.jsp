<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>검색 폼</h1>
    <form method="post" action="/search/main">
        <label for="keyword">메인 검색어:</label>
        <input type="text" id="keyword" name="keyword" required>
        <br>
        <input type="submit" value="검색">
    </form>
    <form method="post" action="/search/sub">
        <label for="search">서브 검색어:</label>
        <input type="text" id="search" name="search" required>
        <br>
        <input type="submit" value="검색">
    </form>
    <form method="post" action="/search/title">
        <label for="search">제목 검색어:</label>
        <input type="text" id="search" name="search" required>
        <br>
        <input type="submit" value="검색">
    </form>
    <form method="post" action="/search/nick">
        <label for="search">이름 검색어:</label>
        <input type="text" id="search" name="search" required>
        <br>
        <input type="submit" value="검색">
    </form>
</body>
</html>