<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<div style="max-width: 1000px; margin: auto;">
	<div class="container">
		<div class="container mt-4">
			<!-- 정보와 이미지를 포함하는 하나의 카드 -->
			<div class="card">
				<div class="row g-0">
					<!-- g-0은 카드 내부의 gutter(간격)를 제거합니다 -->
					<div class="col-md-5">
						<!-- 이미지 섹션 -->
						<img src="/upload/${lecture.headImg}"
							class="img-fluid rounded-start" alt="Class Image">
					</div>
					<div class="col-md-7">
						<!-- 정보 섹션 -->
						<div class="card-body">
							<h2 class="card-title">${lecture.className}</h2>
							<p class="card-text">강사명: ${lecture.teacher}</p>
							<p class="card-text">
								시작 날짜:
								<fmt:formatDate value="${lecture.classStart}"
									pattern="yyyy-MM-dd" />
							</p>
							<p class="card-text">
								종료 날짜:
								<fmt:formatDate value="${lecture.classEnd}" pattern="yyyy-MM-dd" />
							</p>
							<p class="card-text">최대 인원: ${lecture.maxCount}</p>
							<p class="card-text">비용: ${lecture.expense}</p>
							<p class="card-text">클래스 정보: ${lecture.classInfo}</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 지도 섹션 -->
			<div class="row mt-4">
				<div class="col-12">
					<div id="map" class="w-100 border rounded" style="height: 400px;"></div>
				</div>
			</div>
		</div>


		<div class="container mt-4">
			<div id="address1" data-main-address="${address.mainAddress}"
				data-sub-address="${address.subAddress}">
				<h5 class="text-muted">주소: ${address.mainAddress}
					${address.subAddress}</h5>
			</div>
		</div>
	</div>
</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	var address1 = document.getElementById('address1');
	var mainAddress = address1.getAttribute('data-main-address'); // 상세 주소
	var subAddress = address1.getAttribute('data-sub-address'); // 도로명 주소

	var mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 초기 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	// 지도 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	var geocoder = new daum.maps.services.Geocoder(); // 주소-좌표 변환 객체
	var marker = new daum.maps.Marker({ // 마커 생성
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	function execDaumPostcode() {
		// 주소로 상세 정보를 검색
		geocoder.addressSearch(mainAddress + ' ' + subAddress, function(
				results, status) {
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

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />