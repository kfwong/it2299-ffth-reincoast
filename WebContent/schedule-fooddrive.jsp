<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/schedules.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Schedule <small>Food Drive</small></h1>
	
	<div class="table-above schedule-button-group">
		<form method="post" action="schedule-fooddrive-edit.jsp">
			<div class="form-group">
				<button type="submit" class="pull-right btn btn-default">Add / Edit</button>
				<button type="button" class="pull-right btn btn-default schedule-button delete-button">Delete</button>
			</div>
		</form>
		
		<span class="pull-left alert alert-info row-selected-count">No records selected</span>
		<h4 class="text-center"><span class="glyphicon glyphicon-chevron-left"></span>January 2013<span class="glyphicon glyphicon-chevron-right"></span></h4>
		<div class="clearfix"></div>
	</div>
	
	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr>
				<th>Week</th>
				<th>Day</th>
				<th>Location</th>
				<th>Quantity</th>
				<th>Status</th>
				<th>Date</th>
				<th>Notes</th>
			</tr>
		</thead>
		<tbody>
			<tr class="table-row">
				<td>1</td>
				<td>Monday</td>
				<td>Chua Chu Kang Primary School</td>
				<td>10</td>
				<td>KIV</td>
				<td>1 January 2013</td>
				<td>need small and medium plastic bags</td>
			</tr>
			
			<tr class="table-row">
				<td>1</td>
				<td>Tuesday</td>
				<td>Ang Mo Kio Secondary School</td>
				<td>20</td>
				<td>OK</td>
				<td>2 January 2013</td>
				<td>need to check whether bulk or pack</td>
			</tr>
			
			<tr class="table-row">
				<td>2</td>
				<td>Wednesday</td>
				<td>Yishun Primary School</td>
				<td>30</td>
				<td>OK</td>
				<td>10 January 2013</td>
				<td>need medium plastic bags</td>
			</tr>
			
			<tr class="table-row">
				<td>2</td>
				<td>Thursday</td>
				<td>Wellington Secondary School</td>
				<td>40</td>
				<td>KIV</td>
				<td>11 January 2013</td>
				<td>need bulk</td>
			</tr>
			
			<tr class="table-row">
				<td>3</td>
				<td>Friday</td>
				<td>Canberra Primary School</td>
				<td>50</td>
				<td>OK</td>
				<td>20 January 2013</td>
				<td>need pack</td>
			</tr>
			
			<tr class="table-row">
				<td>4</td>
				<td>Monday</td>
				<td>Wellington Secondary School</td>
				<td>60</td>
				<td>OK</td>
				<td>21 January 2013</td>
				<td>need small and medium plastic bags</td>
			</tr>
		</tbody>
	</table>

</div>
<!-- /content -->

<script>
	$(document).ready(function(){
		var rowSelectedCount = 0;
		$(".table-row").on("click", function(event){
			$(".row-selected-count").removeClass("alert-danger");
			
			var elementSelected = event.target;
			var rowSelected = $(elementSelected).parents("tr");
			
			if($(rowSelected).hasClass("warning selected")){
				$(rowSelected).removeClass("warning selected");
				rowSelectedCount--;
			}
			else{
				$(rowSelected).addClass("warning selected"); 
				rowSelectedCount++;
			}			
		
			if(rowSelectedCount == 0){
				$(".row-selected-count").text("No records selected");
			}
			else{
				$(".row-selected-count").text(rowSelectedCount + " records selected");
			}
		});	
		
		$(".delete-button").on("click", function(event){
			if(rowSelectedCount <= 0){
				$(".row-selected-count").text("No records selected");
				$(".row-selected-count").addClass("alert-danger");
			}
			else{
				$(".delete-modal").modal();
			}
		});
		
		$(".confirm-delete-button").on("click", function(){
			location.reload(true);
			console.log("test");
		});
		
	});
</script>

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->