<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}

.siteP{
	margin-left: 100px;
	margin-right: 100px;
	font-size: 17px;
}

.start{
	background-color: #F0C610;
	display: inline-block;
	padding: 15px;
	border-radius:5% 5% 5% 5%;
}

</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

	<div style="text-align: center; border: 1px solid gray; margin-left: 100px; margin-right: 100px;">
		<h1 style="background: black; color: white;">ClassMate 소개</h1>
		<img src="/resources/img/site.png">
	</div>
	<br>
	<p class="siteP"><strong>ClassMate</strong>는 다양한 분야의 온라인 강의와 오프라인 모임을 손쉽게 찾아볼 수 있는 통합 플랫폼입니다.
	현대 사회에서 다양한 개성과 관심사를 가진 사람들을 위한 공간으로, 여러분의 학습과 소통을 더욱 풍부하고 편리하게 만들어냅니다.</p>
	<br>
	<p class="siteP"><strong>1. 다양한 카테고리와 주제별 분류</strong></p>
	<p class="siteP">예술, 프로그래밍, 운동, 요리 등 다양한 주제와 관심사에 따라 카테고리가 구성되어 있어, 여러분의 개성에 맞는 강의와 모임을 쉽게 찾을 수 있습니다.</p>
	<br>
	<p class="siteP"><strong>2. 간편한 회원 서비스</strong></p>
	<p class="siteP">로그인, 회원가입, 마이페이지 등의 서비스를 통해 여러분의 학습 이력을 관리하고, 다양한 소셜 로그인 옵션을 통해 편리하게 가입할 수 있습니다.</p>
	<br>
	<p class="siteP"><strong>3. 효율적인 검색 기능</strong></p>
	<p class="siteP">메인 검색 기능을 통해 원하는 강의나 모임을 빠르게 찾을 수 있습니다. 더불어, 카테고리 검색을 활용하여 세부 분야까지 자세히 찾아볼 수 있습니다.</p>
	<br>
	<p class="siteP"><strong>4. 온라인 강의실과 강의 영상 제공</strong></p>
	<p class="siteP">ON클래스 강의실에서는 다양한 영상 강의를 시청하고, 질문과 답변을 통해 강사와 소통할 수 있습니다.</p>
	<br>
	<p class="siteP"><strong>5. 강사와 회원 간의 상호작용</strong></p>
	<p class="siteP">강사는 강의를 등록하고 관리할 수 있으며, 회원과의 소통을 통해 더 나은 학습 경험을 제공할 수 있습니다.</p>
	<br>
	<p class="siteP"><strong>6. 관리자 시스템 강화</strong></p>
	<p class="siteP">시스템을 체계적으로 관리하는 관리자 페이지를 통해 회원, 강사, 클래스, 게시판 등을 효과적으로 관리하고 사고를 미연에 방지할 수 있습니다.</p>
	<br><br>
	<p style="text-align: center; font-size: 20px;"><strong>ClassMate</strong>는 당신의 학습과 소통을 더 풍요롭게 만들기 위해 노력하고 있습니다.</p>
	<p style="text-align: center; font-size: 20px;">함께 <strong>ClassMate</strong>에서 새로운 학습과 소통의 세계를 경험해보세요!</p>
	<br><br>
	<div style="text-align: center;"><a href="/main/mainCategory" class="start"><strong>클래스 시작하기</strong></a></div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />