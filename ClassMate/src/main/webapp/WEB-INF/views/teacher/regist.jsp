<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript"> 

function categoryUchange() {
	
	var cook = ["양식", "한식", "밀키트"];
	var beauty = ["헤어", "메이크업", "왁싱"];
	var sports = ["구기스포츠", "라켓스포츠", "수영"];
	var selfDevelopement = ["실무", "제테크", "자격증"];
	var design = ["패션", "악세사리", "가구"];
	var communication = ["토론", "어학", "발표"];
	var business = ["굿즈", "투잡", "제테크"];
	var create = ["문학", "음악", "팬픽"];
	var it = ["홈페이지", "어플리케이션", "프로그래밍 언어"];
	
	var categoryU = document.getElementById("categoryU");
	var categoryD = document.getElementById("categoryD");
	
	var selectedCategory = categoryU.value;
	
	categoryD.innerHTML = "";
	
	// 선택한 대분류에 따라 소분류 설정
    switch (selectedCategory) {
    case "cook":
        categoryDropdown(cook);
        break;
    case "beauty":
    	categoryDropdown(beauty);
        break;
    case "sports":
    	categoryDropdown(sports);
        break;
    case "selfDevelopement":
    	categoryDropdown(selfDevelopement);
        break;
    case "design":
    	categoryDropdown(design);
        break;
    case "communication":
    	categoryDropdown(communication);
        break;
    case "business":
    	categoryDropdown(business);
        break;
    case "create":
    	categoryDropdown(create);
        break;
    case "it":
    	categoryDropdown(it);
        break;
    // 다른 대분류에 대한 case 추가
	}
}
	
function categoryDropdown(categoryArray) {
	
	var  categoryD = document.getElementById("categoryD");
	
	 for (var i = 0; i < categoryArray.length; i++) {
         var option = document.createElement("option");
         option.text = categoryArray[i];
         categoryD.add(option);
     }

     // 소분류 드랍다운 활성화
     categoryD.disabled = false;
	
}
	

</script>

<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ON/OFF클래스 등록</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
<hr>

<form action="/teacher/regist" method="post">
<div style="width: 70px; height: 70px; background-color: red; margin-top: 10px;">사진</div>

<table class="table table-bordered">

<colgroup>
	<col style="width: 20%;">
	<col style="width: 80%;">
</colgroup>

<tr>
	<td class="table-info">강사</td><td>${user.userName }</td>
</tr>
<tr>
	<td class="table-info">카테고리</td>
	<td>
	 <label for="categoryU">대분류 : </label>
	<select name="categoryU" id="categoryU" onchange="categoryUchange()">
	<option value="cook">요리</option>
	<option value="beauty">뷰티</option>
	<option value="sports">스포츠</option>
	<option value="selfDevelopement">자기개발</option>
	<option value="design">디자인</option>
	<option value="communication">커뮤니케이션</option>
	<option value="business">비즈니스</option>
	<option value="create">창작</option>
	<option value="it">IT</option>
	</select>
	>
	<label for="categoryD">소분류 : </label>
	<select name="categoryD" id="categoryD" disabled>
	</select>
	</td>
</tr>
<tr>
	<td class="table-info">클래스명</td><td><input type="text" name="className" id="className"></td>
</tr>
<tr>
	<td class="table-info">클래스 기간</td><td><input type="date" name= "classStart" id="classStart"> ~
		 <input type="date" name="classEnd" id="classEnd"></td>
</tr>
<tr>
	<td class="table-info">모집 정원</td><td><input type="number" name="maxCount" id="maxCount"> 명</td>
</tr>
<tr>
	<td class="table-info">비용 및 안내</td><td><input type="text" name="expense" id="expense"> 원</td>
</tr>
<tr>
	<td class="table-info">클래스 소개</td><td><textarea name="classInfo" id="classInfo"></textarea></td>
</tr>
<tr>
	<td class="table-info">커리큘럼</td><td><textarea name="curriculum" id="curriculum"></textarea></td>
</tr>
<tr>
	<td class="table-info">영상 업로드</td><td>${classDetail.curriculum }</td>
	<td>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table>
	  <c:forEach items="${video }" var="video">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td>${video.videoLesson } 회차</td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	</td>
</tr>

</table> 





<script src="http://code.jquery.com/jquery-latest.js"></script> 
<body>
		<table>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address"></td>
				<td><button type="button" id="searchBtn">검색</button></td>
			</tr>
			<tr>
				<td>상세 주소</td>
				<td><input type="text" name="detailAddress2"></td>
				<td></td>
			</tr>
		</table>
		<div id="map" style="width:100%;height:350px;"></div>
   
	<!-- kakao API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	
	$('#searchBtn').click(function(){
		// 버튼을 click했을때
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('#address').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});  
	});
	  
	</script>

<br>

<button>목록</button>
<button>취소</button>
</form>


</div>	<!-- center box -->

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />