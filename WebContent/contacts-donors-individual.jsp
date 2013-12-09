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
		<form method="post" action="contacts-donors-individual-edit.jsp">
			<div class="form-group">
				<button type="submit" class="pull-right btn btn-default">Add / Edit</button>
				<button type="button" class="pull-right btn btn-default contact-button delete-button">Delete</button>
			</div>
		</form>
		
		<span class="pull-left alert alert-info row-selected-count">No records selected</span>
		
		<div class="clearfix"></div>
	</div>
	
	<!-- Modal -->
	<div class="modal delete-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Delete contacts</h4>
	      </div>
	      <div class="modal-body">
	         <p>Are you sure you want to delete the records?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-primary confirm-delete-button">Confirm</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		
	<table class="table table-hover table-striped table-bordered">
	<tr>
		<th class="table-column-name">Name</th>
		<th class="table-column-address">Address</th>
		<th class="table-column-number">Contact Number</th>
		<th class="table-column-email">Email</th>
	</tr>
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr class="table-row">
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
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