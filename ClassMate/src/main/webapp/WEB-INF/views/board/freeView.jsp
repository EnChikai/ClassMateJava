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
	height: 650px;;
}

#tdFoot {
	height: 100px;;
	margin-bottom: 0;
}


#viewBt1, #viewBt2 {
	widows: 65px;
	height:30px;
	margin: 5px;
	cursor: pointer;
	float: right;
}

</style>

<tbody>

<div id="freeviewAll">

<table id="freeViewTb" border="1">
	<tr>
		<td id="tdHead">정보</td>
	</tr>
	
	<tr>
		<td id="tdBody">내용</td>
	</tr>
		
	<tr>	
		<td id="tdFoot">
			<button id="viewBt1" type="button" onclick="location.href='./freeUpdate'">수정</button>
			<button id="viewBt2" type="button" onclick="location.href='./board'">목록</button>
		</td>
	</tr>
</table>

</div> <!-- #freeviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

