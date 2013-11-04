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
			<h2>Item Database</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped tablesorter">
					<thead>
						<tr>
							<th>Page <i class="icon-sort"></i></th>
							<th>Visits <i class="icon-sort"></i></th>
							<th>% New Visits <i class="icon-sort"></i></th>
							<th>Revenue <i class="icon-sort"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>/index.html</td>
							<td>1265</td>
							<td>32.3%</td>
							<td>$321.33</td>
						</tr>
						<tr>
							<td>/about.html</td>
							<td>261</td>
							<td>33.3%</td>
							<td>$234.12</td>
						</tr>
						<tr>
							<td>/sales.html</td>
							<td>665</td>
							<td>21.3%</td>
							<td>$16.34</td>
						</tr>
						<tr>
							<td>/blog.html</td>
							<td>9516</td>
							<td>89.3%</td>
							<td>$1644.43</td>
						</tr>
						<tr>
							<td>/404.html</td>
							<td>23</td>
							<td>34.3%</td>
							<td>$23.52</td>
						</tr>
						<tr>
							<td>/services.html</td>
							<td>421</td>
							<td>60.3%</td>
							<td>$724.32</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
						</tr>
						<tr>
							<td>/blog/post.html</td>
							<td>1233</td>
							<td>93.2%</td>
							<td>$126.34</td>
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