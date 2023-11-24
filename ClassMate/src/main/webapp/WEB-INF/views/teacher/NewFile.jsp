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

<form action="/teacher/NewFile" method="post" id="submit" name="submit" enctype="multipart/form-data">
    <button id="deleteTableButton" onclick="deleteTable()">테이블 삭제</button>
    <table id="dynamicTable"></table>

    <!-- 추가: 파일 개수를 입력하는 input -->
    <input type="number" id="fileCount" name="fileCount" value="1" readonly style="display:none">

    <div class="text-center">
        <button class="btn btn-primary" id="btnRegist" onclick="submitForm()">등록</button>
        <button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
    </div>
</form>


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
                input.id = 'fileInput_' + ((i * 5) + (j + 1)); // 고유한 id 부여
                input.name = 'fileInput_' + ((i * 5) + (j + 1)); // name 속성 부여

                var input2 = document.createElement('input');
                input2.type = 'number';
                input2.id = 'numberInput_' + ((i * 5) + (j + 1)); // 고유한 id 부여
                input2.name = 'numberInput_' + ((i * 5) + (j + 1)); // name 속성 부여
                input2.value = (i * 5) + (j + 1); // 열 번호로 초기값 설정
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
                    input2.style.display = 'block';
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
            var nextInput2 = nextCell.querySelector('input[type="number"]');

            if (nextInput) {
                nextInput.style.display = 'block';
            }

            if (nextInput2) {
                nextInput2.style.display = 'block';
                var fileCountInput = document.getElementById('fileCount');
                fileCountInput.value = (nextInput2.value == 20) ? 20 : nextInput2.value - 1;
            }
        }

        // 현재 위치의 열이 마지막 열이 아니면 다음 행의 첫 번째 열에 input 추가
        if (row < 5 && col === 4) {
            var nextRow = cell.parentNode.nextElementSibling;
            if (nextRow) {
                var firstCell = nextRow.querySelector('td');
                if (firstCell) {
                    var firstInput = firstCell.querySelector('input[type="file"]');
                    var firstInput2 = firstCell.querySelector('input[type="number"]');

                    if (firstInput) {
                        firstInput.style.display = 'block';
                    }

                    if (firstInput2) {
                        firstInput2.style.display = 'block';
                        // fileCount를 최신 numberInput 값으로 설정
                        var fileCountInput = document.getElementById('fileCount');
                        // 예외처리: 20번째 셀인 경우 fileCount를 20으로 설정
                        fileCountInput.value = (firstInput2.value == 20) ? 20 : firstInput2.value - 1;
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


    function uploadFiles() {
        // FormData 생성
        var formData = new FormData();

        // 테이블 내의 파일들을 FormData에 추가
        var table = document.getElementById('dynamicTable');
        for (var i = 0; i < table.rows.length; i++) {
            var row = table.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                var cell = row.cells[j];

                // input type="file" 처리
                var fileInput = cell.querySelector('input[type="file"]');
                if (fileInput && fileInput.files.length > 0) {
                    for (var k = 0; k < fileInput.files.length; k++) {
                        formData.append(fileInput.name, fileInput.files[k]);
                    }
                }

                
                var numberInput = cell.querySelector('input[type="number"]');
                if (numberInput) {
                    formData.append(numberInput.name, numberInput.value);
                }
            }
        }

        // AJAX를 사용하여 FormData를 서버로 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/teacher/NewFile', true);
        xhr.onload = function () {
              if (xhr.status === 200) {
                console.log('Files uploaded successfully.');
            } else {
                console.error('File upload failed.');
            }
        };
        xhr.send(formData);
    }
    
    
    
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp" />    
