<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#freeViewTb {
	border-collapse: collapse;
	border-color: lightgrey;
	width: 60%;
	margin-left:auto; 
    margin-right:auto;
}

#tdHead {
	height: 280px;;
}

#tdBody {
	height: 680px;;
	margin: 0 auto;
	text-align: center;
}

#tdFoot {
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

#viewBt3 {
	widows: 65px;
	height:30px;
	margin: 5px;
	cursor: pointer;
	float: right;
}

#freefile {
	margin-right: 10px;
}

#contentFile {
	width: 500px;
	height: 30px;
	margin: 0 auto;
	line-height: 1.8;
}

</style>

<tbody>


<div id="freeviewAll">

<table id="freeViewTb" border="1">
	<tr>
		<td id="tdHead">
			<span>자유게시판 < </span>
			<span>조회 수 : ${viewFree.freeHit} </span>
			
			<h1>${viewFree.freeName }</h1>
			
			<span>작성자 : ${viewFree.userName }</span>
			<span>등록일 : ${viewFree.freeDate }</span>
		</td>
		
	</tr>
	
	<tr>
		<td id="tdBody">${viewFree.freeContent }<br>
			<c:if test="${not empty freeBoardFile }">
				<div id="contentFile" style="height: auto; padding: 10px; 	border: 1px solid lightgrey;">
					<c:forEach var="freeBoardFile" items="${freeBoardFile}">
						<img id="freefile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
						<a href="./download?fileNo=${freeBoardFile.fileNo }"><span id="contentFileSpan"> : ${freeBoardFile.originName }</span></a><br>
					</c:forEach>
				</div>
			</c:if>
		</td>
	</tr>
		
	<tr>	
		<td id="tdFoot">
			<button id="viewBt1" type="button" onclick="location.href='./board'">목록</button>
			<button id="viewBt2" type="button" onclick="location.href='./freeUpdate?freeNo=${viewFree.freeNo}'">수정</button>
			<a href="./delete?freeNo=${viewFree.freeNo }"><button id="viewBt3" type="button">삭제</button></a>
		</td>
	</tr>
</table>

</div> <!-- #freeviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

