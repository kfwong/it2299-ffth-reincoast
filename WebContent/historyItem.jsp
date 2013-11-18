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
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-lg-1 control-label">Receipt No:</label>
				<div class="col-lg-4">
					<input class="form-control" type="text" value="1234" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 control-label">Donor:</label>
				<div class="col-lg-4">
					<input class="form-control" type="text" value="muhahaha" readonly />
				</div>
			</div>
		</form>

		<div class="col-lg-12">
			<table
				class="table table-hover table-striped tablesorter table-condensed">
				<thead>
					<tr>
						<th>Item Description</th>
						<th>Quantity</th>
						<th>Total Price</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>89247147812</td>
						<td>150</td>
						<td>$1000</td>
					</tr>
					<tr>
						<td>23183973</td>
						<td>150</td>
						<td>$1200</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->