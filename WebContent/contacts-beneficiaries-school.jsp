<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/contacts.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Contacts" name="active" />
	<jsp:param value="Beneficiaries - School" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Contacts <small>Beneficiaries - School</small></h1>
	<form method="get" action="ContactEditServlet">
		<div class="table-above contact-button-group">
			<div class="form-group">
				<button type="submit" class="pull-right btn btn-default submit-button">Add / Edit</button>
				<button type="button" class="pull-right btn btn-default contact-button delete-button">Delete</button>
			</div>
							
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
			<thead>
				<tr>
					<th class="table-column-name">Name</th>
					<th class="table-column-address">Address</th>
					<th class="table-column-number">Contact Number</th>
					<th class="table-column-email">Email</th>
					<th class="table-column-organization">School</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="contact" items="${contactArray}">
				<tr class="table-row">
					<td>${contact.name}</td>
					<td>${contact.address}</td>
					<td>${contact.contactNumber}</td>
					<td>${contact.email}</td>
					<td>${contact.organization}</td>
					<input class="id" type="hidden" name="id" value="${contact.id}">
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" name="type" value="school">
	</form>
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
				$(rowSelected).find("input").removeClass("selectedId");
			}
			else{
				$(rowSelected).addClass("warning selected"); 
				rowSelectedCount++;
				$(rowSelected).find("input").addClass("selectedId");
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
		});
		
		$(".submit-button").on("click", function(event){
			event.preventDefault();
			$(".id").not(".selectedId").remove();
			
			$("form").submit();
		});
		
		$(".confirm-delete-button").on("click", function(event){
			event.preventDefault();
			$(".id").not(".selectedId").remove();
			$("form").append('<input type="hidden" name="delete" value="true">');
			$("form").submit();
		});
	});
</script>

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->