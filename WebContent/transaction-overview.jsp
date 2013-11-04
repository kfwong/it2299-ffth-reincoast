<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h2>Transaction Overview</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Transaction Overview</li>
			</ol>
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
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
							<label class="col-lg-1 control-label">T.Code</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-1 control-label">Type</label>
							<div class="col-lg-4">
								<select class="form-control">
									<option>Dispatched</option>
									<option>Scheduled</option>
									<option>Preparing</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-1 control-label">Receipt No.</label>
							<p class="form-control-static">4866486523235</p>
						</div>
						<div class="form-group">
							<label class="col-lg-1 control-label">Type</label>
							<p class="form-control-static">Organization</p>
						</div>
					</form>
					<div class="table-responsive">
						<table class="table table-hover table-striped tablesorter table-condensed">
							<thead>
								<tr>
									<th class="col-lg-1">#<i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Code <i class="icon-sort"></i></th>
									<th>Item Description <i class="icon-sort"></i></th>
									<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Unit of Measure<i class="icon-sort"></i></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>0320654875</td>
									<td>SUPER CUP NOODLES 320G</td>
									<td>10</td>
									<td>PLT</td>
								</tr>
								<tr>
									<td>2</td>
									<td>0320654875</td>
									<td>SUPER CUP NOODLES 320G</td>
									<td>10</td>
									<td>PLT</td>
								</tr>
								<tr>
									<td>3</td>
									<td>0320654875</td>
									<td>SUPER CUP NOODLES 320G</td>
									<td>10</td>
									<td>PLT</td>
								</tr>
								<tr>
									<td>4</td>
									<td>0320654875</td>
									<td>SUPER CUP NOODLES 320G</td>
									<td>10</td>
									<td>PLT</td>
								</tr>
								<tr>
									<td>5</td>
									<td>0320654875</td>
									<td>SUPER CUP NOODLES 320G</td>
									<td>10</td>
									<td>PLT</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->