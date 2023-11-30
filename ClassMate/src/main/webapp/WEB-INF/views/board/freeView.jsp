<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#freeViewTb {
   border-collapse: collapse;
   border-color: lightgrey;
   width: 50%;
   margin-left:auto; 
   margin-right:auto;
}


#tdHead {
   text-align: justify;
   height: 150px;
   padding-top: 50px;
   padding-bottom: 10px;
   border-bottom-color: #505050;
}

#tdHeadS1 {
   padding-left: 170px;
   display: inline-block;
   width: 570px;
   color: #505050;
   font-size: 17px;
}

#tdHeadS2 {
   padding-left: 170px;
   display: inline-block;
   width: 510px;
}

.tdHeadS {
   color: #808080;
   width: 200px;
}

#tdHeadH1 {
   width: 1000px;
   margin-left: 170px;
   margin-top: 3px;
   margin-bottom: 20px;
   text-align: justify;
}

#tdBody {
     height: 650px;;
   margin: 0 auto;
   padding: 70px 150px 70px 150px;
     text-align: center;
}

#contentFileSpan {
   vertical-align: text-bottom;
}

#tdComment2 {
     border-bottom-color: #505050;
}

#freeCommentHead {
   padding: 13px;
   height: 25px;
   margin-left: 80px;
}

#freeCommentBody {
   padding: 25px;
   height: auto;
   margin-left: 80px;
}

#freeCommentFoot {
   padding: 15px;
   height: 30px;
   text-align: center;
   margin-bottom: 40px;
}

#freeCommentContent {
   width: 450px;
   height: 30px;
   padding-left: 5px;
   border-radius: 3px;
   border: 1px solid;
   font-size: 15px;
}

#freeCommentButton {
   width: 70px;
   height: 32px;
   font-size: 15px;
   background-color: white;
   border: 1.5px solid;
   border-radius: 3px;
   cursor: pointer;
}

#tdFoot {
   height: 100px;;
   margin-bottom: 0;
}

#freefile {
   margin-right: 10px;
}

#contentFile {
   width: 500px;
   height: 30px;
   margin: 0 auto;
   line-height: 1.8;
   padding: 15px;
   margin-top: 30px;
}

#viewBt1 {
   width: 73px;
   height:35px;
   margin-left:20px;
   border: none;
   border-radius: 3px;
   font-size: 15px;
   color: white;
   background-color: black;
   cursor: pointer;
   float: left;
}

#viewBt2 {
   width: 73px;
   height:35px;
   margin-right: 10px;
   border: none;
   border-radius: 3px;
   font-size: 15px;
   color: white;
   background-color: rgb(241, 196, 15);
   cursor: pointer;
   float: right;
}

#viewBt3 {
   width: 73px;
   height:35px;
   margin-right: 10px;
   border: none;
   border-radius: 3px;
   font-size: 15px;
   color: white;
   background-color: #ff7f00;
   cursor: pointer;
   float: right;
}

#viewBt4 {
   width: 73px;
   height:35px;
   margin-right: 10px;
   border: none;
   border-radius: 3px;
   font-size: 15px;
   color: white;
   background-color: black;
   cursor: pointer;
   float: right;
}

#commentFreeDiv {
   height: 70px;
}

#freeCommentDate {
   color: gray;
}

#freeCommentName {
   vertical-align: top;
}

#freeCommentComment2 {
   margin-left: -4px;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        // 페이지 로드 시 댓글 목록 불러오기
        loadCommentList();

        // 댓글 입력
        $("#freeCommentContent").keypress(function (e) {
            if (e.which === 13) {
                submitComment();
            }
        });

        $("#freeCommentButton").click(function () {
            var userId = "${sessionScope.userId}";
            if (userId == null || userId.trim() === "") {
                alert("로그인이 필요합니다.");
                window.location.href = "/user/login"; // 로그인 페이지로 이동
                return;
            }
            submitComment();
        });

        // 댓글 목록을 동적으로 생성하여 출력
        function renderCommentList(comments) {
            var commentListElement = $('#commentList');

            $.each(comments, function (index, comment) {
                var commentHtml = createCommentHtml(comment);
                commentListElement.append(commentHtml);
            });
        }

        // 댓글 목록을 동적으로 생성하여 출력
        function renderCommentList1(comments) {
            var commentListElement = $('#commentList1');

            $.each(comments, function (index, comment) {
                var commentHtml = createCommentHtml(comment);
                commentListElement.append(commentHtml);
            });
        }
        
        // 댓글 HTML 생성
        function createCommentHtml(comment) {
            var formattedDate = moment(comment.freeCommentDate, "YYYY-MM-DD HH:mm:ss.SSSSSS").format("YYYY-MM-DD HH:mm:ss");
            var commentHtml = '<div id="commentFreeDiv" style="color:#464646;">';
            commentHtml += '<span> <img id="freeCommentfile" alt="freefile" src="/resources/img/usercomment.png" width="20" height="20"> </span>';
            commentHtml += '<span id="freeCommentName"> ' + comment.userName + '</span>';
            commentHtml += '<span id="freeCommentDate"><small style="vertical-align: top;"> &nbsp &nbsp' + formattedDate + ' </small></span>';

            var currentUserNo = "${sessionScope.userNo}";
            if (currentUserNo == comment.userNo) {
                commentHtml += '<p class="freeCommentDeleteBtn" data-comment-no="' + comment.freeCommentNo + '" style="cursor: pointer; color: red; font-size: 12px; margin-left: 8px; vertical-align: text-top; display:inline-block;">삭제</p>';
            }
            commentHtml += '<p style="display: none;"> ' + comment.userNo + ' </p>';

            commentHtml += '<p id="freeCommentComment2">&nbsp &nbsp &nbsp &nbsp' + comment.freeCommentContent + '</p>';
            commentHtml += '</div>';
            return commentHtml;
        }

        // 댓글 등록
        function submitComment() {
            var formData = {
                freeNo: ${viewFree.freeNo},
                freeCommentContent: $("#freeCommentContent").val(),
            };

            $.ajax({
                type: "POST",
                url: "/board/freeView",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data: formData,
                success: function (comment) {
                    console.log("댓글 등록 성공", comment);
                    renderCommentList([comment]); // 등록 후 댓글 목록을 다시 불러와서 갱신
                    $("#freeCommentContent").val("");
                },
                error: function (error) {
                    console.error("댓글 등록 실패", error);
                }
            });
        }

        // 댓글 목록 불러오기
        function loadCommentList() {
            var commentData = {
                freeNo: ${viewFree.freeNo},
            };

            $.ajax({
                type: "GET",
                url: "/board/freeView/comments",
                dataType: "json",
                data: commentData,
                encode: true,
                success: function (comments) {
                    console.log("댓글 목록 불러오기 성공", comments);
                    
                    renderCommentList(comments);
                },
                error: function (error) {
                    console.error("댓글 목록 불러오기 실패", error);
                }
            });
        }

        // 댓글 삭제 버튼 클릭 이벤트 처리
        $('#commentList').on('click', '.freeCommentDeleteBtn', function () {
            var freeCommentNo = $(this).data('comment-no');

            // 서버에 댓글 삭제 요청을 보냅니다.
            deleteComment(freeCommentNo);
        });

        // 댓글 삭제 요청
        function deleteComment(freeCommentNo) {
            var commentData = {
                    freeNo: ${viewFree.freeNo},
                    freeCommentNo: freeCommentNo
                };
            $.ajax({
                type: 'POST',
                url: '/board/freeView/deleteComment',
                data: commentData,
                success: function (comments) {
                    console.log('댓글 삭제 성공');
                    // 삭제가 성공하면 해당 댓글을 화면에서 제거합니다.
                    $('#commentFreeDiv' + freeCommentNo).remove();
                    console.log('너만 오면 돼', freeCommentNo);
                    renderCommentList1(comments);
                },
                error: function (error) {
                    console.error('댓글 삭제 실패', error);
                }
            });
        }
    });
</script>



<tbody>


<div id="freeviewAll">

<table id="freeViewTb" border="1">
   <tr>
      <td id="tdHead">
      
     <div style="width: 1000px; margin: 0 auto;">
      <div>
         <span id="tdHeadS1">자유게시판 < </span>
         <span class="tdHeadS">조회 수 &nbsp:&nbsp ${viewFree.freeHit} </span>
      </div>
         
         <h1 id="tdHeadH1">${viewFree.freeName }</h1>
         
      <div style="width: 1000px; margin: 0 auto;">   
         <span id="tdHeadS2">작성자 &nbsp:&nbsp ${viewFree.userName }</span>
         <span class="tdHeadS">등록일 &nbsp:&nbsp ${viewFree.freeDate }</span>
      </div>
     </div> 
         
      </td>
   </tr>
   
   <tr>
      <td id="tdBody">${viewFree.freeContent }<br>
         <c:if test="${not empty freeBoardFile }">
            <div id="contentFile" style="height: auto;  border: 1px solid lightgrey;">
               <c:forEach var="freeBoardFile" items="${freeBoardFile}">
                  <img id="freefile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
                  <a href="./download?fileNo=${freeBoardFile.fileNo }"><span id="contentFileSpan"> : ${freeBoardFile.originName }</span></a><br>
               </c:forEach>
            </div>
         </c:if>
      </td>
   </tr>
      
   <tr id="tdComment">
      <td>
         <div id="freeCommentHead">
            <img id="comment" alt="comment" src="/resources/img/comment.png" width="22" height="22">
            <span style="vertical-align: top; display: inline-block; font-size: 17px; font-weight: bold;">댓글</span>
         </div>
      </td>
   </tr>
   
   <tr id="tdComment2"> 
         <td>     
         <div id="freeCommentBody">
          <div id="renderCommentList"></div>
          <div id="renderCommentList1"></div>
          <div id="commentList"></div>
         </div>
         
      <div id="freeCommentFoot">
         <label for="freeCommentContent">
            <input type="text" id="freeCommentContent" name="freeCommentContent" placeholder="댓글을 입력하세요" >
            <!-- <input type="button" id="freeCommentButton" name="freeCommentButton" value="등록"> -->
            <button id="freeCommentButton" name="freeCommentButton">등록</button>
         </label>
      </div>
      </td>
   </tr>
      
   <tr>
     <td id="tdFoot">
     
     <c:if test="${not empty sessionScope.userId and sessionScope.userNo eq viewFree.userNo}">  
         <button id="viewBt1" type="button" onclick="location.href='./board'">목록</button>
         <a href="./delete?freeNo=${viewFree.freeNo }"><button id="viewBt3" type="button">삭제</button></a>
         <button id="viewBt2" type="button" onclick="location.href='./freeUpdate?freeNo=${viewFree.freeNo}'">수정</button>
     </c:if>
        
     <c:if test="${empty sessionScope.userId or sessionScope.userNo ne viewFree.userNo}">  
         <button id="viewBt4" type="button" onclick="location.href='./board'">목록</button>
     </c:if>
     </td>
   </tr>
   
</table>

</div> <!-- #freeviewAll -->
</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />