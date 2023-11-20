<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.searchUserId {
   text-align: center;
   line-height: 2;
    padding: 95px;
}

h3 {
   color: #333333;
   font-size: 17px;
}

input {
   border: 1px solid #ccc;
   height: 40px;
    margin-left: -6px;
    margin-top: 30px;
    width: 250px;
    border-radius: 3px;
}

button {
    display: block;
    margin: 0 auto;
    margin-top: 40px;
    background-color: #F1C40F;
    font-size: 17px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 2em;
    border: none;
    border-radius: 4px;
    width: 100px;
}

.searchUserId label {
   border: 1px solid black;
    border-radius: 4px;
    background-color: black;
    color: white;
    padding: 9px 21px;
    vertical-align: middle;
}

</style>


<div class="searchUserId">

<h1>아이디 확인</h1>
<h3>회원님께서 찾으시는 정보는 아래와 같습니다</h3>

   <label for="userId" style="">아이디</label>
   <input type="text" id="userId" name="userId" value="${userInfo.userId}" readonly><br>
   
   
   
   <button onclick="location.href='${pageContext.request.contextPath}/user/login'">로그인 하기</button>


</div><!-- .searchUserId -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />