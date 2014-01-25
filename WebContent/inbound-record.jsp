<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
<jsp:param value="Inbound Delivery" name="sub-active" />
<jsp:param value="Outbound Delivery" name="sub-active" />
<jsp:param value="Inbound Delivery Record" name="active" />
<jsp:param value="Inventory" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<div class="page-header">
					<h1>
						Food Drive
					</h1>
				</div>
			<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Delivery</li>
					<li class="active">Inbound Delivery Record</li>
				</ol>
			<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<label>Food Drive List</label>
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" >
						<div class="form-group" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#searchModal">
									<i class="icon-tags"></i> Search
								</button>	
							</div>
						</div>

						<div class="table-responsive" id="tableRec">
							<table class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										<th class="col-lg-1">Delivery ID<i class="icon-sort"></i></th>
										<th class="col-lg-2">Donor<i class="icon-sort"></i></th>
										<th class="col-lg-2">Donor Type<i class="icon-sort"></i></th>
										<th class="col-lg-2">Recevied Date<i class="icon-sort"></i></th>
										<th class="col-lg-1">Item List<i class="icon-sort"></i></th>
										<th class="col-lg-2">Remove Order<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">

									<c:forEach items="${inboundList}" var="item">
												
									<tr>
										
										<td>${item.id}</td>
										<td>${item.donorName}</td>
										<td>${item.donorType}</td>
										<td>${item.dateDelivered}</td>
										<td><a href ="GetItemListServlet?id=${item.id}" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> View</a></td>
										<!--  <td><href ="RemoveOrderServlet?id=${item.id}" class="btn btn-primary"><i class="icon-remove-sign"></i>Remove Record</a></td>-->
										<td><button type="button" class="remove"  id="${item.id}">Remove Order</button></td>
									</tr>
											
									</c:forEach>
								</tbody>
							</table>
						</div>
						
					</form>
								
								
									<!-- Modal -->
									<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Advanced Search</h4>
												</div>
												<div class="modal-body" id="searchID">
													<table>
													<tr>
													<td>
													Delivery ID:
													</td>
													<td>
													<input class="form-control" type="text" id ="searchId" name="search" />
													</td>
													</tr>
													<tr>
													<td>
													Donor Name: 
													</td>
													<td>
													<input class="form-control" type="text" id ="searchName" name="name" />
													</td>
													</tr>
													<tr>
													<td>
													Search From
													</td>
													<td>
													<input class="form-control datepicker" type="text" id ="searchDate1" name="Date1" readonly/>
													</td>
													<td>
													To
													</td>
													<td>
													<input class="form-control datepicker" type="text" id ="searchDate2" name="Date2" readonly/>
													</td>
													</tr>
													</table>
												</div>
												<div class="modal-footer">
												<button type="button" class="btn btn-primary" id="deliverySearch">Search</button>
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
				</div>
				
			</div>
			</div>
			
		</div>
	</div>
</div>
<!-- /.row -->
<form method="GET" action="RemoveOrderServlet" id="hiddenForm">
	<input type="hidden" name="id" id="hiddenInput">
</form>
<form method="POST" action="SearchInboundServlet" id="hiddenForm2">
	<input type="hidden" name="searchID" id="hiddenID">
	<input type="hidden" name="searchName" id="hiddenName">
	<input type="hidden" name="searchDate1" id="hiddenDate1">
	<input type="hidden" name="searchDate2" id="hiddenDate2">
	<input type="hidden" name="searchType" id="hiddenType">
</form>
<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	$(document).ready(function(){
		
		$(".remove").on('click', function(event){
			var result = event.target.id;
			
			if (confirm('Are you sure you want to cancel this order?')) {
				$("#hiddenInput").val(result);
				$("#hiddenForm").submit();
			} else {
			   alert("Good Choose");
			}
			search();
		});
		
		
		
	});
	
	function search(){
		$("#deliverySearch").on('click', function(){
			var id = $("#searchId").val();
			var name = $("#searchName").val();
			var date1 = $("#searchDate1").val();
			var date2 = $("#searchDate2").val();
			
			$("#hiddenID").val(id);
			$("#hiddenName").val(name);
			$("#hiddenDate1").val(date1);
			$("#hiddenDate2").val(date2);
			$("#hiddenForm2").submit();
		});
	}
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->