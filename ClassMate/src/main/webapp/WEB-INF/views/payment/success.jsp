<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<%-- <% ============================================================================= %> --%>


<div style="width: 500px; text-align: center; margin: auto;">

<div style="border-top: 2px solid #ccc; border-bottom: 2px solid #ccc; padding-top: 10px; padding-bottom: 10px;">
	<p style="font-size: 26px; font-weight:bold;">결제가 완료되었습니다</p>
</div>

<div style="margin-top: 20px; margin-bottom: 20px;">
<p>구매 번호 : </p>
</div>

<div>
<p>결제하신 클래스 정보 알림은</p>
<p>카카오톡 결제내역에서 확인이 가능합니다</p>
</div>

<div style="margin-top: 70px; text-align: right; padding-right: 110px;">
<p style="font-size: 21px; font-weight:bold;">총 결제 금액 : </p>
<p style="margin-top: 7px; font-size: 13px;">부가세 : </p>
</div>

<div style="border-top: 2px solid #ccc; padding-top: 5px; margin-top: 36px; padding-bottom: 7px;">
<p style="text-align: right; color: #a7a7a7; font-size: 15px">자세한 결제 내역은 마이페이지에서 확인이 가능합니다</p>
</div>

<a href="../main/main" style="text-decoration: underline; color: rgb(41,90,223);">메인화면으로 이동하기</a>

</div>


<%-- <% ============================================================================= %> --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />