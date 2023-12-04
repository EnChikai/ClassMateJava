<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        // 페이지 로드 시 초기 설정
        handleOnOffValue('${detailList.onOff}');
    });

    // detailList.onOff 값에 따라 처리하는 함수
    function handleOnOffValue(onOffValue) {
        var onClassVideoDiv = document.getElementById('onClassVIdeo');
        var addressMap1Div = document.getElementById('addressMap1');
        var addressMap2Div = document.getElementById('addressMap2');

        // 초기 설정
        onClassVideoDiv.style.display = 'none';
        addressMap1Div.style.display = 'none';
        addressMap2Div.style.display = 'none';

        // onClassVideo가 나타날 때의 처리
        if (onOffValue === '1') {
            onClassVideoDiv.style.display = 'block';
        } else {
            // onClassVideo가 나타나지 않을 때의 처리
            addressMap1Div.style.display = 'block';
            addressMap2Div.style.display = 'block';
        }
    }
</script>

<div class="cd1" style= margin-left: 700px;">
<div style="width: 700px;"><h3 style="text-align: center;">ON/OFF클래스 상세 조회</h3></div>
<div><c:choose>
    <c:when test="${detailList.onOff eq 1}">
        <p style="text-align: right; font-weight: bold; color:orange;">온라인</p>
    </c:when>
    <c:otherwise>
        <p style="text-align: right; font-weight: bold; color: teal;">오프라인</p>
    </c:otherwise>
</c:choose></div>
<hr>


<img alt="강의 썸네일" src="/upload/${detailList.headImg}" width="130" height="150" style="margin-bottom: 10px; margin-left: 10px;">

<table class="table table-bordered" style="width: 700px; text-align: center;">

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
	<td class="table-info">카테고리</td><td>${mainCategoryName }
	<img src="/resources/img/gonext.png" id="rightImg" alt="더하기" width="20" height="20" style="margin-left: 5px; margin-right: 5px;">
	 ${subCategoryName }</td>
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

</table> 

<div id="onClassVIdeo">
<table style="text-align: center;">
    <c:forEach begin="0" end="4" varStatus="outerLoop">
        <tr>
            <c:forEach begin="0" end="3" varStatus="innerLoop">
                <td>
                <c:if test="${not empty videoList[outerLoop.index * 4 + innerLoop.index].videoLesson}">
                <div style="margin-top: 20px; font-size: large;">   
                            ${videoList[outerLoop.index * 4 + innerLoop.index].videoLesson}<span>강</span>
                </div>
                <div><img src="/resources/img/videoImg2.png" id="videoImg" alt="영상" width="175" height="140"></div>
                        </c:if>
                <div>${videoList[outerLoop.index * 4 + innerLoop.index].originName}</div>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

</div>

    <!-- 지도 섹션 -->
    <div class="row mt-4" id="addressMap1">
        <div class="col-12">
            <div id="map" class="w-100 border rounded" style="height:400px; width: 400px;" ></div>
        </div>
    </div>


<div class="container mt-4" id="addressMap2">
    <div id="address1" data-main-address="${addressList.mainAddress}" data-sub-address="${addressList.subAddress}">
        <h5 class="text-muted">주소: ${addressList.mainAddress} ${addressList.subAddress}</h5>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script>
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

<div style="text-align: center; margin-top: 20px;"><a href="/teacher/check"><button class="btn btn-secondary">목록</button></a></div>



</div> <!-- cd1 -->




<c:import url="/WEB-INF/views/layout/footer.jsp" />