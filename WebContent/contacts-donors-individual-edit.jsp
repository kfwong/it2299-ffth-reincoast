<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/contacts.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Contacts <small>Donors - Individual</small></h1>

	<div class="table-above contact-button-group">
		<form method="post" action="contacts-donors-individual.jsp">
		<div class="form-group">	
			<button type="submit" class="pull-left btn btn-default contact-button">Discard</button>
			<button type="button" class="pull-left btn btn-default contact-button reset-button">Reset</button>
			<button type="submit" class="pull-right btn btn-default">Save</button>
			<button type="button" class="pull-right btn btn-default contact-button new-contact-button">New Contact</button>
		</div>
		</form>
		
		<span class="pull-left alert alert-info row-selected-count">No changes detected</span>
		
		<div class="clearfix"></div>
	</div>

	

	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr>
				<th class="table-column-name">Name</th>
				<th class="table-column-address">Address</th>
				<th class="table-column-number">Contact Number</th>
				<th class="table-column-email">Email</th>
			</tr>
		</thead>
		<tbody class="table-new-contact">
			<tr>
				<td class="table-column-name"><input type="text" class="form-control" value="John Smith" ></td>
				<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123" ></td>
				<td class="table-column-number"><input type="text" class="form-control" value="91234567" ></td>
				<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com" ></td>
			</tr>
			
			<tr>
				<td class="table-column-name"><input type="text" class="form-control" value="John Smith" ></td>
				<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123" ></td>
				<td class="table-column-number"><input type="text" class="form-control" value="91234567" ></td>
				<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com" ></td>
			</tr>
		</tbody>
	</table>

</div>
<!-- /content -->

<script>
	$(document).ready(function(){
		var rowSelectedCount = 0;
		
		$(".reset-button").on("click", function(){
			location.reload();
		});
		
		
		$(".new-contact-button").on("click", function(){
			$(".table-new-contact").prepend(
				'<tr>'+
				'<td class="table-column-name"><input type="text" class="form-control"></td>'+
				'<td class="table-column-address"><input type="text" class="form-control"></td>'+
				'<td class="table-column-number"><input type="text" class="form-control"></td>' +
				'<td class="table-column-email"><input type="text" class="form-control"></td>' +
				'</tr>'
			);
		});
		
		$(".table-column-name input, .table-column-address input, .table-column-number input, .table-column-email input").on("change", function(event){
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