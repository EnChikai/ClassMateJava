<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>

<style type="text/css">
.defaultWidth {
    margin-left: 400px;
    margin-right: 400px;
    margin-top: 35px;
}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

    <h1>ON클래스 상세보기</h1>
    <c:forEach var="list" items="${list}">
        ${list.teacher }<br>
        ${list.className }<br>
        ${list.classStart }
        ${list.classEnd }
        ${list.maxCount }<br>
        ${list.expense }<br>
        ${list.classInfo }<br>
        ${list.curriculum }<br>
        ${list.onOff }<br>
        ${list.headImg }<br>
        ${list.content }<br>
        <input type="text" id="classNo" value="${list.classNo}" style="display: none;" readonly="readonly">
        <input type="text" id="onOff" value="${list.onOff}" style="display: none;" readonly="readonly">
        <input type="text" id="className" value="${list.className}" style="display: none;" readonly="readonly">
    </c:forEach>

    <c:if test="${isLogin != null }">
        <button type="button" name="basket">장바구니</button><br>
        <button type="button" name="main">ON 클래스 시작하기</button>
    </c:if>
    
    <c:if test="${isLogin == null }">
		<a href="/user/login"><button onclick="alert('로그인이 필요합니다.')">장바구니</button></a><br>
   		<a href="/user/login"><button onclick="alert('로그인이 필요합니다.')">ON 클래스 시작하기</button></a>
   	</c:if>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />