<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">

.defaultWidth{
	margin-left: 450px;
	margin-right: 450px;
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
	margin-top: 40px;
	vertical-align: middle;
}

#boardToptr {
	height: 60px;
	font-size: 120%;
}

#boardFree,#boardAnnounce, #boardEvent {
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

#boardPaging1 {
	background-color: rgb(241, 196, 15); 
	border-color: rgb(241, 196, 15); 
	border-radius: 4px;
	margin: 3.5px;
	text-align: center;"
}

#boardPaging2 {
	border-radius: 4px; 
	color: black; 
	background-color: #f1f3f5; 
	border-color: #f1f3f5; 
	margin: 3.5px; 
	text-align: center;"
}

#boardPaging3,#boardPaging4,#boardPaging5,#boardPaging6 {
	border-radius: 4px; 
	color: black; 
	background-color: #f1f3f5; 
	border-color: #f1f3f5; 
	margin: 3.5px; 
	text-align: center;"
}




</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    
    document.addEventListener('DOMContentLoaded', function () {
        var coloredRows = document.querySelectorAll('.colored-row');
        var textRowColor = getRandomColor(); // 텍스트 행의 색상을 랜덤으로 지정

        var usedColors = [];

        coloredRows.forEach(function (row) {
            var cells = row.getElementsByTagName('td');
            var color;

            if (row.classList.contains('text-row')) {
                color = textRowColor; // 텍스트 행은 동일한 색상으로 설정
            } else {
                color = getRandomUniqueColor(usedColors); // 각 행에는 겹치지 않는 랜덤한 색상 설정
                usedColors.push(color);
            }

            for (var i = 0; i < cells.length; i++) {
                cells[i].style.color = color;
            }
        });

        function getRandomUniqueColor(usedColors) {
            var colors = ['#2E64FE', '#FF8000', '#FE2E9A', '#088A29'];
            var availableColors = colors.filter(function (color) {
                return !usedColors.includes(color);
            });

            if (availableColors.length === 0) {
                return getRandomColor(); // 사용 가능한 색상이 없으면 랜덤으로 선택
            }

            return availableColors[Math.floor(Math.random() * availableColors.length)];
        }

        function getRandomColor() {
            var colors = ['#642EFE', '#2E64FE', '#FF8000', '#FE2E9A', '#088A29'];
            return colors[Math.floor(Math.random() * colors.length)];
        }
    });
</script>


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
	
<c:forEach var="announceList" items="${announceList }">
	<tr id="boardAnnounce" style="color: red; font-weight: bold;">
		<td></td>
		<td style="color: red;">${announceList.announceHead }</td>
		<td style="color: red;">${announceList.announceName }</td>
		<td style="color: red;">${announceList.userName }</td>
		<td style="color: red;">${announceList.announceDate }</td>
		<td style="color: red;">${announceList.announceHit }</td>
	</tr>
</c:forEach>

<c:forEach var="eventList" items="${eventList }">
    <tr id="boardEvent" class="colored-row"">
        <td></td>
        <td>${eventList.eventHead }</td>
        <td>${eventList.eventName }</td>
        <td>${eventList.userName }</td>
        <td>${eventList.eventDate }</td>
        <td>${eventList.eventHit }</td>
    </tr>
</c:forEach>


	
<c:forEach var="freeList" items="${freeList }">
	<tr id="boardFree">
		<td>${freeList.freeNo }</td>
		<td>${freeList.freeHead }</td>
		<td>${freeList.freeName }</td>
		<td>${freeList.userName }</td>
		<td>${freeList.freeDate }</td>
		<td>${freeList.freeHit }</td>
	</tr>
</c:forEach>


</table>

<div id="boardWrite" style="float: right;">
	<button id="boardWritebt" type="button" onclick="location.href='./freeWrite'">작성</button>
</div>

</div>


</tbody>


<div>
   <ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
   
		<!-- 맨 처음 페이지로 이동 -->
<%-- 		<c:if test="${paging.curPage ne 1 }">
		    <li class="page-item" style="width: 45px;">
		        <a class="page-link" href="./board?curPage=1" id="boardPaging5">&laquo;</a>
		    </li>
		</c:if> --%>
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${paging.curPage > 1 }">
		    <li style="width: 45px;">
		        <a class="page-link" href="./board?curPage=${paging.curPage - 1 }" id="boardPaging6">&lt;</a>
		    </li>
		</c:if>
		      
      
      <!-- 페이징 번호 목록 -->
      <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
         <c:if test="${paging.curPage eq i }">
         <li class="page-item" style="width: 45px;">
            <a class="page-link active" href="./board?curPage=${i }" id="boardPaging1">${i }</a>
         </li>
         </c:if>
         <c:if test="${paging.curPage ne i }">
         <li class="page-item" style="width: 45px;">
            <a class="page-link" href="./board?curPage=${i }" id="boardPaging2">${i }</a>
         </li>
         </c:if>
      </c:forEach>
      
      
		<!-- 다음 페이지로 이동 -->
		<c:if test="${paging.curPage < paging.totalPage }">
		    <li class="page-item" style="width: 45px;">
		        <a class="page-link" href="./board?curPage=${paging.curPage + 1 }" id="boardPaging3">&gt;</a>
		    </li>
		</c:if>
		
		<!-- 맨 마지막 페이지로 이동 -->
<%-- 		<c:if test="${paging.curPage ne paging.totalPage }">
		    <li class="page-item" style="width: 45px;">
		        <a class="page-link" href="./board?curPage=${paging.totalPage }" id="boardPaging4">&raquo;</a>
		    </li>
		</c:if> --%>

      
   </ul>
</div>

<%-- <c:import url=".././layout/pagination.jsp"/> --%>

</div>
<br>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

