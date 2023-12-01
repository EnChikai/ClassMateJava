<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <style type="text/css">
       #side {
  list-style-type: none;
  padding: 0px;
  margin-left: 360px;
  width: 180px;
  height: 100%;
  overflow: auto;
  position: fixed;
}

.sideLi a {
  text-decoration: none;
  padding: 10px;
  display: block;
  color: #000;
}

.sideLi a:hover {
  background: #333;
  color: #fff;
}


.cd1 {
  display: grid;
  align-items: center;
  justify-content: center; 
  margin-top: 50px;
  
  

}

#all {
	margin-left: 600px;
	margin-bottom: 10px;
}

.result {
	min-height: 700px;
}
	
#sideLi1 {
	border-left: 1px #d2d2d2 solid;
	border-top-left-radius: 10px;
	border-right: 1px #d2d2d2 solid;
	border-top-right-radius: 10px;
	border-top: 1px #d2d2d2 solid;
	margin-top: 10px;
	font-weight: bold;
}	

#sideLi2 {
	border-left: 1px #d2d2d2 solid;
	border-right: 1px #d2d2d2 solid;
}	

#sideLi3 {
	border-left: 1px #d2d2d2 solid;
	border-right: 1px #d2d2d2 solid;
	margin-top: -10px;
}	

#sideLi4 {
	border-left: 1px #d2d2d2 solid;
	border-right: 1px #d2d2d2 solid;
	margin-top: -10px;
}	

#sideLi5 {
	border-left: 1px #d2d2d2 solid;
	border-bottom-left-radius: 10px;
	border-right: 1px #d2d2d2 solid;
	border-bottom-right-radius: 10px;
	border-bottom: 1px #d2d2d2 solid;
	margin-top: -10px;
	margin-bottom: 10px;
}	

</style>

  <ul id="side" style="">
  <li class="sideLi" style="margin-top: 50px; border:1px #d2d2d2 solid; border-radius: 10px;">
  <img alt="강사 이미지" src="/upload/${teacherImg}" width="140" height="160" style="margin-left: 20px; margin-top: 20px; margin-bottom: 10px;  border-radius: 1px;">
  <div style="text-align: center; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; background-color: #d2d2d2"><a>${userName} 강사님</a></div></li>
  <li class="sideLi" id="sideLi1">클래스 관리</a></li>
  <li class="sideLi" id="sideLi2"><a href="/teacher/regist">클래스 등록</a></li>
  <li class="sideLi" id="sideLi3"><a href="/teacher/check">클래스 조회</a></li>
  <li class="sideLi" id="sideLi4"><a href="/teacher/answer">질문답변 조회</a></li>
  <li class="sideLi" id="sideLi5"><a href="/teacher/payDetail">정산 내역</a></li>
</ul>

