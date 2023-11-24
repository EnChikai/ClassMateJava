<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}

#announceInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 740px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;
display: block;

}


#announceInfoTb th{
text-align: center;
vertical-align: top;
background: rgb(224,224,224);
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
padding-left: 30px;
padding-right: 30px;
vertical-align: middle;

}

#announceInfoTb td{
padding-left: 15px; 
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);

}

#announceInfoTb td input{
padding-left: 5px;
margin-top: 5px;
width: 540px;
height: 25px;

}

#updateBtn, #cancelBtn{
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
margin-right: 19px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: 1px rgb(241,196,15);
	
}

#cancelBtn{
background: black;
box-shadow: 0 0 0 1px black

}

#cancelBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

p{
margin-bottom: 0px;

}
</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(() => {
	
	$(".del").click(e => {
		$(e.target).prev().toggleClass("text-decoration-line-through").css("color"
				, $(e.target).prev().hasClass("text-decoration-line-through") ? "red" : "rgb(13,110,253)");
		
		$(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
	})
	
})
</script>
<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">
<p id="announceInfo" style="margin-bottom: 1rem">이벤트 수정</p>

<!-- 썸네일 테스트 -->
<!-- <div> -->
<%-- <img src="/upload/${eventBoard.headImg }" width="100px;" height="100px;"> --%>
<!-- </div> -->

<form action="/admin/announceUpdate" method="post" enctype="multipart/form-data">
<input style="display: none" readonly="readonly" name="announceNo" value="${announceBoard.announceNo}">

<div style="text-align: left; margin-left: 44px; margin-bottom: 10px;">
<table id="announceInfoTb">
	<tr>
		<th>제목</th>
			<td colspan="3"><input name="announceName" value="${announceBoard.announceName}"></td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${announceBoard.userName}</td>
			
		<th style="width: 124px;">등록일</th>
			<td style="padding-bottom: 0px;">
				${announceBoard.announceDate }
			</td>	
	</tr>
			
	<tr>
		<th>내용</th>
			<td colspan="3">
			<div style="width: 540px; margin-top: 5px;">
			<textarea id="content" name="announceContent">${announceBoard.announceContent }</textarea>
			<script type="text/javascript">
			$('#content').summernote({
			    placeholder: '본문을 입력해 주세요',
			    tabsize: 1,
			    height: 170,
			    toolbar: [
			      ['style', ['style']],
			      ['font', ['bold', 'underline', 'clear']],
			      ['color', ['color']],
			      ['para', ['ul', 'ol', 'paragraph']],
			      ['insert', ['picture']],
			      ['table', ['table']],
			    ]
			  });
			</script>
			</div>
		</td>
	</tr>
	
	<c:if test="${not empty announceBoardFile }">
	<tr>
		<th>기존 첨부파일</th>
			<td colspan="3">
			<div id="originFile">
			<c:forEach var="announceBoardFile" items="${announceBoardFile }">
				<div>
					<a style="color: rgb(13,110,253); text-decoration: underline;">${announceBoardFile.originName }</a>
					<span style="font-size: 14px;" class="del fw-bold text-danger">X</span>
					<input type="checkbox" class="d-none" name="delFileno" value="${announceBoardFile.fileNo }">
				</div>
			</c:forEach>
			
			</div>
			</td>
	</tr>
	</c:if>
	
	<tr>
		<th>신규 첨부파일</th>
			<td colspan="3">
			<input style="height: auto;" type="file" name="announceFile" class="file" multiple="multiple"></td>
	</tr>
	
</table>

</div>

<div style="margin-top: 72px; margin-bottom: 15px;">
<button id="updateBtn">수정</button>
<a href="../admin/announceView?announceNo=${announceBoard.announceNo}"><button id="cancelBtn" type="button">취소</button></a>
</div>
</form>

</div>
<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />