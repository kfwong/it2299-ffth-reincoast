<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
		<h2>Stock</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i>Stock</li>
			</ol>
		<div class="col-lg-7">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">

						<i class="icon-bar-chart"></i> <label>Stock</label>
						
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="post"
						action="/j2EE-it2299-ffth-reincoast/GetStockByCategoryServlet" id="GetByType">
						<div class="form-group">
						<div class ="col-lg-6">
					<label class="col-lg-1 control-label">Category</label>
								<select class="form-control" id="category" name=selectCategory>
								</select>
								<button type="button" class="btn btn-xs btn-default" id="ViewType">
									<i class="icon-plus"></i> View Type
								</button>
					</div>
					</div>
						<div class="table-responsive" id="tableRec">
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										<th class="col-lg-1">Product ID<i class="icon-sort"></i></th>
										<th class="col-lg-2">Product Name<i class="icon-sort"></i></th>
										<th class="col-lg-1">Product Quantity<i class="icon-sort"></i></th>
										<th class="col-lg-1">Product value<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
								<c:forEach items="${stockList}" var="item">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td>${item.quantity}</td>
										<td>${item.price}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="pull-right">
									<ul id="pagination" class="pagination">
									</ul>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
		<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Stock Status</label>
						</h4>
						<span>Displaying stock status.</span>
					</div>
					
					<div class="panel-footer">
						<h4><label>Stock Graph</label></h4>
						
						<div id="graph"></div>

						<div class="clearfix"></div>
					</div>
					<div class="row">
							<div class="col-lg-12">
								<div class="pull-right">
									<ul id="pagination" class="pagination">
									</ul>
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	
	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<!-- Add row function -->
<form method="GET" action="GetStockByCategoryServlet" id="hiddenForm">
	<input type="hidden" name="page" id="hiddenPage"/>
	<input type="hidden" name="category" id="hiddenType" />
</form>
<script>

	$(document).ready(function(){
		
		$("#ViewType").on('click', function(){
			var itemType = $('#category :selected').val();
			var page = 1;
			
			$('#hiddenPage').val(page);
			$('#hiddenType').val(itemType);
			$('#hiddenForm').submit();
		});
		
		$("#category").select2({
			
		});
		getCategory();
		$('#pagination').bootstrapPaginator({
			
			bootstrapMajorVersion: 3,
			size: 'normal',
			currentPage: "${current_page}",
			totalPages: Math.ceil(${(total_item)/5}),
			pageUrl: function( type, page, current){
				
				 return "${s_url}"+page;
			}
		});
		
		${mychart};
	});
	
	function getCategory(){
		var category = 1;
		$.ajax({
			type:"POST",
			url:"GetCategoryServlet",
			data:{
				category: category
			}
		}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#category").append('<option value='+this.name + '>'+ this.name +' </option>');
			});
		})
	}
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.dot-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.min.js" name="js" />
		<jsp:param value="js/bootstrap-paginator.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->