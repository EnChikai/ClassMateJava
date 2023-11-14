<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div class= "title">
<h1>강사페이지</h1>

<div id= "all"><a>전체보기</a></div>
</div>
<hr>



<table>
<tr>
	<td class="table-info">강사</td><td>${user.userName }</td>
</tr>
<tr>
	<td class="table-info">카테고리</td>
	<td>
	 <label for="categoryU">대분류:</label>
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
	<label for="categoryD">소분류:</label>
	<select name="categoryD" id="categoryD" disabled>
	</select>
	</td>
</tr>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7386d9c0dc5cbff30aa6aa3fde01768b&libraries=services"></script>
 <div id="map"></div>
  <form id="search-form">
    <input type="text" id="addressInput" placeholder="주소를 입력하세요" />
    <button type="submit">검색</button>
  </form>
  
  <script>
  var map = new kakao.maps.Map(document.getElementById("map"), {
    center: new kakao.maps.LatLng(37.54699, 127.09598),
    level: 5,
  });

  var addressInput = document.getElementById("addressInput");
  var geocoder = new kakao.maps.services.Geocoder();

  // 주소 검색 폼 제출 시
  document
    .getElementById("search-form")
    .addEventListener("submit", function (event) {
      event.preventDefault();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(addressInput.value, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
          // 검색된 좌표를 변수에 저장합니다
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          
          // 검색된 좌표를 clipboard에 복사합니다
          let dummy = document.createElement("textarea");
          document.body.appendChild(dummy);
          dummy.value = coords
            .toString()
            .replace(/[()]/g, "")
            .replace(", ", ",");
          dummy.select();
          document.execCommand("copy");
          document.body.removeChild(dummy);
          alert("좌표가 클립보드에 복사되었습니다.");

          // 검색된 좌표로 지도 중심을 이동시킵니다
          map.setCenter(coords);
        } else {
          // 검색 실패 시 예시 좌표로 이동합니다
          var exampleCoords = new kakao.maps.LatLng(37.54699, 127.09598);
          alert(
            "검색 실패! 예시 좌표 " +
                  exampleCoords.toString() +
                  " 로 이동합니다."
              );
              map.setCenter(exampleCoords);
            }
          });
        });
  </script> 


<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />