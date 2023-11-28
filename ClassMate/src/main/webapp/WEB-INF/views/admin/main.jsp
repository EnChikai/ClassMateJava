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
width:400px;
height: 187px;
float: left;
border-collapse: collapse;
border-radius: 3px;
border-style: hidden;
box-shadow: 0 0 0 1px #ccc;
text-align: center;
margin-left: 33px;
margin-top: 30px;

}

.profileTh, .profileTd{
border: 1px solid #ccc;
border-collapse:collapse;    
padding: 0;
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

#logout:hover:not(.active){
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

<script>
        // 그래프 데이터 정의
        
        let userCount = ${userCount };
        let secessionUserCount = ${secessionUserCount };
        let sum = 0;
        sum += userCount;
        sum += secessionUserCount;

window.onload = function() {
        var data = {
            labels: ['유저수', '탈퇴수', '총인원'],
            datasets: [{
                label: '사용자 그래프',
                data: [userCount, secessionUserCount, sum],
                backgroundColor: ['rgba(251,206,25,1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
            }]
        };

        // 그래프 옵션 정의
        var options = {
        		indexAxis: 'y'
            	,scales: {
                	y: {
                    	beginAtZero: true
                    
                	}
            	}
        };

        // 캔버스에 그래프 그리기
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options
        });
};
</script>

<%-- <% ============================================================================= %> --%>
<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px; height: 500px;">

<!-- 그래프를 그릴 캔버스 요소 추가 -->


<div id="userCount">
<canvas id="myChart"></canvas>
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
		<p id="logoutText" style="text-decoration: underline; color: red;">로그아웃</p>
		</form>
	</div>
	</td>
</tr>
</table>

</div>			
<%-- <% ============================================================================= %> --%>		
	
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />