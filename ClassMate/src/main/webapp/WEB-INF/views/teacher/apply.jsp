<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
.note-editor .dropdown-toggle::after { 
   all: unset; 
}
</style>

<script type="text/javascript">
    $(document).ready(function () {
        // 등록 버튼 클릭 시 처리
        $("#btnUpdate").click(function (event) {
            // 필수 입력값 체크
            var teacherTitle = $("#teacherTitle").val();
            var singleFile = $("#singleFile").val();
            var teacherInfo = $("#content").val(); // Summernote 에디터의 값 가져오기

            if (teacherTitle.trim() === "" || teacherTitle === null || teacherInfo.trim() === "" || teacherInfo === null || singleFile === "" || singleFile === null ) {
                // 필수 입력값이 비어있을 경우 알림창 띄우기
                alert("필수 내용을 입력해주세요.");
                event.preventDefault(); // submit 방지
            }
            // 이하 등록 로직 추가...
        });

        // 취소 버튼 클릭 시 처리
        $("#btnCancel").click(function () {
            window.location.href = "/main/main"; // /main/main 페이지로 이동
        });
    });
</script>

<script type="text/javascript">
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
</script>

 <style>
.btn-upload {
  width: 130px;
  height: 27px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

#file {
  display: none;
}
</style>

<div class="cd1">
<div class="nav justify-content-center">
<form action="./apply" method="post" enctype="multipart/form-data" style="width: 850px;  margin-top: 50; margin-bottom: 50; border:1px gray solid; border-radius: 5px;" >
<div class="nav justify-content-center" style="margin-top: 50px;">
	<div style=" display: flex; align-items: center; justify-content: center; font-size: xx-large; font-weight: 900; width: 300px; height: 100px; background-color: #8c8c8c; color: #F4FFFF; border-radius: 5px;">강사 신청</div>
</div>
<div style="margin-top: 50px;">


 <table>
 <colgroup>
	<col style="width: 17%;">
	<col style="width: 39%;">
	<col style="width: 12%;">
	<col style="width: 32%;">
</colgroup>
<tr>
	<td><div class="fw-semibold" style="margin-right: 10px; margin-bottom: 15px; margin-left:10px; font-size: 20px;">신청자 이름 :</div></td>
 	<td><div style="margin-bottom: 15px;"><input type="text" readonly class="form-control form-control-lg" id="floatingPlaintextInput" value="${userName}"></div></td>
 	<td rowspan="3"><img src="/resources/img/plus.png" id="plusImg" alt="더하기" width="40" height="40" style="margin-left: 50px;"></td>
 	<td rowspan="3"><div style="margin-bottom: 10px; display: flex; align-items: center; justify-content: center;"><img id="preview" width="180" height="220"/></div>
 	<div style="margin-right: 10px;"><input type="file"  class="form-control" name="singleFile" id="singleFile" onchange="readURL(this);"></div></td>

</tr>
<tr>
	<td><div class="fw-semibold" style="margin-right: 10px; margin-bottom: 15px; margin-left:10px; font-size: 20px;">강사 자격증 :</div></td>
	<td><div style="margin-bottom: 15px;"><input class="form-control form-control-lg" name="teacherCareer" id="teacherCareer" type="text" placeholder="자격증 파일을 입력해주세요"></div></td>	
</tr>
<tr>
	<td><div class="fw-semibold" style="margin-right: 10px; margin-left:10px; font-size: 20px;">자격증 파일 :</div></td>
	<td><div><input class="form-control form-control-lg" id="formFileLg" type="file" name="file" multiple="multiple"></div></td>	
</tr>

<tr>
	<td><div class="fw-semibold" style="margin-top:40px; margin-right: 10px; margin-bottom: 15px; margin-left:10px; font-size: 20px;">신청 제목 :</div></td>
	<td><div style="margin-bottom: 15px; margin-top:40px;"><input class="form-control form-control-lg" name="teacherTitle" id="teacherTitle" type="text" placeholder="제목을 입력해주세요"></div></td>
</tr>
<tr>
	<td colspan="2"><div class="fw-semibold" style="margin-top:10px; margin-right: 10px; margin-bottom: 15px; margin-left:10px; font-size: 20px;">내용 및 커리큘럼 :</div></td>
</tr>
<tr>
	<td colspan="4">
	<div style="margin-left: 10px; margin-right: 10px;">
	<textarea id="content" name="teacherInfo">${announceBoard.announceContent }</textarea>
         <script type="text/javascript">
         $('#content').summernote({
             placeholder: '본문을 입력해 주세요',
             tabsize: 1,
             height: 250,
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

</div>


<div class="text-center" style="margin-top: 30px; margin-bottom: 20px;">
	<button class="btn btn-primary" id="btnUpdate">신청</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>




</div> <!-- center-box -->

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />