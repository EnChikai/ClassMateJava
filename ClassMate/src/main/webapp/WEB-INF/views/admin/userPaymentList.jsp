<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>
<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
	
}

#userInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 720px;
margin-left: auto;
margin-right: auto;
margin-top: 18px;

}

#userListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;
margin-bottom: 80px;

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

.topMenuBtn{
background: white;
border-radius: 3px; 
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
font-size:14px;
padding-top : 12px;
padding-bottom : 12px;
padding-left: 14px; 
padding-right: 14px;
vertical-align: bottom;

}

.checked{
background: rgb(241,196,15);
border-style: hidden;
box-shadow: 0 0 0 1px rgb(231,186,5);
color: white;
font-weight:bold;
font-size: 19px;
vertical-align: bottom;
padding-left: 20px; 
padding-right: 20px;

}

</style>

<%-- 페이징 --%>
<style type="text/css">
#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingNow {
   border-radius: 4px; 
   color: black; 
   background-color: rgb(241,196,15); 
   border: 1px solid rgb(251,206,25);
   margin: 3.5px; 
   text-align: center;"

}

#pagingAfter,#pagingBefore {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;
}
.page-link {
position:static;
}

</style>

<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="orderList" value="${map.orderList[i] }" />

<!-- 환불 모달 -->
<style type="text/css">
#refundBtn{
border-radius: 3px; 
border-style: hidden;
width: 65px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(158,158,158); 
box-shadow: 0 0 0 1px #ccc; 

}

#refundBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

#refund{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#refund:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#refundModal${orderList.orderNo }{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.refundModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 650px;;
  min-height: 470px;
  background:#fff;
}
.refundModal-con .con{
  font-size:26px; 
  line-height:1.3;
  padding-top: 50px;
  padding-left: 100px;
  padding-right: 100px;
  padding-bottom: 50px;
  height: 400px;
  overflow-y: auto;
  text-align: center; 
}

.closeModalBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black;
font-size: 14px;

}

.closeModalBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
cursor:pointer
	
}

.refundOkBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(241,196,15); 
box-shadow: 0 0 0 1px rgb(230,204,100); 
margin-right: 19px;
font-size: 14px;

}

.refundOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>

</c:if>
</c:forEach>
</c:if>

<%-- <% ============================================================================= %> --%>
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
<%-- <% ============================================================================= %> --%>
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="orderList" value="${map.orderList[i] }" />
<c:set var="classList" value="${map.classList[i] }" />
<script type="text/javascript">
$(function(){
	$("#btnCancel${orderList.orderNo }").click(function() {
	    
	    $.ajax({
	       type: "post"
	       , url: "../admin/cancel"
	       , data: {
	          merchantUid: $(this).attr("data-uid"),
	          userNo: $(this).attr("data-no")
	       }
	       , dataType: "json"
	       , success: function( data ) {
// 	          console.log("AJAX 성공")
	          
// 	          alert("취소가 완료되었습니다");
	          location.href = '../admin/userPaymentList?userNo=${orderTb.userNo}';
	          
	       }
	       , error: function(xhr, status, error) {
// 	          console.log("AJAX 실패", status, error);
	       }
	    })
	    
	})
})
</script>
</c:if>
</c:forEach>
</c:if>
<%-- <% ============================================================================= %> --%>
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="orderList" value="${map.orderList[i] }" />

<script type="text/javascript">

//삭제 모달 열기
function openRefundModal${orderList.orderNo }(modalname) {
  $("#refundModal${orderList.orderNo }").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".refundModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#refundModal${orderList.orderNo }").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeRefundModal${orderList.orderNo }").click(function (e) {
		    var modal = $(".refundModal-con");
		      $("#refundModal${orderList.orderNo }").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});
</script>
</c:if>
</c:forEach>
</c:if>
<%-- <% ============================================================================= %> --%>

<div style="margin-top: 25px; margin-left: 72px; font-size: 6px;">
<a href="../admin/userDetailedInfo?userNo=${orderTb.userNo}"><button style="margin-left: 1px;" class="topMenuBtn">회원정보 관리</button></a>
<button class="topMenuBtn checked">결제/수강 내역</button>
<a href="../admin/userPostList?userNo=${orderTb.userNo}"><button class="topMenuBtn">작성한 게시물</button></a>
</div>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px;">
<p id="userInfo">결제/수강 내역</p>

<div style="text-align: left; margin-bottom: 10px">
<table id="userListTb">

<tr>
	<th class="userListTh" width="7%">번호</th>
	<th class="userListTh" width="20%">클래스명</th>
	<th class="userListTh" width="10%">금액</th>
	<th class="userListTh" width="10%">결제방식</th>
	<th class="userListTh" width="10%">결제카드</th>
	<th class="userListTh" width="10%">UID</th>
	<th class="userListTh" width="10%">환불</th>
</tr>

<c:if test="${paging.totalCount <= 0}">
<tr>
<td colspan="5" style="text-align: center; padding-top: 20px; padding-bottom: 20px; padding-left: 220px;">
<h3>결제 내역이 없습니다</h3>
<p style="margin-top: 20px; padding-left: 40px"><img title="보노" alt=";;;;;;" src="/resources/img/bono.png" width="162px" height="156px"></p>
</td>
</tr>
</c:if>

<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:set var="paymentList" value="${map.paymentList[i] }" />
<c:set var="orderList" value="${map.orderList[i] }" />
<c:set var="classList" value="${map.classList[i] }" />
<c:if test="${i < paging.totalCount}">
	<tr>
		<td class="userListTd">
			${i+1 }
		</td>
		<td class="userListTd">
			<c:out value="${classList.className }" />
		</td>
		<td class="userListTd">
			<c:set var="paymentList" value="${map.paymentList[i] }" />
			<fmt:formatNumber type="number" maxFractionDigits="3"><c:out value="${paymentList.payment }" /></fmt:formatNumber>원
		</td>
		<td class="userListTd">
			<c:out value="${paymentList.provider }" />
			
		</td>
		<td class="userListTd">
			<c:out value="${paymentList.cardName }" />
			
		</td>
		<td class="userListTd">
			<c:out value="${orderList.merchantUid }" />
		</td>
		<td class="userListTd">
			<c:if test="${orderList.refund != 0}">
				환불 완료
			</c:if>
		
			<c:if test="${orderList.refund == 0}">
				<a href="javascript:openRefundModal${orderList.orderNo }('refundModal${orderList.orderNo }');" class="terms" style="text-decoration: none; color: black;"><button id="refundBtn">환불</button></a>
			</c:if>
			
		</td>
	</tr>
</c:if>
</c:forEach>
</c:if>

</table>

<%-- <% ============================================================================= %> --%>	
<%-- 페이징 --%>	

<c:if test="${paging.totalCount > 0}">
<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${paging.curPage - 1 }" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${i }" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${i }" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?userNo=${orderTb.userNo}&curPage=${paging.curPage + 1 }" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	
</c:if>

</div>

<%-- <% ============================================================================= %> --%>	
<%-- 환불 --%>
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">
<c:set var="orderList" value="${map.orderList[i] }" />

<div id="refundModal${orderList.orderNo }" class="close"></div>
  <div class="refundModal-con refundModal${orderList.orderNo }" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">해당 결제를</p>
    <p>환불 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 27px;">다시 한번 확인 후 진행해주세요</p>
    
    <button class="refundOkBtn" id="btnCancel${orderList.orderNo }" data-uid="${orderList.merchantUid }" data-no="${orderList.userNo }">환불</button>
    <a href="javascript:return false;" class="closeRefundModal" id="closeRefundModal${orderList.orderNo }"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
    
    </div>
  </div>
</c:if>
</c:forEach>
</c:if>  
<%-- <% ============================================================================= %> --%>	

</div>			
<%-- <% ============================================================================= %> --%>	


		
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />