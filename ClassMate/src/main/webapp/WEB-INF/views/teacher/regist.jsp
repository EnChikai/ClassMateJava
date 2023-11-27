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
	      $('#deleteTableButton').show();
	      $('#dynamicTable').show();   
	    } else {
	      $('#showMap').show();
	      $('#deleteTableButton').hide();
	      $('#dynamicTable').hide();
	    }
	  }); 
	}); 

</script>

<script type="text/javascript"> 

function categoryUchange() {
	
	var art = ["음악", "영화", "사진", "회화", "뮤지컬", "공예", "연기", "게임", "무용"];
	var sports = ["헬스", "무술", "런닝", "수영", "사이클링", "레저", "체조", "요가", "크로스핏"];
	var cook = ["중식", "양식", "한식", "채식", "디저트", "베이킹", "퓨전", "건강식", "간편식"];
	var travel = ["백패킹", "휴양지", "도보", "음식", "문화", "도심", "로드 트립", "정글", "섬",];
	var growth = ["직업", "창업", "금융", "건강", "자기개발", "기술", "비즈니스", "교육", "독서"];
	var it = ["웹 개발", "앱 개발", "클라우드", "빅데이터", "프로그래밍 언어", "사이버 보안", "인공지능(AI)", "블록체인", "로봇 공학"];
	var fashion = ["의류", "패션 디자인", "악세사리", "뷰티", "컬러 코디네이션", "코스튬", "컬처 패션", "리사이클 패션", "패션 브랜드"];
	var create = ["영상 제작", "포토그래피", "디자인", "만화", "VR 및 AR", "음악 프로듀싱", "소셜 미디어", "캘리그라피", "키네틱 아트"];
	var culture = ["축제", "종교", "문학", "미술", "문화유산", "언어", "여행", "음악", "건축"];
	
	var mainCategoryName = document.getElementById("mainCategoryName");
	var subCategoryName = document.getElementById("subCategoryName");
	
	var selectedCategory = mainCategoryName.value;
	
	subCategoryName.innerHTML = "";
	
	// 선택한 대분류에 따라 소분류 설정
    switch (selectedCategory) {
    case "art":
        categoryDropdown(art);
        break;
    case "sports":
    	categoryDropdown(sports);
        break;
    case "cook":
    	categoryDropdown(cook);
        break;
    case "travel":
    	categoryDropdown(travel);
        break;
    case "growth":
    	categoryDropdown(growth);
        break;
    case "it":
    	categoryDropdown(it);
        break;
    case "fashion":
    	categoryDropdown(fashion);
        break;
    case "create":
    	categoryDropdown(create);
        break;
    case "culture":
    	categoryDropdown(culture);
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

<form action="/teacher/regist" method="post" id="submit" name="submit" enctype="multipart/form-data">
<table class="table table-bordered">
	<img id="preview" />
	<div class="fileBox">
	<label for="singleFile" style="display: block;">썸네일 등록</label>
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
	<option selected disabled>--대분류를 선택해주세요--</option>
	<option value="art">예술</option>
	<option value="sports">스포츠</option>
	<option value="cook">요리</option>
	<option value="travel">여행</option>
	<option value="growth">성장</option>
	<option value="it">IT</option>
	<option value="fashion">패션</option>
	<option value="create">창작</option>
	<option value="culture">IT</option>
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
	<td class="table-info">모집 정원</td><td><input type="number" name="maxCount" id="maxCount" style="display: block;"> 명</td>
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

<style type="text/css">
     
    input[type="file"], input[type="number"] {
        display: none;
    }

    #deleteTableButton {
        cursor: pointer;
        color: red;
        font-weight: bold;
        margin-top: 10px;
        display: none;
    }
</style>

<tr>
	<td><button id="deleteTableButton" onclick="deleteTable(event)">테이블 삭제</button></td>
    <td><table id="dynamicTable"></table></td>

    <!-- 추가: 파일 개수를 입력하는 input -->
    <input type="number" id="fileCount" name="fileCount" value="1" readonly style="display:none">	
</tr>
<script>
    // 함수를 호출하여 테이블 생성
    createDynamicTable(4, 5);

    function createDynamicTable(rows, cols) {
        // 테이블 엘리먼트 생성
        var table = document.getElementById('dynamicTable');

        // 행과 열을 반복하여 테이블 채우기
        for (var i = 0; i < rows; i++) {
            var row = table.insertRow(i);
            row.classList.add('tableRow'); // 행에 클래스 추가

            for (var j = 0; j < cols; j++) {
                var cell = row.insertCell(j);
                cell.classList.add('tableCell'); // 셀에 클래스 추가

                // input 엘리먼트 생성
                var input = document.createElement('input');
                input.type = 'file';
                input.id = 'fileInput_' + ((i * 5) + (j + 1)); // 고유한 id 부여
                input.name = 'fileInput_' + ((i * 5) + (j + 1)); // name 속성 부여

                var input2 = document.createElement('input');
                input2.type = 'number';
                input2.id = 'numberInput_' + ((i * 5) + (j + 1)); // 고유한 id 부여
                input2.name = 'numberInput_' + ((i * 5) + (j + 1)); // name 속성 부여
                input2.value = (i * 5) + (j + 1); // 열 번호로 초기값 설정
                input2.readOnly = true; // 읽기 전용으로 설정

                // input의 change 이벤트에 함수 연결
                input.addEventListener('change', function () {
                    handleFileInput(this);
                });

                // cell에 input 추가
                cell.appendChild(input);
                cell.appendChild(input2);

                // 첫 번째 셀인 경우 파일 입력을 보이게 처리
                if (i === 0 && j === 0) {
                    input.style.display = 'block';
                    input2.style.display = 'block';
                }
            }
        }

        // 테이블 밖의 삭제 버튼 표시
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'block';
    }

    function handleFileInput(input) {
        // 현재 위치의 열과 행 찾기
        var cell = input.parentNode;
        var col = cell.cellIndex;
        var row = cell.parentNode.rowIndex;

        // 현재 위치의 행이 마지막 행이 아니면 다음 열에 input 추가
        if (col < 4) {
            var nextCell = cell.nextElementSibling;
            var nextInput = nextCell.querySelector('input[type="file"]');
            var nextInput2 = nextCell.querySelector('input[type="number"]');

            if (nextInput) {
                nextInput.style.display = 'block';
            }

            if (nextInput2) {
                nextInput2.style.display = 'block';
                var fileCountInput = document.getElementById('fileCount');
                fileCountInput.value = (nextInput2.value == 20) ? 20 : nextInput2.value - 1;
            }
        }

        // 현재 위치의 열이 마지막 열이 아니면 다음 행의 첫 번째 열에 input 추가
        if (row < 5 && col === 4) {
            var nextRow = cell.parentNode.nextElementSibling;
            if (nextRow) {
                var firstCell = nextRow.querySelector('td');
                if (firstCell) {
                    var firstInput = firstCell.querySelector('input[type="file"]');
                    var firstInput2 = firstCell.querySelector('input[type="number"]');

                    if (firstInput) {
                        firstInput.style.display = 'block';
                    }

                    if (firstInput2) {
                        firstInput2.style.display = 'block';
                        // fileCount를 최신 numberInput 값으로 설정
                        var fileCountInput = document.getElementById('fileCount');
                        // 예외처리: 20번째 셀인 경우 fileCount를 20으로 설정
                        fileCountInput.value = (firstInput2.value == 20) ? 20 : firstInput2.value - 1;
                    }
                }
            }
        }
    }

    function deleteTable(event) {

    	 // 폼의 자동 제출을 막기 위해 event.preventDefault() 호출
        event.preventDefault();
    	
    	// 테이블 엘리먼트 찾기
        var table = document.getElementById('dynamicTable');

        
        // 테이블 내의 모든 파일 값 초기화 및 셀 삭제
        for (var i = table.rows.length - 1; i >= 0; i--) {
            table.deleteRow(i);
        }

        // 삭제 버튼 숨기기
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'none';

        // 테이블 내용을 1행 1열로 재생성
        createDynamicTable(1, 5);
    }


    function uploadFiles() {
        // FormData 생성
        var formData = new FormData();

        // 테이블 내의 파일들을 FormData에 추가
        var table = document.getElementById('dynamicTable');
        for (var i = 0; i < table.rows.length; i++) {
            var row = table.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                var cell = row.cells[j];

                // input type="file" 처리
                var fileInput = cell.querySelector('input[type="file"]');
                if (fileInput && fileInput.files.length > 0) {
                    for (var k = 0; k < fileInput.files.length; k++) {
                        formData.append(fileInput.name, fileInput.files[k]);
                    }
                }

                
                var numberInput = cell.querySelector('input[type="number"]');
                if (numberInput) {
                    formData.append(numberInput.name, numberInput.value);
                }
            }
        }

        // AJAX를 사용하여 FormData를 서버로 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/teacher/NewFile', true);
        xhr.onload = function () {
              if (xhr.status === 200) {
                console.log('Files uploaded successfully.');
            } else {
                console.error('File upload failed.');
            }
        };
        xhr.send(formData);
    }
    
    
</script>


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