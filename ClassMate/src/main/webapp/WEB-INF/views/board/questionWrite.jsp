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
	height: 510px;
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
   width: 139px;
   height: 28px;
}

#wButton,#wList {
   width: 73px;
   height:35px;
   font-size: 15px;
   color: white;
   margin-top: 20px;
   border: none;
   border-radius: 3px;
   background-color: rgb(241, 196, 15)
}

#questionContent {
	padding: 10px;
	resize: none;
}

.filebox .upload-name {
    display: inline-block;
    border: none;
    width: 330px;;
    margin-left: 12px;
    color: #999999;
    font-size: 15px;
}

.filebox label {
    display: inline-block;
    cursor: pointer;
    margin-top: 50px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}


</style>

<tbody>
<div id="questionWrite">

   <div id="questionh1">
      <h1 style="font-weight: normal;">1:1 문의 등록하기</h1>
   </div>

<form action="./questionWrite" method="post" enctype="multipart/form-data">
   <div id="questionForm">

         <label id="questionUw" style="margin-left: 85px; margin-bottom: 13px;">작성자 &nbsp: </label><span style="display: inline-block; width: 250px; font-size: 14px; color: gray; margin-bottom: 15px; margin-left: 25px;">${userName }</span>
         <select id="questionCategory" name="questionCategory" required="required">
            <option selected disabled>분류</option>
                <option value="계정">계정</option>
               <option value="결재">결재</option>
                <option value="클래스">클래스</option>
                <option value="시스템">시스템</option>
            </select>
         
         <label for="questionTw" style="margin-left: 85px; margin-bottom: 13px;">제목 &nbsp &nbsp : <input type="text" id="questionName" name="questionName" style="width: 393px; margin-left: 23px;"></label><br>
         
      <label for="questionCw" style="margin-left: 85px;">내용 &nbsp &nbsp :
  
      <div id="questionCw2" style="margin-top: -20px; margin-left: 177px; margin-bottom: -40px;">
         <textarea id="questionContent" name="questionContent" cols="53" rows="15" placeholder="내용을 입력해주세요"></textarea>
      </div>
      
      </label>         

      <div class="filebox">
       <span style="margin-left: 85px;">첨부파일 : 
          <input class="upload-name" value="파일을 첨부해주세요">
             <label for="file"><img alt="freefile" src="/resources/img/freefile.png" width="55px" height="22px" style="vertical-align: middle;"></label> 
             <input type="file" id="file" name="file" multiple="multiple">
          </span>
      </div>

   <script type="text/javascript">
       $("#file").on('change', function () {
           var files = $("#file")[0].files;
           var fileName = "";
           for (var i = 0; i < files.length; i++) {
               fileName += files[i].name;
               if (i < files.length - 1) {
                   fileName += ", ";
               }
           }
           $(".upload-name").val(fileName);
       });
   </script>

         <div style="text-align: center; margin-top: 40px;">
         <input type="submit" id="wButton" name="wButton" value="등록" style="margin-right: 8px; cursor: pointer;">
         <button id="wList" type="button" onclick="location.href='./question'" style="background-color: black; cursor: pointer;">취소</button>
         </div>
   
   <input name="userNo" style="display: none;" readonly="readonly" value="${userNo}" >
</div>
</form>

</div>
</tbody>



<c:import url="/WEB-INF/views/layout/footer.jsp" />