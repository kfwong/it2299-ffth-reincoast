<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.it2299.ffth.reincoast.dao.InboundDeliveryDao, java.util.List, com.it2299.ffth.reincoast.dto.InboundDelivery, com.it2299.ffth.reincoast.dto.InboundLineItem, com.it2299.ffth.reincoast.dao.ItemDao, com.it2299.ffth.reincoast.dao.ProductDao, com.it2299.ffth.reincoast.dto.Product"%>


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
			<h2>Inbound received</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i>Stock</li>
			</ol>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Metadata
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="post"
						action="/it2299-ffth-reincoast/InBoundServlet">
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

						<div class="table-responsive" id="tableRec">
							<table class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										<th class="col-lg-1">#<i class="icon-sort"></i></th>
										<th class="col-lg-1">Delivery ID<i class="icon-sort"></i></th>
										<th class="col-lg-2">Donor<i class="icon-sort"></i></th>
										<th class="col-lg-2">Donor Type<i class="icon-sort"></i></th>
										<th class="col-lg-2">Recevied Date<i class="icon-sort"></i></th>
										<th class="col-lg-1">Item List<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">

									<%
										InboundDeliveryDao inboundDao = new InboundDeliveryDao();
										List<InboundDelivery> inboundList = inboundDao.getAll();
																	
										for (int i = 0; i < inboundList.size(); i++) {
									%>

									<tr>
										<td><%=i%></td>
										<td id="deliveryID"><%=inboundList.get(i).getId()%></td>
										<td><%=inboundList.get(i).getDonorName()%></td>
										<td><%=inboundList.get(i).getDonorType()%></td>
										<td><%=inboundList.get(i).getDateDelivered()%></td>
										<td><button class="btn btn-primary" data-toggle="modal"
												data-target="#myModal" id="viewList">View Item</button></td>
									</tr>
											<!-- Modal -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Donor by <%=inboundList.get(4).getDonorName()%></h4>
												</div>
												<div class="modal-body" id="itemList">
												
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">cancel delivery</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</form>
				

				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	$(document).ready(function(){
		$("#viewList").on('click', function(){
			var selectedValue =$("#add-list").children("deliveryID").text();
			alert(selectedId);
			$("#itemList").append('<table class="table table-hover table-striped tablesorter table-condensed"><thead><th class="col-lg-1">#<i class="icon-sort"></i></th><th class="col-lg-1">Product<i class="icon-sort"></i></th><th class="col-lg-1">Quantity<i class="icon-sort"></i></th><th class="col-lg-1">Expiry Date<i class="icon-sort"></i></th></thead><tbody><tr><td>1</td><td>muhaha</td><td>140</td></tr></tbody></table>');
		});
	});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->