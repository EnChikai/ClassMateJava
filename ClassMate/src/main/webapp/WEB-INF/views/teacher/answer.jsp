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
$(document).ready(function() {
	   $(".dropTag").change(function() {
	        $('#dropSubmit').submit();
	    });
	    
	    $("form[id^='form']").each(function(index) {
	        var answer = $(this).find(".answer").text();
	        console.log(answer);
	        
	        var buttonId = "questionButton" + index;
	        var textareaId = "textarea" + index;
	        var registerButtonId = "registerButton" + index;
	        var registerInput = "registerInput" + index;
	        var uncorrectId = "uncorrect" + index;
	        
	        if (answer === "1") {
	            $("#" + buttonId).text("답변수정");
	            $("#" + registerButtonId).text("수정");
	        } else {
	            $("#" + buttonId).text("답변하기");
	            $("#" + registerButtonId).text("등록");
	        }

	        $("#" + buttonId).click(function(event) {
	            event.preventDefault();
	            $("#" + textareaId).toggle(); // 답변수정 또는 답변하기 버튼 클릭 시 textarea 토글
	            $("#" + registerButtonId).toggle(); // 답변수정 또는 답변하기 버튼 클릭 시 등록 버튼 토글
	        });
	        
	        $("#" + registerButtonId).click(function(event) {
	            event.preventDefault();

	            // 수정 또는 등록 버튼 클릭 시 서버로 데이터 전송
	            var formData = {
	                answerContent: $("#" + textareaId).val(), // 답변 내용을 textarea에서 가져옴
	                questionNo: $("#" + registerInput).val()
	                // 다른 필요한 데이터가 있다면 추가
	                
	            };
	                console.log(formData)

	            $.ajax({
	                type: "POST",
	                url: "/teacher/answer_ok", // 실제 서블릿의 URL로 변경
	                data: formData,

	                success: function(res) {
	                    // 서버에서의 처리가 성공하면 이 부분에 원하는 화면 업데이트 로직 추가
	                    console.log("Success:", res);
	                    $("#" + textareaId).val(res); // 예를 들어, 서버에서의 응답을 해당 div에 넣어주는 등의 작업
	                    $("#" + buttonId).text("답변수정");
	    	            $("#" + registerButtonId).text("수정");
	    	            $("#" + uncorrectId).text("답변완료");
	                    
	                },
	                error: function(error) {
	                    console.error("Error:", error);
	                    // 실패 시 처리 (예: 오류 메시지 표시)
	                }
	            });
	        });
	    });
	});

	$(document).ready(function() {
    	$(".registButton").hide();
	});

    function changeSelection() {
        var selectedElement = document.getElementById("classNo");
        // 선택한 option의 텍스트
        var optionTxt = selectedElement.options[selectedElement.selectedIndex].text;
    }
</script>

<style>
    /* 초기에는 textarea 숨김 */
    textarea {
        display: none;
    }
</style>


<div class="cd1">
    <div style="width: 700px; min-height: 750px; border: 1px #d2d2d2 solid; border-radius: 5px;">
        <div >
            <div style="font-weight: 700; font-size: xx-large; text-align: center; margin-bottom: 20px; margin-top: 25px;">ON클래스 질문/답변 조회</div>
                <div id="dropdownContainer" style="margin-left: 490px;">
                    <form action="/teacher/answer" method="post" id="dropSubmit" name="dropSubmit">
                        <select class="dropTag" name="classNo" id="classNo" onchange="changeSelection()" style="width: 180px;">
                            <option selected disabled style="text-align: center;"> ----선택---- </option>
                            <c:forEach var="dl" items="${dropList }">
                                <option value="${dl.classNo }">${dl.className }</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>   
        	<div style="height: 10px; background-color: #FDE1B4; margin-top: 10px;"></div>
        </div>
               

            <c:forEach var="list" items="${list }" varStatus="loop">
                <form id="form${loop.index}">
        <table style="width: 700px;">
            <colgroup>
                <col style="width: 12%;">
                <col style="width: 68%;">
                <col style="width: 20%;">
            </colgroup>
                    <tr>
                        <td>
                            <div class="answer" style="display: none;">${list.answer }</div>
                            <div>
                                <c:choose>
                                    <c:when test="${list.answer == '1'}">
                                        <span id="correct${loop.index}">답변완료</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span id="uncorrect${loop.index}">미답변</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><div>${list.questionName }</div></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2"><div>${list.questionContent }</div></td>
                    </tr>
                    <tr>
                        <td><span style="width: 10px;"><button id="questionButton${loop.index}" style="width: 90px; height: 40px;"></button></span></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2"><div><textarea id="textarea${loop.index}" placeholder="본문 내용을 입력해주세요">${list.answerContent }</textarea></div></td>
                    </tr>
                    <tr>
                        <td><div>
                            <button class="registButton" id="registerButton${loop.index}"></button>
                            <input type="number" id="registerInput${loop.index}" style="display: none;" value="${list.questionNo }">
                        </div></td>
                    </tr>
        </table>
                </form>
            </c:forEach>
    </div>

    
</div> <!-- cd1 -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />


