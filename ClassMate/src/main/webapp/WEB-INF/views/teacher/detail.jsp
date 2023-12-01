<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="cd1" style="width: 700px; min-height: 800px; margin-left: 700px;">
<div id="all">
<h3 style="display: inline-block;">ON/OFF클래스 상세 조회</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
<hr>

<img alt="강의 썸네일" src="/upload/${deailList.teacherImg}" width="130" height="150">

<table class="table table-bordered">

<colgroup>
	<col style="width: 20%;">
	<col style="width: 80%;">
</colgroup>

<tr>
	<td class="table-info">강사</td><td>${detailList.teacher }</td>
</tr>
<tr>
	<td class="table-info">클래스명</td><td>${detailList.className }</td>
</tr>
<tr>
	<td class="table-info">클래스 기간</td><td><fmt:formatDate value="${detailList.classStart }" pattern="yyyy - MM - dd"/> ~
		 <fmt:formatDate value="${detailList.classEnd }" pattern="yyyy - MM - dd"/></td>
</tr>
<tr>
	<td class="table-info">모집 정원</td><td>${detailList.maxCount } 명</td>
</tr>
<tr>
	<td class="table-info">비용 및 안내</td><td>${detailList.expense } 원</td>
</tr>
<tr>
	<td class="table-info">클래스 소개</td><td>${detailList.classInfo }</td>
</tr>
<tr>
	<td class="table-info">커리큘럼</td><td>${detailList.curriculum }</td>
</tr>
<tr>
	<td class="table-info">영상 업로드</td><td>${detailList.curriculum }</td>
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

<tr>
	<td>영상테스트</td>
	<td><c:forEach items="${videoList }" var="videoList">
	<td>"${videoList }"</td>
	
	</c:forEach></td>
</tr>

</table> 

    <!-- 지도 섹션 -->
    <div class="row mt-4">
        <div class="col-12">
            <div id="map" class="w-100 border rounded" style="height:400px; width: 400px;" ></div>
        </div>
    </div>


<div class="container mt-4">
    <div id="address1" data-main-address="${addressList.mainAddress}" data-sub-address="${addressList.subAddress}">
        <h5 class="text-muted">주소: ${addressList.mainAddress} ${addressList.subAddress}</h5>
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

<a href="/teacher/check"><button>목록</button></a>



</div> <!-- cd1 -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />