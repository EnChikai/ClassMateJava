<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">
$(function() {
    $("#loginForm").keypress(function(event) {
        if (event.which === 13) {
            event.preventDefault(); // 기본 Enter 키 동작을 막음
            $("#btnLogin").click(); // 로그인 버튼 클릭 이벤트 호출
        }
    });

});
</script>


<style type="text/css">

.defaultWidth {
	margin-left: 300px;
	margin-right: 300px;
	text-align: center;
}

.button {
	margin: auto;
}

.idpw{
    margin: 0 auto 10px;
}

.join {
	width: 227px;
	border: 1px solid rgba(0, 0, 0, .12);
    padding: 8px;
	margin: 15px auto 40px;
	font-size: 12px;
	font-weight: bold;
	box-sizing: border-box;
	display: inline-block;
	text-align: center;
	color: rgb(94, 94, 94);
}

#loginDiv {
    border: 1px solid #ccc;
    width: 478px;
    height: 337px;
    margin: 0 auto;
    margin-top: 9px;
}

#loginDiv1 {
	border: 1px solid #ccc;
	width: 500px;
    height: 357px;
    margin: 90px auto 10px auto;
}

#loginh1 {
	margin-top: 50px;
	margin-bottom: 20px;
}

h1 {
	font-family: Impact; 
	font-style: normal; 
	font-weight: normal;
	color: #F0C610; 
	font-size: 30px;"
}


#search {	
	margin-left: 343px;
    text-decoration: underline;
    color: rgb(41, 90, 221);
    font-size: 14px;
}

#searchDiv {
    margin-bottom: 100px;
}

.idpw img {
	width: 20px;
	vertical-align: middle;	
}


.idpw input {
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
}

button {
	background-color: #F0C610; 
	border-radius: 4px; 
	color: white; 
	font-size: 14px; 
	text-align: center; 
	cursor:pointer; 
	display: inline-block; border: none; width: 70px; height: 32px;"
}

#noInputId, #noInputPw {
	font-size: 12px;
	color: red;
}

</style>
<script type="text/javascript">
$(function() {

		if( $("#userId").val() == '' ){
			$("#userId").attr("placehol")
// 			$("#noInputId").text('아이디를 입력해주세요');
		} 

		if( $("#userPw").val() == '' ){
// 			$("#noInputPw").text('비밀번호를 입력해주세요');
		}
		$("#userId").keyup(function(){

			if( $("#userId").val() == '' ){
				$("#noInputId").text('아이디를 입력해주세요');
			} else {
				$("#noInputId").text('');
			}
		})
		$("#userPw").keyup(function(){

			if( $("#userPw").val() == '' ){
				$("#noInputPw").text('비밀번호를 입력해주세요');
			} else {
				$("#noInputPw").text('');
			}
		})
	
    $("#btnLogin").on( 'click', function() {
    	console.log('1111클릭됨')
    	
	    if( $("#userId").val() == '' || $("#userPw").val() == '' ) {
	        $("#btnLogin").attr("type", "button");
	    } else {
	        $("#btnLogin").attr("type", "submit");
	    }
    })
	
});
</script>


<div class="defaultWidth">

<div id="loginDiv1">
	<div id="loginDiv">
		
		<h1 id="loginh1">ClassMate</h1>
		
		<form action="/user/login" method="post" id="loginForm">
			<div class="idpw">
			
				<label><img src="/resources/img/userId.png">
				<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"></label><br>
				<div id="noInputId"></div>
					    
				<div style="margin-bottom: 8px;"></div>
				<label><img src="/resources/img/key_1.png">
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요"></label><br>
				<div id="noInputPw"></div><br>
			
			</div>
		
			<div style="text-align: center;">
				<button id="btnLogin" type="button">로그인</button>
					
			</div><!-- .idpw -->
		
			<div>
				<a class="join" href="/user/join">계정이 없으신가요? 가입하기</a>
			</div>
		</form>
	</div><!-- .loginDiv -->	
</div><!-- .loginDiv1 -->


	<div id="searchDiv">
		<a id="search" href="/user/searchIdPw" >아이디/비밀번호 찾기</a>
	</div>

</div><!-- .defaultWidth -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
