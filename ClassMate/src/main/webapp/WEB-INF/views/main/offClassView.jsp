<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- Moment.js CDN -->
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // 장바구니 또는 OFF 클래스 시작하기 버튼 클릭 시
        $("button").click(function () {
            var classNo = $("#classNo").val();
            var onOff = $("#onOff").val();
            var className = $("#className").val();
            var buttonType = $(this).attr("name");

            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                type: "POST",
                url: "/main/basket",
                dataType: "json",
                data: {
                    classNo: classNo,
                    onOff: onOff,
                    className: className,
                    buttonType: buttonType
                },
                success: function (response) {
                	
                    var redirectUrl = response.redirect;

                    if (response.error && response.error !== "") {
                        // alert 창을 먼저 표시
                        alert(response.error);

                            if (redirectUrl) {
                                window.location.href = redirectUrl;
                            } else {
                                console.log("리다이렉트 URL이 없습니다.");
                            }

                    } else if (redirectUrl) {
                        // alert 창이 필요 없는 경우 바로 페이지 전환
                        window.location.href = redirectUrl;
                    } else {
                        console.log("리다이렉트 URL이 없습니다.");
                    }
                },
                error: function (error) {
                    console.error("전송 오류: ", error);
                }
            });
        });
        
        // 클래스 소개와 커리큘럼의 상태를 저장하는 변수들
        var classInfoContainerVisible = false;
        var classCurriculumContainerVisible = false;

        // 클래스 소개 버튼 클릭 시
        $("#classInfo").click(function () {
            var classNo = $("#classNo").val();

            $.ajax({
                url: "/main/classInfo",
                method: "GET",
                data: {
                    classNo: classNo
                },
                success: function (response) {
                    console.log(response);
                    displayClassInfo(response);
                    // 커리큘럼 컨테이너를 숨김
                    $("#classCurriculumContainer").hide();
                    classCurriculumContainerVisible = false;
                },
                error: function (error) {
                    console.error("Ajax 요청 실패!");
                    console.error(error);
                }
            });
        });
        
       

        function displayClassInfo(data) {
            // 클릭 상태에 따라 토글 처리
            if (classInfoContainerVisible) {
                $("#classInfoContainer").hide();
            } else {
                $("#classInfoContainer").empty();
                if (data && data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                    	 var date = new Date(data[i].freeDate);
                         
                    	 var classDate = new Date(data[i].classDate);
                         var classStart = new Date(data[i].classStart);
                         var classEnd = new Date(data[i].classEnd);

                         var classDateFormatted = classDate.toISOString().split('T')[0];
                         var classStartFormatted = classStart.toISOString().split('T')[0];
                         var classEndFormatted = classEnd.toISOString().split('T')[0];


                        var htmlContent =
                            '<div style="display: flex;">' +
                            '<div style="background-color: black; font-size: 30px; color: white; flex: auto; width: 551px; height: 550px;">' +
                                '<div style="padding-top: 50px; padding-left: 50px; padding-bottom: 50px; font-size: 20px;">' +
                                    '강사명 : ' + data[i].teacher + '<br><br>' +
                                    '강의기간<br>' + classStartFormatted + '~' + classEndFormatted + '<br><br>' +
                                    '모집기간<br>' + classDateFormatted + '~' + classStartFormatted + '<br><br>' +
                                    '모집인원 : ' + data[i].maxCount + '<br>' +
                                    '금액 : ' + parseInt(data[i].expense) + '<br>' +
                                '</div>' +
                            '</div>' +
                            '<div style="width: 551px;">' +
                                '<div style="text-align: center; font-size: 36px;"><strong>클래스 소개</strong></div>' +
                                '<div style="padding: 50px;">' +
                                    data[i].classInfo +
                                '</div>' +
                            '</div>' +
                            '</div>' +
                            '<div id="map">' +
                            '</div>';

                        $("#classInfoContainer").append(htmlContent);
                    }
                    $("#classInfoContainer").show();
                } else {
                    $("#classInfoContainer").text("클래스 정보가 없습니다.");
                }
            }

            // 클릭 상태를 업데이트
            classInfoContainerVisible = !classInfoContainerVisible;
        }

        // 커리큘럼 버튼 클릭 시
        $("#classCurriculum").click(function () {
            var classNo = $("#classNo").val();

            $.ajax({
                url: "/main/classInfo",
                method: "GET",
                data: {
                    classNo: classNo
                },
                success: function (response) {
                    console.log(response);
                    displayClassCurriculum(response);
                    // 클래스 소개 컨테이너를 숨김
                    $("#classInfoContainer").hide();
                    classInfoContainerVisible = false;
                },
                error: function (error) {
                    console.error("Ajax 요청 실패!");
                    console.error(error);
                }
            });
        });

        function displayClassCurriculum(data) {
            // 클릭 상태에 따라 토글 처리
            if (classCurriculumContainerVisible) {
                $("#classCurriculumContainer").hide();
            } else {
                $("#classCurriculumContainer").empty();
                if (data && data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                    	 var classDate = new Date(data[i].classDate);
                         var classStart = new Date(data[i].classStart);
                         var classEnd = new Date(data[i].classEnd);

                         var classDateFormatted = classDate.toISOString().split('T')[0];
                         var classStartFormatted = classStart.toISOString().split('T')[0];
                         var classEndFormatted = classEnd.toISOString().split('T')[0];


                        var htmlContent =
                            '<div style="display: flex;">' +
                            '<div style="background-color: black; font-size: 30px; color: white; flex: auto; width: 551px; height: 550px;">' +
                                '<div style="padding-top: 50px; padding-left: 50px; padding-bottom: 50px; font-size: 20px;">' +
                                    '강사명 : ' + data[i].teacher + '<br><br>' +
                                    '강의기간<br>' + classStartFormatted + '~' + classEndFormatted + '<br><br>' +
                                    '모집기간<br>' + classDateFormatted + '~' + classStartFormatted + '<br><br>' +
                                    '모집인원 : ' + data[i].maxCount + '<br>' +
                                    '금액 : ' + parseInt(data[i].expense) + '<br>' +
                                '</div>' +
                            '</div>' +
                            '<div style="width: 551px;">' +
                                '<div style="text-align: center; font-size: 36px;"><strong>커리큘럼</strong></div>' +
                                '<div style="padding: 50px;">' +
                                    data[i].curriculum +
                                '</div>' +
                            '</div>' +
                            '</div>';

                        $("#classCurriculumContainer").append(htmlContent);
                    }
                    $("#classCurriculumContainer").show();
                } else {
                    $("#classCurriculumContainer").text("클래스 정보가 없습니다.");
                }
            }

            // 클릭 상태를 업데이트
            classCurriculumContainerVisible = !classCurriculumContainerVisible;
        }
        
        
    });
    
function redirectToLogin() {
	  alert('로그인이 필요합니다.');
	  window.location.href = '/user/login';
}
</script>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}
</style>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

<c:forEach var="list" items="${list}">
    	<div style="text-align: center;">
        	<img style="width: 1103px; height: 783px;" src="/upload/${list.headImg }">
        </div>
        <div style="display: flex;">
	        <div style="text-align: center; margin-right: 52px; margin-left: 51px;">
		        <c:if test="${isLogin != null }">
		        	<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 50px; padding-left: 68px; padding-right: 68px;  margin-right: 80px; margin-left: 80px;" type="button" name="main"><strong>OFF 클래스 시작하기</strong></button><br>
		    	</c:if>
		    	<c:if test="${isLogin == null }">
		   			<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 50px; padding-left: 68px; padding-right: 68px;  margin-right: 80px; margin-left: 80px;" onclick="redirectToLogin()"><strong>OFF 클래스 시작하기</strong></button><br>
		   		</c:if>
		   		
		   		<div style="text-align: center; margin-top: 25px;">
			   		<c:if test="${isLogin != null }">
						<button type="button" name="basket"><img style="width: 50px;" src="/resources/img/basket.png"></button>
			    	</c:if>
			    
			    	<c:if test="${isLogin == null }">
			   			<a href="/user/login"><button onclick="alert('로그인이 필요합니다.')"><img style="width: 50px;" src="/resources/img/basket.png"></button></a>
			   		</c:if>
			   		
			   		<a href="https://www.instagram.com/" target='_blank'><img style="width: 50px; margin-left: 50px;" src="/resources/img/link.png"></a>
		   		</div>
		   		<div style="margin-top: 90px;">
		   			<a style="font-size: 23px; margin-right: 20px; margin-left: 20px; text-decoration: underline; cursor: pointer;" id="classInfo"><strong>클래스 소개</strong></a>
		   			<a style="font-size: 23px; margin-right: 20px; margin-left: 20px; text-decoration: underline; cursor: pointer;" id="classCurriculum"><strong style="margin-right: 20px;">커리큘럼</strong></a>
		   		</div>
	   		</div>
        	<div style="background-color: black; font-size: 35px; color: white; flex: auto; width: 551px; height: 550px;">
        		<div style="display: flex; justify-content: flex-end;"><img style=" height:100px; width: 60px; margin-right: 20px; margin-top: 20px;" src="/resources/img/offLogo.png"></div>
        		<div style="margin-left: 25px;"><strong>${list.className }</strong></div>
        	</div>
	    </div>
	    <div id="classInfoContainer"></div>
	    <div id="classCurriculumContainer"></div>
	    
        <input type="text" id="classNo" value="${list.classNo}" style="display: none;" readonly="readonly">
        <input type="text" id="onOff" value="${list.onOff}" style="display: none;" readonly="readonly">
        <input type="text" id="className" value="${list.className}" style="display: none;" readonly="readonly">
    </c:forEach>
    
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
    
<c:import url="/WEB-INF/views/layout/footer.jsp" />