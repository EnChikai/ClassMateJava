<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">

.defaultWidth{
   margin-left: 495px;
   margin-right: 495px;
   margin-top: 60px;
}

#questionTitle, #generalQuestionTitle {
   margin-top: 2em;
   border: 1px;
   width: 910px;
   height: 50px;
   font-size: 150%;
   text-align: center;
   margin: 0 auto;
}

#questionTitleh2, #generalQuestionTitleh2 {
   padding-top: 25px;
   font-weight: bold;
}

#questiontb {
   text-align: center;
   margin: 0 auto;
   margin-top: 25px;
   vertical-align: middle;
   width: 910px;
}

#questionToptr {
   height: 40px;
   font-size: 15px;;
}

#question {
   height: 40px;
   font-size: 14px;
}


#questionWritebt {
   margin-top: 15px;;
   margin-right: 15px;
   width: 70px;
   height: 35px;
   background-color: black;
   color: white;
   border-radius: 4px;
}

#questionPaging1 {
   background-color: rgb(241, 196, 15); 
   border-color: rgb(241, 196, 15); 
   border-radius: 4px;
   margin: 3.5px;
   text-align: center;"
}

#questionPaging2 {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border-color: #f1f3f5; 
   margin: 3.5px; 
   text-align: center;"
}

#questionPaging3,#questionPaging4,#questionPaging5,#questionPaging6 {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border-color: #f1f3f5; 
   margin: 3.5px; 
   text-align: center;"
}

#questionDivOut {
   width:910px;
   margin: 0 auto;
}

</style>



<div class="defaultWidth" >

   <div id="questionDivOut">
      <div id="questionTitle">
      <h2 id="questionTitleh2">1:1 문의내역
         <button id="qWrite" type="button" onclick="location.href='./questionWrite'">문의등록</button>
      </h2>
      </div><!-- #questionTitle -->
   
      <div id="questionAllTb">
         <table class="table table-bordered" id="questiontb">
            <tr class="table-warning" id="questionToptr">
               <th>번호</th>
               <th width="90px;">분류</th>
               <th>문의내용</th>
               <th>작성자</th>
               <th>등록일</th>
               <th>확인여부</th>
            </tr>
               
         <c:forEach var="questionList" items="${questionList }">
            <tr id="question">
               <td>${questionList.questionNo }</td>
               <td>${questionList.questionHead }</td>
               <td><a href="/board/freeView?freeNo=${questionList.questionNo }">${questionList.questionName }</a></td>
               <td>${questionList.userName }</td>
               <td>${questionList.questionDate }</td>
               <td>${questionList.questionHit }</td>
            </tr>
         </c:forEach>
         </table>
      </div><!-- #questionAllTb -->
         
      <div id="generalQuestionTitle">
         <h2 id="generalQuestionTitleh2">자주 묻는 질문 Q&A</h2>
      </div><!-- #questionTitle -->
   
         <table class="table table-bordered" id="generalQuestiontb">
            <tr class="table-warning" id="generalQuestionToptr">
               <th>번호</th>
               <th width="90px;">분류</th>
               <th>문의내용</th>
               <th>작성자</th>
               <th>등록일</th>
            </tr>
               
            <tr class="generalQuestion">
               <td>3</td>
               <td>결재</td>
               <td>무통장 입금 시 어떻게 진행해야할까요?</td>
               <td>관리자</td>
               <td>2023.05.23</td>
            </tr>
   
            <tr class="generalQuestion">
               <td>2</td>
               <td>계정</td>
               <td>비밀번호를 변경하고 싶어요.</td>
               <td>관리자</td>
               <td>2023.05.20</td>
            </tr>
            
            <tr class="generalQuestion">
               <td>1</td>
               <td>클래스</td>
               <td>클래스와 강사정보관련 신고 조치는 어떻게 되나요?</td>
               <td>관리자</td>
               <td>2023.05.19</td>
            </tr>
         </table>
   
   </div><!-- #questionDivOut -->


   <div id="questionPagination">
      <ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
      
         <!-- 이전 페이지로 이동 -->
         <c:if test="${paging.curPage > 1 }">
             <li style="width: 45px;">
                 <a class="page-link" href="./question?curPage=${paging.curPage - 1 }" id="questionPaging6">&lt;</a>
             </li>
         </c:if>
               
         <!-- 페이징 번호 목록 -->
         <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
            <li class="page-item" style="width: 45px;">
               <a class="page-link active" href="./question?curPage=${i }" id="questionPaging1">${i }</a>
            </li>
            </c:if>
            <c:if test="${paging.curPage ne i }">
            <li class="page-item" style="width: 45px;">
               <a class="page-link" href="./question?curPage=${i }" id="questionPaging2">${i }</a>
            </li>
            </c:if>
         </c:forEach>
         
         <!-- 다음 페이지로 이동 -->
         <c:if test="${paging.curPage < paging.totalPage }">
             <li class="page-item" style="width: 45px;">
                 <a class="page-link" href="./question?curPage=${paging.curPage + 1 }" id="questionPaging3">&gt;</a>
             </li>
         </c:if>
         
      </ul>
   </div><!--#questionPagination -->

</div><!-- defaultWidth -->



<c:import url="/WEB-INF/views/layout/footer.jsp" />
