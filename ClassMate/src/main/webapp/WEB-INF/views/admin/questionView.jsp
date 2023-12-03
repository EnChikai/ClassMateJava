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

#questionViewInfo{
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

#questionViewInfoTb th{
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

#questionViewInfoTb td{
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
background: rgb(158,158,158);
box-shadow: 0 0 0 1px #ccc;

}

#cancelBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){
	
	let anwerBoolean = '${question.answer }';
	
	if(anwerBoolean === "확인중"){
		$('.anserInfo').css("display","none");
		$('#updateBtn').css("display","none");
		$('#anwerText').css("display","inline");
		$('#answerBtn').css("display","inline");
		
	}else{
		$('.anserInfo').css("display","table-cell");
		$('#updateBtn').css("display","inline");
		$('#anwerText').css("display","none");
		$('#answerBtn').css("display","none");
	}
	
	$('#updateBtn').click(function(){
		
		$('.anserInfo').css("display","none");
		$('#updateBtn').css("display","none");
		$('#anwerText').css("display","inline");
		$('#anwerText').val('${question.answerContent }');
		$('#answerBtn').css("display","inline");
		
		
	})
})
</script>
<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 70px;">
<p id="questionViewInfo" style="margin-bottom: 1rem">1:1문의(Q&A) 상세보기</p>

<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">
<table id="questionViewInfoTb" style="width: 695px;">
	<tr>
		<th>제목</th>
			<td colspan="3">[<span>${question.questionCategory }</span>] ${question.questionName }</td>
	<tr>
	
	<tr>
		<th>작성자</th>
			<td>${userInfo.userName }</td>
		<th style="width: 124px;">등록일</th>
			<td style="padding-bottom: 0px;">
				<fmt:formatDate value="${question.questionDate }" pattern="yyyy-MM-dd HH:mm:ss" />
			</td>	
	</tr>
	
	<tr>
		<th>첨부파일</th>
			<td colspan="3">
			<c:if test="${not empty questionFile }">
				<c:forEach var="questionFile" items="${questionFile }">
				<a href="./questionFileDownload?fileNo=${questionFile.fileNo }">${questionFile.originName }</a>
				<br>			
				</c:forEach>
			</c:if>
			
			<c:if test="${empty questionFile }">
				파일이 없습니다
			</c:if>
			</td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">${question.questionContent }</td>
	</tr>
	
	
	<tr>
		<th style="display: none;" class="anserInfo" >답변</th>
		<td style="display: none;" class="anserInfo" colspan="3">
			${question.answerContent }
		</td>
	</tr>
	
</table>

<form action="/admin/questionView" method="post">
<textarea id="anwerText" name="answerContent" style="width: 695px; height: 150px; margin-top: 10px; padding: 10px; border: 2px solid #ccc;" placeholder="답변 작성하기" ></textarea>
<input readonly="readonly" style="display: none" type="number" name="questionNo" value="${question.questionNo }">

<div style="margin-top: 20px; margin-bottom: 20px; text-align: center;">

<button id="answerBtn" class="answerBtn">답변</button>

<button style="display: none;" id="updateBtn" class="answerBtn" type="button">수정</button>

<a href="../admin/questionList"><button id="cancelBtn" type="button">뒤로</button></a>
</div>
</form>

</div>


</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />