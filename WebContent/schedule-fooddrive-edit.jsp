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
		<form method="post" action="schedule-fooddrive.jsp">
			<div class="form-group">
				<button type="submit" class="pull-left btn btn-default schedule-button">Discard</button>
				<button type="button" class="pull-left btn btn-default schedule-button reset-button">Reset</button>
				<button type="submit" class="pull-right btn btn-default">Save</button>
				<button type="button" class="pull-right btn btn-default schedule-button new-schedule-button">New Contact</button>
			</div>
		</form>
		
		<span class="pull-left alert alert-info row-selected-count">No records changed</span>
		<span class="pull-left alert alert-info row-added-count hide"></span>
		
		<div class="date-selector">
			<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="date-selector-selected">January 2013</span>
			<span class="glyphicon glyphicon-chevron-right"></span>
		</div>
		<div class="clearfix"></div>
	</div>
	
	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr>
				<th class="table-column-week">Week</th>
				<th class="table-column-day">Day</th>
				<th class="table-column-location">Location</th>
				<th class="table-column-quantity">Quantity</th>
				<th class="table-column-status">Status</th>
				<th class="table-column-date">Date</th>
				<th class="table-column-notes">Notes</th>
			</tr>
		</thead>
		<tbody class="table-new-schedule">
			<tr class="table-row">
				<td class="table-column-week"><input type="text" class="form-control" value ="1"></td>
				<td class="table-column-day"><input type="text" class="form-control" value="Monday"></td>
				<td class="table-column-location"><input type="text" class="form-control" value="Chua Chu Kang Primary School"></td>
				<td class="table-column-quantity"><input type="text" class="form-control" value="10"></td>
				<td class="table-column-status"><input type="text" class="form-control" value="KIV"></td>
				<td class="table-column-date"><input type="text" class="form-control" value="1 January 2013"></td>
				<td class="table-column-notes"><input type="text" class="form-control" value="small and medium plastic bags"></td>
			</tr>
			
			<tr class="table-row">
				<td class="table-column-week"><input type="text" class="form-control" value ="1"></td>
				<td class="table-column-day"><input type="text" class="form-control" value="Tuesday"></td>
				<td class="table-column-location"><input type="text" class="form-control" value="Ang Mo Kio Secondary School"></td>
				<td class="table-column-quantity"><input type="text" class="form-control" value="20"></td>
				<td class="table-column-status"><input type="text" class="form-control" value="OK"></td>
				<td class="table-column-date"><input type="text" class="form-control" value="2 January 2013"></td>
				<td class="table-column-notes"><input type="text" class="form-control" value="need to check whether bulk or pack"></td>
			</tr>
		</tbody>
	</table>

</div>
<!-- /content -->
<script>
	$(document).ready(function(){
		var rowSelectedCount = 0;
		var rowAddedCount = 0;
		
		$(".reset-button").on("click", function(){
			location.reload();
		});
		
		$(".new-schedule-button").on("click", function(){
			$(".table-new-schedule").prepend(
				'<tr>'+
				'<td class="table-column-week"><input type="text" class="form-control"></td>'+
				'<td class="table-column-day"><input type="text" class="form-control"></td>'+
				'<td class="table-column-location"><input type="text" class="form-control"></td>' +
				'<td class="table-column-quantity"><input type="text" class="form-control"></td>' +
				'<td class="table-column-status"><input type="text" class="form-control"></td>'+
				'<td class="table-column-date"><input type="text" class="form-control"></td>'+
				'<td class="table-column-notes"><input type="text" class="form-control"></td>'+
				'</tr>'
			);
			
			rowAddedCount++;
		
			$(".row-added-count").removeClass("hide");
			$(".row-added-count").text(rowAddedCount + " records added");
		});
		
		$(".table-column-week input, .table-column-day input, .table-column-location input, .table-column-quantity input," +
			".table-column-status input, .table-column-date input, .table-column-notes input").on("change", function(event){
			var elementSelected = event.target;
			var rowSelected = $(elementSelected).parents("tr");
			
			if($(rowSelected).hasClass("warning selected")){

			}
			else{
				$(rowSelected).addClass("warning selected");
				rowSelectedCount++;
			}	
			
			$(".row-selected-count").text(rowSelectedCount + " records changed");
			console.log(rowSelectedCount);
		});
	});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->