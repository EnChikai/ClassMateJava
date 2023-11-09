<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

.defaultWidth{
   margin-left: 450px;
   margin-right: 450px;
	margin-bottom: 300px;
}

#boardtitle {
	margin: auto;
	margin-top: 3em;
	border: 1px;
	background-color: black;
	color: white;
	height: 110px;
	font-size: 150%;
	text-align: center;
}

#boardtitleh2 {
	padding-top: 30px;
	font-weight: bold;
}

#boardtb {
	text-align: center;
	margin: 0 auto;
	/* margin-bottom: 300px; */
	margin-top: 40px;
	vertical-align: middle;
}

#boardToptr {
	height: 60px;
	font-size: 120%;
}

#boardBodytr {
	height: 50px;
}

#boardWrite {
	float: right;
}

#boardWritebt {
	margin-top: 15px;;
	margin-right: 15px;
	width: 70px;
	height: 35px;
	background-color: black;
	color: white;
	border-radius: 4px;
}

</style>


<div class="defaultWidth" >

<tbody>

<div id="boardtitle">
<h2 id="boardtitleh2">통합 게시판</h2>
</div>

<div id="boardAllTb">
<table class="table table-bordered" id="boardtb">

	<tr class="table-secondary" id="boardToptr">
		<th>번호</th>
		<th>말머리</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
<c:forEach var="list" items="${allList }">
	
	<tr id="boardBodytr">
		<td>${list.freeNo }</td>
		<td>${list.freeHead }</td>
		<td>${list.freeName }</td>
		<td>${list.userNo }</td>
		<td>${list.freeDate }</td>
		<td>${list.freeHit }</td>
	</tr>

</c:forEach>
</table>

<div id="boardWrite">
<button id="boardWritebt">등록</button>
</div>

</div>


</tbody>


</div>
<br>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

