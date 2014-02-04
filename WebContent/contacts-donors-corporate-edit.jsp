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
	<jsp:param value="Donors - Corporate" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Contacts <small>Donors - Corporate</small></h1>
	<form method="post" action="ContactEditServlet">
		<div class="table-above contact-button-group">
			<div class="form-group">	
				<button type="button" class="pull-left btn btn-default contact-button discard-button">Discard</button>
				<button type="button" class="pull-left btn btn-default contact-button reset-button">Reset</button>
				<button type="submit" class="pull-right btn btn-default">Save</button>
				<button type="button" class="pull-right btn btn-default contact-button new-contact-button">New Contact</button>
			</div>
			
			<span class="pull-left alert alert-info row-selected-count">No changes detected</span>
			<span class="pull-left alert alert-info row-added-count hide"></span>
			<div class="clearfix"></div>
		</div>

		<table class="table table-hover table-striped table-bordered">
			<thead>
				<tr>
					<th class="table-column-name">Name</th>
					<th class="table-column-address">Address</th>
					<th class="table-column-number">Contact Number</th>
					<th class="table-column-email">Email</th>
					<th class="table-column-organization">Company</th>
				</tr>
			</thead>
			<tbody class="table-new-contact">
				<c:forEach var="contact" items="${contactArray}">
				<tr class="table-row">
					<td class="table-column-name"><input type="text" class="form-control" name="name" value="${contact.name}" ></td>
					<td class="table-column-address"><input type="text" class="form-control" name="address" value="${contact.address}" ></td>
					<td class="table-column-number"><input type="text" class="form-control" name="number" value="${contact.contactNumber}" ></td>
					<td class="table-column-email"><input type="text" class="form-control" name="email" value="${contact.email}" ></td>	
					<td class="table-column-organization"><input type="text" class="form-control" name="organization" value="${contact.organization}"></td>
					<input type="hidden" name="type" value="corporate"/>
					<input class="id" type="hidden" name="id" value="${contact.id}">
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" name="type" value="corporate">
	</form>
</div>
<!-- /content -->

<script>
	$(document).ready(function(){
		var rowSelectedCount = 0;
		var rowAddedCount = 0;
		
		$(".reset-button").on("click", function(){
			location.reload();
		});
		
		$(".discard-button").on("click", function(){
			window.location.href = 'ContactServlet?type=corporate';	
		});
		
		$(".new-contact-button").on("click", function(){
			$(".table-new-contact").prepend(
				'<tr>'+
				'<td class="table-column-name"><input type="text" class="form-control" name="name"></td>'+
				'<td class="table-column-address"><input type="text" class="form-control" name="address"></td>'+
				'<td class="table-column-number"><input type="text" class="form-control" name="number"></td>' +
				'<td class="table-column-email"><input type="text" class="form-control" name="email"></td>' +
				'<td class="table-column-organization"><input type="text" class="form-control" name="organization"></td>' +
				'<input class="id" type="hidden" name="id" value="-1">' +
				'<input type="hidden" name="type" value="corporate"' +
				'</tr>'
			);
			
			rowAddedCount++;
			$(".row-added-count").removeClass("hide");
			$(".row-added-count").text(rowAddedCount + " records added");
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