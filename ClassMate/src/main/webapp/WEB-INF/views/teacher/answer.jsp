<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>



<script type="text/javascript">

//페이지 로드 시 초기 상태 설정
$(document).ready(function() {
    // 페이지 로드 시 선택된 값이 없다면 div를 숨기게 처리
    if (!$(".dropTag").val()) {
        $("#result").hide();
        $("#start").show();
    }
});

$(function(){

	   $(".dropTag").change(function(){
	      
		   
	      $('#dropSubmit').submit();
	      
	       /* location.href = "/teacher/answer";  */
	      
	   })
	   
	});


function changeSelection(){
	var selectedElement = document.getElementById("classNo");


   
    // 선택한 option의 텍스트
    var optionTxt = selectedElement.options[selectedElement.selectedIndex].text;
}



</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".dropTag").change(function() {
            var selectedClassNo = $(this).val();
            console.log(selectedClassNo)
            
            if (selectedClassNo) {
                // 선택된 값이 있으면 해당 div를 보이게 처리
                $("#start").hide();
            } else {
                // 선택된 값이 없으면 해당 div를 숨기게 처리
                $("#start").show();
            }


        });
    });
</script>

       
<div class="cd1">
<div class="border" style="width: 700px;">       
<div id="all"><h3 style="display: inline-block;">ONF클래스 질문/답변 조회</h3>
<span style="margin-left: 30px;">
    <div id="dropdownContainer">
        <form action="/teacher/answer" method="post" id="dropSubmit" name="dropSubmit">
            <select class="dropTag" name="classNo" id="classNo" onchange="changeSelection()" style="width: 100px;">
                <option selected disabled> --선택-- </option>
                <c:forEach var="dl" items="${dropList }">
                    <option value="${dl.classNo }">${dl.className }</option>
                </c:forEach>
            </select>
        </form>
    </div>
</span>
    
<hr>
</div>


    <c:forEach var="list" items="${list }" varStatus="loop">
    	<form id="form${loop.index }">
		<div>
		${list.answer }
		</div>
		<div>
		<div>
		${list.questionName }
		</div>
		<div>
		${list.questionContent }
		</div>
		</div>
		<div>
		<div>
		<textarea placeholder="본문 내용을 입력해주세요">${list.answerContent }</textarea>
		</div>
		<button id="registerButton${loop.index}">등록</button>
		</div>
		</form>
	</c:forEach>

<div id="start" style="height: 300px;"></div>

</div>  
</div>	<!-- cd1 -->






<c:import url="/WEB-INF/views/layout/footer.jsp" />


