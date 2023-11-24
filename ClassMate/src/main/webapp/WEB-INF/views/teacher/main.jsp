<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div class= "title">
<h1>강사페이지</h1>

<div id= "all"><a>전체보기</a></div>
</div>
<hr>

<%-- <table>
<tr>
	<td class="table-info" id="onInsert1">영상 업로드</td><td id="onInsert2"><div><input type="file" class="form-control" name="file" id="file" multiple="multiple"></div></td>
	<td id="onInsert3">
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table>
	  <c:forEach items="${video }" var="video">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td>${video.videoLesson } 회차</td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	</td>
</tr>
</table> --%>

<%-- <table>
<tr>
	<td class="table-info">영상 업로드</td><td></td>
	<td>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table>
	  <c:forEach items="${video }" var="video">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td>${4*j + i } 회차</td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
	</td>
</tr>
</table>

<script>

var num = 1;

var t = "<table border='1' style='margin: auto; text-align: center'>";

for(var i=1; i<11; i++) {
	
	t += "<tr>";	//행
	
	
	if(i%2 == 1) {
	for(var k=1; k<5; k++) {
		
		t += "<td style='background-color: gray;'>" + num +"</td>";
				
		num++;
		
		}
	} else	{
		
		for(var k=1; k<5; k++) {
			
			t += "<td>" + ((i/2-1)*4 + k) + '회차' + "삭제" + "</td>";
						
			}
	
	}
	
	t += "</tr>";
	
	
}
 t += "</table>";

 console.log(t);
 
 document.write(t);

</script>
 
  
    
    
    
    <div id="calculator_addBtn">
      <button type="button" id="add_class">강의 추가</button>
    </div>
<script>

var num = 1;

var t = "<table id='calculator_table' border='1' style='margin: auto; text-align: center'>";

for(var i=1; i<6; i++) {
	
	t += "<tr>";	//행
	
	
	
	for(var k=1; k<5; k++) {
		
		t += "<td>"+"<div>" + num + "회차" + "</div>" + "<div style='margin-bottom: 2px;'>"+ "아" +"</div>"
		+"<div>"+"<button class='td_delete' onclick='td_delete_event(this)'>"+"삭제"+"</button>"+"</div>" +"</td>";
				
		num++;
		
		}
	
	
	t += "</tr>";
	
	
}
 t += "</table>";

 console.log(t);
 
 document.write(t);

</script> --%>








<!-- <style type="text/css">
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
</style>


<div class="form-group">
	<label>동적테이블 행추가하기</label>
	<button type=button class='btn btn-default' id='btn_add' style='float:right; margin-bottom:5px;'>추가버튼</button>	
</div>

<table id='table_ipaddr'> 	
	<tbody>
	<tr>
		<td>
			<div class="label_group">
			<label for="manager_ipaddr_label">행</label>
			</div>
		</td>
		<td>	
			<div class="form_group" style="margin:5px;">
				<input name="manager_ipaddr" class="form-control" class='ipaddr' 
                	style='width:300px; float:left; margin-right:5px'>
				<button type="button" name="btn_delete" class="btn btn-default btn-sm" style="height:30px">
				<span class="glyphicon glyphicon-minus"></span>
				</button>
			</div>
		</td>
	</tr>
</tbody>
</table>     -->   


<hr>
<hr>

<div id="file-container">
  <!-- Initial file input field -->
  <input type="file" name="file" id="file1" onchange="fileChanged()" />
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
  var maxRows = 4;  // 최대 행 수
  var maxCols = 5;  // 최대 열 수
  var num = 1;

  // Function to handle file input change
  function fileChanged() {
    // Check if the table exists, if not, create it
    if (!document.getElementById('dynamic-table')) {
      createTable();
    }

    // Get the table
    var table = document.getElementById('dynamic-table');

    // Check if a new row needs to be added
    if (table.rows.length >= maxRows) {
      alert("테이블이 최대 크기에 도달했습니다.");
      return;
    }

    // Add a new row to the table
    var newRow = table.insertRow();

    // Add new cells to the row
    for (var i = 0; i < maxCols; i++) {
      var newCell = newRow.insertCell();

      // Create file input element
      var fileInput = document.createElement('input');
      fileInput.type = 'file';
      fileInput.name = 'file';
      fileInput.id = 'file' + num;
      fileInput.onchange = fileChanged;

      // Create delete button element
      var deleteButton = document.createElement('button');
      deleteButton.textContent = 'Delete';
      deleteButton.onclick = function () {
        deleteColumn(newCell.cellIndex);
      };

      // Append file input and delete button to the cell
      newCell.appendChild(fileInput);
      newCell.appendChild(deleteButton);

      // Increment the num variable
      num++;
    }
  }

  // Function to create the initial table
  function createTable() {
    var table = document.createElement('table');
    table.id = 'dynamic-table';
    table.border = '1';

    // Append the table to the body
    document.body.appendChild(table);

    // Add the initial row
    addRow();
  }

  // Function to add a new row to the table
  function addRow() {
    for (var i = 0; i < maxRows; i++) {
      fileChanged();
    }
  }

  // Function to delete a column from the table
  function deleteColumn(cellIndex) {
    var table = document.getElementById('dynamic-table');
    for (var i = 0; i < table.rows.length; i++) {
      table.rows[i].deleteCell(cellIndex);
    }
  }

  // Add initial file input
  fileChanged();
});
</script>



  
<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />