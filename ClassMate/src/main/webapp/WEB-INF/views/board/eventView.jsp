<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#eventViewTb {
   border-collapse: collapse;
   border-color: lightgrey;
   width: 56%;
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
	padding-left: 52px;
	display: inline-block;
	width: 811px;
	color: #505050;
	font-size: 17px;
}

#tdHeadS2 {
	padding-left: 52px;
	display: inline-block;
	width: 750px;
}

.tdHeadS {
   color: #808080;
   width: 200px;
}

#tdHeadH1 {
	width: 1000px;
	margin-left: 50px;
	margin-top: 3px;
	margin-bottom: 20px;
	text-align: justify;
}

#tdBody {
  	height: 650px;;
	margin: 0 auto;
	padding: 70px 150px 70px 150px;
  	text-align: center;
  	border-bottom-color: #505050;
}

#contentFileSpan {
	vertical-align: text-bottom;
}

#tdFoot {
   height: 100px;;
   margin-bottom: 0;
}

#viewBt1 {
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

#eventfile {
   margin-right: 10px;
}

#contentFile {
   width: 500px;
   height: 30px;
   margin: 0 auto;
   line-height: 1.8;
   margin-top: 30px;
}

</style>

<script type="text/javascript">
    function getRandomColor() {
        var colors = ['#2E64FE', '#FF8000', '#FE2E9A', '#088A29'];
        return colors[Math.floor(Math.random() * colors.length)];
    }

    document.addEventListener("DOMContentLoaded", function () {
        var tdHeadH1 = document.getElementById("tdHeadH1");
        if (tdHeadH1) {
            tdHeadH1.style.color = getRandomColor();
        }
    });
</script>

<tbody>

<div id="eventviewAll">

<table id="eventViewTb" border="1">
   <tr>
      <td id="tdHead">
      
     <div style="width: 1000px; margin: 0 auto;">
      <div>
         <span id="tdHeadS1">이벤트게시판 < </span>
         <span class="tdHeadS">조회 수 &nbsp:&nbsp ${viewEvent.eventHit} </span>
      </div>
         
         <h1 id="tdHeadH1">${viewEvent.eventName }</h1>
         
      <div style="width: 1000px; margin: 0 auto;">   
         <span id="tdHeadS2">작성자 &nbsp:&nbsp ${viewEvent.userName }</span>
         <span class="tdHeadS">등록일 &nbsp:&nbsp ${viewEvent.eventDate }</span>
      </div>
     </div> 
         
      </td>
   </tr>
   
   <tr>
      <td id="tdBody">${viewEvent.eventContent }<br>
         <c:if test="${not empty eventBoardFile }">
            <div id="contentFile" style="height: auto; padding: 10px;    border: 1px solid lightgrey;">
               <c:forEach var="eventBoardFile" items="${eventBoardFile}">
                  <img id="eventfile" alt="eventfile" src="/resources/img/file.png" width="22" height="19">
                  <a href="./download?fileNo=${eventBoardFile.fileNo }"><span id="contentFileSpan"> : ${eventBoardFile.originName }</span></a><br>
               </c:forEach>
            </div>
         </c:if>
      </td>
   </tr>
      
   <tr>   
      <td id="tdFoot">
         <button id="viewBt1" type="button" onclick="location.href='./board'">목록</button>
      </td>
   </tr>
</table>

</div> <!-- #eventviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />