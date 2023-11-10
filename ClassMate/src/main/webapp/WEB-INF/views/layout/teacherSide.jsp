<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.total-box {
	margin-left: 18%;
  	margin-right: 18%;
	display: flex;
	width:64%;
	height: 700px;
}

.left-box  {
 	 width:20%;
  	 border-radius:0.5rem;
 	 justify-content: left;
 	 height: 600px;

}  

.Tpage {
	display: flex;
	margin-top: 75px;
	margin-bottom: 15px;
	font-size: 20px;
	
} 

.teach {
	display: flex;
	flex-direction : column;
	justify-content: center;
	align-items: center;
	 border-radius: 0.5rem;
	border: 1px solid black;

}

.photo {
	width: 150px;
	height:150px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: red;
	margin-top: 5px;
	
}

.name {
	width:100%;
	height: 50px;
	color: black;
	display: flex;
	border-bottom-left-radius: 0.5rem;
	border-bottom-right-radius: 0.5rem;
	background-color: gray;
	justify-content: center;
	align-items: center;
}

.empty {
	height: 40px;	
}

.Tclass {
	 border-radius: 0.5rem;
	border: 1px solid black;
	height: 300px;
	line-height: 1.8;
	
}

.center-box {
	margin-left: 70px;
	margin-top: 70px;
	width: 80%;
	height: 600px;

}

h1 {
	display: inline-block;
}

#all {
	display: inline-block;

}

.title {
	 display: flex;
  justify-content: space-between;
}

</style>
<div class="total-box">

<div class="left-box">

	<div class="Tpage">
	홈 > 강사페이지
	</div>

	<div class="teach">
		<div class="photo">
		사진
		</div>
		<div class = "name">
		코이시 강사님
		</div>
	</div>
	
	<div class= "empty">
	</div>
	
	<div class="Tclass">
		<ul>
			<li style="list-style-type: none; margin-top: 15px; font-size: x-large; font-weight: bold;">클래스 관리
				<ol style="list-style-type: disc; font-size: large; font-weight: normal;">
					<li>클래스 등록</li>
					<li>클래스 조회</li>
					<li>질문/답변 조회</li>
					<li>정산내역</li>				
				</ol>
			</li>
		</ul>
	</div>
</div>