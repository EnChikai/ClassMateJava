<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% Date date = new Date(); %>
<% SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd (E)", Locale.KOREA); %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.boardManagement{
background: rgb(241,196,15);

}

#boardInfo{
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


#boardInfoTb th{
text-align: center;
vertical-align: top;
background: rgb(224,224,224);
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);
padding-left: 30px;
padding-right: 30px;
vertical-align: middle;

}

#boardInfoTb td{
padding-left: 15px; 
padding-bottom: 5px;
border-bottom: 2px solid rgb(175,175,175);
border-top: 2px solid rgb(175,175,175);

}

#boardInfoTb td input{
padding-left: 5px;
margin-top: 5px;
width: 447px;
height: 25px;

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
background: rgb(243,156,18);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(243,156,18);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

#writeBtn,#cancelBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#writeBtn{
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 19px;

}

#writeBtn:hover:not(.active){
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

</style>

<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){
	
	$(".dropTag").change(function(){
		
		if($(this).val() === '0'){
			$('.headImg').css('display','none');
			$('.eventE').css('display','none');
			$('.annoE').css('display','table-cell');
			
		}else{
			$('.headImg').css('display','table-cell');
			$('.eventE').css('display','table-cell');
			$('.annoE').css('display','none');
		}
		
	})
	
});
</script>
<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">

<p id="boardInfo">공지사항/이벤트 등록</p>

<form action="/admin/writeEventAnno" method="post" enctype="multipart/form-data">
<div style="text-align: left; margin-left: 62px; margin-bottom: 10px;">

<table id="boardInfoTb">
	<tr>
		<th>제목</th>
			<td colspan="3">
			<input name="postName" style="height: 25px;">
			<select class="dropTag" name="sort" id="sort">
				<option value="0">공지사항</option>
				<option value="1">이벤트</option>
			</select>
			</td>
	</tr>
	
	<tr>
		<th>작성자</th>
			<td style="width: 280px;">
			<input style="width: 250px;" readonly="readonly" value="${userId}">
			<input style="display: none;" readonly="readonly"  name="userNo" value="${userNo}">
			</td>
		<th style="width: 123px;">등록일</th>
			<td style="padding-bottom: 0px;">
			<%=newFormat.format(date) %>
			</td>	
	</tr>
	
	<tr>
		<th class="headImg" style="display: none;">썸네일</th>
			<td colspan="3" class="headImg" style="display: none;">
			<input style="height: auto;" type="file" name="file" id="file">
			</td>
	</tr>
	
	<tr>
		<th>내용</th>
			<td colspan="3">
			<div style="width: 540px; margin-top: 5px;">
			<textarea id="content" name="content"></textarea>
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
	
	<tr>
		<th class="annoE">첨부파일</th>
			<td colspan="3" class="annoE">
			<input style="height: auto;" type="file" name="announceFile" class="file" multiple="multiple"></td>
	</tr>
	
	<tr>
		<th class="eventE" style="display: none;">첨부파일</th>
			<td colspan="3" class="eventE" style="display: none;">
			<input style="height: auto;" type="file" name="eventFile" class="file" multiple="multiple"></td>
	</tr>
	
</table>

</div>
<div style="margin-top: 25px; margin-bottom: 15px;">
<a><button id="writeBtn">등록</button></a>
<a href="../admin/board"><button id="cancelBtn" type="button">취소</button></a>
</div>
</form>

</div>
<%-- <% ============================================================================= %> --%>
		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />