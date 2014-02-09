<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/datatables.css" name="css" />
</jsp:include>
<!-- header.jsp -->
<style>
.INBOUND{
background-color:rgb(91, 192, 222);
}

.OUTBOUND{
background-color:rgb(210, 50, 45);
}
</style>

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Audit" name="active" />
	<jsp:param value="Delivery Log" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<div class="page-header">
				<h1>
					Product Log
				</h1>
			</div>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Dashboard</li>
				<li class="active">Audit</li>
				<li class="active">Product log</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-12">
					<h4><label>Summary</label></h4>
					<p>Total of ${total} record(s). ${totalInsert } insert(s), ${totalUpdate } update(s), ${totalDelete } delete(s).</p>
				</div>
			</div>
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th class="col-lg-1">Operation</th>
						<th class="col-lg-1">Delivery Id</th>
						<th class="col-lg-1">Code</th>
						<th>Product Name<i class="icon-sort"></i></th>
						<th>Quantity</th>
						<th class="col-lg-3">Date Authored<i class="icon-sort"></i></th>
						<th class="col-lg-2">Options</th>
					</tr>
				</thead>
				<tbody id="tran-list">
					<c:forEach items="${audits}" var="audit">
					   <tr>
					   	<td><span class="badge ${audit.type}">${audit.type}</span></td>
					   	<td>${audit.id}</td>
					   	<td>${audit.code}</td>
					   	<td>${audit.name}</td>
					   	<td>${audit.quantity }</td>
					   	<td><i class="fa fa-calendar" title="${audit.date}" style="cursor:pointer;"></i>&nbsp;<span class="format-date">${audit.date}</span></td>
					   	<td><a href="AuditProductSnapshot?entityId=${audit.entity.id}&revisionId=${audit.revisionId}">View Snapshot</a></td>
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
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/jquery.dataTables.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/datatables-tabletools/2.1.5/js/TableTools.min.js" name="js" />
	<jsp:param value="js/datatables.js" name="js" />
</jsp:include>
<!-- footer.jsp -->
<script>
$(document).ready(function(){
	$('.format-date').each(function (id, element) {
		var date = parseInt($(element).text());
		$(element).text($.format.prettyDate(new Date(date)));
		console.log($(element).closest('td').children('i').attr('title', $.format.date(new Date(date), "dd MMM yyyy HH:mm:ss")));
	});
	
	$('.table').dataTable({
		"sDom": 'lf<"pull-right"T>rtip',
		"iDisplayLength": 30,
		"aLengthMenu": [ 30, 50, 100 ],
		"bSort" : false,
		"oTableTools": {
            "sSwfPath": "http://cdnjs.cloudflare.com/ajax/libs/datatables-tabletools/2.1.5/swf/copy_csv_xls_pdf.swf"
        }
	});
	
	$('.table').each(function(){
	    var datatable = $(this);
	    var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
	    search_input.attr('placeholder', 'Search');
	    search_input.addClass('form-control input-sm');
	    var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
	    length_sel.addClass('form-control input-sm');
	});
			
});
</script>
