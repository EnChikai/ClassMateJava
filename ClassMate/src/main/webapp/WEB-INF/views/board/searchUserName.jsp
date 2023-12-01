<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

.defaultWidth{
	text-align: justify;
	margin-top: 60px;
	margin-bottom: 100px;
}

#boardtb tr th {
	border-top: 1.8px solid black; 
	border-bottom: 1.8px solid black;
	background-color: #cdcaba63;
}

#boardtitle {
	margin-top: 2em;
	border: 1px;
	background-color: black;
	color: white;
	width: 910px;
	height: 90px;
	font-size: 150%;
	text-align: center;
	margin: 0 auto;
}

#boardtitleh2 {
	padding-top: 25px;
	font-weight: bold;
}

#boardtb {
	text-align: center;
	margin: 0 auto;
	margin-top: 25px;
	vertical-align: middle;
	width: 910px;
}
#boardtb tr th, #boardtb tr td {
	border-left: 0;
	border-right: 0;
}

#boardToptr {
	height: 40px;
	font-size: 15px;
}

</style>

<div class="defaultWidth" >
    <div id="boardtitle">
		<h2 id="boardtitleh2">통합 게시판</h2>
	</div> <!-- #boardtitle -->
    
    <div id="boardAllTb">
		<table class="table table-bordered" id="boardtb">
			<tr class="table-warning" id="boardToptr">
				<th>번호</th>
				<th width="90px;">말머리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		
			<c:forEach var="boardNameList" items="${boardNameList }">
			<tr id="boardFree">
				<td>${boardNameList.freeNo }</td>
				<td>${boardNameList.freeHead }</td>
				<td><a href="/board/freeView?freeNo=${boardNameList.freeNo }">${boardNameList.freeName }</a></td>
				<td>${boardNameList.userName }</td>
				<td>${boardNameList.freeDate }</td>
				<td>${boardNameList.freeHit }</td>
			</tr>
			</c:forEach>
		
    	</table>
    </div>	<!-- #boardAllTb -->
</div> <!-- #defaultWidth -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
