<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/datatables.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Audit" name="active" />
	<jsp:param value="Product Log" name="sub-active" />
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
						<th class="col-lg-1">Code</th>
						<th>Product Name<i class="icon-sort"></i></th>
						<th class="col-lg-3">Date Authored<i class="icon-sort"></i></th>
						<th class="col-lg-2">Options</th>
					</tr>
				</thead>
				<tbody id="tran-list">
					<c:forEach items="${audits}" var="audit">
					   <tr>
					   	<td><span class="badge badge-${fn:toLowerCase(audit.operation) }">${audit.operation}</span></td>
					   	<td>${audit.entity.code}</td>
					   	<td>${audit.entity.name}</td>
					   	<td><i class="fa fa-calendar" title="${audit.date}" style="cursor:pointer;"></i>&nbsp;<span class="format-date"><fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ss" value="${audit.date}" /></span>&nbsp;<span style="color:#aaa;">authored by</span>&nbsp;${audit.entity.registeredBy }</td>
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
		$(element).text($.format.prettyDate($(element).text()));
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
