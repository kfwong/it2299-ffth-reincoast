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
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<div class="page-header">
					<h1>
						Food Drive List(Send)
					</h1>
				</div>
			<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Delivery</li>
					<li class="active">Outbound Delivery Record</li>
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

						<div class="table-responsive" id="tableRec">
							<table class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										<th class="col-lg-1">Delivery ID<i class="icon-sort"></i></th>
										<th class="col-lg-2">Collection Center<i class="icon-sort"></i></th>
										<th class="col-lg-2">Send Date<i class="icon-sort"></i></th>
										<th class="col-lg-1">Item List<i class="icon-sort"></i></th>
										<th class="col-lg-2">Remove Order<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">

									<c:forEach items="${outboundList}" var="item">
												
									<tr>
										
										<td>${item.id}</td>
										<td>${item.collectionCenter}</td>
										<td>${item.dateDelivered}</td>
										<td><a href ="GetOutBoundItemServlet?id=${item.id}" class="btn btn-default"><i class="glyphicon glyphicon-search"></i> View</a></td>
										<td><button type="button" class="remove"  id="${item.id}">Remove Order</button></td>
									</tr>
											
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
							<div class="col-lg-12">
								<div class="pull-right">
									<ul id="pagination" class="pagination">
									</ul>
								</div>
							</div>
						</div>
						</div>
						
					</form>
								
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->
<form method="GET" action="RemoveOutboundServlet" id="hiddenForm">
	<input type="hidden" name="id" id="hiddenInput">
</form>
<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	$(document).ready(function(){
		
		$('#pagination').bootstrapPaginator({
			bootstrapMajorVersion: 3,
			size: 'normal',
			currentPage: "${current_page}",
			totalPages: Math.ceil(${(total_item)/5}),
			pageUrl: function( type, page, current){
				 return "${s_url}"+page;
			}
		});
		
		$(".remove").on('click', function(event){
			var result = event.target.id;
			
			if (confirm('Are you sure you want to cancel this order?')) {
				$("#hiddenInput").val(result);
				$("#hiddenForm").submit();
			} else {
			   alert("Good Choose");
			}
			
		});
	});
	
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
<jsp:param value="js/bootstrap-paginator.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->