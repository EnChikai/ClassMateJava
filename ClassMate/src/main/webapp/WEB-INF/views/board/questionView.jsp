<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">

#questionWrite {
	margin-top: 70px;
}

#questionh1 {
   text-align: center;
   margin: 0 auto;
   border: 1px solid lightgrey;;
   border-radius: 4px;
   width: 650px;
   height: 50px;
   font-size: 80%;
   font-weight: normal;
   padding-top: 8px;
}

#questionForm {
	border: 1px solid lightgrey;
	height: auto;
 	width: 650px;
	margin: 0 auto;
	padding-top: 50px;
	margin-bottom: 80px;
}

#questionName,#questionUw {
   margin: 7px 0;
   height: 25px;
}


#questionCategory {
   width: 140px;
   height: 28px;
}

#contentFileSpan {
	vertical-align: text-bottom;
}

#wList {
   width: 73px;
   height:35px;
   font-size: 15px;
   color: white;
   margin-top: 30px;
   margin-bottom: 50px;
   border: none;
   border-radius: 3px;
   background-color: rgb(241, 196, 15)
}

#questionCw2 {
	margin-top: -20px;
	margin-left: 90px;
	margin-bottom: -40px;
	width: 380px;
	height: 200px;
}

#divHr {
	width: 500px;
	margin: 0 auto;
	margin-bottom: 10px;
}

#contentFile {
   width: 500px;
   margin: 0 auto;
   line-height: 1.8;
   padding: 15px;
   margin-top: 10px;
}

#answersh4 {
	font-weight:normal;
	color: red;
	margin-left: 85px;
	text-align: justify;
	width: 475px;
}

#answer {
	margin-top: -20px;
	margin-left: 90px;
	margin-bottom: -40px;
	width: 380px;
	height: 100px;
}

</style>

<tbody>
<div id="questionWrite">

   <div id="questionh1">
      <h1 style="font-weight: normal;">1:1 문의 확인하기</h1>
   </div>

<form action="./questionView" method="get" enctype="multipart/form-data">
<div id="questionForm">

      <div id="questionUw" style="margin-left: 85px; margin-bottom: 13px;">작성자 &nbsp &nbsp: 
      	<span style="display: inline-block; width: 250px; margin-left: 12px; color: gray;">${viewQuestion.userName }</span>
      <select id="questionCategory" name="questionCategory" required="required">
         <option selected disabled>${viewQuestion.questionCategory }</option>
         </select>
      </div>
        
      <div id="questionTw" style="margin-left: 85px; margin-bottom: 13px;">제목 &nbsp &nbsp &nbsp: 
      	<span style="display: inline-block; width: 390px; margin-left: 15px;">${viewQuestion.questionName }</span>
      </div>
         
      <div id="questionCw" style="margin-left: 85px;">내용 &nbsp &nbsp &nbsp:
	      <div id="questionCw2">
	         <span>${viewQuestion.questionContent }</span>
	      </div>
      </div>         

       <c:if test="${not empty questionFile }">
          <div id="contentFile" style="height: auto;  border: 1px solid lightgrey; text-align: center;">
             <c:forEach var="questionFile" items="${questionFile}">
                <img id="questionfile" alt="questionfile" src="/resources/img/file.png" width="22" height="19">
                <span id="contentFileSpan"> : ${questionFile.originName }</span><br>
             </c:forEach>
          </div>
   		</c:if>
   		
	<br><br>

	<div id="divHr">
		<hr>
	</div>	
	
	<br>
	
	  <div style="margin-left: 85px; color: red;">답변&nbsp &nbsp &nbsp:
	      <div id="answer">
	         <span>${viewQuestion.answerContent }</span>
	      </div>
      </div>

     <div style="text-align: center; margin-top: 40px;">
     	<button id="wList" type="button" onclick="location.href='./question'" style="background-color: black; cursor: pointer;">목록</button>
     </div>
   
   <input name="userNo" style="display: none;" readonly="readonly" value="${userNo}" >
</div>
</form>

</div>
</tbody>



<c:import url="/WEB-INF/views/layout/footer.jsp" />