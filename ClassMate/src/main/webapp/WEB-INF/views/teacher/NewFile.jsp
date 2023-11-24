<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    table, th, td {
        border: 1px solid black;
    }

    input[type="file"], input[type="number"] {
        display: none;
    }

    #deleteTableButton {
        cursor: pointer;
        color: red;
        font-weight: bold;
        margin-top: 10px;
        display: none;
    }
</style>
<button id="deleteTableButton" onclick="deleteTable()">테이블 삭제</button>
<table id="dynamicTable"></table>

<script>
    // 함수를 호출하여 테이블 생성
    createDynamicTable(4, 5);

    function createDynamicTable(rows, cols) {
        // 테이블 엘리먼트 생성
        var table = document.getElementById('dynamicTable');

        // 행과 열을 반복하여 테이블 채우기
        for (var i = 0; i < rows; i++) {
            var row = table.insertRow(i);
            row.classList.add('tableRow'); // 행에 클래스 추가

            for (var j = 0; j < cols; j++) {
                var cell = row.insertCell(j);
                cell.classList.add('tableCell'); // 셀에 클래스 추가

                // input 엘리먼트 생성
                var input = document.createElement('input');
                input.type = 'file';
                input.id = 'fileInput_' + i + '_' + j; // 고유한 id 부여
                input.name = 'fileInput_' + i + '_' + j; // name 속성 부여

                var input2 = document.createElement('input');
                input2.type = 'number';
                input2.id = 'numberInput_' + i + '_' + j; // 고유한 id 부여
                input2.name = 'numberInput_' + i + '_' + j; // name 속성 부여
                input2.value = j; // 열 번호로 초기값 설정
                input2.readOnly = true; // 읽기 전용으로 설정

                // input의 change 이벤트에 함수 연결
                input.addEventListener('change', function () {
                    handleFileInput(this);
                });

                // cell에 input 추가
                cell.appendChild(input);
                cell.appendChild(input2);

                // 첫 번째 셀인 경우 파일 입력을 보이게 처리
                if (i === 0 && j === 0) {
                    input.style.display = 'block';
                }
            }
        }

        // 테이블 밖의 삭제 버튼 표시
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'block';
    }

    function handleFileInput(input) {
        // 현재 위치의 열과 행 찾기
        var cell = input.parentNode;
        var col = cell.cellIndex;
        var row = cell.parentNode.rowIndex;

        // 현재 위치의 행이 마지막 행이 아니면 다음 열에 input 추가
        if (col < 4) {
            var nextCell = cell.nextElementSibling;
            var nextInput = nextCell.querySelector('input[type="file"]');
            var nextInput2 = cell.querySelector('input[type="number"]');

            if (nextInput) {
                nextInput.style.display = 'block';
            }

            if (nextInput2) {
                nextInput2.style.display = 'block';
            }
        }

        // 현재 위치의 열이 마지막 열이 아니면 다음 행의 첫 번째 열에 input 추가
        if (row < 5 && col === 4) {
            var nextRow = cell.parentNode.nextElementSibling;
            if (nextRow) {
                var firstCell = nextRow.querySelector('td');
                if (firstCell) {
                    var firstInput = firstCell.querySelector('input[type="file"]');
                    var firstInput2 = cell.querySelector('input[type="number"]');

                    if (firstInput) {
                        firstInput.style.display = 'block';
                    }

                    if (firstInput2) {
                        firstInput2.style.display = 'block';
                    }
                }
            }
        }
    }

    function deleteTable() {
        // 테이블 엘리먼트 찾기
        var table = document.getElementById('dynamicTable');

        // 테이블 내의 모든 파일 값 초기화 및 셀 삭제
        for (var i = table.rows.length - 1; i >= 0; i--) {
            table.deleteRow(i);
        }

        // 삭제 버튼 숨기기
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'none';

        // 테이블 내용을 1행 1열로 재생성
        createDynamicTable(1, 5);
    }
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp" />    
