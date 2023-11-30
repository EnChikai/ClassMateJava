<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <style type="text/css">
       ul {
  list-style-type: none;
  padding: 0px;
  margin-left: 360px;
  width: 200px;
  height: 100%;
  overflow: auto;
  position: fixed;
}

li a {
  text-decoration: none;
  padding: 10px;
  display: block;
  color: #000;
  font-weight: bold;
}

li div:hover {
  background: #333;
  color: #fff;
}


.cd1 {
  display: grid;
  align-items: center;
  justify-content: center; 
  margin-top: 50px;

}

.all {
	display: inline-block;
}

.result {
	min-height: 700px;
}
	
</style>

  <ul>
  <li class="border" style="margin-top: 100px;">
  <img alt="강사 이미지" src="/upload/${teacherImg}" width="130" height="150">
  <a>${userName} 강사님</a></li>
  <li>클래스 관리</a></li>
  <li><a href="/teacher/regist">클래스 등록</a></li>
  <li><a href="/teacher/check">클래스 조회</a></li>
  <li><a href="/teacher/answer">질문답변 조회</a></li>
  <li><a href="/teacher/payDetail">정산 내역</a></li>
</ul>

