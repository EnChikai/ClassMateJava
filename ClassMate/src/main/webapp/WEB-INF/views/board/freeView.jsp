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
	padding: 15px;
	height: 90px;
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

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    // ...

    // 댓글 입력
    $("#freeCommentButton").click(function () {
        var formData = {
            freeNo: ${viewFree.freeNo},
            freeCommentContent: $("#freeCommentContent").val(),
        };

        $.ajax({
            type: "POST",
            url: "/board/freeView",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (comment) {
                console.log("댓글 등록 성공", comment);
                // 등록 후 댓글 목록을 다시 불러와서 갱신
                renderCommentList(comment);
            },
            error: function (error) {
                console.error("댓글 등록 실패", error);
            }
        });
    });

    // 댓글 목록을 동적으로 생성하여 출력
    function renderCommentList(comments) {
        var commentListElement = $('#commentList');
        commentListElement.empty(); // 기존에 출력된 내용 초기화

        $.each(comments, function (index, comment) {
            var commentHtml = '<div>';
            commentHtml += '<p>댓글 번호: ' + comment.freeCommentNo + '</p>';
            commentHtml += '<p>이름: ' + comment.userName + '</p>';
            commentHtml += '<p>내용: ' + comment.freeCommentContent + '</p>';
            commentHtml += '<p>작성일: ' + comment.freeCommentDate + '</p>';
            commentHtml += '</div>';

            // 댓글을 목록에 추가
            commentListElement.append(commentHtml);
        });
    }

    // ...
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
      		<span style="display: inline-block; font-size: 16px;">이름 : </span>
      		<span style="display: inline-block; font-size: 16px;">내용 : </span>
      		<span style="display: inline-block; font-size: 16px;">작성일 : </span>
				<div id="commentList"></div> <!-- 댓글 목록을 출력할 영역 -->
      	</div>
      	
		<div id="freeCommentFoot">
			<label for="freeComment">
				<input type="text" id="freeCommentContent" name="freeCommentContent" placeholder="댓글을 입력하세요">
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