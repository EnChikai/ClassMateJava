<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
$('#btnRegist').click(function () {
	
	if ($("#classCheck option:selected").val() == 2 || $("#classCheck option:selected").val() == null) {
		event.preventDefault();
		alert("클래스를 선택해주세요")
		}
	})
});
</script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("select[name=classCheck]").change(function(){
		  
	console.log($(this).val()); //value값 가져오기
		  
	var onOffNum = parseInt($(this).val());
	
	if($(this).val())
			
	$('#onOff').val(onOffNum);
			
		});
	
});
</script>

<script type="text/javascript">

$(document).ready(function() {
	  $('#classCheck').change(function() {
	    var Num = $('#classCheck option:selected').val();
	    if (Num == '1') {
	      $('#showMap').hide();
	      $('#onInsert1').show();
	      $('#onInsert2').show();
	      $('#onInsert3').show();   
	    } else {
	      $('#showMap').show();
	      $('#onInsert1').hide();
	      $('#onInsert2').hide();
	      $('#onInsert3').hide();
	    }
	  }); 
	}); 

</script>

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
	
	var mainCategoryName = document.getElementById("mainCategoryName");
	var subCategoryName = document.getElementById("subCategoryName");
	
	var selectedCategory = mainCategoryName.value;
	
	subCategoryName.innerHTML = "";
	
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
	
	var  subCategoryName = document.getElementById("subCategoryName");
	
	 for (var i = 0; i < categoryArray.length; i++) {
         var option = document.createElement("option");
         option.text = categoryArray[i];
         subCategoryName.add(option);
     }

     // 소분류 드랍다운 활성화
     subCategoryName.disabled = false;
	
}	

</script>

<script type="text/javascript">
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

</script>


<style type="text/css">

.preview {
	margin-top: 10px;
	
}

</style>

<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ON/OFF클래스 등록</h3>
<div id= "all"><select name="classCheck" id="classCheck">
  <option disabled="disabled" selected="selected" value="2">--선택해주세요--</option>
  <option value="1">on클래스</option>
  <option value="0">off클래스</option>
</select></div>
</div>
<hr>

<form action="/teacher/regist" method="post" id="submit" name="submit">
<table class="table table-bordered">
	<img id="preview" />
	<div class="fileBox">
	<label for="singleFile">썸네일 등록</label>
	<input type="file"  name="singleFile" id="singleFile" onchange="readURL(this);"> 
</div>


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
	 <label for="mainCategoryName">대분류 : </label>
	<select name="mainCategoryName" id="mainCategoryName" onchange="categoryUchange()">
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
	<label for="subCategoryName">소분류 : </label>
	<select name="subCategoryName" id="subCategoryName" disabled>
	<option selected disabled>--대분류를 먼저 선택해주세요--</option>
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
	<td><input type="hidden" name="onOff" id="onOff" value=""></td>
</tr>
<tr>
	<td class="table-info" id="onInsert1" style="display: none;">영상 업로드</td><td id="onInsert2" style="display: none;"><input type="file" class="form-control" name="file" id="file" multiple="multiple"></td>
	<td id="onInsert3" style="display: none;">
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
<div id="showMap" style="display: none">
<input type="text" id="mainAddress" name="mainAddress" placeholder="주소" readonly>
<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
<input type="text" id="subAddress" name="subAddress" placeholder="상세 주소 입력">
<div id="map" style="width:90%;height:350px;margin-top:10px;display:none"></div>
</div>

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
                document.getElementById("mainAddress").value = addr;               
               
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



<br>

<div class="text-center">
	<button class="btn btn-primary" id="btnRegist">등록</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>
</form>


</div>	<!-- center box -->

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />