<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#freeViewTb {
   border-collapse: collapse;
   border-color: lightgrey;
   width: 60%;
   margin-left:auto; 
   margin-right:auto;
}


#tdHead {
   height: 260px;
   padding-left: 140px;
   padding-top: 70px;
   border-bottom-color: #505050;
}

#tdHeadS1 {
   display: inline-block;
   width: 600px;
   color: #505050;
   font-size: 17px;
}

#tdHeadS2 {
   display: inline-block;
   width: 530px;
}

.tdHeadS {
   color: #808080;
}

#tdHeadH1 {
   margin-top: 3px;
   margin-bottom: 25px;
}

#tdBody {
   height: 650px;;
   margin: 0 auto;
   padding-left: 150px;
   padding-right: 150px;
   text-align: center;
   border-bottom-color: #505050;
}

#tdFoot {
   height: 100px;;
   margin-bottom: 0;
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

#freefile {
   margin-right: 10px;
}

#contentFile {
   width: 500px;
   height: 30px;
   margin: 0 auto;
   line-height: 1.8;
}

</style>

<tbody>


<div id="freeviewAll">

<table id="freeViewTb" border="1">
   <tr>
      <td id="tdHead">
         <span id="tdHeadS1">자유게시판 < </span>
         <span class="tdHeadS">조회 수 &nbsp:&nbsp ${viewFree.freeHit} </span>
         
         <h1 id="tdHeadH1">${viewFree.freeName }</h1>
         
         <span id="tdHeadS2">작성자 &nbsp:&nbsp ${viewFree.userName }</span>
         <span class="tdHeadS">등록일 &nbsp:&nbsp ${viewFree.freeDate }</span>
      </td>
   </tr>
   
   <tr>
      <td id="tdBody">${viewFree.freeContent }<br>
         <c:if test="${not empty freeBoardFile }">
            <div id="contentFile" style="height: auto; padding: 10px;    border: 1px solid lightgrey;">
               <c:forEach var="freeBoardFile" items="${freeBoardFile}">
                  <img id="freefile" alt="freefile" src="/resources/img/file.png" width="22" height="19">
                  <a href="./download?fileNo=${freeBoardFile.fileNo }"><span id="contentFileSpan"> : ${freeBoardFile.originName }</span></a><br>
               </c:forEach>
            </div>
         </c:if>
      </td>
   </tr>
      
   <tr>   
      <td id="tdFoot">
         <button id="viewBt1" type="button" onclick="location.href='./board'">목록</button>
         <a href="./delete?freeNo=${viewFree.freeNo }"><button id="viewBt3" type="button">삭제</button></a>
         <button id="viewBt2" type="button" onclick="location.href='./freeUpdate?freeNo=${viewFree.freeNo}'">수정</button>
      </td>
   </tr>
</table>

</div> <!-- #freeviewAll -->

</tbody>

<div style="height: -100px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />