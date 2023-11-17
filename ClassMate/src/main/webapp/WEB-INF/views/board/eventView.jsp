<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#eventViewTb {
	border-collapse: collapse;
	border-color: lightgrey;
	width: 60%;
	margin-left:auto; 
    margin-right:auto;
}

#tdeHead {
	height: 280px;;
}

#tdeBody {
	height: 680px;;
	margin: 0 auto;
	text-align: center;
}

#tdeFoot {
	height: 100px;;
	margin-bottom: 0;
}

#viewBt2 {
	widows: 65px;
	height:30px;
	margin: 5px;
	cursor: pointer;
	float: right;
}

#eventile {
	margin-right: 10px;
}

#contenteFile {
	width: 500px;
	height: 30px;
	margin: 0 auto;
	line-height: 1.8;
}

</style>

<tbody>


<div id="eventviewAll">

<table id="eventViewTb" border="1">
	<tr>
		<td id="tdeHead">
			<span>이벤트게시판 < </span>
			<span>조회 수 : ${viewEvent.eventHit} </span>
			
			<h1>${viewEvent.eventName }</h1>
			
			<span>작성자 : ${viewEvent.userName }</span>
			<span>등록일 : ${viewEvent.eventDate }</span>
		</td>
		
	</tr>
	
	<tr>
		<td id="tdeBody">${viewEvent.eventContent }<br>
			<c:if test="${not empty eventBoardFile }">
				<div id="contenteFile" style="height: auto; padding: 10px; 	border: 1px solid lightgrey;">
					<c:forEach var="eventBoardFile" items="${eventBoardFile}">
						<img id="eventfile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
						<a href="./download?fileNo=${eventBoardFile.fileNo }"><span id="contentFileSpan"> : ${eventBoardFile.originName }</span></a><br>
					</c:forEach>
				</div>
			</c:if>
		</td>
	</tr>
		
	<tr>	
		<td id="tdeFoot">
			<button id="viewBt2" type="button" onclick="location.href='./board'">목록</button>
		</td>
	</tr>
</table>

</div> <!-- #eventviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

