<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.title {
	border: 1px solid #ccc;
	background-color: black;
	width: 900px;
	height: 175px;
	margin: auto;
	margin-top: 100px;
}

#member {
	color: white;
	font-size: 25px;
	font-weight: bold;
}

#member2 {
	color: white;
	font-size: 25px;
	font-weight: bold;
}

.title1 {
	margin-top: 87px;
	margin-left: 46px;
}

.titleBtn {
	float: right;
	margin-right: 37px;
}

button {
	height: 40px;
	border-radius: 4px;
	background-color: #F0C610;
	font-weight: bold;
	padding: 5px;
	font-size: 16px;
	border: outset;
	border-color: ghostwhite;
	cursor: pointer;
}

.OnOff {
	border: 1px solid #ccc;
	width: 900px;
	height: 400px;
	margin: auto;
	margin-top: 60px;
}

.pay {
	border: 1px solid #ccc;
	width: 900px;
	height: 400px;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 140px;
}

#text {
	border: 1px solid #ccc;
	width: 900px;
	height: 60px;
	background-color: #F1C40F;
	text-align: center;
}

#text2 {
	border: 1px solid #ccc;
	width: 900px;
	height: 60px;
	background-color: black;
	text-align: center;
}

#classIng {
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
	padding: 14px;
}

#history {
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
	padding: 14px;
	color: white;
}

.classItem {
	border: 1px solid #ddd;
    padding: 10px;
    align-items: center;
    width: 18%;
    height: 32%;
	float: left;
}

.classIcon {
    margin-right: 10px;
}

.classDetails {
    flex-grow: 1;
}

.pagination {
    margin-top: 190px;
    text-align: center;
}

.pagination a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination a.active {
    background-color: #F0C610;
    color: white;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}

</style>


<div class="title">
	<div class="title1">
		<label id="member">'OOO'님 의</label><br> <label id="member2">마이페이지입니다</label>

		<div class="titleBtn">
			<a href="/class/myOnClassList">
				<button style="background-color: #9E9E9E;">ON클래스 강의실</button></a>
			<a href="/user/userPwChk">
				<button>회원정보수정</button></a>
		</div><!-- .titleBtn -->
	</div><!-- .title1 -->
</div><!-- .title -->


<div class="OnOff">
    <div id="text">
        <label id="classIng">진행중인 ON/OFF 클래스</label>
    </div><!-- #text -->
    <c:choose>
        <c:when test="${not empty lecture}">
            <c:set var="itemsPerPage" value="3" /> <!-- 페이지당 표시할 클래스 수 -->
            <c:set var="totalItems" value="${fn:length(lecture)}" />
            <c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />

            <c:set var="currentPage" value="${param.page eq null ? 1 : param.page}" />
            <c:set var="start" value="${(currentPage - 1) * itemsPerPage}" />
            <c:set var="end" value="${start + itemsPerPage}" />

            <c:forEach var="index" begin="${start}" end="${end - 1}" varStatus="loop">
                <div>
                <div class="classItem ${lecture[index].onOff eq '1' ? 'onClass' : 'offClass'}">
                    <div class="classIcon">
                        <i class="fas ${lecture[index].onOff eq '1' ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                    </div>
                    <div class="classDetails">
                        <a href="${lecture[index].onOff eq '1' ? '/class/onClass?classNo=' : '/class/offClass?classNo='}${lecture[index].classNo}"
                            class="stretched-link" style="color: inherit; text-decoration: none;">
                            ${lecture[index].className}
                        </a>
                        <img src="/upload/${lecture[index].headImg}" alt="Class Image">
                        ${lecture[index].headImg },
<%--                         ${lecture[index].onOff } --%>
                    </div>
                </div>
                </div>
            </c:forEach>
        </c:when>
    </c:choose>
    <div class="pagination">
        <c:forEach begin="1" end="${totalPages}" var="page">
            <a href="?page=${page}" class="${page == currentPage ? 'active' : ''}">${page}</a>
        </c:forEach>
    </div>
</div><!-- .OnOff -->

<div class="pay">
	<div id="text2">
		<label id="history">결제/수강 내역</label>
	</div>
	<!-- #tex2 -->
</div>
<!-- .pay -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />
