<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
  // 모달 열기
  function openModal(modalname) {
    $("#modal").fadeIn(300);
    $("." + modalname).fadeIn(300);


  };
  function openModal2(modalname) {
    $("#modal2").fadeIn(300);
    $("." + modalname).fadeIn(300);
    

  };
  
  function openModal3(modalname) {
    $("#modal3").fadeIn(300);
    $("." + modalname).fadeIn(300);


  };

  // 외부 영역 클릭시 팝업 닫기
  $(document).mouseup(function (e) {
    var modal = $(".modal-con"); // 모달 내용에 대한 올바른 클래스
    if (!modal.is(e.target) && modal.has(e.target).length === 0) {
      $("#modal").fadeOut(300);
      modal.fadeOut(300);
	

     	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });
    	  

      

    }
  });
  
  // 외부 영역 클릭시 팝업 닫기
   $(document).mouseup(function (e) {
    var modal2 = $(".modal-con2"); // 모달 내용에 대한 올바른 클래스
    if (!modal2.is(e.target) && modal2.has(e.target).length === 0) {
      $("#modal2").fadeOut(300);
      modal2.fadeOut(300);
	

      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });


      
      
    }
  }); 
  
  
  // 외부 영역 클릭시 팝업 닫기
  $(document).mouseup(function (e) {
    var modal3 = $(".modal-con3"); // 모달 내용에 대한 올바른 클래스
    if (!modal3.is(e.target) && modal3.has(e.target).length === 0) {
      $("#modal3").fadeOut(300);
      modal3.fadeOut(300);


     $('html, body').css({ 'overflow': 'auto', 'height': '100%' });


      
      
    }
  });

</script>

<style type="text/css">

body{
	overflow: auto;
}

*{margin:0; padding:0;}
a.button{display:inline-block; text-decoration:none; color:#000;}

#modal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}


.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#fff; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}

#modal2{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}


.modal-con2{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con2 .title2{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
}
.modal-con2 .con2{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
}

.modal-con2 .close2{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#fff; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}

#modal3{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}


.modal-con3{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con3 .title3{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
}
.modal-con3 .con3{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
}

.modal-con3 .close3{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#fff; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}

.vl {
    border-left: 2px solid #DBDCDD;
    height: 15px;
}

td{
	padding-right: 15px;
}

.footer{
	margin: 15px;
}

.subtilte{
	text-align: center;
	margin-top: 25px;
	color: gray;
	font-size: 18px;
	
}


</style>
<hr style="margin-top: 60px;">

<div class="footer">

<div id="modal" class="close"></div>
  <div class="modal-con modal1" style="border-radius: 8px;">
    <p class="title"><strong>이용약관</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 회원 약관은 다음과 같습니다</strong></p>
    </div>
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">

	<c:import url="/WEB-INF/views/main/useTerms.jsp"></c:import>

    </div>
  </div>

<div id="modal2" class="close2"></div>
  <div class="modal-con2 modal2" style="border-radius: 8px;">
    <p class="title2"><strong>개인 정보 처리 방침</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 개인 정보 처리 방침은 다음과 같습니다</strong></p>
    </div>
    <div class="con2" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">

	<c:import url="/WEB-INF/views/main/privacyPolicy.jsp"></c:import>

    </div>
  </div>

<div id="modal3" class="close3"></div>
  <div class="modal-con3 modal3" style="border-radius: 8px;">
    <p class="title3"><strong>위치 기반 서비스 이용약관</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 위치 기반 서비스에 관련된 이용약관은 아래와 같습니다.</strong></p>
    </div>
    <div class="con3" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    
	<c:import url="/WEB-INF/views/main/locationBased.jsp"></c:import>
    
    </div>
  </div>
    


<table>
	<tr>
		<td><a href="/main/site" style="text-decoration: none; color: black;">사이트 소개</a></td>
		<td><div class="vl"></div></td>
		<td><a href="javascript:openModal('modal1');" class="button modal-open">이용약관</a></td>
		<td><div class="vl"></div></td>
		<td><a href="javascript:openModal2('modal2');" class="button modal-open">개인 정보 처리 방침</a></td>
		<td><div class="vl"></div></td>
		<td><a href="javascript:openModal3('modal3');" class="button modal-open">위치 기반 서비스 이용 약관</a></td>
	</tr>
</table>
<br><br>
<span><small>문의 전화 : 010-9318-5539</small></span><br>
<span><small>광고 제휴 : yeah0203@naver.com</small></span><br>
<span><small>소재지 : XXX XXXX XXXX XX</small></span>



</div>

</body>
</html>