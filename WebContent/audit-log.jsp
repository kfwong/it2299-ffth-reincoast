<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<div class="page-header">
				<h1>
					Audit Log
				</h1>
			</div>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Dashboard</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="table-responsive">
				<table class="table table-hover table-striped tablesorter table-condensed">
					<thead>
						<tr>
							<th># <i class="icon-sort"></i></th>
							<th>Description<i class="icon-sort"></i></th>
							<th>Movement Type<i class="icon-sort"></i></th>
							<th>Date Audited<i class="icon-sort"></i></th>
						</tr>
					</thead>
					<tbody id="tran-list">
						<c:forEach items="${audits}" var="audit">
						   <tr>
						   	<td>${audit.id}</td>
						   	<td>${audit.description}</td>
						   	<td><span class='label label-info'>${audit.movementType}</span></td>
						   	<td>${audit.dateAudited}</td>
						   </tr>
						</c:forEach>
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