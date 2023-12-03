<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}

#freeBoardInfo{
padding-bottom: 8px; 
text-align: center; 
margin-left: auto;
margin-right: auto;
margin-top: 20px;
margin-bottom: 17px; 
font-size: 22px; 
font-weight:bold;

}

#freeBoardListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;

}

.freeBoardListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;

}

.freeBoardListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
vertical-align: middle;
cursor:pointer

}

.topMenuBtn{
background: white;
border-radius: 3px; 
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
font-size:14px;
padding-top : 12px;
padding-bottom : 12px;
padding-left: 14px; 
padding-right: 14px;
vertical-align: bottom;

}

.checked{
background: rgb(241,196,15);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(231,186,5);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

.delCheckbox {
width: 20px;
height: 20px;
vertical-align: middle;

}

</style>

<%-- 페이징 CSS --%>
<style type="text/css">
#pagination {
   margin-bottom: 20px;
}

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
   background-color: rgb(251,206,25); 
   border: 1px solid rgb(241,196,15);
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

<!-- 비할성화 모달 -->
<style type="text/css">

#delBtn, #fakeDelBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black;
font-size: 15px;

}

#delBtn:hover:not(.active), #fakeDelBtn:hover:not(.active){
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
<%-- <% ============================================================================= %> --%>
<c:forEach var="freeBoardList" items="${freeBoardList }"> 
<script type="text/javascript">
$(function(){
	$('#delCheckbox${freeBoardList.freeNo }').click(function(){
		
		if($('.delCheckbox').is(":checked")){
			$('#delBtn').css('display', 'inline');
			$('#fakeDelBtn').css('display', 'none');
			
		}else{
			$('#delBtn').css('display', 'none');
			$('#fakeDelBtn').css('display', 'inline');
		}
	})
})
</script>	
</c:forEach>

<script type="text/javascript">
$(function(){
    var checkedValues = []; <%-- 체크된 값을 저장할 배열 초기화 --%>

    $('.delCheckbox').click(function(){
        checkedValues = []; <%-- 어떤 체크박스가 클릭되면 배열을 초기화합니다. --%> 

        $('.delCheckbox:checked').each(function() {
            checkedValues.push($(this).val()); <%-- 체크된 값을 배열에 추가합니다. --%>
        });

        if (checkedValues.length > 0) {
            $('#delBtn').css('display', 'inline');
            $('#fakeDelBtn').css('display', 'none');
        } else {
            $('#delBtn').css('display', 'none');
            $('#fakeDelBtn').css('display', 'inline');
        }
    });

    <%-- '삭제' 버튼을 클릭할 때 체크된 값을 사용 --%>
    $('#delBtn').click(function() {
        console.log('체크된 값:', checkedValues);
        <%-- 여기에서 체크된 값을 사용하여 추가 동작을 수행 --%>
    });
});
</script>

<script type="text/javascript">
$(function() {
	<%-- '삭제' 버튼을 클릭할 때 --%> 
  $('#delOkBtn').click(function() {
    <%--'freePostNo' 필드에 체크된 값 할당--%>
    $('#freePostNo').val(checkedValues.join(','));

    <%--폼 제출--%>
    $('#deleteForm').submit();
  });
  
	<%--다른 부분에서 checkedValues 정의 및 사용--%>
  $(document).on('change', '.delCheckbox', function() {
      checkedValues = [];
      $('.delCheckbox:checked').each(function() {
          checkedValues.push($(this).val());
      });
  });
  
});
</script>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){

	$(".dropTag").change(function(){
		
		$('#freeBoardListForm').submit();
		
	})
	
});

$(function(){
	
    $('.freeBoardListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.freeBoardListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

function fakeDelclick() {
  alert("체크박스를 클릭해주세요")
}
</script>	

<%-- 클릭시 유저 상세보기로 --%>
<c:forEach items="${freeBoardList }" var="freeBoardList"> 
<script>
$(function(){
	
	$(".freeBoardInfo${freeBoardList.freeNo }").click(function(){
		
		
		location.href = '../admin/freeBoardView?curPage=${paging.curPage}&sort=${sort}&freeNo=${freeBoardList.freeNo}';
		
	})
	
});
</script>
</c:forEach>

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
<%-- <% ============================================================================= %> --%>

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<a href="../admin/board"><button style="margin-left: 1px;" class="topMenuBtn">공지/이벤트</button></a>
<button class="topMenuBtn checked">자유게시판</button>
<a href="../admin/questionList"><button class="topMenuBtn">1:1문의</button></a>
</div>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="freeBoardInfo">&#x003C; 자유게시판 &#x003E;</p>

<form id="freeBoardListForm" action="../admin/freeBoardList" method="get">
	<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">
		
		<input style="display: none" type="text" readonly="readonly" name="curPage" value="${paging.curPage}">
		
		<div>
		<c:if test="${sort eq 0}">
		<select class="dropTag" name="sort" id="sort">
			<option value="0">최신순</option>
			<option value="1">오래된순</option>
			<option value="2">작성자순</option>
			<option value="3">제목순</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 1}">
		<select class="dropTag" name="sort" id="sort">
			<option value="1">오래된순</option>
			<option value="0">최신순</option>
			<option value="2">작성자순</option>
			<option value="3">제목순</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 2}">
		<select class="dropTag" name="sort" id="sort">
			<option value="2">작성자순</option>
			<option value="0">최신순</option>
			<option value="1">오래된순</option>
			<option value="3">제목순</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 3}">
		<select class="dropTag" name="sort" id="sort">
			<option value="3">제목순</option>
			<option value="0">최신순</option>
			<option value="1">오래된순</option>
			<option value="2">작성자순</option>
		</select>
		</c:if>
		
		        
        </div>
        
	</div>
</form>

<table id="freeBoardListTb">	
	
<tr>
	<th class="freeBoardListTh" width="7%">번호</th>
	<th class="freeBoardListTh" width="40%">제목</th>
	<th class="freeBoardListTh" width="10%">등록일</th>
	<th class="freeBoardListTh" width="10%">작성자</th>
	<th class="freeBoardListTh" width="10%">선택/해제<br>
</tr>

<c:forEach var="freeBoardList" items="${freeBoardList }"> 
	<tr class="freeBoardListTr" >
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">${freeBoardList.freeNo }</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">[${freeBoardList.freeHead }] ${freeBoardList.freeName }</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">${freeBoardList.freeDate }</td>
		<td class="freeBoardListTd freeBoardInfo${freeBoardList.freeNo }">${freeBoardList.userName }</td>
		<td class="freeBoardListTd"><input id="delCheckbox${freeBoardList.freeNo }" class="delCheckbox" type="checkbox" value="${freeBoardList.freeNo }"></td>
	</tr>
</c:forEach>
</table>

<div style="text-align:right; margin-top: 20px; margin-bottom: 15px; margin-right: 65px;">
<button  id="fakeDelBtn" onclick="fakeDelclick()">삭제</button>
<a href="javascript:openDelModal('delModal');" class="terms" style="text-decoration: none; color: black;"><button style="display: none" id="delBtn">삭제</button></a>
</div>

<%-- <% ============================================================================= %> --%>

<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	


</div>
<%-- <% ============================================================================= %> --%>	

<%-- 삭제 --%>	
<div id="delModal" class="close"></div>
  <div class="delModal-con delModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">해당 사용자의 게시물을</p>
    <p>삭제 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form id="deleteForm" action="../admin/freeBoardList" method="post">
      <button id="delOkBtn">예</button>
      <input type="text" name="freePostNo" id="freePostNo" style="display: none;" readonly="readonly">
      <a href="javascript:void(0);" class="closeDelModal" id="closeDelModal">
        <button class="closeModalBtn" style="margin-top: 65px" type="button">아니오</button>
      </a>
    </form>
    
    </div>
  </div>	
  
<%-- <% ============================================================================= %> --%>	
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />