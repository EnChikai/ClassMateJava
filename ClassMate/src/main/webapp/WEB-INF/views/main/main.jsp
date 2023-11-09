<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<style type="text/css">

.defaultWidth{
   margin-left: 400px;
   margin-right: 400px;
}

.class{
	width: 330px;
}

.TOP5{
	border : 1px solid gray;
	background-color: #F0C610;
	display: inline-block;
	padding: 15px;
	border-radius:5% 5% 0 0;
}

</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth" >

<img style="height: 300; width: -webkit-fill-available;" src="/resources/img/event.png">
<br><br><br>

<div>
<span class="TOP5"><strong>인기 ON TOP5</strong></span><br>

<img src="/resources/img/class.png" class="class">
<img src="/resources/img/class.png" class="class" style="margin-left: 50;">
<img src="/resources/img/class.png" class="class" style="float: right;">
</div>
<br><br><br>
<div>
<span class="TOP5"><strong>인기 OFF TOP5</strong></span><br>

<img src="/resources/img/class.png" class="class">
<img src="/resources/img/class.png" class="class" style="margin-left: 50;">
<img src="/resources/img/class.png" class="class" style="float: right;">
</div>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
