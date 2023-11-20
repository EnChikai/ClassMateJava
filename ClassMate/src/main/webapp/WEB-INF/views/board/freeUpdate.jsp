<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">

#freelegendUpdate {
   text-align: center;
   background-color: black;
   color: white;
   width: 600px;
   height: 40px;
   font-size: 140%;
   padding-top: 8px;
   margin-bottom: 40px;
}

#freeFormUpdate {
   width: 700px;
   text-align: left;
   margin: 0 auto;
   margin-top: 70px;
   margin-bottom: 80px;
}

#freeName,#freeUu {
   margin: 7px 0;
   height: 25px;
}


#freeHead {
   width: 140px;
   height: 28px;
   margin-top: 3px;
}

#uButton,#uList {
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
<div id="freeUpdate">

<form action="./freeUpdate" method="post" enctype="multipart/form-data">
   <div id="freeFormUpdate">
   <fieldset style="border: 1px solid gray; border-radius: 4px; height: 600px;">

      <legend id="freelegendUpdate">게시글 수정</legend>

         <label for="freeTu" style="word-spacing:32px; margin-left: 85px;">제목 : </label><span style="display: inline-block; width: 400px; font-size: 14px; color: gray; margin-bottom: 15px;">${paramFree.freeName}</span><br>
         
         <label id="freeUu" style="word-spacing:15px; margin-left: 85px;">작성자 : </label><span style="display: inline-block; width: 300px; font-size: 14px; color: gray; margin-bottom: 15px;">${paramFree.userName}</span>
         
         <select id="freeHead" name="freeHead" required="required">
            <option disabled>말머리</option>
	            <c:if test="${freeHead eq 1 }">
	               <option value="자유" selected="selected">자유</option>
	                <option value="모임">모임</option>
	            </c:if>
	            <c:if test="${freeHead eq 0 }">
	               <option value="자유">자유</option>
	                <option value="모임" selected="selected">모임</option>
	            </c:if>
            </select>

      <label for="freeCu" style="word-spacing:2px; margin-left: 85px;">내용 : 
      <div id="freeSummer" style="margin-top: -12px; margin-left: 175px; margin-bottom: -40px;">
         <textarea id="freeContent" name="freeContent">${paramFree.freeContent }</textarea>
      <script type="text/javascript">
      $('#freeContent').summernote({
          placeholder: '수정할 데이터',
          tabsize: 2,
          height: 220,
          width: 450,
          toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['link', 'picture']],
      //       ['insert', ['picture']],
          ]
        });
      </script>
      </div>
      </label>         

      <div class="filebox">
       <span style="margin-left: 85px;">첨부파일 : 
          <input class="upload-name" value="파일 첨부 또는 변경하시겠습니까?">
             <label for="file">
             	<img alt="freefile" src="/resources/img/freefile.png" width="55px" height="22px" style="vertical-align: middle;">
             </label> 
             <input type="file" id="file" name="file" multiple="multiple">
          </span>
      </div>
      
      <div id="contentFile" style="height: auto; padding: 10px; 	border: 1px solid lightgrey;">
			<c:forEach var="freeBoardFile" items="${freeBoardFile}">
				<img id="freefile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
						<a href="./download?fileNo=${freeBoardFile.fileNo }">
							<span id="contentFileSpan"> : ${freeBoardFile.originName }</span>
						</a><span class="del fw-bold fs-4 text-danger">X</span>
		      	<input type="checkbox" class="d-none" name="delFileno" value="${freeBoardFile.fileNo }"><br>
			</c:forEach>
	  </div>
      
		<script type="text/javascript">
		$(() => {
		   $("#title").focus()
		   
		   $(".del").click(e => {
		      $(e.target).prev().toggleClass("text-decoration-line-through")
		      
		      $(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
		   })
		   
		   $("#content").summernote({
		      height: 300
		   })
		})
		</script>

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
         <input type="submit" id="uButton" name="uButton" value="수정" style="margin-right: 8px; cursor: pointer;">
         <button id="uList" type="button" onclick="location.href='./board'" style="background-color: black; cursor: pointer;">취소</button>
         </div>
   
   <input name="userNo" style="display: none;" readonly="readonly" value="${userNo}" >
   </fieldset>
</div>
</form>

</div>
</tbody>



<c:import url="/WEB-INF/views/layout/footer.jsp" />