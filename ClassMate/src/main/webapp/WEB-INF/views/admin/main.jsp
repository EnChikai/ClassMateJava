<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<%-- <% ============================================================================= %> --%>

<style type="text/css">

#profile{
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin-right: 33px;
margin-left: 580px;
margin-top: 30px;

}

#userCount{
width:550px;
height: 250px;
float: left;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin: 0;
margin-left: 33px;
margin-top: 30px;

}

#classCount{
width:300px;
height: 300px;
float: left;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin: 0;
margin-top: 20px;
float: left;

}

#paymentCount{
border: 1px solid #ccc;
width: 470px;
height: 300px;
float: left;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin: 0;
margin-left: 20px;
margin-top: 20px;
float: left;


}

.profileTh, .profileTd{
border: 1px solid #ccc;
border-collapse:collapse;    
padding: 0;
text-align: center;

}

#helloAdmin{
background: rgb(224,224,224) 
}

#img{
margin-right: 40px;
margin-left: 40px;
}

#logout{
margin-top: 10px; 
margin-bottom: 10px; 
}

#logoutText:hover:not(.active){
	cursor:pointer
}

</style>

<script type="text/javascript">

$(function(){
	
	$("#logoutText").click(function(){
		$("#logoutForm").submit();
	})
	
}); 

</script>

<script type="text/javascript">
    window.onload = function () {
        // ==========유저 그래프 데이터 정의==========
        let userCount = ${userCount};
        let teacherCount = ${teacherUserCount};
        	userCount = userCount - teacherCount;
        let secessionUserCount = ${secessionUserCount};
        let userSum = userCount + teacherCount + secessionUserCount;

        var userData = {
            labels: ['일반유저', '강사유저', '탈퇴유저', '합계'],
            datasets: [{
                label: '사용자 그래프',
                data: [userCount, teacherCount, secessionUserCount, userSum],
                backgroundColor: ['rgba(251,206,25,1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(75, 192, 192, 1)'],
            }]
        };

        // 그래프 옵션 정의
        var userOptions = {
       		maintainAspectRatio: false, // 종횡비 조절 비활성화
            responsive: true, // 반응형 크기 조절 활성화
            width: 500, // 그래프의 너비
            height: 300, // 그래프의 높이
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        };

        // 캔버스에 유저 그래프 그리기
        var userCtx = document.getElementById('userChart').getContext('2d');
     	// 캔버스 너비 조절
        userCtx.canvas.width = 400; // 조절하고자 하는 너비 값
        var userChart = new Chart(userCtx, {
            type: 'bar',
            data: userData,
            options: userOptions
        });

        // ==========클래스 그래프 데이터 정의==========
        let onClassCount = ${onClassCount};
        let offClassCount = ${offClassCount};
        let classSum = onClassCount + offClassCount;

        var classData = {
            labels: ['온클래스', '오프클래스', '합계'],
            datasets: [{
                label: '클래스 그래프',
                data: [onClassCount, offClassCount, classSum],
                backgroundColor: ['rgba(251,206,25,1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
            }]
        };

        // 그래프 옵션 정의
        var classOptions = {
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        };

        // 캔버스에 클래스 그래프 그리기
        var classCtx = document.getElementById('classChart').getContext('2d');
        var classChart = new Chart(classCtx, {
            type: 'doughnut',
            data: classData,
            options: classOptions
        });
        
     // ==========정산 그래프 데이터 정의==========
        let payment1 = ${paymentList.get(0) != null ? paymentList.get(0) : 0};
        let payment2 = ${paymentList.get(1) != null ? paymentList.get(1) : 0};
        let payment3 = ${paymentList.get(2) != null ? paymentList.get(2) : 0};
        let payment4 = ${paymentList.get(3) != null ? paymentList.get(3) : 0};
        
        let month1 = '${payDateList.get(0) != null ? payDateList.get(0) : 0}'
        let month2 = '${payDateList.get(1) != null ? payDateList.get(1) : 0}'
        let month3 = '${payDateList.get(2) != null ? payDateList.get(2) : 0}'
        let month4 = '${payDateList.get(3) != null ? payDateList.get(3) : 0}'
        
        

        var paymentData = {
            labels: [month4, month3, month2, month1],
            datasets: [{
                label: '정산 그래프',
                data: [payment4, payment3, payment2, payment1],
                backgroundColor: ['rgba(251,206,25,1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(75, 192, 192, 1)'],
            }]
        };

        // 그래프 옵션 정의
        var paymentOptions = {
            maintainAspectRatio: false, // 종횡비 조절 비활성화
            responsive: true, // 반응형 크기 조절 활성화
            width: 500, // 그래프의 너비
            height: 300, // 그래프의 높이
            indexAxis: 'x',
            scales: {
                x: {
                    beginAtZero: true
                }
            }
        };

        // 캔버스에 유저 그래프 그리기
        var userCtx = document.getElementById('paymentChart').getContext('2d');
        // 캔버스 너비 조절
        userCtx.canvas.width = 400; // 조절하고자 하는 너비 값
        var paymentChart = new Chart(userCtx, {
            type: 'line',
            data: paymentData,
            options: paymentOptions
        });
    };
</script>
<%-- <% ============================================================================= %> --%>
<div style="text-align: center; width: 820px; margin-left: 20px; margin-bottom: 20px; margin-top: 20px; height: 600px;">

<!-- 그래프를 그릴 캔버스 요소 추가 -->


<div id="userCount" style="float: left; margin: 0;">
<canvas id="userChart"></canvas>
</div>

<table id="profile" >
<tr>
<th class="profileTh">
	<div id="img" >
	<img title="미졌습니까? 휴먼?" alt="관리자 이미지" src="/resources/img/sample_img.png" width="130" height="150">
	</div>
</th>
</tr>

<tr>
	<td id="helloAdmin" class="profileTd">
	관리자(${userId})님<br>
	반갑습니다
	</td>
</tr>
<tr>
	<td class="profileTd">
	<div id="logout">
		<form id="logoutForm" action="./main" method="post">
			<p id="logoutText" style="text-decoration: underline; color: red; width: 70px; margin: auto;">로그아웃</p>
		</form>
	</div>
	</td>
</tr>
</table>

<div id="classCount">
<canvas id="classChart"></canvas>
</div>

<div id="paymentCount" style="float: left;">
<canvas id="paymentChart"></canvas>
</div>

</div>			
<%-- <% ============================================================================= %> --%>		
	
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />