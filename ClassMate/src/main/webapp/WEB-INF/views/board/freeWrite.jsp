<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">

#freelegend {
   text-align: center;
   background-color: black;
   color: white;
   width: 600px;
   height: 40px;
   font-size: 140%;
   padding-top: 8px;
   margin-bottom: 40px;
}

#freeForm {
   width: 700px;
   text-align: left;
   margin: 0 auto;
   margin-top: 70px;
   margin-bottom: 80px;
}

#freeName,#freeUw {
   margin: 7px 0;
   height: 25px;
}


#freeHead {
   width: 140px;
   height: 28px;
}

#wButton,#wList {
   width: 65px;
   height: 29px;
   color: white;
   border: none;
   border-radius: 3px;
   background-color: rgb(241, 196, 15)
}

#freeSummer {
	width: 450px;
	margin: 0 auto;
}

.filebox .upload-name {
    display: inline-block;
    border: none;
    width: 390px;;
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

.note-editable {
    letter-spacing: 2px;
}

</style>

<tbody>
<div id="freewrite">

<form action="./freeWrite" method="post" enctype="multipart/form-data">
   <div id="freeForm">
   <fieldset id="freeFieldset" style="border: 1px solid gray; border-radius: 4px; height: 600px;">

      <legend id="freelegend">게시글 등록</legend>

         <label for="freeTw" style="word-spacing:32px; margin-left: 85px;">제목 : <input type="text" id="freeName" name="freeName" style="margin-left:-19px; width: 444px;"></label><br>
         
         <label id="freeUw" style="word-spacing:15px; margin-left: 85px;">작성자 : </label><span style="display: inline-block; width: 300px; font-size: 14px; color: gray; margin-bottom: 15px;">${userName }</span>
         
         <select id="freeHead" name="freeHead" required="required">
            <option selected disabled>말머리</option>
               <option value="자유">자유</option>
                <option value="모임">모임</option>
            </select>

         <!-- <label for="freeCw" style="word-spacing:32px; margin-left: 85px; ">내용 : <textarea rows="20" cols="60" id="freeCw" name="freeCw" placeholder="내용을 입력해주세요" style="padding: 10px; height: 200px;"></textarea></label><br> -->

		<label for="freeCw" style="word-spacing:2px; margin-left: 85px;">내용 : 
		<div id="freeSummer" style="margin-top: -20px; margin-left: 175px; margin-bottom: -40px;">
			<textarea id="freeContent" name="freeContent"></textarea>
		<script type="text/javascript">
		$('#freeContent').summernote({
		    placeholder: '내용을 입력해주세요',
		    tabsize: 2,
		    height: 220,
		    width: 450,
		    toolbar: [
		      ['style', ['style']],
		      ['font', ['bold', 'underline', 'clear']],
		      ['color', ['color']],
		      ['para', ['table', 'paragraph']],
		      ['insert', ['link', 'picture']],
		    ]
		  });
		</script>
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
         <button id="wList" type="button" onclick="location.href='./board'" style="background-color: black; cursor: pointer;">취소</button>
         </div>
	
	<input name="userNo" style="display: none;" readonly="readonly" value="${userNo}" >
   </fieldset>
</div>
</form>

</div>
</tbody>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
