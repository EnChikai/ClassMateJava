<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingNow {
   border-radius: 4px; 
   color: black; 
   background-color: rgb(241,196,15); 
   border: 1px solid rgb(251,206,25);
   margin: 3.5px; 
   text-align: center;"

}

#pagingAfter,#pagingBefore {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;
}

</style>

<script>
function loadPage(pageNumber) {
    var selectedClassNo = $("#classNo").val();

    // Ajax 호출
    $.ajax({
        type: "POST",
        url: "/teacher/answer_ok",
        data: {
            classNo: selectedClassNo,
            curPage: pageNumber
        },
        dataType: "json",  // 응답 데이터 타입을 JSON으로 지정
        success: function (response) {
            // 서버에서 받은 데이터를 처리하는 부분
            console.log(response);

            // 여기에서 필요한 로직을 추가하면 됩니다.
            // 페이징 정보를 사용하여 페이징 렌더링 등의 작업 수행

            $("#result2").html(response.questionList);  // 질문/답변 목록을 렌더링하는 부분
        },
        error: function (error) {
            // 에러 발생 시 처리하는 부분
            console.error("Ajax request failed: ", error);
        }
    });
}
</script>


<div id="pagination">
    <ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">

        <!-- 이전 페이지로 이동 -->
        <c:if test="${paging.curPage > 1 }">
            <li style="width: 45px;">
                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${paging.curPage - 1 })" id="pagingBefore">&lt;</a>
            </li>
        </c:if>

        <!-- 페이징 번호 목록 -->
        <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
            <li class="page-item" style="width: 45px;">
                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${i })" id="pagingLink${i }">${i }</a>
            </li>
        </c:forEach>

        <!-- 다음 페이지로 이동 -->
        <c:if test="${paging.curPage < paging.totalPage }">
            <li class="page-item" style="width: 45px;">
                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${paging.curPage + 1 })" id="pagingAfter">&gt;</a>
            </li>
        </c:if>

    </ul>
</div>