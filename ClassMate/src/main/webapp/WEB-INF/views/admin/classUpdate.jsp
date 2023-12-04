<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}"></script>
			
<%-- <% ============================================================================= %> --%>
<style type="text/css">
.classManagement{
background: rgb(241,196,15);

}

.note-editor .dropdown-toggle::after { 
   all: unset; 
}

#classViewInfo{
font-size: 35px; 
font-weight: bold; 
border-bottom: 9px solid rgb(255,240,177); 
padding-bottom: 8px; 
text-align: left; 
padding-left: 27px;
width: 750px;
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

width: 120px;
background: #eee;
}

#classViewInfoTb td{
border-bottom : 1px solid #ccc;

}

.classInfo{
border: 1px solid #ccc;
border-radius: 10px;
padding: 10px;
margin: 5px;
margin-bottom: 10px;
margin-top: 10px;

}

.videoInfo{
display:inline-block;
border-left: 2px solid rgb(255,250,220);
border-top: 2px solid rgb(255,250,220);
border-right: 2px solid rgb(255,225,120);
border-bottom: 2px solid rgb(255,225,120);;
border-radius: 5px;
padding: 5px;
margin-top:5px; 
margin-bottom:5px; 
background: rgb(255,240,177);
width: 100px;

}

.emptyVideoInfo{
display:inline-block;
border-left: 2px solid #eee;
border-top: 2px solid #eee;
border-right: 2px solid #aaa;
border-bottom: 2px solid #aaa;
border-radius: 5px;
padding: 5px;
margin-top:5px; 
margin-bottom:5px; 
background: #ccc;
width: 100px;

}

#updateBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;
background: rgb(251,206,25); 
box-shadow: 0 0 0 1px rgb(241,196,15); 
margin-right: 5px;

}

#updateBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: 1px rgb(241,196,15);
	
}

.classInput{
height: 20px;
text-align: center;

}


#cancelBtn{
border-radius: 3px; 
border-style: hidden;
width: 63px; 
height: 33px;
color: white;
font-weight:bold;

}

#cancelBtn{
background: black;
box-shadow: 0 0 0 1px black

}

#cancelBtn:hover:not(.active){
box-shadow: 0 0 0 2px skyblue;
background: rgb(50,50,50);
	
}

</style>

<%-- <% ============================================================================= %> --%>
<style>
    label {
        display: inline-block;
        padding: 10px;
        border: 1px solid #ccc;
        cursor: pointer;
    }
</style>

<script>
    function displayFileName(input) {
        var fileNameDisplay = document.getElementById('fileNameDisplay');
        fileNameDisplay.innerText = input.files[0].name;
    }
</script>
<%-- <% ============================================================================= %> --%>
<script type="text/javascript">
$(function(){
   let headImg = "${classInfo.headImg}";
   
   var trimmedPart = headImg.slice(-12);
   
   headImg = headImg.replace(trimmedPart,'');
   
   $("#fileName").text(headImg)
   
   
});
</script>
<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">
<p id="classViewInfo" style="margin-bottom: 1rem">클래스 수정</p>

<div style="border: 1px solid #ccc; padding: 10px; width: 750px; margin: auto; margin-bottom: 30px; border-radius: 10px;">

<form action="../admin/classUpdate" method="post" enctype="multipart/form-data">
<input readonly="readonly"  name="classNo" style="display: none;" value="${classInfo.classNo }">
<table id="classViewInfoTb" >
	<tr>
		<th rowspan='5' style="padding-top: 20px;">
			강사<br>
			사진
		</th>
		<td rowspan='5' style="padding-top: 20px; padding-bottom: 20px; width: 200px; border-top: 1px solid #ccc;">
			
			<c:if test="${not empty teacher.teacherImg }">
			<img class="teacherImg" alt="강사 이미지" src="/upload/${teacher.teacherImg }" width="130" height="150">
			</c:if>
			
			<c:if test="${empty teacher.teacherImg }">
			<img class="teacherImg" title="미졌습니까? 휴먼?" alt="디폴트 이미지" src="/resources/img/sample_img.png" width="130" height="150">
			</c:if>
			
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
			<input class="classInput" type="text" style="width: 300px;" name="className" value="${classInfo.className }">
		</td>
	</tr>
	
	<tr>
		<th>
		강의 금액
		</th>
		<td>
		<div id="classInfo">
			<input name="expense" class="classInput" style="width: 300px;" value="${classInfo.expense }">
		</div>
		</td>
	</tr>
	
	<tr>
		<th>
		모집 정원
		</th>
		<td>
			<input class="classInput" type="text" style="width: 300px;" name="maxCount" value="${classInfo.maxCount }">
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
		클래스<br>
		기간
		</th>
		<td colspan="3">
		<div class="classInfo">
		시작일 : <input class="classInput" type="date" style="width: 200px; margin-right: 25px;" name="classStart" value="${classInfo.classStart }">
		종료일 : <input class="classInput" type="date" style="width: 200px;" name="classEnd" value="${classInfo.classEnd }">
		</div>
		</td>
	</tr>
	
	<tr>
		<th>
		기존<br>
		썸네일
		</th>
		<td colspan="3">
		<div class="classInfo">
		<c:if test="${not empty classInfo.headImg }">
			<p id="fileName"></p>
		</c:if>
		<c:if test="${empty classInfo.headImg }">
			이미지가 없습니다
		</c:if>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>
		신규<br>
		썸네일
		</th>
		<td colspan="3">
		<div class="classInfo">
			<input style="height: auto;" type="file" name="file" id="file">
		</div>
		</td>
	</tr>
	
	<tr>
		<th>
		클래스<br>
		소개
		</th>
		<td colspan="3">
		<textarea class="classInfo" style="width: 604px; height: 226px;" name="classInfo">${classInfo.classInfo }</textarea>
		</td>
	</tr>
	
	<tr>
		<th>
		커리큘럼
		</th>
		<td colspan="3">
		<div class="classInfo">
		<textarea id="content" name="curriculum">${classInfo.curriculum }</textarea>
			<script type="text/javascript">
			$('#content').summernote({
			    placeholder: '본문을 입력해 주세요',
			    tabsize: 1,
			    height: 170,
			    toolbar: [
			      ['style', ['style']],
			      ['font', ['bold', 'underline', 'clear']],
			      ['color', ['color']],
			      ['para', ['ul', 'ol', 'paragraph']],
			      ['insert', ['picture']],
			      ['table', ['table']],
			    ]
			  });
			</script>
		
		</div>
		</td>
	</tr>
	
	<c:if test="${classInfo.onOff eq 1}">
	<tr>
		<th>
		기존<br>
		동영상
		</th>
		<td colspan="3">
			<c:if test="${not empty classVideo}">
				<c:forEach var="i" begin="0" end="${classVideo.size() }">
<%-- 				<c:forEach var="i" begin="0" end="10"> --%>
 
				</c:forEach>
			</c:if>
			<c:if test="${empty classVideo}">
			영상이 없습니다
			</c:if>
		</td>
	</tr>
	
	<tr>
		<th>
		신규<br>
		동영상
		</th>
		<td colspan="3">
		<label for="fileInput${i }">파일 업로드:
			<input onchange="displayFileName(this)" style="display: none;" id="fileInput" type="file" name="classVideo" class="file">
			<span id="fileNameDisplay"></span>
		</label>	
		</td>
	</tr>
	</c:if>	

	<c:if test="${classInfo.onOff eq 0}">
	<tr>
		<th>
		지도
		</th>
		<td colspan="3">
		<div class="classInfo">
		
		<input style="display: none;" type="text" id="class_postcode" placeholder="우편번호">
		<input style="border-radius: 5px; border: 1px solid #aaa;" type="button" onclick="class_execDaumPostcode()" value="주소 찾기">
		<input name="mainAddress" type="text" id="class_address" placeholder="주소" value="${classAddress.mainAddress}">
		<input name="subAddress" type="text" id="class_detailAddress" placeholder="상세주소" value="${classAddress.subAddress}">
		<input style="display: none;" type="text" id="class_extraAddress" placeholder="참고항목">

			<!-- 지도 섹션 -->
			<div style="margin-top: 10px;">
			    <div class="col-12">
			        <div id="map" class="w-100 border rounded" style="height:300px;"></div>
			       </div>
			   </div>
				<script type="text/javascript">
				function class_execDaumPostcode() {
				    new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				            var addr = ''; // 주소 변수
				            var extraAddr = ''; // 참고항목 변수
				
				            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                addr = data.roadAddress;
				            } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                addr = data.jibunAddress;
				            }
				
				            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				            if(data.userSelectedType === 'R'){
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraAddr !== ''){
				                    extraAddr = ' (' + extraAddr + ')';
				                }
				                // 조합된 참고항목을 해당 필드에 넣는다.
				                document.getElementById("class_extraAddress").value = extraAddr;
				            
				            } else {
				                document.getElementById("class_extraAddress").value = '';
				            }
				
				            // 우편번호와 주소 정보를 해당 필드에 넣는다.
				            document.getElementById('class_postcode').value = data.zonecode;
				            document.getElementById("class_address").value = addr;
				            document.getElementById("class_detailAddress").value = data.buildingName; // Use buildingName as subAddress
				            document.getElementById("class_extraAddress").value = extraAddr;
				            // 커서를 상세주소 필드로 이동한다.
				            document.getElementById("class_detailAddress").focus();
				            
				            // execDaumPostcode 함수 호출
				            execDaumPostcode(data);
				            
				        }
				    }).open();
				}
				
				var mapContainer = document.getElementById('map');
				var mapOption = {
				    center: new daum.maps.LatLng(37.537187, 127.005476),
				    level: 5
				};
				var map = new daum.maps.Map(mapContainer, mapOption);
				var geocoder = new daum.maps.services.Geocoder();
				var marker = new daum.maps.Marker({
				    position: new daum.maps.LatLng(37.537187, 127.005476),
				    map: map
				});
				
				function execDaumPostcode(data) {
				    // 주소로 상세 정보를 검색합니다.
				    geocoder.addressSearch(data.roadAddress, function(results, status) {
				        if (status === daum.maps.services.Status.OK) {
				            var result = results[0];
				
				            var coords = new daum.maps.LatLng(result.y, result.x);
				            mapContainer.style.display = "block";
				            map.relayout();
				            map.setCenter(coords);
				            marker.setPosition(coords);
				        }
				    });
				}
				
				// 페이지 로드 시 지도 표시 함수 호출
				window.onload = function() {
				    //처음 로드되는 지도
				    execDaumPostcode({
				        roadAddress: document.getElementById("class_address").value,
				    });
				};
				</script>
		</div>
		</td>
	</tr>
	</c:if>
</table>

<button id="updateBtn" style="margin-top: 10px;">확인</button>
<a href="../admin/classView?classNo=${classInfo.classNo }"><button id="cancelBtn" type="button">취소</button></a>

</form>
</div>

<%-- ${classInfo } --%>
<%-- ${teacher } --%>
<%-- ${userInfo } --%>


</div>
<%-- <% ============================================================================= %> --%>
      
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />