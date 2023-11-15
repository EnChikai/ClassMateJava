<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ON/OFF클래스 상세 조회</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
<hr>

<div style="width: 70px; height: 70px; background-color: red; margin-top: 10px;">사진</div>

<table class="table table-bordered">

<colgroup>
	<col style="width: 20%;">
	<col style="width: 80%;">
</colgroup>

<tr>
	<td class="table-info">강사</td><td>${classDetail.teacher }</td>
</tr>
<tr>
	<td class="table-info">클래스명</td><td>${classDetail.className }</td>
</tr>
<tr>
	<td class="table-info">클래스 기간</td><td><fmt:formatDate value="${classDetail.classStart }" pattern="yyyy - MM - dd"/> ~
		 <fmt:formatDate value="${class.classEnd }" pattern="yyyy - MM - dd"/></td>
</tr>
<tr>
	<td class="table-info">모집 정원</td><td>${classDetail.maxCount }</td>
</tr>
<tr>
	<td class="table-info">비용 및 안내</td><td>${classDetail.classInfo }</td>
</tr>
<tr>
	<td class="table-info">클래스 소개</td><td>${classDetail.content }</td>
</tr>
<tr>
	<td class="table-info">커리큘럼</td><td>${classDetail.curriculum }</td>
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

<div id="adress1">${adress.mainAdress }</div><br>
<div id="detailAddress">${adress.subAdress }</div><br>
<input type="button" onclick="execDaumPostcode()" value="지도 보기">
<div id="map" style="width:90%;height:350px;margin-top:10px;display:none"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address1").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    
</script>

<div id="address1">서울 영등포구 국회대로 494</div>
<input type="button" onclick="execDaumPostcode()" value="지도 보기">
<div id="map" style="width:90%;height:350px;margin-top:10px;display:none"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch('서울 영등포구 국회대로 494', function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            
    }
</script>

<button>목록</button>


<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />