<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#failBox{
	margin-left:auto; 
	margin-right:auto;
	border-collapse:collapse;    
	border-radius: 5px;
	border-style: hidden;
	box-shadow: 0 0 0 2px #ccc;

 
}

#backBtn{
	background: black;
	font-size: 16px;
	width:50px;
	padding: 8px;
	border-radius: 3px;
	border-style: hidden;
	box-shadow: 0 0 0 1px rgb(190,190,190);
	font-weight:bold;
	color: white;
	margin-bottom: 5px; 

}

#backBtn:hover:not(.active){
	box-shadow: 0 0 0 2px skyblue;
	cursor:pointer
}

.errFont{
color: #aaa;
}

</style>
<%-- <% ============================================================================= %> --%>

<div style="text-align: center;">
<div style="font-size: 30px; font-weight:bold; color: rgb(51,51,51); margin-top: 143px">
결제가 정상적으로<br> 
완료되지 않았습니다.
</div>

<div style="font-size: 17px; font-weight:bold; color: #aaa; margin-top: 16px; margin-bottom: 40px">
이용에 불편을 드려 죄송합니다.
</div>

<div id="failBox" style="width: 370px; margin-bottom: 93px">
	<p class="errFont" style="padding-top: 5px">결재 실패 사유 : </p>
	<p class="errFont">(ERROR CODE : )</p>
	<p style="margin-top: 20px; padding-left: 40px"><img title="보노" alt=";;;;;;" src="/resources/img/bono.png" width="162px" height="156px"></p>
</div>

<div style="margin-bottom: 25px">
<a href="../payment/basket"><button id="backBtn" style="width: 165px;" >장바구니로 돌아가기</button></a>
</div>

<div style="margin-bottom: 113px;">
<a href="" style="text-decoration: underline; color: black;">1:1문의 / Q&A  로</a>
</div>


</div>

<%-- <% ============================================================================= %> --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />