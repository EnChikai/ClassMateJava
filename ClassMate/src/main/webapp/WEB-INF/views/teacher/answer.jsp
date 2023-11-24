<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript">

$(function(){

	   $(".dropTag").change(function(){
	      
	      $('#userListForm').submit();
	      
	      location.href = "/teacher/regist";
	      
	   })
	   
	});


function changeSelection(){
	var selectedElement = document.getElementById("classCheck");


   
    // 선택한 option의 텍스트
    var optionTxt = selectedElement.options[selectedElement.selectedIndex].text;
}



</script>
<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ONF클래스 질문/답변 조회</h3>
<div id= "all">
    <select class="dropTag" name="classCheck" id="classCheck" onchange="changeSelection()">
    	<option selected disabled> --선택-- </option>
       		<c:forEach var="dl" items = "${dropList }">
       		<option value="${dl.classNo }">${dl.className }</option>
      	 	</c:forEach>
    </select>
</div>

<hr>


</div>	<!-- center box -->

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

