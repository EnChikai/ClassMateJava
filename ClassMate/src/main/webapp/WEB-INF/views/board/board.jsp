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

#boardFree,#boardAnnounce, #boardEvent {
	height: 40px;
	font-size: 14px;
}

#searchHead {
	margin-top: 15px;
	margin-left: 15px;
}

#search {
	margin-top: 15px;
	margin-left: 0px;
	font-size: 14px;
	padding-left: 5px;
}

#freeSearchButton {
	margin-top: 15px;
	margin-left: 5px;
	background: none;
	border: none;
}

#boardWritebt {
	margin-top: 15px;
	margin-right: 15px;
	width: 70px;
	height: 33px;
	background-color: black;
	color: white;
	border-radius: 4px;
	border: none;
}

#boardPaging1 {
	background-color: rgb(241, 196, 15); 
	border-color: rgb(241, 196, 15); 
	border-radius: 4px;
	margin: 3.5px;
	text-align: center;
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

#boardDivOut {
	width:910px;
	margin: 0 auto;
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
            var newcells = row.getElementsByTagName('a')
            var color;

            if (row.classList.contains('text-row')) {
                color = textRowColor; // 텍스트 행은 동일한 색상으로 설정
            } else {
                color = getRandomUniqueColor(usedColors); // 각 행에는 겹치지 않는 랜덤한 색상 설정
                usedColors.push(color);
            }

            for (var i = 0; i < cells.length; i++) {
                cells[i].style.color = color;
                newcells[0].style.color = color;
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
    
    //----------------------------------------------------------------------------------
    
    
$(document).ready(function () {
    	
        // 검색창 입력
    $("#search").keypress(function (e) {
        if (e.which === 13) {
        	submitSearch();
        }
    });

    $("#freeSearchButton").click(function () {
        submitSearch();
    });
    
});
    
 //작성자 검색어 입력
 function submitSearch(paging, searchHead, search) {
     var searchValue = $("#search").val();
     
//      console.log("searchHead??", searchHead);
//      console.log("search??", search);
     
     if (searchValue === "") {
         // 검색어가 비어있을 경우 처리
         alert("검색어를 입력하세요.");
         return;
     }
     
     var formSearch = {
 		searchHead: searchHead !== undefined ? searchHead : $("#searchHead").val(),
        search: search !== undefined ? search : $("#search").val(),
     	curPage: paging
     };
     
     console.log("검색어 들어왔니?", formSearch);
     var url = "";

     if (formSearch.searchHead === "작성자") {
         url = "./board/boardNameSearch";
     } else if (formSearch.searchHead === "제목") {
         url = "./board/boardTitleSearch";
     }

     $.ajax({
         type: "POST",
         url: url,
         data: formSearch,
         success: function (boardNameList) {
             console.log("검색 성공", boardNameList);
             var paging = boardNameList.paging;
             console.log("searchHead??전", boardNameList.searchHead);
             console.log("search??전", paging.search);
             
          // searchHead 변수 초기화
             var searchHead = searchHead || boardNameList.searchHead || $("#searchHead").val();

             // search 변수 초기화
             var search = search || paging.search || $("#search").val();
             
             console.log("searchHead??후", searchHead);
             console.log("search??후", search);
             
             
             // 결과가 없을 경우 알림창 표시
             if (boardNameList.boardNameList.length === 0) {
                 alert("검색된 결과가 없습니다.");
             } else {
            	 var boardNameList = boardNameList.boardNameList;
                 renderBoardNameList(boardNameList);
                 updatePagination(paging, searchHead, search);
             }
         },
         error: function (error) {
             console.error("검색 실패", error);
         }
     });

 }
  
//----------------------------------------------------------------------------------

// 날짜의 달과 일이 한 자리 수일 경우 앞에 0을 붙이는 함수
function padZero(num) {
    return num < 10 ? '0' + num : num;
}
  
// 검색 결과를 화면에 출력하는 함수
function renderBoardNameList(boardNameList) {
	var boardBody = $("#boardBody");
	
	boardBody.empty();
	
	// 여기에서 searchResult를 이용하여 동적으로 HTML 생성
    var boardNameListHtml = "";

    // 검색 결과를 돌면서 행 추가
    for (var i = 0; i < boardNameList.length; i++) {
        var boardName = boardNameList[i];
//         var formattedDate = moment(boardName.freeDate, "MM DD, YYYY").format("YYYY-MM-DD");

		var date = new Date(boardName.freeDate);
		
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);  // 월은 0부터 시작하므로 1을 더하고 2자리로 포맷팅
		var day = ('0' + date.getDate()).slice(-2);  // 일도 2자리로 포맷팅
		var formattedDate = year + '-' + month + '-' + day;

        boardNameListHtml += '<tr id="boardFree">';
        boardNameListHtml += '<td>' + boardName.freeNo + '</td>';
        boardNameListHtml += '<td>' + boardName.freeHead + '</td>';
        boardNameListHtml += '<td><a href="/board/freeView?freeNo=' + boardName.freeNo + '">' + boardName.freeName + '</a></td>';
        boardNameListHtml += '<td>' + boardName.userName + '</td>';
        boardNameListHtml += '<td>' + formattedDate + '</td>';
        boardNameListHtml += '<td>' + boardName.freeHit + '</td>';
        boardNameListHtml += '</tr>';
    }

    boardNameListHtml += '</table>';

    // 생성된 HTML을 해당 위치에 추가
   // $("#boardAllTb").html(boardNameListHtml);
    boardBody.append(boardNameListHtml);
	
}

function updatePagination(paging, searchHead, search) {
    console.log("paging 뭔데 ", paging);
    console.log("searchHead 뭔데 ", searchHead);
    console.log("search 뭔데 ", search);

    // 페이징 목록을 추가
    var paginationHtml = '<ul class="pagination pagination-sm justify-content-center" style="margin-top: 70px;">';

    // 이전 페이지로 이동
    if (paging.curPage > 1) {
        paginationHtml += '<li style="width: 45px;">';
        paginationHtml += '<a class="page-link" href="javascript:" onclick="submitSearch(' + (paging.curPage - 1) + ', \'' + searchHead + '\', \'' + search + '\')" id="boardPaging6">&lt;</a>';
        paginationHtml += '</li>';
    }

    // 페이징 번호 목록 추가
    for (var i = paging.startPage; i <= paging.endPage; i++) {
        if (paging.curPage === i) {
            paginationHtml += '<li class="page-item" style="width: 45px;">';
            paginationHtml += '<a class="page-link active" href="javascript:" onclick="submitSearch(' + i + ', \'' + searchHead + '\', \'' + search + '\')" id="boardPaging1">' + i + '</a>';
            paginationHtml += '</li>';
        } else {
            paginationHtml += '<li class="page-item" style="width: 45px;">';
            paginationHtml += '<a class="page-link" href="javascript:" onclick="submitSearch(' + i + ', \'' + searchHead + '\', \'' + search + '\')" id="boardPaging2">' + i + '</a>';
            paginationHtml += '</li>';
        }
    }

    // 다음 페이지로 이동
    if (paging.curPage < paging.totalPage) {
        paginationHtml += '<li class="page-item" style="width: 45px;">';
        paginationHtml += '<a class="page-link" href="javascript:" onclick="submitSearch(' + (paging.curPage + 1) + ', \'' + searchHead + '\', \'' + search + '\')" id="boardPaging3">&gt;</a>';
        paginationHtml += '</li>';
    }

    paginationHtml += '</ul>';

    // 생성된 HTML을 해당 위치에 추가
    $("#boardPagination").html(paginationHtml);
}
</script>


<div class="defaultWidth" >

<div id="boardDivOut">
<div id="boardtitle">
	<h2 id="boardtitleh2">통합 게시판</h2>
</div><!-- #boardtitle -->

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
	
<c:forEach var="announceList" items="${announceList }">
	<tr id="boardAnnounce" style="color: red; font-weight: bold;">
		<td></td>
		<td style="color: red;">${announceList.announceHead }</td>
		<td style="color: red;"><a href="/board/announceView?announceNo=${announceList.announceNo }" style="color: red;">${announceList.announceName }</a></td>
		<td style="color: red;">${announceList.userName }</td>
		<td style="color: red;">${announceList.announceDate }</td>
		<td style="color: red;">${announceList.announceHit }</td>
	</tr>
</c:forEach>

<c:forEach var="eventList" items="${eventList }">
    <tr id="boardEvent" class="colored-row">
        <td></td>
        <td>${eventList.eventHead }</td>
        <td><a class="newtag" href="/board/eventView?eventNo=${eventList.eventNo }" >${eventList.eventName }</a></td>
        <td>${eventList.userName }</td>
        <td>${eventList.eventDate }</td>
        <td>${eventList.eventHit }</td>
    </tr>
</c:forEach>
<tbody id="boardBody">
	<c:forEach var="freeList" items="${freeList }">
		<tr id="boardFree">
			<td>${freeList.freeNo }</td>
			<td>${freeList.freeHead }</td>
			<td><a href="/board/freeView?freeNo=${freeList.freeNo }">${freeList.freeName }</a></td>
			<td>${freeList.userName }</td>
			<td>${freeList.freeDate }</td>
			<td>${freeList.freeHit }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
	
	<div id="wb">
		<select id="searchHead" name="searchHead" required="required">
               <option value="작성자">작성자</option>
                <option value="제목">제목</option>
        </select>
		<input type="text" id="search" name="search">
		<button type="button" id="freeSearchButton" name="freeSearchButton">
			<img id="freeSearchImg" alt="freeSearchImg" src="/resources/img/freeSearch.png" width="25" height="25">
		</button>
		
		<button id="boardWritebt" type="button" onclick="location.href='./freeWrite'" style="float:right;">작성</button>

</div><!-- #defaultWidth -->

</div><!-- #boardDivOut -->


<div id="boardPagination">
   <ul class="pagination pagination-sm justify-content-center" style="margin-top: 70px;">
   
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
</div><!--.boardPagination -->

<%-- <c:import url=".././layout/pagination.jsp"/> --%>
</div><!-- defaultWidth -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />


