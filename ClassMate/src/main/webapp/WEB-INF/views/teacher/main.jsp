<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<div class="cd1">
<div class="center-box">
<div class= "title">
<h1>강사페이지</h1>

<div id= "all"><a>전체보기</a></div>
</div>
<hr>

<script type="text/javascript"> 

function categoryUchange() {
	
	var art = ["음악", "영화", "사진"];
	var sports = ["헤어", "메이크업", "왁싱"];
	var cook = ["구기스포츠", "라켓스포츠", "수영"];
	var travel = ["실무", "제테크", "자격증"];
	var growth = ["패션", "악세사리", "가구"];
	var it = ["토론", "어학", "발표"];
	var fashion = ["굿즈", "투잡", "제테크"];
	var create = ["문학", "음악", "팬픽"];
	var culture = ["홈페이지", "어플리케이션", "프로그래밍 언어"];
	
	var mainCategoryName = document.getElementById("mainCategoryName");
	var subCategoryName = document.getElementById("subCategoryName");
	
	var selectedCategory = mainCategoryName.value;
	
	subCategoryName.innerHTML = "";
	
	// 선택한 대분류에 따라 소분류 설정
    switch (selectedCategory) {
    case "art":
        categoryDropdown(cook);
        break;
    case "sports":
    	categoryDropdown(beauty);
        break;
    case "cook":
    	categoryDropdown(sports);
        break;
    case "travel":
    	categoryDropdown(selfDevelopement);
        break;
    case "growth":
    	categoryDropdown(design);
        break;
    case "it":
    	categoryDropdown(communication);
        break;
    case "fashion":
    	categoryDropdown(business);
        break;
    case "create":
    	categoryDropdown(create);
        break;
    case "culture":
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
<table>
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
</table>



  
<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />