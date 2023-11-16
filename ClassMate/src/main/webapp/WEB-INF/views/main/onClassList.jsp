<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#onClass").click(function () {
            $.ajax({
                type: "POST",
                url: "/main/onClassList",
                data: { subCategoryNo: "${subCategoryNo}" },
                dataType: "json",
                success: function (data) {
                    console.log("onClassList 성공", data);
                    displayClassList(data, "onClassList");
                    $("#onClassList").show();
                    $("#offClassList").hide();
                    $("#defaultOnClassList").hide();
                },
                error: function () {
                    console.log("onClassList 실패");
                }
            });
        });

        $("#offClass").click(function () {
            $.ajax({
                type: "GET",
                url: "/main/offClassList",
                data: { subCategoryNo: "${subCategoryNo}" },
                dataType: "json",
                success: function (data) {
                    console.log("offClassList 성공", data);
                    displayClassList(data, "offClassList");
                    $("#offClassList").show();
                    $("#onClassList").hide();
                    $("#defaultOnClassList").hide();
                },
                error: function () {
                    console.log("offClassList 실패");
                }
            });
        });

        // Ajax로 받아온 데이터를 HTML로 변환하여 화면에 표시하는 함수
        function displayClassList(data, containerId) {
            var container = $("#" + containerId);
            container.empty(); // 컨테이너 비우기

            // 받아온 데이터를 기반으로 동적으로 HTML 생성
            for (var i = 0; i < data.length; i++) {
                var c = data[i];
                if (c.deleteBoolean == 0) {
                    var html = '<h1>' + containerId + '</h1><br>' +
                        c.headImg + '<br>' +
                        '<h3>' + c.className + '</h3><br>' +
                        c.classInfo + '<br>' +
                        c.expense + '<br>' +
                        c.classStart + '<br>' +
                        c.classEnd + '<br>' +
                        c.maxCount + '<br>';

                    container.append(html); // 생성한 HTML을 컨테이너에 추가
                }
            }
        }
    });
</script>

<style type="text/css">
    .defaultWidth {
        margin-left: 400px;
        margin-right: 400px;
        margin-top: 56px;
        margin-bottom: 80px;
    }
    
    .page-link.active{

	background: rgb(250,224,120);
	border: 1px solid rgb(230,204,100);
	
}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth">
    <!-- 토글 버튼 -->
    <button id="onClass">ON 전체보기</button>
    <button id="offClass">OFF 전체보기</button>
<div class="dropdown" style="float: right;">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><button class="dropdown-item" href="#">Action</button></li>
    <li><button class="dropdown-item" href="#">Another action</button></li>
    <li><button class="dropdown-item" href="#">Something else here</button></li>
  </ul>
</div>

	<div id="defaultOnClassList">
		<c:forEach var="c" items="${onClassList}">
	    	<c:if test="${c.deleteBoolean == 0}">
		        <h1>onClassList</h1><br>
		        ${c.headImg }<br>
		        <h3>${c.className }</h3><br>
		        ${c.classInfo }<br>
		        ${c.expense }<br>
		        ${c.classStart }<br>
		        ${c.classEnd }<br>
		        ${c.maxCount }<br>
	    	</c:if>
	</c:forEach>
	</div>

	<div id="onClassList"></div>
    <div id="offClassList"></div>
    
      <div>
    	<ul class="pagination pagination-sm justify-content-center">
			<%-- 첫 페이지로 이동 --%>
			<c:if test="${paging.curPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?subCategoryNo=${subCategoryNo}">&larr; 처음</a>
			</li>
			</c:if>
			
			
			
			<%-- 이전 페이지 리스트로 이동 --%>
			<c:choose>
				<c:when test="${paging.startPage ne 1 }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.startPage - paging.pageCount }&subCategoryNo=${subCategoryNo}">&laquo;</a>
				</li>
				</c:when>
				<c:when test="${paging.startPage eq 1 }">
				<li class="page-item">
					<a class="page-link disabled">&laquo;</a>
				</li>
				</c:when>
			</c:choose>
			
			
			
			
			<%-- 이전 페이지로 이동 --%>
			<c:if test="${paging.curPage > 1 }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&subCategoryNo=${subCategoryNo}">&lt;</a>
				</li>
			</c:if>
			
			
			
		
			<%-- 페이징 번호 목록 --%>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
				<li class="page-item">
					<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&subCategoryNo=${subCategoryNo}">${i }</a>
				</li>
				</c:if>
				
				<c:if test="${paging.curPage ne i }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&subCategoryNo=${subCategoryNo}">${i }</a>
				</li>
				</c:if>
			</c:forEach>
			
			
			
			
			<%-- 다음 페이지로 이동 --%>
			<c:if test="${paging.curPage < paging.totalPage }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&subCategoryNo=${subCategoryNo}">&gt;</a>
				</li>
			</c:if>
			
			
			
			
			<%-- 다음 페이지 리스트로 이동 --%>
			<c:choose>
				<c:when test="${paging.endPage ne paging.totalPage }">
				<li class="page-item">
					<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.endPage + paging.pageCount }&subCategoryNo=${subCategoryNo}">&raquo;</a>
				</li>
				</c:when>
				<c:when test="${paging.endPage eq paging.totalPage }">
				<li class="page-item">
					<a class="page-link disabled">&raquo;</a>
				</li>
				</c:when>
			</c:choose>
	
			
			
			
			<%-- 끝 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.totalPage }&subCategoryNo=${subCategoryNo}">끝 &rarr;</a>
			</li>
			</c:if>
		
		</ul>
    </div>
	
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
