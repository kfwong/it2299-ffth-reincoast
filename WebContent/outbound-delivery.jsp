<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2>Outbound Delivery</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Outbound
					Delivery</li>
			</ol>
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				Transaction completed successfully. T.Code: 6000864578
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Metadata
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form">
						<div class="form-group" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-ok"></i> Save
								</button>
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-tags"></i> Other
								</button>
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-tags"></i> Other
								</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Collection Center</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="donor" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Package Description</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="package_description" />
							</div>
						</div>
					
					<div class="table-responsive">
						<table
							class="table table-hover table-striped tablesorter table-condensed">
							<thead>
								<tr>
									<th class="col-lg-1">#<i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Code <i class="icon-sort"></i></th>
									<th>Item Description <i class="icon-sort"></i></th>
									<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Unit of Measure<i class="icon-sort"></i></th>
								</tr>
							</thead>
							<tbody id="add-list">
								<tr>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="id" /></td>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="item-code" /></td>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="item-desc" /></td>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="item-quantity" /></td>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="item-price" /></td>
									<td><input class="form-control input-sm" type="text"
										style="width: 100%;" name="item-measure" /></td>
								</tr>
							</tbody>
							<tr colspan="5">
								<td><button type="button" class="btn btn-xs btn-default"
										id="addRow">
										<i class="icon-plus"></i> Add row
									</button></td>
							</tr>
						</table>
						<input type="submit"/>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	$(document)
			.ready(
					function() {
						$("#addRow")
								.on(
										'click',
										function() {
											$("#add-list")
													.append(
															'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-desc"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-measure"/></td></tr>');
											$(document).scrollTop(
													$(document).height());
										});

					});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->