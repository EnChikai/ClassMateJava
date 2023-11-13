<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

$(function(){
	   $("#offClass").click(function(){
	      $.ajax({
	         type: "GET"
	         , url: ""
	         , data: {
	            
	         }
	         
	         , dataType: ""
	         , success: function(){
	            console.log("성공")
	            
	         }
	         ,error: function(){
	            console.log("실패")
	   
	         }
	      })
	   })
	})


</script>





<style type="text/css">

.defaultWidth{
   margin-left: 400px;
   margin-right: 400px;
}

</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth" >

<!-- 토글 버튼 -->
<button id="onClass">ON 전체보기</button><button id="offClass">OFF 전체보기</button>
<c:forEach var="onClass" items="${onClassList}">
<c:if test="${onClass.deleteBoolean == 0}">
<h1>onClassList</h1><br>
${onClass.headImg }<br>
<h3>${onClass.className }</h3><br>
${onClass.classInfo }<br>
${onClass.expense }<br>
${onClass.classStart }<br>
${onClass.classEnd }<br>
${onClass.maxCount }<br>
</c:if>
</c:forEach>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />