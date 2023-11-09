<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(document).on('click', "input[type='checkbox']", function(){
    if(this.checked) {
        const checkboxes = $("input[name='gender']");
        for(let ind = 0; ind < checkboxes.length; ind++){
            checkboxes[ind].checked = false;
        }
        this.checked = true;
    } else {
        this.checked = false;
    }
});


</script>
<style type="text/css">

.defaultWidth {
	margin-left: 300px;
	margin-right: 300px;
	text-align: center;
}

.joinDiv {
	border: 1px solid #ccc;
	width: 730px;
	height: 724px;
	margin: 0 auto;
	margin-top: 85px;
	text-align: center;
}

.decobox {
	width: 730px;
	height: 11px;
	background-color: rgb(255, 240, 177);
	margin-bottom: 45px;
}

.title {
	text-align: center;
	padding: 20px;
}



</style>


<div class="defaultWidth">

<div class="joinDiv">
	<h1 class="title">회원가입</h1>
	<div class="decobox"></div>

	아이디<input><br>
	비밀번호<input><br>
	비밀번호확인<input><br>
	이름<input><br>
	성별
	<input type="checkbox" id="cb1" value="man" name="gender" style="cursor: pointer;">
		<label for="man">남성</label>
	<input type="checkbox" id="cb2" value="woman" name="gender" style="cursor: pointer;">
		<label for="woman">여성</label><br>
	생년월일<input><br>
	전화번호<input><br>
	이메일<input><br>
	주소<input><br>
	<input><br>
	<input><br>

	<div id="agreeDiv">
	약관 관련
	<input type="checkbox" id="cb3" value="agree" name="agree" style="cursor: pointer; ">
		<label for="agree">약관 동의 여부</label>
		<button
		    style="background-color: rgb(224, 224, 224);
		    color: rgb(64, 64, 64);
		    border: none;
		    border-radius: 4px;
		    line-height: 1.5em;
		    font-size: 12px;

		    text-align: center;
		    display: inline-block;
		    margin: 1px 4px;
		    cursor: pointer;
		    padding: 2px 4px;">자세히 보기</button>
	</div><!-- .agreeDiv -->

<form action=""></form>



</div><!-- .joinDiv -->
</div><!-- .defaultWidth -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />
