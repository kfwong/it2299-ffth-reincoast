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
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div id="myPDF">
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="js/jspdf/adler32cs.js" name="js" />
	<jsp:param value="js/jspdf/deflate.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.addimage.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.autoprint.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.cell.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.from_html.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.ie_below_9_shim.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.javascript.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.sillysvgrenderer.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.split_text_to_size.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.standard_fonts_metrics.js" name="js" />
	<jsp:param value="js/jspdf/jspdf.plugin.total_pages.js" name="js" />
</jsp:include>
<!-- footer.jsp -->
<script>
$(document).ready(function(){
	demoFromHTML();
})
function demoFromHTML(){
	var pdf = new jsPDF();
	
	pdf.setFontSize(40);
	
	pdf.text(35, 25, "Paranyan loves jsPDF");
}

</script>