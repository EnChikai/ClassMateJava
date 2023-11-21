<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

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


<div class="center-box">
<div><h3>강사 신청</h3></div>
<form action="./apply" method="post" enctype="multipart/form-data">
<div>
<div>
<table>
<tr>
	<td class="table-info">강사 이름</td><td><input type="text" name="userName" id="userName" readonly="readonly"></td>
</tr>
<tr>
	<td class="table-info">관련 자격증</td><td><input type="text" name= "teacherCareer" id="teacherCareer"></td>
</tr>
<tr>
	<td class="table-info">자격증 파일</td><td><input type="file" class="form-control" name="file" id="file" multiple="multiple"></td>
</tr>
<tr>
	<td class="table-info">사진 등록</td><td><input type="file"  class="form-control" name="singleFile" id="singleFile" onchange="readURL(this);"> 
	<img id="preview" /></td>
</tr>
</table> 
<br>
</div>

<div>내용 및 커리큘럼</div>

<textarea name="teacherInfo" id="teacherInfo"></textarea>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">신청</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>




</div> <!-- center-box -->

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />