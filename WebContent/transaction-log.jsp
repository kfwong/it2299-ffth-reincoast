<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.it2299.ffth.reincoast.dao.InboundDeliveryDao, com.it2299.ffth.reincoast.dto.InboundDelivery, java.util.List, com.it2299.ffth.reincoast.dao.AuditDeliveryDao, com.it2299.ffth.reincoast.dto.AuditDelivery "%>
	
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
					<%
						InboundDeliveryDao deliveryList = new InboundDeliveryDao();
						List<InboundDelivery> list = deliveryList.getAll();
						AuditDeliveryDao adDao = new AuditDeliveryDao();
						AuditDelivery ad = new AuditDelivery();
						for(int i=0; i<list.size();i++){
							ad = adDao.get(list.get(i).getId());
					%>
						<tr>
							<td><%=(i+1) %></td>
							<td><%=list.get(i).getId() %></td>
							<td><%=ad.getMovementType() %></td>
							<td><%=list.get(i).getDateDelivered() %></td>
							<td><%=list.get(i).getDonorName() %></td>
							<td><%=list.get(i).getTotalPrice() %></td>
						</tr>
						<%
						}
						%>
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