<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#announceViewTb {
	border-collapse: collapse;
	border-color: lightgrey;
	width: 60%;
	margin-left:auto; 
    margin-right:auto;
}

#tdaHead {
	height: 280px;;
}

#tdaBody {
	height: 680px;;
	margin: 0 auto;
	text-align: center;
}

#tdaFoot {
	height: 100px;;
	margin-bottom: 0;
}

#viewBt {
	widows: 65px;
	height:30px;
	margin: 5px;
	cursor: pointer;
	float: right;
}

#announcefile {
	margin-right: 10px;
}

#contentaFile {
	width: 500px;
	height: 30px;
	margin: 0 auto;
	line-height: 1.8;
}

</style>

<tbody>


<div id="announceviewAll">

<table id="announceViewTb" border="1">
	<tr>
		<td id="tdaHead">
			<span>공지게시판 < </span>
			<span>조회 수 : ${viewAnnounce.announceHit} </span>
			
			<h1>${viewAnnounce.announceName }</h1>
			
			<span>작성자 : ${viewAnnounce.userName }</span>
			<span>등록일 : ${viewAnnounce.announceDate }</span>
		</td>
		
	</tr>
	
	<tr>
		<td id="tdaBody">${viewAnnounce.announceContent }<br>
			<c:if test="${not empty announceBoardFile }">
				<div id="contentaFile" style="height: auto; padding: 10px; 	border: 1px solid lightgrey;">
					<c:forEach var="announceBoardFile" items="${announceBoardFile}">
						<img id="announcefile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
						<a href="./download?fileNo=${announceBoardFile.fileNo }"><span id="contentFileSpan"> : ${announceBoardFile.originName }</span></a><br>
					</c:forEach>
				</div>
			</c:if>
		</td>
	</tr>
		
	<tr>	
		<td id="tdaFoot">
			<button id="viewBt" type="button" onclick="location.href='./board'">목록</button>
		</td>
	</tr>
</table>

</div> <!-- #announceviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

