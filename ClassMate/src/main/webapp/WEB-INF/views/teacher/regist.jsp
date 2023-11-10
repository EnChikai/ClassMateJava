<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />

<script type="text/javascript"> 

function categoryUchange(z) {
	
	var cook = ["양식", "한식", "밀키트"];
	var beauty = ["헤어", "메이크업", "왁싱"];
	var sports = ["구기스포츠", "라켓스포츠", "수영"];
	var selfDevelopement = ["실무", "제테크", "자격증"];
	var design = ["패션", "악세사리", "가구"];
	var communication = ["토론", "어학", "발표"];
	var business = ["굿즈", "투잡", "제테크"];
	var create = ["문학", "음악", "팬픽"];
	var it = ["홈페이지", "어플리케이션", "프로그래밍 언어"];
	var target = document.getElementById("categoryD");

	if(z.value == a) var y = cook;
	else if(z.value == b) var y = beauty;
	else if(z.value == c) var y = sports;
	else if(z.value == d) var y = selfDevelopement;
	else if(z.value == e) var y = design;
	else if(z.value == f) var y = communication;
	else if(z.value == g) var y = business;
	else if(z.value == h) var y = create;
	else if(z.value == i) var y = it;
	
	target.options.length = 0;
	
	for (x in y) {
		var opt = document.createElement("option");
		opt.value = y[x];
		opt.innerHTML = y[x];
		target.appendChild(opt);
		
	}
	
}

</script>

<div class="center-box">
<div class="title">
<h3 style="display: inline-block;">ON/OFF클래스 상세 조회</h3>
<div id= "all"><select name="claaCheck" id="classCHeck">
  <option>on클래스</option>
  <option>off클래스</option>
</select></div>
</div>
<hr>

<form action="/teacher/regist" method="post">
<div style="width: 70px; height: 70px; background-color: red; margin-top: 10px;">사진</div>

<table class="table table-bordered">

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
	<select class="categoryControll" name="categoryU" id="categoryU">
  	<option>대분류</option>
	<option value="a">요리</option>
	<option value="b">뷰티</option>
	<option value="c">스포츠</option>
	<option value="d">자기개발</option>
	<option value="e">디자인</option>
	<option value="f">커뮤니케이션</option>
	<option value="g">비즈니스</option>
	<option value="h">창작</option>
	<option value="i">IT</option>
	</select>
	>
	<select class="categoryControll" name="categoryD" id="categoryD">
	<option>선택해주세요</option>
	</select>
	</td>
</tr>
<tr>
	<td class="table-info">클래스명</td><td><input type="text" name="className" id="className"></td>
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

<tr>
	<td colspan="2">${adress.adressNo }</td>
</tr>
</table> 

<button>목록</button>
<button>취소</button>
</form>


<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />