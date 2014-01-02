<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.it2299.ffth.reincoast.dto.Stock, com.it2299.ffth.reincoast.dao.StockDao, java.util.List, com.it2299.ffth.reincoast.dto.Product, com.it2299.ffth.reincoast.dao.ProductDao"%>


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
			<h2>Stock</h2>
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
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
									<th class="col-lg-1">#<i class="icon-sort"></i></th>
									<th class="col-lg-2">Product Name<i class="icon-sort"></i></th>
									<th class="col-lg-2">Product Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Product value<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
								<%
				StockDao stockDao = new StockDao();
				List<Stock> stockList = stockDao.getAll();
				for (int i = 0; i < stockList.size(); i++) {
					ProductDao productDao = new ProductDao();
					Product product = new Product();
					product = stockList.get(i).getProduct();
			%>

			<tr>
				<td><%= i %></td>
				<td><%=product.getName() %></td>
				<td><%=stockList.get(i).getQuantity() %></td>
				<td>$<%=product.getPrice() %></td>
			</tr>
			<tr>
			
			
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
	
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->