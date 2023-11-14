<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#onClass").click(function () {
            $.ajax({
                type: "GET",
                url: "/main/onClassList",
                data: {"subCateGory" : ${subCategory}}
                dataType: "json",
                success: function (data) {
                    console.log("onClassList 성공", data);
                    displayClassList(data, "onClassList");
                },
                error: function () {
                    console.log("onClassList 실패");
                }
            });
        });

        $("#offClass").click(function () {
            $.ajax({
                type: "GET",
                url: "/main/offClassList",
                dataType: "json",
                success: function (data) {
                    console.log("offClassList 성공", data);
                    displayClassList(data, "offClassList");
                },
                error: function () {
                    console.log("offClassList 실패");
                }
            });
        });

        // Ajax로 받아온 데이터를 HTML로 변환하여 화면에 표시하는 함수
        function displayClassList(data, containerId) {
            var container = $("#" + containerId);
            container.empty(); // 컨테이너 비우기

            // 받아온 데이터를 기반으로 동적으로 HTML 생성
            for (var i = 0; i < data.length; i++) {
                var c = data[i];
                if (c.deleteBoolean == 0) {
                    var html = '<h1>' + containerId + '</h1><br>' +
                        c.headImg + '<br>' +
                        '<h3>' + c.className + '</h3><br>' +
                        c.classInfo + '<br>' +
                        c.expense + '<br>' +
                        c.classStart + '<br>' +
                        c.classEnd + '<br>' +
                        c.maxCount + '<br>';

                    container.append(html); // 생성한 HTML을 컨테이너에 추가
                }
            }
        }
    });
</script>

<style type="text/css">
    .defaultWidth {
        margin-left: 400px;
        margin-right: 400px;
    }
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth">
    <!-- 토글 버튼 -->
    <button id="onClass">ON 전체보기</button>
    <button id="offClass">OFF 전체보기</button>

    <div id="onClassList"></div>
    <div id="offClassList"></div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
