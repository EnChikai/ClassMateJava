<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%-- <% ============================================================================= %> --%>
<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
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
width: 130px;

}

#freePostViewInfoTb td{
padding-left: 15px; 
padding-top: 5px;
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
vertical-align: middle;

}
.answerBtn, #cancelBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

.answerBtn{
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 19px;

}

.answerBtn:hover:not(.active){
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
margin-bottom: 0;

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
<p id="freePostViewInfo" style="margin-bottom: 1rem">게시글 수정</p>

<form action="/admin/userFreePostUpdate" method="post" enctype="multipart/form-data">
<input style="display: none" readonly="readonly" name="freeNo" value="${freeBoard.freeNo}">

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="freePostViewInfoTb" style="width: 695px;">
	<tr>
		<th>제목</th>
			<td colspan="3">
			<input style="width: 480px" name="freeName" value="${freeBoard.freeName }">
			
			<c:if test="${freeBoard.freeHead eq '자유'}">
			<select style="margin-left: 5px; height: 30px;" class="dropTag" name="freeHead" id="sort">
				<option value="자유">자유</option>
				<option value="모임">모임</option>
			</select>
			</c:if>
			
			<c:if test="${freeBoard.freeHead eq '모임'}">
			<select class="dropTag" name="freeHead" id="sort">
				<option value="모임">모임</option>
				<option value="자유">자유</option>
			</select>
			</c:if>
			</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${userInfo.userName }</td>
		<th style="width: 124px;">등록일</th>
			<td style="padding-top: 0px; padding-bottom: 0px;">
				<fmt:formatDate value="${freeBoard.freeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
			</td>	
	</tr>
	
	<c:if test="${not empty freeBoardFiles }">
	<tr>
		<th>기존 파일</th>
			<td colspan="3">
				<div id="originFile">
				<c:forEach var="freeBoardFiles" items="${freeBoardFiles }">
					<div>
						<a style="color: rgb(13,110,253); text-decoration: underline;">${freeBoardFiles.originName }</a>
						<span style="font-size: 14px;" class="del fw-bold text-danger">X</span>
						<input type="checkbox" class="d-none" name="delFileno" value="${freeBoardFiles.fileNo }">
					</div>
				</c:forEach>
				</div>
			</td>
	</tr>
	</c:if>
	
	<tr>
		<th>신규 파일</th>
			<td colspan="3">
			<input style="height: auto;" type="file" name="freeFile" class="file" multiple="multiple"></td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">
			<div style="width: 540px; margin-top: 5px;">
			<textarea id="content" name="freeContent">${freeBoard.freeContent }</textarea>
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
	
	
</table>


<div style="margin-top: 20px; margin-bottom: 20px; text-align: center;">

<button id="updateBtn" class="answerBtn">확인</button>

<a href="../admin/userPostList?userNo=${freeBoard.userNo }"><button id="cancelBtn" type="button">뒤로</button></a>

</div>

</div>
</form>

</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />