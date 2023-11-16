<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<style type="text/css">


.col{
	width: 331px;
    margin-left: 16px;
    margin-right: 16px
    
}

.TOP5{
	background-color: #F0C610;
	display: inline-block;
	padding: 15px;
	border-radius:5% 5% 0 0;
	margin-left: 15px;
}








</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />


<img style="height: 300; width: -webkit-fill-available;" src="/resources/img/event.png">

<br><br><br>


<div class="container">
<span class="TOP5"><strong>인기 ON TOP5</strong></span><br>
<img class="col" src="/resources/img/class.png">
<img class="col" src="/resources/img/class.png">
<img class="col" src="/resources/img/class.png">
</div>

<br><br><br>

<div class="on-container">
<span class="TOP5"><strong>인기 OFF TOP5</strong></span><br>
<img class="col" src="/resources/img/class.png">
<img class="col" src="/resources/img/class.png">
<img class="col" src="/resources/img/class.png">
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
