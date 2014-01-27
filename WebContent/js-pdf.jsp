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
			<h1>
				Dashboard <small>Statistics Overview</small>
			</h1>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Dashboard</li>
			</ol>
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				Welcome to SB Admin by <a class="alert-link" href="http://startbootstrap.com">Start Bootstrap</a>! Feel free to use this template for your admin needs! We are using a few different plugins to handle the dynamic tables and charts, so make sure you check out the necessary documentation links provided.
			</div>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<a href="javascript:demoFromHTML()" class="button">Run Code</a>
			<div id="testcase">
			  <h1>  
			      Lorem Ipsum
			 </h1>
			 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			<table id="the-table">
                <thead>
                    <tr>    
                        <th>ID</th>
                        <th>NAME</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Jack Sparrow</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Barracks Obama</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Harry Potter</td>
                    </tr>               
                </tbody>
              </table>
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
function demoFromHTML() {

	var pdf = new jsPDF('p','pt','a4', true);

	var source = $('#testcase')[0];  // This is your HTML Div to generate pdf
	
	var specialElementHandlers = {
	
	    '#bypassme': function(element, renderer){
	        return true
	    }
	};
	
	// Generate from HTML	
	pdf.fromHTML(
	    source, // HTML string or DOM elem ref.
		15, // x coord
	    15, // y coord
	    {
	    	'width':565, // max width of content on PDF
	        'elementHandlers': specialElementHandlers
	    }
	);

	//Create table
	var table = tableToJson($('#the-table').get(0))
	pdf.cellInitialize();
	pdf.setFontSize(8);
	$.each(table, function (i, row){
	  $.each(row, function (j, cell){
		  if(j == "id"){
			  pdf.cell(15, 150, 50, 15, cell, i); //x, y, width, height, txt,
		  }else{
			  pdf.cell(15, 150, 150, 15, cell, i); 
		  }
	  })
	});

	// Add image
	var imgData = 'data:image/jpeg;base64,'+ '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';
	pdf.addImage(imgData, 'JPEG', 15, 300, 150, 50);
	
	pdf.output('dataurl')

	
}



function tableToJson(table) {
    var data = [];

    // first row needs to be headers
    var headers = [];
    for (var i=0; i<table.rows[0].cells.length; i++) {
        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
    }

    // go through cells
    for (var i=1; i<table.rows.length; i++) {

        var tableRow = table.rows[i];
        var rowData = {};

        for (var j=0; j<tableRow.cells.length; j++) {

            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

        }

        data.push(rowData);
    }       

    return data;
}


</script>