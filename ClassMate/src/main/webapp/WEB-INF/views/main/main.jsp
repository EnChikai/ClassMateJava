<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

/* ON 클래스 TOP 5 */
/* 버튼 클릭 시 한칸씩 넘어가기 */
    $(document).ready(function () {
        var currentIndex = 0;
        var itemWidth = $(".lecture-item-on").outerWidth();
        var itemCount = $(".lecture-item-on").length;
        var visibleItemCount = 3; // 한 번에 보여지는 아이템 개수

        $("#nextBtn-on").on("click", function () {
            if (currentIndex < itemCount - visibleItemCount) {
                currentIndex++;
                updateCarousel();
            }
        });

        $("#prevBtn-on").on("click", function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateCarousel();
            }
        });

        function updateCarousel() {
            var translateValue = -currentIndex * itemWidth;
            $("#carousel-inner-on").css("transform", "translateX(" + translateValue + "px)");
        }
    });
    
/* OFF 클래스 TOP 5 */
/* 버튼 클릭 시 한칸씩 넘어가기 */
    $(document).ready(function () {
        var currentIndex = 0;
        var itemWidth = $(".lecture-item-off").outerWidth();
        var itemCount = $(".lecture-item-off").length;
        var visibleItemCount = 3; // 한 번에 보여지는 아이템 개수

        $("#nextBtn-off").on("click", function () {
            if (currentIndex < itemCount - visibleItemCount) {	
                currentIndex++;
                updateCarousel();
            }
        });

        $("#prevBtn-off").on("click", function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateCarousel();
            }
        });

        function updateCarousel() {
            var translateValue = -currentIndex * itemWidth;
            $("#carousel-inner-off").css("transform", "translateX(" + translateValue + "px)");
        }
    });
    
/* ON/OFF 클래스 TOP 5 */
/* 버튼 클릭 시 한칸씩 넘어가기 */
    $(document).ready(function () {
        var currentIndex = 0;
        var itemWidth = $(".lecture-item-onOff").outerWidth();
        var itemCount = $(".lecture-item-onOff").length;
        var visibleItemCount = 4; // 한 번에 보여지는 아이템 개수

        $("#nextBtn-onOff").on("click", function () {
            if (currentIndex < itemCount - visibleItemCount) {	
                currentIndex++;
                updateCarousel();
            }
        });

        $("#prevBtn-onOff").on("click", function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateCarousel();
            }
        });

        function updateCarousel() {
            var translateValue = -currentIndex * itemWidth;
            $("#carousel-inner-onOff").css("transform", "translateX(" + translateValue + "px)");
        }
        
    });
    

    

</script>



<style type="text/css">


.col{
	width: 331px;
    margin-left: 16px;
    margin-right: 16px
    
}

.TOP5{
	background-color: #F0C610;
	display: inline-block;
	padding: 15px;
	border-radius:5% 5% 0 0;
}



.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}

.carousel-indicators{

	justify-content: right;
	
	margin-right: 3%;

	margin-left: 3%;
	
	left: 650px;
}

.carousel-indicators [data-bs-target] {

  box-sizing: content-box;

  flex: 0 1 auto;

  width: 10px;

  height: 10px;

  border-radius:50%;

  padding: 0;

  margin-right: 3px;

  margin-left: 3px;

  text-indent: -999px;

  cursor: pointer;

  background-color: black;

  background-clip: padding-box;

  border: 0;

  border-top: 10px solid transparent;

  border-bottom: 10px solid transparent;

  opacity: .8;

  transition: opacity .6s ease;

}

.carousel-indicators .active{

background-color: #F0C610;

}

/* ON 클래스 TOP 5 */

/* 버튼 클릭 시 한칸씩 넘어가기 */
#carousel-container-on {
    overflow: hidden;
}

#carousel-inner-on {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.lecture-item-on {
    flex: 0 0 auto;
    width: 33.33%; /* 한 번에 3개의 아이템을 보여줍니다. */
    box-sizing: border-box;
}

/* 이전/다음 버튼에 스타일 추가 */
#prevBtn-on, #nextBtn-on {
    padding-right: 6px;
    padding-left: 6px;
    cursor: pointer;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 187px;
    margin-right: 6px;
}

/* 강의 아이템 스타일 추가 */
.lecture-item-on {
    margin-bottom: 20px;
    
}

.container-on {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* OFF 클래스 TOP 5 */
/* 버튼 클릭 시 한칸씩 넘어가기 */
#carousel-container-off {
    overflow: hidden;
}

#carousel-inner-off {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.lecture-item-off {
    flex: 0 0 auto;
    width: 33.33%; /* 한 번에 3개의 아이템을 보여줍니다. */
    box-sizing: border-box;
}

/* 이전/다음 버튼에 스타일 추가 */
#prevBtn-off, #nextBtn-off {
    padding-right: 6;
    padding-left: 6;
    cursor: pointer;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 187px;
    margin-right: 6px;
}

/* 강의 아이템 스타일 추가 */
.lecture-item-off {
    margin-bottom: 20px;
}

.container-off {
    display: flex;
    align-items: center;
	justify-content: space-between;
}


/* ON/OFF 클래스 TOP 10 */
/* 버튼 클릭 시 한칸씩 넘어가기 */
#carousel-container-onOff {
    overflow: hidden;
}

#carousel-inner-onOff {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.lecture-item-onOff {
    flex: 0 0 auto;
    width: 25%; /* 한 번에 4개의 아이템을 보여줍니다. */
    box-sizing: border-box;
}

/* 이전/다음 버튼에 스타일 추가 */
#prevBtn-onOff, #nextBtn-onOff {
    padding-right: 6px;
    padding-left: 6px;
    cursor: pointer;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 187px;
    margin-right: 6px;
}

/* 강의 아이템 스타일 추가 */
.lecture-item-onOff {
    text-align: center;
    margin-bottom: 20px;
}

.container-onOff {
	display: flex;
    align-items: center;
    justify-content: flex-end;
    border: 1px solid #ccc;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 4px;
    margin-right: 4px;
}

a:hover{
	color: #F0C610;
}

p{
    text-align: center;
}

img {
  max-width: 100%;
}

@media (max-width: 1850px) {

#carouselExampleRide {
	display: none;
}

	.lecture-item-on {
	    flex: 0 0 auto;
	    width: 50%; /* 한 번에 3개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
	.solid {
		display: none;
	}
	
	.lecture-item-Off {
	    flex: 0 0 auto;
	    width: 50%; /* 한 번에 4개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
	.lecture-item-onOff {
	    flex: 0 0 auto;
	    width: 50%; /* 한 번에 4개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
	.container-on {
	text-align: center;
	justify-content: flex-start;
	}
	
	.container-Off {
	text-align: center;
	justify-content: flex-start;
	}
	
	.container-onOff {
	text-align: center;
	justify-content: flex-start;
	width: 250px;
	}
	
	.onOffFlext{
	display:flex;
	text-align: center;
	justify-content: center;
	}

}

@media (max-width: 1535px) {

.defaultWidth{
	margin-left: 200px;
	margin-right: 200px;
    margin-top: 60px;
	margin-bottom: 60px;
}


	.lecture-item-on {
	    flex: 0 0 auto;
	    width: 100%; /* 한 번에 3개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
		.lecture-item-Off {
	    flex: 0 0 auto;
	    width: 100%; /* 한 번에 3개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
	.TOP5{
		min-width: 139px;
	}
	
	
	
}

@media (max-width: 950px) {

		.lecture-item-onOff {
	    flex: 0 0 auto;
	    width: 100%; /* 한 번에 3개의 아이템을 보여줍니다. */
	    box-sizing: border-box;
	}
	
		.onOffFlext{
	display:inline-block;
	    margin-left: 48px;
	}

}


@media (max-width: 780px) {
	#carousel-container-on{
		min-width: 358px;
	}
	#carousel-container-off{
		min-width: 358px;
	}
	#carousel-container-onOff{
		min-width: 358px;
	}


}

        
</style>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth">

<div style="margin-top: 60px;">
<c:if test="${not empty selectByEventFileList or selectByEventFileList.size() != 0}">
<div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
    <div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    
    	<c:forEach var="list"  items="${selectByEventFileList }" begin="1" varStatus="status">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.count }" aria-label="Slide ${status.count }"></button>
		</c:forEach>
		
	</div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a style="text-decoration: none;" href="/board/eventView?eventNo=${selectByEventFileList[0].eventNo }"><img data-bs-slide-to="0" style="width: 1103; height: 300px;" src="/upload/${selectByEventFileList[0].headImg }"></a>
    </div>
    <c:forEach var="list"  items="${selectByEventFileList }" begin="1" varStatus="status">
    	<div class="carousel-item">
			<a style="text-decoration: none;" href="/board/eventView?eventNo=${list.eventNo }"><img data-bs-slide-to="${status.count }" style="width: 1103; height: 300px;" src="/upload/${list.headImg }"></a>
    	</div>
	</c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</div>
</c:if>

<br><br><br>
<c:if test="${not empty onClassOrderTopList or onClassOrderTopList.size() != 0}">
<div class="container-on">
<span class="TOP5"><strong>인기 ON TOP5</strong></span><span class="solid" style="border: 1px solid #ccc; padding-left: 869px; margin-right: 30px;"></span>
<button id="prevBtn-on">&lt;</button>
<button id="nextBtn-on">&gt;</button>
</div>

<div id="carousel-container-on">
    <div id="carousel-inner-on" class="lecture-list-on">
        <!-- 강의 목록은 서버에서 가져와 동적으로 생성되어야 합니다. 여기서는 간단히 하드코딩으로 생성합니다. -->
        <c:forEach var="list" items="${onClassOrderTopList}" varStatus="status">
            <div class="lecture-item-on">
                <a style="text-decoration: none;" href="/main/onClassView?classNo=${list.classNo}">
                    <img style="width: 358px; height: 270px;" src="/upload/${list.headImg}">
                    <p class="className" style="width: 358px; background-color: #F4E399">${list.className}</p>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
</c:if>

<br><br><br>
<c:if test="${not empty offClassOrderTopList or offClassOrderTopList.size() != 0}">
<div class="container-off">
<span class="TOP5"><strong>인기 OFF TOP5</strong></span><span class="solid" style="border: 1px solid #ccc; padding-left: 865px; margin-right: 30px;"></span>
<button id="prevBtn-off">&lt;</button>
<button id="nextBtn-off">&gt;</button>
</div>


<div id="carousel-container-off">
    <div id="carousel-inner-off" class="lecture-list-off">
        <!-- 강의 목록은 서버에서 가져와 동적으로 생성되어야 합니다. 여기서는 간단히 하드코딩으로 생성합니다. -->
        <c:forEach var="list" items="${offClassOrderTopList}" varStatus="status">
            <div class="lecture-item-off">
                <a style="text-decoration: none;" href="/main/offClassView?classNo=${list.classNo}">
                    <img style="width: 358px; height: 280px;" src="/upload/${list.headImg}">
                    <p class="className" style="width: 358px; background-color: #B8DEF8">${list.className}</p>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
</c:if>
<br><br><br>
<c:if test="${not empty onRecommended[i].classNo or onRecommended[i].classNo.size() != 0}">
<div class="onOffFlext">
	<div class="container-onOff">
	<span><strong style="margin-right: 111px;">추천 ON/OFF</strong></span><span class="solid" style="padding-left: 310px; margin-right: 10px;"></span>
	<button id="prevBtn-onOff">&lt;</button>
	<button style="margin-right: 10px;" id="nextBtn-onOff">&gt;</button>
	</div>
</div>

<div id="carousel-container-onOff">
    <div id="carousel-inner-onOff" class="lecture-list-onOff">
        <!-- 강의 목록은 서버에서 가져와 동적으로 생성되어야 합니다. 여기서는 간단히 하드코딩으로 생성합니다. -->
        <%-- <c:forEach var="list" items="${offClassOrderTopList}" varStatus="status"> --%>
        <c:forEach var="i" begin="0" end="4">
        
            <div class="lecture-item-onOff">
                <a style="text-decoration: none;" href="/main/onClassView?classNo=${onRecommended[i].classNo }">
                    <img style="width: 266px; height: 200px;" src="/upload/${onRecommended[i].headImg}">
                    <p class="className" style="margin-right: 5px; margin-left: 5px; background-color: #F4E399">${onRecommended[i].className}</p>
                </a>
            </div>
            
            <div class="lecture-item-onOff">
                <a style="text-decoration: none;" href="/main/offClassView?classNo=${offRecommended[i].classNo }">
                    <img style="width: 266px; height: 200px;" src="/upload/${offRecommended[i].headImg}">
                    <p class="className"style="margin-right: 5px; margin-left: 5px; background-color: #B8DEF8">${offRecommended[i].className}</p>
                </a>
            </div>
            
        </c:forEach>
    </div>
</div>
</c:if>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
