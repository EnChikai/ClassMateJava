<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">

/* 아이디/비밀번호 찾기 */
.idpw2 h1 {
   text-align: center;
    margin-top: 60px;
    font-weight: bold;
}
 
.idpw {
   border: 1px solid #ccc;
   padding: 40px;
   max-width: 460px;
   margin: 100px auto;
   margin-bottom: 160px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.idpw h1 {
   font-weight: bold;
   margin-bottom: 20px;
   color: #333;
   text-align: center;
}

.idpw h4 {
   font-weight: bold;
   font-size: 18px;
   margin-top: 20px;
   margin-left: 17%;
   color: #555;
}

.idpw input {
    border: 1px solid #ddd;
    margin: 3px -6px;
    width: 45%;
    border-radius: 3px;
    vertical-align: middle;
    padding: 13px;
}

.idpw label {
    margin-left: 17%;
    text-align: center;
}

.idpw hr {
    border: none;
    border-top: 1px solid #ddd;
    width: 55%;
    margin: 0 auto; /* 가운데 정렬을 위해 추가 */
}

button {
    display: block;
    margin: 0 auto;
    margin-top: 20px;
    background-color: #F1C40F;
    color: rgb(255, 255, 255);
    text-align: center;
    border: none;
    border-radius: 4px;
   padding: 10px 13px;
   cursor: pointer;
}

#email {
   border: 1px solid black; 
   border-radius: 4px;
   background-color: black;
   color: white;
   padding: 10px 10px;
   vertical-align: middle;
}

#nameId {
   border: 1px solid black;
   border-radius: 4px;
   background-color: black;
   color: white;
   padding: 10px 18px;
   vertical-align: middle;
}

#id {
   border: 1px solid black;
   border-radius: 4px;
   background-color: black;
   color: white;
   padding: 10px 10px;
   vertical-align: middle;
}

#namePw {
   border: 1px solid black;
   border-radius: 4px;
   background-color: black;
   color: white;
   padding: 10px 18px;
   vertical-align: middle;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
   var isPasswordCoincide = ${isPasswordCoincide}
   console.log(isPasswordCoincide)
   if(isPasswordCoincide == false) {
      alert('회원 정보가 일치하지않습니다')
   } 
   var isIdCoincide = ${isIdCoincide}
   console.log(isIdCoincide)
   if(isIdCoincide == false) {
      alert('회원 정보가 일치하지않습니다')
   } 
   var isOutUser = ${isOutUser}
   console.log(isOutUser)
   if(isOutUser == true) {
      alert('탈퇴한 회원입니다.')
   } 
});

</script>


<div class="idpw">

<!-- 아이디 찾기 폼 -->
<form id="findIdForm" action="/user/searchIdPw" method="post">

   <h1>아이디/비밀번호 찾기</h1>
    
   <h4>아이디 찾기</h4>
   
   <label id="email" for="userEmail">이메일</label>
   <input type="text" id="userEmail" name="userEmail" required><br>
   <label id="nameId" for="userName">이름</label>
   <input type="text" id="userName" name="userName" required><br>
   
   <button>아이디 찾기</button><br>
</form>

   <hr>
   
   <!-- 비밀번호 찾기 폼 -->
   <form id="findPwForm" action="/user/checkPw" method="post">
   <h4>비밀번호 찾기</h4>

   <label id="id" for="userId">아이디</label>
   <input type="text" name="userId"><br>
   <label id="namePw" for="userName">이름</label>
   <input type="text" id="userName" name="userName"><br>
   
   <button>비밀번호 찾기</button>
   </form><!-- .findPwForm -->
</div><!-- .idpw -->

   
<c:import url="/WEB-INF/views/layout/footer.jsp" />