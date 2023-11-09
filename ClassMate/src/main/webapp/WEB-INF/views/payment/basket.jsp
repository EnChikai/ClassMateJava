<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#basketTableTitle{
margin-left:auto; 
margin-right:auto;
background: black;
border-collapse:collapse;    
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;

 
}

.thFontInfo{
color: white;
padding-top: 5px;
padding-bottom: 5px;
table-layout: fixed;

}

#basketTableInfo{
margin-left:auto; 
margin-right:auto;
border-collapse:collapse;    
 
}

.basketTableInfoTd{
border-bottom: 2px solid #ccc;

}

#paymentOneBtn{
background: rgb(250,224,120);
font-size: 16px;
width:50px;
padding: 8px;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px rgb(250,224,120);
font-weight:bold;
color: white;
margin-bottom: 5px; 

}

#paymentOneBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100)

}
#deleteBtn{
background: rgb(190,190,190);
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

#deleteBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170)

}

</style>

<script type="text/javascript">
//가맹점 코드 초기화
IMP.init('imp04411553')

//결제창 띄우는 함수
function requestPay(){

	IMP.request_pay({
// 	      pg: "html5_inicis",	//결제 pg 선택
	      pg: "kakaopay",	//결제 pg 선택
	      pay_method: "card",	//결제 방식
	      
	      merchant_uid: "order0001",   // 고유 주문 번호
	     
	      name: "노르웨이 회전 의자",	//주문 상품 이름
	      amount: 100,	//금액,  숫자 타입
	      
	      //주문자 정보
	      buyer_email: "email@email.com",
	      buyer_name: "덕주옹",
	      buyer_tel: "010-6737-5161",
	      buyer_addr: "서울특별시 강남구 대치동",
	      buyer_postcode: "00151"
	   
		}, function (rsp) { // callback
	      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	      
	      console.log(rsp)
	      // 결제 정보를 우리가 개발한
	      //서버로 전송해주어야 한다
	      //	-> 결제 후 처리
	      
	      if(rsp.success){//결제 성공시
	    	  alert('결제에 성공했습니다.')
		      
	    	     $.ajax({
	    	            type: "GET",
	    	            url: '../member/paySuccess',
	    	            data : {"email" : rsp.buyer_email}
//	  	    		location.href = '../board/list';

	    	     });
	    	 
	    	location.href = '../member/paySuccess';
	    	  
	      }else{//결제 실패시
	    	 alert('결제에 실패했습니다')
	      
	    	 location.href = '../member/payFail';
    	    
	      }
	 });
}
</script>


<%-- <% ============================================================================= %> --%>

<div style="text-align: center; margin-bottom: 40px;">
<img alt="장바구니 아이콘" src="/resources/img/basket.png">
</div>


<div style="text-align: center; width: 1000px; margin-left:auto; margin-right:auto;">
<table id="basketTableTitle">
	<tr>
		<th width="10%" class="thFontInfo">
			선택
		</th>
		<th width="20%" class="thFontInfo">
		</th>
		<th width="30%" class="thFontInfo">
			상품 정보
		</th>
		<th width="20%" class="thFontInfo">
			클래스 기간
		</th>
		<th width="30%" class="thFontInfo">
			상품 금액
		</th>
		<th width="15%" style="padding-right: 43px; "class="thFontInfo">
		</th>
	</tr>
</table>

<table id="basketTableInfo">
	<tr>
		<td class="basketTableInfoTd" style="border-right: 2px solid #ccc;" width="10%">
			<input style="width: 20px; height: 20px;" type="checkbox">
		</td>
		<td class="basketTableInfoTd" width="20%">
			<img alt="강의_이미지" src="/resources/img/sample_img2.png" width="195px" height="130px">
		</td>
		<td class="basketTableInfoTd" width="30%">
			<p style="font-weight:bold;">이름이 정해지지 않은 클래스</p>
		</td>
		<td class="basketTableInfoTd" style="text-align: left;" width="20%">
			<p style="width: 100px; padding-left: 50px;">2023-10-23~</p>
			<p style="width: 100px; padding-left: 50px;">2023-11-23</p>
		</td>
			<td class="basketTableInfoTd" width="30%">
		</td>
		<td class="basketTableInfoTd" width="15%">
			<button onclick="requestPay()" id="paymentOneBtn">구매</button><br>
			<button id="deleteBtn">삭제</button>
		</td>
	</tr>
</table>
</div>





<%-- <% ============================================================================= %> --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />