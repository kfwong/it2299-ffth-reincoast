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

<!-- content -->
<div id="page-wrapper">
	<h1>Schedule <small>Food Drive</small></h1>
	<h3 class="text-center"><span class="glyphicon glyphicon-chevron-left"></span>January 2013<span class="glyphicon glyphicon-chevron-right"></span></h3>
	<table class="table table-hover table-striped table-bordered">
	<tr>
		<th>Week</th>
		<th>Day</th>
		<th>Location</th>
		<th>Quantity</th>
		<th>Status</th>
		<th>Date</th>
		<th>Notes</th>
	</tr>
	<tr>
		<td>1</td>
		<td>Monday</td>
		<td>Chua Chu Kang Primary School</td>
		<td>10</td>
		<td>KIV</td>
		<td>1 January 2013</td>
		<td>need small and medium plastic bags</td>
	</tr>
	
	<tr>
		<td>1</td>
		<td>Tuesday</td>
		<td>Ang Mo Kio Secondary School</td>
		<td>20</td>
		<td>OK</td>
		<td>2 January 2013</td>
		<td>need to check whether bulk or pack</td>
	</tr>
	
	<tr>
		<td>2</td>
		<td>Wednesday</td>
		<td>Yishun Primary School</td>
		<td>30</td>
		<td>OK</td>
		<td>10 January 2013</td>
		<td>need medium plastic bags</td>
	</tr>
	
	<tr>
		<td>2</td>
		<td>Thursday</td>
		<td>Wellington Secondary School</td>
		<td>40</td>
		<td>KIV</td>
		<td>11 January 2013</td>
		<td>need bulk</td>
	</tr>
	
	<tr>
		<td>3</td>
		<td>Friday</td>
		<td>Canberra Primary School</td>
		<td>50</td>
		<td>OK</td>
		<td>20 January 2013</td>
		<td>need pack</td>
	</tr>
	
	<tr>
		<td>4</td>
		<td>Monday</td>
		<td>Wellington Secondary School</td>
		<td>60</td>
		<td>OK</td>
		<td>21 January 2013</td>
		<td>need small and medium plastic bags</td>
	</tr>
	
	
	</table>

</div>
<!-- /content -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->