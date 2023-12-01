<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%int i = 1; %>

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
	border-radius: 4px;
	background-color: #F0C610;
	font-weight: bold;
	padding: 7px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.OnOff {
	border: 1px solid #ccc;
	width: 900px;
	height: 450px;
	margin: auto;
	margin-top: 60px;
}

.pay {
	border: 1px solid #ccc;
	width: 900px;
	height: 510px;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 140px;
}

#text {
	border: none;
	width: 900px;
	height: 60px;
	background-color: #F1C40F;
	text-align: center;
    margin-bottom: 40px;
}

#text2 {
	border: none;
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

div.classItem.onClass {
	color: #F1C40F;
	box-shadow: 0 4px 8px rgba(76, 175, 80, 0.1); /* 그림자 효과 추가 */
	font-weight: bold;
    font-size: 20px;
}

div.classItem.offClass {
	box-shadow: 0 4px 8px rgba(76, 175, 80, 0.1); /* 그림자 효과 추가 */
	font-weight: bold;
    font-size: 20px;
}

.classItem {
	border: 1px solid #ddd;
    max-width: 278px;
	float: left;
	margin-left: 15px;
	padding-bottom: 15px;
}

.classIcon {
    margin-right: 10px;
}

.classDetails {
    flex-grow: 1;
    text-align: center;
}

/* 페이지네이션 위/아래 */
.paginationUp {
    margin-top: 330px;
    text-align: center;
}

.paginationDown {
    margin-top: 40px;
    text-align: center;
}
.paginationUp a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.paginationUp a.active {
    background-color: #F0C610;
    color: white;
}

.paginationUp a:hover:not(.active) {
    background-color: #ddd;
}

.paginationDown a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.paginationDown a.active {
    background-color: #F0C610;
    color: white;
}

.paginationDown a:hover:not(.active) {
    background-color: #ddd;
}

/* 결제조회 css */
#userListTb{
border-top: 2px solid #ccc; 
width : 850px;
margin: auto;

}

.userListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;
text-align: center;

}

.userListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;
text-align: center;

}

/* 이미지 크기 지정 */
.fixed-size-image {
    width: 230px;
    height: 200px;
}

</style>

<script type="text/javascript">
$(function(){
	
    $('.userListTd').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.userListTd').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})

</script>

<div class="title">
	<div class="title1">
		<label id="member">"${userInfo.userName}"님 의</label><br> <label id="member2">마이페이지입니다</label>

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
            <c:set var="actualEnd" value="${end > totalItems ? totalItems : end}" />

            <c:forEach var="index" begin="${start}" end="${actualEnd - 1}" varStatus="loop">
                <div class="classItem ${lecture[index].onOff eq '1' ? 'onClass' : 'offClass'}">
                    <div class="classIcon">
                        <i class="fas ${lecture[index].onOff eq '1' ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                    </div>
                    <div class="classDetails">
                        <a href="${lecture[index].onOff eq '1' ? '/class/onClass?classNo=' : '/class/offClass?classNo='}${lecture[index].classNo}"
                            class="stretched-link" style="color: inherit; text-decoration: none;">
                            ${lecture[index].className}
                        </a>
                        <!-- 이미지가 보여질 부분 -->
                        <img class="fixed-size-image" src="/upload/${lecture[index].headImg}" alt="Class Image">
                    </div><!-- .classDetails -->
                </div><!-- .classItem -->
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div style="text-align: center; padding: 20px; margin-top: 115px;">
                <p style="font-size: 32px; font-weight: bold;">등록된 클래스가 없습니다</p>
                <p style="font-size: 20px;">새로운 클래스를 찾아보세요!</p>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="paginationUp">
        <c:forEach begin="1" end="${totalPages}" var="page">
            <a href="?page=${page}&curPage=${paging.curPage}" class="${page == currentPage ? 'active' : ''}">${page}</a>
        </c:forEach>
    </div>
</div><!-- .OnOff -->

<div class="pay">
	<div id="text2">
		<label id="history">결제/수강 내역</label>
		
		<div style="text-align: left; margin-top: 40px;">
			<table id="userListTb">
			
			<tr>
				<th class="userListTh" width="7%">번호</th>
				<th class="userListTh" width="20%">클래스명</th>
				<th class="userListTh" width="10%">금액</th>
				<th class="userListTh" width="10%">결제카드</th>
				<th class="userListTh" width="10%">UID</th>
			</tr>
			
			<c:if test="${paging.totalCount <= 0}">
			<tr>
			<td colspan="5" style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
			<h1>결제 내역이 없습니다</h1>
			<p style="margin-top: 20px; padding-left: 40px"><img title="보노" alt=";;;;;;" src="/resources/img/bono.png" width="162px" height="156px"></p>
			</td>
			</tr>
			</c:if>
				<c:if test="${paging.totalCount > 0}">
					<c:forEach var="i" begin="${paging.startNo-1}"
						end="${paging.endNo-1}">
						<c:if test="${i < paging.totalCount}">
						<tr>
							<td class="userListTd">${i+1 }</td>
							<td class="userListTd"><c:set var="classList"
									value="${map.classList[i] }" /> <c:out
									value="${classList.className }" /></td>
							<td class="userListTd"><c:set var="paymentList"
									value="${map.paymentList[i] }" /> <fmt:formatNumber
									type="number" maxFractionDigits="3">
									<c:out value="${paymentList.payment }" />
								</fmt:formatNumber>원</td>
							<td class="userListTd"><c:set var="paymentList"
									value="${map.paymentList[i] }" /> <c:out
									value="${paymentList.cardName }" /></td>
							<td class="userListTd"><c:set var="orderList"
									value="${map.orderList[i] }" /> <c:out
									value="${orderList.merchantUid }" /></td>
						</tr>
						</c:if>
					</c:forEach>
				</c:if>

			</table>

		<%-- 페이징 import --%>
		<c:if test="${paging.totalCount > 0}">
		<div class="paginationDown">
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="paymentPage">
		        <a href="?curPage=${paymentPage}&page=${classPage}" class="${paymentPage == paging.curPage ? 'active' : ''}">${paymentPage}</a>
		    </c:forEach>
		</div>
		</c:if>
		
		</div>
		
	</div>
	<!-- #tex2 -->
</div>
<!-- .pay -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />
