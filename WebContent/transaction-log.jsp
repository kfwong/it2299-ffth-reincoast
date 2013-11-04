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
			<h2>Transaction Log</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped tablesorter table-condensed">
					<thead>
						<tr>
							<th># <i class="icon-sort"></i></th>
							<th>T.Code <i class="icon-sort"></i></th>
							<th>Item Code</th>
							<th>Item Description</th>
							<th>Movement/Status <i class="icon-sort"></i></th>
							<th>Date <i class="icon-sort"></i></th>
							<th>Person <i class="icon-sort"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="warning">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-warning">Outbound Delivery</span>&nbsp;<span class="label label-info">Preparing</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="warning">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-warning">Outbound Delivery</span>&nbsp;<span class="label label-info">Scheduled</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="warning">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-warning">Outbound Delivery</span>&nbsp;<span class="label label-info">Dispatched</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="success">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-success">Inbound Delivery</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
						<tr class="danger">
							<td>1</td>
							<td>6000867531</td>
							<td>0320567846</td>
							<td>ANGRY BIRD CHOC FILLED BISCUITS</td>
							<td><span class="label label-danger">Cancellation</span></td>
							<td>13/07/2013</td>
							<td>John Smith</td>
						</tr>
					</tbody>
				</table>
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