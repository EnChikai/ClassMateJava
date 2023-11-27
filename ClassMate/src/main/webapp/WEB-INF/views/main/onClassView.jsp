<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    // 장바구니 또는 ON 클래스 시작하기 버튼 클릭 시
    $("button").click(function () {
        var classNo = $("#classNo").val();
        var onOff = $("#onOff").val();
        var className = $("#className").val();
        var buttonType = $(this).attr("name");

        // AJAX를 사용하여 데이터를 서버로 전송
        $.ajax({
            type: "POST",
            url: "/main/basket",
            dataType: "json",
            data: {
                classNo: classNo,
                onOff: onOff,
                className: className,
                buttonType: buttonType
            },
            success: function (response) {

                var redirectUrl = response.redirect;

                if (response.error && response.error !== "") {
                    // alert 창을 먼저 표시
                    alert(response.error);

                        if (redirectUrl) {
                            window.location.href = redirectUrl;
                        } else {
                            console.log("리다이렉트 URL이 없습니다.");
                        }

                } else if (redirectUrl) {
                    // alert 창이 필요 없는 경우 바로 페이지 전환
                    window.location.href = redirectUrl;
                } else {
                    console.log("리다이렉트 URL이 없습니다.");
                }
            },
            error: function (error) {
                console.error("전송 오류: ", error);
            }
        });
    });
});
function redirectToLogin() {
	  alert('로그인이 필요합니다.');
	  window.location.href = '/user/login';
}
</script>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

    <c:forEach var="list" items="${list}">
    	<div style="text-align: center;">
        	<img style="width: 890px;" src="/upload/${list.headImg }">
        </div>
        <div style="display: flex;">
        <div>
        <c:if test="${isLogin != null }">
        	<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 30px; padding-left: 70px; padding-right: 70px;  margin-right: 80px; margin-left: 80px;" type="button" name="main">ON 클래스 시작하기</button>
    	</c:if>
    	<c:if test="${isLogin == null }">
   			<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 30px; padding-left: 70px; padding-right: 70px;  margin-right: 80px; margin-left: 80px;" onclick="redirectToLogin()">ON 클래스 시작하기</button>
   		</c:if>
   		</div>
        	<div style="background-color: black; font-size: 35px; color: white; flex: auto; padding-bottom: 300px;">${list.className }</div>
	    </div>
	    <div>
	        <div>
		        ${list.teacher }<br>
		        ${list.classStart }
		        ${list.classEnd }
		        ${list.maxCount }<br>
		        ${list.expense }<br>
		        ${list.onOff }<br>
	        </div>
        </div>
        ${list.classInfo }<br>
        ${list.curriculum }<br>
        <input type="text" id="classNo" value="${list.classNo}" style="display: none;" readonly="readonly">
        <input type="text" id="onOff" value="${list.onOff}" style="display: none;" readonly="readonly">
        <input type="text" id="className" value="${list.className}" style="display: none;" readonly="readonly">
    </c:forEach>

    <c:if test="${isLogin != null }">
		<button type="button" name="basket"><img  src="/resources/img/basket.png"></button><br>
    </c:if>
    
    <c:if test="${isLogin == null }">
   		<a href="/user/login"><button onclick="alert('로그인이 필요합니다.')"><img src="/resources/img/basket.png"></button></a><br>
   	</c:if>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />