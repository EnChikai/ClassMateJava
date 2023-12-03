<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	// 마우스를 올리면 글자색과 언더라인 변경
	$(".subCategoryItem").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "#F0C610");
	        $(this).find("#subFont").css("color", "white");
	        $(this).find("#subImg").css("filter", "invert(100%)");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "#ccc");
	        $(this).find("#subFont").css("color", "black");
	        $(this).find("#subImg").css("filter", "invert(0%)");
	    }
	});
});
</script>

<style type="text/css">

.subCategoryNo{
	text-decoration: none;
	color: black;
}

.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	text-align: center;
	margin-bottom: 60px;
}

.subCateTitle{
	margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.subCategoryContainer {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: 224px 224px 224px;
    align-items: center;
    justify-content: center;
    grid-column-gap: 15px;
    grid-row-gap: 15px;
}

.subCategoryItem {
    text-align: center;
    padding: 30px;
    transition: background-color 0.3s, color 0.3s;
    background-color: #ccc;
}

#subImg {
    width: 80px;
    
    
}

p {
    font-size: 18px;
    color: black;
}

@media (min-width: 1920px) {
	#subName{
	margin-left: 224px;
		
	}
	.subCateTitle {
	border: 1px solid #ccc;
	justify-content: unset;
	margin-right: 200px;
    margin-left: 200px;
    padding-right: 50px;
	
	}
	
	}
	
	@media (max-width: 970px) {
		.subCateTitle{
			min-width: 152px;
			    margin-left: -75px;
		}
		.defaultWidth{
	    margin-top: 60px;
		margin-bottom: 60px;
	}

}


</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">


    <div class="subCateTitle">
    	<img style="float: left; margin-top: -1px; margin-left: -1px;" width="50px;" height="50px;" src="/resources/img/mainCategory.png">
    	<strong id="subName" style="font-size:22px;">카테고리 중분류</strong>
    </div>
    
    
    <c:choose>
        <c:when test="${list[0].mainCategoryNo == 1 }">
            <c:set var="subCategoryPath" value="/WEB-INF/views/main/art.jsp" />
        </c:when>
        
        <c:when test="${list[0].mainCategoryNo == 2 }">
            <c:set var="subCategoryPath" value="/WEB-INF/views/main/sports.jsp" />
        </c:when>
        
        <c:when test="${list[0].mainCategoryNo == 3 }">
        	<c:set var="subCategoryPath" value="/WEB-INF/views/main/cook.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 4 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/travel.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 5 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/growth.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 6 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/it.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 7 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/fashion.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 8 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/create.jsp" />
	    </c:when>
	    
	    <c:when test="${list[0].mainCategoryNo == 9 }">
	        <c:set var="subCategoryPath" value="/WEB-INF/views/main/culture.jsp" />
	    </c:when>
    
        <c:otherwise>
            <c:set var="subCategoryPath" value="" />
        </c:otherwise>
    </c:choose>
    
    <c:if test="${not empty subCategoryPath}">
        <c:import url="${subCategoryPath}" />
    </c:if>
    

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />