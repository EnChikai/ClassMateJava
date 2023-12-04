<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String order = Long.toString(new Date().getTime()); %>

<%-- 체크박스 개별결제 오류남 --%>

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

#basketTableUnder{
	margin-left:auto; 
	margin-right:auto;
	border-collapse:collapse;    
	border-bottom: 2px solid #ccc;
 
}

#classInfo{
	display: inline-block;
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.paymentOneBtn{
	background: rgb(241,196,15);
	font-size: 16px;
	width:50px;
	padding: 8px;
	border-radius: 3px;
	border-style: hidden;
	box-shadow: 0 0 0 1px rgb(230,204,100);
	font-weight:bold;
	color: white;
	margin-bottom: 5px; 

}

.paymentOneBtn:hover:not(.active){
	box-shadow: 0 0 0 2px skyblue;
	background: rgb(230,204,100);
	cursor:pointer
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
	background: rgb(170,170,170);
	cursor:pointer
}

.onOffClass{
	background: rgb(241,196,15); 
	box-shadow: 0 0 0 1px rgb(230,204,100); 
	border-radius: 4px; 
	border-style: hidden; 
	text-align: center; 
	font-weight:bold; 
	color: white;
	margin-bottom: 5px;

}

.moveInfo{
	background: rgb(190,190,190);
	font-size: 16px;
	border-radius: 3px;
	border-style: hidden;
	box-shadow: 0 0 0 1px rgb(190,190,190);
	font-weight:bold;
	color: white;
	margin-bottom: 5px; 
	padding-left: 3px;
	padding-right: 3px;
	float: right;

}

.moveInfo:hover:not(.active){
	box-shadow: 0 0 0 2px skyblue;
	background: rgb(170,170,170);
	cursor:pointer;
}
	
.pInfo{
margin-bottom: 5px;

}

</style>

<%-- <% ============================================================================= %> --%>

<%-- 체크박스 클릭시 결제값 구하기 --%>
<c:forEach items="${classList }" var="classList">
<script type="text/javascript">
$(function(){
	
	var paymentValue = document.getElementById("paymentValue");
	var paymentSum = 0;
	var classNameValue = document.getElementById("classNameAll");
	var className = "'${classList.className}' "
	
	
	$("#checkbox${classList.classNo}").click(function(){
		
		if($("#checkbox${classList.classNo}").is(":checked")){
			paymentSum = ${classList.expense};
			classNameValue.value += className
		}else{
			paymentSum = -${classList.expense};
			classNameValue.value = classNameValue.value.replace("'${classList.className}' ","")
			
		}
	
	paymentValue.value = paymentSum;
	});
}); 
</script>
</c:forEach>

<%-- <% ============================================================================= %> --%>

<%-- 체크박스 결제 --%>
<script type="text/javascript">

<%-- 체크박스 처리 --%>
function allCheckFunc( check ) {
    $("[name=checkbox]").prop("checked", $(check).prop("checked") );
    
}

//체크박스 체크시 전체선택 체크 여부 
function oneCheckFunc( check )
{
    var allcheck = $("[name=checkboxAll]");
    var checkName = $(check).attr("name");

    if( $(check).prop("checked") )
    {
        checkBoxLength = $("[name="+ checkName +"]").length;
        checkedLength = $("[name="+ checkName +"]:checked").length;
        
        <%-- console.log("checkBoxLength : " + checkBoxLength + ", checkedLength : " + checkedLength); --%>
		<%-- 확인용 --%>

        if( checkBoxLength == checkedLength ) {
            allcheck.prop("checked", true);
            
        } else {
            allcheck.prop("checked", false);
            
        }
    }
    else
    {
        allcheck.prop("checked", false);
    }
}

$(function(){
    $("[name=checkboxAll]").change(function(){
        allCheckFunc( this );
    });
    
    $("[name=checkbox]").change(function(){
        oneCheckFunc($(this));
    });
});



<%-- 체크박스 결제 --%>
$(function(){
    
<%-- 최종 결제할 금액 구하기 --%>    
	   var paymentValue = document.getElementById("paymentValue");
	   var paymentSum = 0;
	   var classNameValue = document.getElementById("classNameAll");
	  	   
	   // 전체 체크박스에 대한 이벤트 핸들러
	   $("#checkboxAll").click(function(){
	      // 체크박스가 체크되었는지 확인
	      if($(this).is(":checked")){
	         // 체크되었다면 +값 추가
	         paymentSum = 0;
	         paymentSum += ${paymentSum}; 
	         
	         classNameValue.value = '';
	         $('.classNameInput').each(function (index, item) {
        	     classNameValue.value += "\'"+item.value+"\' "
        	 });	
	         
	      } else {
	         // 체크가 해제되었다면 -값 추가
	         paymentSum = 0;
	         classNameValue.value = '';
	         
	      }

	      // 결과값을 입력란에 표시
	   paymentValue.value = paymentSum;
	   });
    
    
<%-- 체크박스 클릭시 결제값 반영 --%>	
	    var paymentAll = $("#paymentAll");
	    var sum = 0;
	    
	    $(".checkBoxes").click(function(){
	    	sum += parseFloat($("#paymentValue").val())
	        paymentAll.val(sum);
	    	
	    	const element = document.getElementById('sumDiv');
	    	const formattedSum = new Intl.NumberFormat('en-US', { maximumFractionDigits: 3 }).format(parseFloat($("#paymentAll").val()));
	    	element.textContent = '총 합계 금액 : '+formattedSum;
	    	
	    });
	    
	    $("#checkboxAll").click(function(){
	    	sum = 0;
	    	sum += parseFloat($("#paymentValue").val());
	        paymentAll.val(sum);
	        
	        const element = document.getElementById('sumDiv');
	    	const formattedSum = new Intl.NumberFormat('en-US', { maximumFractionDigits: 3 }).format(parseFloat($("#paymentAll").val()));
	    	element.textContent = '총 합계 금액 : '+formattedSum;
	    });
		    
	    
<%-- 전체결제버튼 클릭 --%>	
<%--가맹점 코드 초기화 --%>
IMP.init('${init}')	
	$("#paymentBtn").click(function(){
		
		if($("#checkboxAll").is(":checked") || $(".checkBoxes").is(":checked")){
		
		let classNoAll = new Array();
		
		$('.classNoInput').each(function (index, item) {
			if($("#checkboxAll").prop("checked") == true && $("#checkbox"+item.value).prop("checked") == true){
				classNoAll[index] = item.value
			}
			
			if($("#checkbox"+item.value).prop("checked") == true && $("#checkboxAll").prop("checked") == false){
				classNoAll[index] = item.value
			}
			
		});	
		
		classNoAll = classNoAll.filter(value => value !== "")
		
		console.log(classNoAll);
		
		var userAddr = "${userInfo.mainAddress} ${userInfo.subAddress}";
		
		if(classNoAll.length == 1 && document.getElementById("paymentAll").value == 0){
			 $.ajax({
		            type: "POST",
		            url: '../payment/insertInfo',
		      		dataType: 'json',
		            data : {"merchantUid": <%=order %>
		            	, "provider": "free"
		            	, "payMethod": "free"
		            	, "cardName": "none"
		            	, "classNo" : classNoAll[0]
		            },
	    	     	success: function(data) {
		    	          // 성공 시 처리
		    	          if(data == 1){$(function(){ 
							  	 var overlay = $('<div id="overlay"></div>');
							   	 overlay.css({
							 	          'position': 'fixed',
							 	          'top': 0,
							 	          'left': 0,
							 	          'width': '100%',
							 	          'height': '100%',
							 	          'background': 'rgba(0, 0, 0, 0.5)', // 반투명 회색 배경
							 	          'z-index': 9998 // 다른 요소들 위에 나타나도록 설정
							 	       });
							  	 var loading = $('<img src="/resources/img/loading.webp" id="loading">');
							  	 	 loading.css({
							 	          'position': 'fixed',
							 	          'top': '50%',
							 	          'left': '50%',
							 	          'z-index': 9999 // 다른 요소들 위에 나타나도록 설정
							 	       });
							  	  $('body').append(overlay);
							  	  $('loading').append(overlay);
							  })
								setTimeout(function() {
							location.href = '../payment/insertInfo?merchantUid='+<%=order %>;
							}, 1500);
		    	          }else{
		    	        	  location.href = '../payment/fail';
		    	          }
		    	        },
		    	        error: function(err) {
		    	          // 오류 시 처리
		    	        	location.href = '../payment/fail';
		    	        }

		    	 });
			 			 
		}else{
			
				IMP.request_pay({
				
				pg: "html5_inicis",	//결제 pg 선택
<%--		    pg: "kakaopay",	//결제 pg 선택 --%>
				pay_method: "card",
				
			    merchant_uid: <%=order %>,   <%-- 고유 번호 --%>
			     
			    name: document.getElementById("classNameAll").value,	<%-- 주문 상품 이름 --%>
			    amount: document.getElementById("paymentAll").value,	<%-- //금액,  숫자 타입 --%>
			      
			    <%-- 주문자 정보 --%>
			    buyer_name: "${userInfo.userName}",
			    buyer_email: "${userInfo.userEmail}",
			    buyer_tel: "${userInfo.userPhone}",
			    buyer_addr: userAddr,
			    buyer_postcode: "${userInfo.userPost}"
			   
			}, function (data) {	<%-- callback --%>
				<%-- data.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다. --%>
			      
			      <%-- console.log(data)--%>
			      <%-- 결제 정보를 우리가 개발한 --%>
			      <%-- 서버로 전송해주어야 한다 --%>
			      <%-- 		-> 결제 후 처리 --%>
			      
			      if(data.success){ <%-- 결제 성공시 --%>
			      <%-- alert('결제에 성공했습니다'); --%>
				     
			   	     $.ajax({
			 	            type: "POST",
			 	            url: '../payment/insertInfo',
			 	      		dataType: 'json',
			 	      		traditional: true,
			 	            data : {"merchantUid": data.merchant_uid
			 	            	, "provider": data.pg_provider
			 	            	, "payMethod": data.pay_method
			 	            	, "cardName": data.card_name
			 	            	, "classNo" : classNoAll
			 	            },
			    	     	success: function(data) {
				    	          // 성공 시 처리
				    	          if(data == 1){$(function(){ 
									  	 var overlay = $('<div id="overlay"></div>');
									   	 overlay.css({
									 	          'position': 'fixed',
									 	          'top': 0,
									 	          'left': 0,
									 	          'width': '100%',
									 	          'height': '100%',
									 	          'background': 'rgba(0, 0, 0, 0.5)', // 반투명 회색 배경
									 	          'z-index': 9998 // 다른 요소들 위에 나타나도록 설정
									 	       });
									  	 var loading = $('<img src="/resources/img/loading.webp" id="loading">');
									  	 	 loading.css({
									 	          'position': 'fixed',
									 	          'top': '50%',
									 	          'left': '50%',
									 	          'z-index': 9999 // 다른 요소들 위에 나타나도록 설정
									 	       });
									  	  $('body').append(overlay);
									  	  $('loading').append(overlay);
									  })
										setTimeout(function() {
									location.href = '../payment/insertInfo?merchantUid='+<%=order %>;
									}, 1500);
				    	          }else{
				    	        	  location.href = '../payment/fail';
				    	          }
				    	        },
				    	        error: function(err) {
				    	          // 오류 시 처리
				    	        	location.href = '../payment/fail';
				    	        }
			 	    	 });
			    	  
			      }else{	<%-- 결제 실패시 --%>
			    	 <%-- alert('결제에 실패했습니다') --%>
				    	 
				    	 location.href = '../payment/fail';
				    	 
				      }
				 })
			}
		}else{
				alert('결제할 클래스를 선택하세요')
		}
		
	})
})
</script>

<%-- 무료 결제 --%>
<c:forEach items="${classList }" var="classList">
<script type="text/javascript">
$(function(){
	
	var classNoAll = new Array();

	classNoAll[0] = ${classList.classNo}

	<%-- console.log(classNoAll); --%>
	
	$("#freeBtn${classList.classNo}").click(function(){
		 $.ajax({
	            type: "POST",
	            url: '../payment/insertInfo',
	      		dataType: 'json',
	            data : {"merchantUid": <%=order %>
	            	, "provider": "free"
	            	, "payMethod": "free"
	            	, "cardName": "none"
	            	, "classNo" : classNoAll[0]
	            },
				success: function(data) {
				          // 성공 시 처리
				     if(data == 1){$(function(){ 
				  	 var overlay = $('<div id="overlay"></div>');
				   	 overlay.css({
				 	          'position': 'fixed',
				 	          'top': 0,
				 	          'left': 0,
				 	          'width': '100%',
				 	          'height': '100%',
				 	          'background': 'rgba(0, 0, 0, 0.5)', // 반투명 회색 배경
				 	          'z-index': 9998 // 다른 요소들 위에 나타나도록 설정
				 	 });
				  	 var loading = $('<img src="/resources/img/loading.webp" id="loading">');
				  	 	 loading.css({
				 	          'position': 'fixed',
				 	          'top': '50%',
				 	          'left': '50%',
				 	          'z-index': 9999 // 다른 요소들 위에 나타나도록 설정
				 	     });
				  	  $('body').append(overlay);
				  	  $('loading').append(overlay);
				   })
				setTimeout(function() {
				location.href = '../payment/insertInfo?merchantUid='+<%=order %>;
				}, 1500);
				    }else{
				        	  location.href = '../payment/fail';
				    }
		      },
		      error: function(err) {
		        // 오류 시 처리
		      	location.href = '../payment/fail';
		    }

	   });
	})
})
</script>
</c:forEach>

<%-- 개별 결제 --%>
<c:forEach items="${classList }" var="classList">
<script type="text/javascript">

<%--가맹점 코드 초기화 --%>
IMP.init('${init}')
$(function(){
	$("#OneBtn${classList.classNo}").click(function(){
		
		var classNoAll = new Array();

		classNoAll[0] = ${classList.classNo}
		
			console.log(classNoAll);
	
		var sum = document.getElementById("number${classList.classNo}").value;
		var userAddr = "${userInfo.mainAddress} ${userInfo.subAddress}";
		
		<%--console.log(sum)--%>
		IMP.request_pay({
	   pg: "html5_inicis",	//결제 pg 선택
<%-- 		    pg: "kakaopay",	//결제 pg 선택 --%>
			pay_method: "card", <%-- 결제 방식 --%>
		    merchant_uid: <%=order%>,   <%-- 고유 번호 --%>

		    name: "${classList.className }",	<%-- 주문 상품 이름 --%>
		    amount: ${classList.expense},	<%-- //금액,  숫자 타입 --%>
		      
		    <%-- 주문자 정보 --%>
		    buyer_name: "${userInfo.userName}",
		    buyer_email: "${userInfo.userEmail}",
		    buyer_tel: "${userInfo.userPhone}",
			buyer_addr: userAddr,
			buyer_postcode: "${userInfo.userPost}"
				    
			<%-- m_redirect_url: "{모바일에서 결제 완료 후 리디렉션 될 URL}" --%>
		    	 
		}, function (data) {	<%-- callback --%>
			<%-- data.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다. --%>

			  <%-- console.log(data) --%>
		      <%-- 결제 정보를 우리가 개발한 --%>
		      <%-- 서버로 전송해주어야 한다 --%>
		      <%-- 		-> 결제 후 처리 --%>
		      
		      if(data.success){ <%-- 결제 성공시 --%>
		    	  <%-- alert('결제에 성공했습니다'); --%>
			     
	    	     $.ajax({
	  	            type: "POST",
	  	            url: '../payment/insertInfo',
	  	      		dataType: 'json',
	  	            data : {"merchantUid": data.merchant_uid
	  	            	, "provider": data.pg_provider
	  	            	, "payMethod": data.pay_method
	  	            	, "cardName": data.card_name
	  	            	, "classNo" : classNoAll[0]
	  	            },
	    	     	success: function(data) {
	    	          // 성공 시 처리
	    	          if(data == 1){$(function(){ 
						  	 var overlay = $('<div id="overlay"></div>');
						   	 overlay.css({
						 	          'position': 'fixed',
						 	          'top': 0,
						 	          'left': 0,
						 	          'width': '100%',
						 	          'height': '100%',
						 	          'background': 'rgba(0, 0, 0, 0.5)', // 반투명 회색 배경
						 	          'z-index': 9998 // 다른 요소들 위에 나타나도록 설정
						 	       });
						  	 var loading = $('<img src="/resources/img/loading.webp" id="loading">');
						  	 	 loading.css({
						 	          'position': 'fixed',
						 	          'top': '50%',
						 	          'left': '50%',
						 	          'z-index': 9999 // 다른 요소들 위에 나타나도록 설정
						 	       });
						  	  $('body').append(overlay);
						  	  $('loading').append(overlay);
						  })
							setTimeout(function() {
						location.href = '../payment/insertInfo?merchantUid='+<%=order %>;
						}, 1500);
	    	          }else{
	    	        	  location.href = '../payment/fail';
	    	          }
	    	        },
	    	        error: function(err) {
	    	          // 오류 시 처리
	    	        	location.href = '../payment/fail';
	    	        }
	
	  	    	 });
		    	  
		      }else{	<%-- 결제 실패시 --%>
		     	 <%-- alert('결제에 실패했습니다') --%>
		    	 
		    	 location.href = '../payment/fail';
		    	 
		      }
		 })
	})
})
</script>
</c:forEach>

<%--상세보기로 이동 --%>
<c:forEach items="${classList }" var="classList">
<script type="text/javascript">
$(function(){
	$(".moveOffInfo${classList.classNo}").click(function(){
		location.href = '../main/offClassView?classNo=${classList.classNo}';
	})
	$(".moveOnInfo${classList.classNo}").click(function(){
		location.href = '../main/onClassView?classNo=${classList.classNo}';
	})
})
</script>
</c:forEach>

<%-- <% ============================================================================= %> --%>

<div style="text-align: center; margin-bottom: 40px; margin-top: 84px;">
<img alt="장바구니 아이콘" src="/resources/img/basket.png">
</div>



<div style="text-align: center; width: 1000px; margin-left:auto; margin-right:auto;">
<table id="basketTableTitle">
	<tr>
		<th style="padding-left: 20px; padding-right: 90px;" class="thFontInfo">
			선택
		</th>
		<th class="thFontInfo" style="padding-left: 200px; padding-right: 80px;">
			상품 정보
		</th>
		<th class="thFontInfo" style="padding-left: 100px; padding-right: 100px;">
			클래스 기간
		</th>
		<th class="thFontInfo" style="padding-left: 20px; padding-right: 130px;">
			상품 금액
		</th>
	</tr>
</table>


<c:forEach items="${classList }" var="classList">
<table id="basketTableInfo">
	<tr>
		<td width="20px;" class="basketTableInfoTd" style="border-right: 2px solid #ccc; text-align: center; padding-left:15px; padding-right:25px;">
			<input style="width: 20px; height: 20px;" id="checkbox${classList.classNo}" value="${classList.expense}" class="checkBoxes" name="checkbox" type="checkbox">
		</td>
		
		<td width="200px;" class="basketTableInfoTd">
		<c:if test="${not empty classList.headImg}">
			<img alt="강의_이미지" src="/upload/${classList.headImg}" width="195px" height="130px">
		</c:if>
		
		<c:if test="${empty classList.headImg}">
			<img alt="강의_이미지" src="/resources/img/sample_img2.png" width="195px" height="130px">
		</c:if>
		</td>
		
		
		<td width="200px;" class="basketTableInfoTd" style="vertical-align: top; padding-top: 15px">
			<c:if test="${classList.onOff eq 0}">
				<p class="onOffClass pInfo" style="width: 90; float: left;" >오프클래스</p>
				<p class="moveOffInfo${classList.classNo} moveInfo">상세보기</p>
			</c:if>
			<c:if test="${classList.onOff ne 0}">
				<p class="onOffClass pInfo" style="width: 75; float: left;" >온클래스</p>
				<p class="moveOnInfo${classList.classNo} moveInfo" >상세보기</p>
			</c:if>
			<br><br>
			<input style="display: none;" class="classNoInput" readonly="readonly" type="text" value="${classList.classNo}"/>
			<p class="pInfo" style="font-weight:bold;">${classList.className }</p>
			<p class="pInfo">강사명 : ${classList.teacher }</p>
			<p class="pInfo" id="classInfo" >${classList.classInfo }</p>
			<input style="display: none;" id="teacher${classList.classNo}" readonly="readonly" type="text" value="teacher${classList.classNo}"/>
			<input style="display: none;" class="classNameInput" readonly="readonly" type="text" value="${classList.className}"/>
		</td>
		
		
		<td width="150px;" class="basketTableInfoTd" style="text-align: left;">
			<p class="pInfo" style="width: 150px; padding-left: 20px;">${classList.classStart }~</p>
			<p class="pInfo" style="width: 150px; padding-left: 20px;">${classList.classEnd }</p>
		</td>
		
		
		<td width="200px;" style="text-align: center;" class="basketTableInfoTd" >
			<p class="pInfo" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${classList.expense }"/>원</p>
			<input style="display: none;" id="number${classList.classNo}" readonly="readonly" type="text" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${classList.expense }"/>">
		</td>
		
		
		<td width="50px;" class="basketTableInfoTd">
		
			<c:if test="${classList.expense eq 0}">
			<form action="../payment/basket" method="post">
			<button type="button" id="freeBtn${classList.classNo}" class="paymentOneBtn">결제</button><br>
			</form>
			</c:if>
			
			<c:if test="${classList.expense ne 0}">
			<form action="../payment/basket" method="post">
			<button type="button" id="OneBtn${classList.classNo}" class="paymentOneBtn">결제</button><br>
			</form>
			</c:if>
			
			<form action="../payment/basket" method="post">
			<button id="deleteBtn">삭제</button>
			<input style="display: none;" readonly="readonly" type="text" name="classNo" value="${classList.classNo}"/>
			</form>
		</td>
	</tr>
</table>
</c:forEach>



<table style="border-bottom: 2px solid #ccc;" id="basketTableInfo">
	<tr>
		<td width="70px;" style="text-align: center; padding-top: 10px; padding-bottom: 10px; padding-right: 20px;">
			<input style="width: 20px; height: 20px;" id="checkboxAll" name="checkboxAll" type="checkbox">
		</td>
		
		<td width="600px;">
		</td>
	
		<td width="200px;" style="padding-left: 140px;">
			<div id="sumDiv" style="font-weight:bold;">총 합계 금액 : 0</div>
		</td>
		<td width="30px;">
		</td>
	</tr>
</table>

<div style="margin-bottom: 89px">
	<button type="button" style="margin-top:40px; width: 100px;" id="paymentBtn" class="paymentOneBtn">결제하기</button>
</div>

<div style="display: none">체크박스 결제값 : <input id="paymentValue" readonly="readonly" type="number" value="0"/></div>
<div style="display: none">결제할 금액 : <input id="paymentAll" readonly="readonly" type="number" value="0"/></div>
<div style="display: none">클래스 이름 : <textarea style="width: 300px; height: 100px;" id="classNameAll" readonly="readonly"></textarea></div>

</div>

<%-- <% ============================================================================= %> --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />