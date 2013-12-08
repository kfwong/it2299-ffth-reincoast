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
			<h2>Transaction Log</h2>
			<div class="table-responsive">
				<table
					class="table table-hover table-striped tablesorter table-condensed">
					<thead>
						<tr>
							<th># <i class="icon-sort"></i></th>
							<th>T.Code <i class="icon-sort"></i></th>
							<th>Movement/Status <i class="icon-sort"></i></th>
							<th>Date <i class="icon-sort"></i></th>
							<th>Person <i class="icon-sort"></i></th>
							<th>Total price<i class="icon-sort"></i></th>
						</tr>
					</thead>
					<tbody id="tran-list">

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->
<script>
	var count = 0;
	$(document).ready(

			function getTrans() {
				var tran = null;
				$.ajax({
					type : "POST",
					url : "GetTransHistory",
					data : {
						tran : tran
					}
				}).done(
						function(data) {

							var obj = $.parseJSON(data);
							alert(count);
							$("#tran-list").append(
									"<tr><td>" + count + "</td><td>"
											+ obj.receiptno
											+ "</td><td>haha</td><td>"
											+ obj.date + "</td><td>"
											+ obj.donor + "</td><td>$" + obj.totalPrice +"</td></tr>");
						});
				count++;
			});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->