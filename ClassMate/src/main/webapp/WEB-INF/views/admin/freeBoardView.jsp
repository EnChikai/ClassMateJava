<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>
<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}
.note-editor .dropdown-toggle::after { 
   all: unset; 
}

#freePostViewInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 720px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;
display: block;

}

#freePostViewInfoTb th{
text-align: center;
vertical-align: top;
background: rgb(224,224,224);
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
padding-left: 30px;
padding-right: 30px;
vertical-align: middle;
width: 124px;

}

#freePostViewInfoTb td{
padding-left: 15px; 
padding-top: 5px;
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
vertical-align: middle;

}
#updateBtn, #backBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#updateBtn{
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 10px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: 1px rgb(241,196,15);

}

#backBtn{
background: rgb(158,158,158);
box-shadow: 0 0 0 1px #ccc;
margin-right: 482px;

}

#backBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

p{
margin-bottom: 0;

}

#commentTb{
border-bottom: 2px solid #ccc; 
width: 695px; 
margin: auto;

}

.commentTh{
font-size: 15px;
text-align: center;

}

.commentTd{
font-size: 15px;
padding-right: 0;
text-align: center;

}
</style>

<!-- 삭제 모달 -->
<style type="text/css">

#delBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#delBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#delModal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.delModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 650px;;
  min-height: 470px;
  background:#fff;
}
.delModal-con .con{
  font-size:26px; 
  line-height:1.3;
  padding-top: 50px;
  padding-left: 100px;
  padding-right: 100px;
  padding-bottom: 50px;
  height: 400px;
  overflow-y: auto;
  text-align: center; 
}

.closeModalBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black;
font-size: 14px;

}

.closeModalBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
cursor:pointer
	
}

#delOkBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(241,196,15); 
box-shadow: 0 0 0 1px rgb(230,204,100); 
margin-right: 19px;
font-size: 14px;

}

#delOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>

<%-- 페이징 --%>
<style type="text/css">
#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingNow {
   border-radius: 4px; 
   color: black; 
   background-color: rgb(241,196,15); 
   border: 1px solid rgb(251,206,25);
   margin: 3.5px; 
   text-align: center;"

}

#pagingAfter,#pagingBefore {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;
}
</style>

<%-- <% ============================================================================= %> --%>

<script type="text/javascript">

//삭제 모달 열기
function openDelModal(modalname) {
  $("#delModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".delModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#delModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeDelModal").click(function (e) {
		    var modal = $(".delModal-con");
		      $("#delModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});
</script>

<script type="text/javascript">
// DOMContentLoaded 이벤트를 사용하여 스크립트가 실행되기 전에 문서가 로드되었는지 확인
document.addEventListener('DOMContentLoaded', function () {
    // 뒤로가기 버튼 클릭 시 실행되는 함수
    var backBtn = document.getElementById('backBtn');
    if (backBtn) {
        backBtn.addEventListener('click', function() {
            // 현재 URL 가져오기
            var currentUrl = window.location.href;

            // 현재 URL에서 curPage와 sort 값 추출
            var curPageMatch = currentUrl.match(/curPage=(\d+)/);
            var sortMatch = currentUrl.match(/sort=(\d+)/);

            // curPage와 sort 값이 존재하면 뒤로가기 링크 생성
            if (curPageMatch && sortMatch) {
                var curPageValue = curPageMatch[1];
                var sortValue = sortMatch[1];

                // 새로운 URL 생성
                var newUrl = '../admin/freeBoardList?curPage=' + curPageValue + '&sort=' + sortValue;

                // 뒤로가기
                window.location.href = newUrl;
            } else {
                // curPage 또는 sort 값이 없는 경우에 대한 처리
                alert('curPage 또는 sort 값을 찾을 수 없습니다.');
            }
        });
    } else {
        // backBtn이 null인 경우에 대한 처리
        console.error('뒤로가기 버튼을 찾을 수 없습니다.');
    }
});
</script>

<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">
<p id="freePostViewInfo" style="margin-bottom: 1rem">게시글 상세 조회</p>

<div style="text-align: right; margin-right: 62px; padding-bottom: 10px;">
	<button id="backBtn" type="button">목록</button>
	<a href="../admin/userFreePostUpdate?freeNo=${freeBoard.freeNo }"><button id="updateBtn" type="button">수정</button></a>
	<a href="javascript:openDelModal('delModal');" class="terms" style="text-decoration: none; color: black;"><button id="delBtn">삭제</button></a>
</div>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="freePostViewInfoTb" style="width: 695px;">
	<tr>
		<th>제목</th>
			<td colspan="3">[<span>${freeBoard.freeHead }</span>] ${freeBoard.freeName }</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${userInfo.userName }</td>
		<th style="width: 124px;">등록일</th>
			<td style="padding-bottom: 0px;">
				<fmt:formatDate value="${freeBoard.freeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
			</td>	
	</tr>
	
	<tr>
		<th>첨부파일</th>
			<td colspan="3">
			<c:if test="${not empty freeBoardFiles }">
				<c:forEach var="freeBoardFiles" items="${freeBoardFiles }">
				<a href="../board/download?fileNo=${freeBoardFiles.fileNo }">${freeBoardFiles.originName }</a>
				<br>			
				</c:forEach>
			</c:if>
			
			<c:if test="${empty freeBoardFiles }">
				파일이 없습니다
			</c:if>
			</td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">${freeBoard.freeContent }</td>
	</tr>
	
	
</table>


</div>

<%-- <% ============================================================================= %> --%>	

<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNO-1}" end="${paging.endNO-1}" >

<table id="commentTb">

<tr>
	<th class="commentTh">
		${userNameList[i].userName }
	</th>
	<td class="commentTd">
		<fmt:formatDate value="${freeComment[i].freeCommentDate }" pattern="yyyy-MM-dd HH:mm:ss" />
	</td>
</tr>

<tr>
	<td class="commentTd">
		${freeComment[i].freeCommentContent }
	</td>
</tr>

</table>
</c:forEach>

<%-- <% ============================================================================= %> --%>	
<%-- 페이징 --%>	

<c:if test="${paging.totalCount > 0}">
<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&freeNo=${freeBoard.freeNo }" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&freeNo=${freeBoard.freeNo }" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&freeNo=${freeBoard.freeNo }" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&freeNo=${freeBoard.freeNo }" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	
</c:if>

</c:if>
</div>
<%-- <% ============================================================================= %> --%>	
<%-- 삭제 --%>	
<div id="delModal" class="close"></div>
  <div class="delModal-con delModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">해당 사용자의 게시물을</p>
    <p>삭제 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/freeBoardList" method="post">
	<button id="delOkBtn">예</button>
	<input type="text" name="freePostNo" style="display: none;" value="${freeBoard.freeNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeDelModal" id="closeDelModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>			
<%-- <% ============================================================================= %> --%>	      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />