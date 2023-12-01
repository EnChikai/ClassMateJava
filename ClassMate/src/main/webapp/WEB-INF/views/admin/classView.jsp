<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
			
<%-- <% ============================================================================= %> --%>
<style type="text/css">
.classManagement{
background: rgb(241,196,15);

}

#classViewInfo{
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
display: block;

}

.teacherImg{
padding: 5px;
border: 1px solid #ccc;
border-radius: 3px;

}

#classViewInfoTb{
margin: auto;
width: 700px;
vertical-align: middle;

}

#classViewInfoTb th{
border: 3px solid white;

width: 100px;
background: #eee;
}

#classViewInfoTb td{
border-bottom : 1px solid #ccc;

}

#classInfo{
border: 1px solid #ccc;
border-radius: 5px;
padding: 10px;
margin: 5px;
margin-bottom: 10px;
margin-top: 10px;



}

.videoInfo{
display:inline-block;
border: 1px solid #ccc;
border-radius: 5px;
padding: 10px;
width: 142px;
margin-top:5px; 
margin-bottom:5px; 


}
</style>





<!-- 종강 모달 -->
<style type="text/css">
#existBtn{
border-radius: 3px; 
border-style: hidden;
width: 65px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(158,158,158); 
box-shadow: 0 0 0 1px #ccc; 
margin-right: 33px;

}

#existBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(170,170,170);
	
}

#delBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: black;
box-shadow: 0 0 0 1px black

}

#delBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

#existModal, #delModal{
  display:none;
  position:fixed;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}

.existModal-con, .delModal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 650px;;
  min-height: 470px;
  background:#fff;
}
.existModal-con .con, .delModal-con .con{
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

#existOkBtn, #delOkBtn{
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

#existOkBtn:hover:not(.active), #delOkBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(230,204,100);
cursor:pointer
	
}
</style>
<%-- <% ============================================================================= %> --%>

<script type="text/javascript">
// 비활성화 모달 열기
function openExistModal(modalname) {
  $("#existModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".existModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#existModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeExistModal").click(function (e) {
		    var modal = $(".existModal-con");
		      $("#existModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});

//삭제 모달 열기
function openDelModal(modalname) {
  $("#delModal").fadeIn(300);
  $("." + modalname).fadeIn(300);

};

// 외부 영역 클릭시 팝업 닫기
$(document).mouseup(function (e) {
  var modal = $(".delModal-con");
  if (!modal.is(e.target) && modal.has(e.target).length === 0) {
    $("#delModal").fadeOut(300);
    modal.fadeOut(300);

   	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });

  }
});

//닫기 버튼 클릭시 팝업 닫기
$(function(){
	  $("#closeDelModal").click(function (e) {
		    var modal = $(".delModal-con");
		      $("#delModal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});
</script>

<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">
<p id="classViewInfo" style="margin-bottom: 1rem">클래스 조회</p>

<c:if test="${not empty teacher.teacherImg }">
<img class="teacherImg" alt="강사 이미지" src="/upload/${teacher.teacherImg }" width="130" height="150">
</c:if>

<%-- <c:if test="${empty teacher.teacherImg }"> --%>

<%-- </c:if> --%>

<div style="margin-top: 10px; margin-bottom: 15px; text-align: right;">
<a href="javascript:openExistModal('existModal');" class="terms" style="text-decoration: none; color: black;"><button id="existBtn">종강</button></a>
</div>

<div style="border: 1px solid #ccc; padding: 10px; width: 750px; margin: auto; margin-bottom: 30px;">
<table id="classViewInfoTb" >
	<tr>
		<th rowspan='5' style="padding-top: 20px;">
			강사<br>
			사진
		</th>
		<td rowspan='5' style="padding-top: 20px; padding-bottom: 20px; width: 200px; border-top: 1px solid #ccc;">
			<img class="teacherImg" title="미졌습니까? 휴먼?" alt="디폴트 이미지" src="/resources/img/sample_img.png" width="130" height="150">
		</td>
		<th>
		강사
		</th>
		<td style="border-top: 1px solid #ccc;">
		${userInfo.userName }
		</td>
	</tr>
	
	<tr>
		<th>
		클래스명
		</th>
		<td>
		${classInfo.className }
		</td>
	</tr>
	
	<tr>
		<th>
		클래스 기간
		</th>
		<td>
		${classInfo.classStart } ~ ${classInfo.classEnd }
		</td>
	</tr>
	
	<tr>
		<th>
		모집 정원
		</th>
		<td>
		${classInfo.maxCount } 명
		</td>
	</tr>
	
	<tr>
		<th>
		현재 인원
		</th>
		<td>
		${classListCount } 명
		</td>
	</tr>
	
	<tr>
		<th>
		클래스 소개
		</th>
		<td colspan="3">
		<div id="classInfo">
		${classInfo.classInfo }
		</div>
		</td>
	</tr>
	
	<tr>
		<th>
		커리큘럼
		</th>
		<td colspan="3">
		<div id="classInfo">
		${classInfo.curriculum }
		</div>
		</td>
	</tr>
	
	<c:if test="${classInfo.onOff eq 1}">
	<tr>
		<th>
		영상 업로드
		</th>
		<td colspan="3">
			<c:if test="${not empty classVideo}">
				<c:forEach var="i" begin="0" end="${classVideo.videoLesson }">
			<span class="videoInfo">
					${i } 회차
			</span>
				</c:forEach>
			</c:if>
			<c:if test="${empty classVideo}">
			영상이 없습니다
			</c:if>
		</td>
	</tr>
	</c:if>	
	
	<c:if test="${classInfo.onOff eq 0}">
	<tr>
		<th>
		지도
		</th>
		<td colspan="3">
			<!-- 지도 섹션 -->
			<div>
			    <div class="col-12">
			        <div id="map" class="w-100 border rounded" style="height:400px;"></div>
			       </div>
			   </div>
			
			<div id="map"></div>
			
			<div class="container mt-4">
			    <div id="address1" data-main-address="${address.mainAddress}" data-sub-address="${address.subAddress}">
			<h5 class="text-muted">주소: ${address.mainAddress} ${address.subAddress}</h5>
				    </div>
				</div>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div
			var address1 = document.getElementById('address1');
			var mainAddress = address1.getAttribute('data-main-address'); // 상세 주소
			var subAddress = address1.getAttribute('data-sub-address'); // 도로명 주소
			
			var mapOption = {
			    center: new daum.maps.LatLng(37.537187, 127.005476), // 초기 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};
			
			// 지도 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			var geocoder = new daum.maps.services.Geocoder(); // 주소-좌표 변환 객체
			var marker = new daum.maps.Marker({ // 마커 생성
			    position: new daum.maps.LatLng(37.537187, 127.005476),
			    map: map
			});
			
			function execDaumPostcode() {
			    // 주소로 상세 정보를 검색
			    geocoder.addressSearch(mainAddress + ' ' + subAddress, function(results, status) {
			        // 정상적으로 검색이 완료됐으면
			        if (status === daum.maps.services.Status.OK) {
			            var result = results[0]; // 첫번째 결과의 값을 활용
			
			            var coords = new daum.maps.LatLng(result.y, result.x); // 해당 주소의 좌표
			            mapContainer.style.display = "block"; // 지도 표시
			            map.relayout(); // 지도 재배치
			            map.setCenter(coords); // 지도 중심 변경
			            marker.setPosition(coords); // 마커 위치 변경
			        }
			    });
			}
			
			// 페이지 로드 시 지도 표시 함수 호출
			window.onload = execDaumPostcode;
			</script>
		</td>
	</tr>
	</c:if>
</table>
</div>

<%-- ${classInfo } --%>
<%-- ${teacher } --%>
<%-- ${userInfo } --%>

<%-- <% ============================================================================= %> --%>	
<%-- 비활성화 --%>	
<div id="existModal" class="close"></div>
  <div class="existModal-con existModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">해당 강의를</p>
    <p>종강 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/classExist" method="get">
	<button id="existOkBtn">예</button>
	<input type="text" name="classNo" style="display: none;" value="${classInfo.classNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeExistModal" id="closeExistModal"><button class="closeModalBtn" style="margin-top: 65px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>
  
<%-- 삭제 --%>	
<div id="delModal" class="close"></div>
  <div class="delModal-con delModal" style="border-radius: 8px;">
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    <p style="margin-top: 30px;">공지사항 게시물을</p>
    <p>삭제 하시겠습니까?</p>
    
    <p style="color: #999; font-size: 16px; padding-top: 33px;">다시 한번 확인 후 진행해주세요</p>
    
    <form action="../admin/announceDelete" method="post">
	<button id="delOkBtn">예</button>
	<input type="text" name="announceNo" style="display: none;" value="${announceBoard.announceNo}" readonly="readonly">
    <a href="javascript:return false;" class="closeDelModal" id="closeDelModal"><button class="closeModalBtn" style="margin-top: 70px" type="button">아니오</button></a>
	</form>
    
    </div>
  </div>			
<%-- <% ============================================================================= %> --%>	


</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />