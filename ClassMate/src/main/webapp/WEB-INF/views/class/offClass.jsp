<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<div>
<h1>오프클래스메인페이지</h1>
<%-- <c:choose> --%>
<%--     <c:when test="${not empty map}"> --%>
        <ul>
            <li>
                클래스 번호: ${lecture.classNo}<br>
                강사 번호: ${lecture.teacherNo}<br>
                주요 카테고리: ${lecture.mainCategoryNo}<br>
                서브 카테고리: ${lecture.subCategoryNo}<br>
                강사명: ${lecture.teacher}<br>
                클래스명: ${lecture.className}<br>
                개설 날짜: <fmt:formatDate value="${lecture.classDate}" pattern="yyyy-MM-dd"/><br>
                시작 날짜: <fmt:formatDate value="${lecture.classStart}" pattern="yyyy-MM-dd"/><br>
                종료 날짜: <fmt:formatDate value="${lecture.classEnd}" pattern="yyyy-MM-dd"/><br>
                최대 인원: ${lecture.maxCount}<br>
                비용: ${lecture.expense}<br>
                클래스 정보: ${lecture.classInfo}<br>
                커리큘럼: ${lecture.curriculum}<br>
                온/오프라인: ${lecture.onOff}<br>
                헤더 이미지: <img src="${lecture.headImg}" alt="Class Image"/><br>
                내용: ${lecture.content}<br>
                삭제 여부: ${lecture.deleteBoolean}<br>
                주소 번호: ${address.addressNo }<br>
               	상세 주소: ${address.mainAddress }<br>
               	도로명 주소: ${address.subAddress }
            </li>
        </ul>
        
<div class="container">
    <div id="address1" data-main-address="${address.mainAddress}" data-sub-address="${address.subAddress}">
        ${address.mainAddress}<br>
        ${address.subAddress}
    </div>
    <div id="map" style="width:90%;height:350px;margin-top:10px;"></div>
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


<%--     </c:when> --%>
<%--     <c:otherwise> --%>
<!--         <p>클래스가 없습니다.</p> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />