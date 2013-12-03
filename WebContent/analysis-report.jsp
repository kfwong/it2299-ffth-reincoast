<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->3
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<div class="col-lg-3">
				<br>
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
						class="icon-collapse"></i> Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Beneficiary list</a></li>
						<li><a href="#">Donor List </a></li>
						<li><a href="#"> In-Kind Donation </a></li>
						<li><a href="#">Last Item</a></li>
						<%---<li class="divider"></li> ---%>
					</ul>
				</div>
			</div>
			<div class="col-lg-6">
				<ul class="nav nav-pills">
					<li><input type="image"
						src="<%=request.getContextPath()%>/img/report-bar-graph.png"
						alt="Bar Graph" width="60" height="60" class="btnBar"></li>
					<li><input type="image"
						src="<%=request.getContextPath()%>/img/report-curve-graph.png"
						alt="Curve Graph" width="60" height="60" class="btnLine"></li>
					<li><input type="image"
						src="<%=request.getContextPath()%>/img/report-pie-graph.png"
						alt="Pie Graph" width="60" height="60" class="btnPie"></li>
				</ul>

			</div>
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
			<h1 id=title>{title}</h1>
				<canvas id="bar" width="600" height="400"></canvas>
				<canvas id="pie" width="600" height="400"></canvas>
				<canvas id="line" width="600" height="400"></canvas>
			</div>
			<div class="col-lg-6">
				<canvas width="600" height="500"></canvas>
			</div>
			<div class="col-lg-3"></div>
			<div class="col-lg-6" id="btnSec">
			
				<button class="btn btn-primary" type="button" id="img">Export
					as image</button>
				<button class="btn btn-primary" type="button" id="pdf">Export
					as PDF</button>
					<button class="btn btn-primary" type="button" id="cvs">Export
					as cvs</button>
			
		</div>
			<div class="col-lg-3"></div>

		</div>



	</div>
	<!-- /.row -->

	<!--  Wrapper  -->
	<!-- sample-content.jsp -->

	<script>
		$(document).ready(function() {
			$("#title").hide();
			$("#img").hide();
			$("#pdf").hide();
			$("#cvs").hide();
			$("#pie").hide();
			$("#bar").hide();
			$("#line").hide();
			
			
			$(".btnPie").on("click", function() {

				$("#line").hide();
				$("#line").hide();		
				$("#pie").show();
				$("#img").show();
				$("#pdf").show();
				$("#cvs").show();
				$("#title").show();
			});

		});

		$(document).ready(function() {
			$("#img").hide();
			$("#cvs").hide();
			$("#pdf").hide();
			$("#pie").hide();
			$("#bar").hide();
			$("#line").hide();
			$("#title").hide();

			$(".btnBar").on("click", function() {
				$("#pie").hide();
				$("#line").hide();
				$("#cvs").show();
				$("#bar").show();
				$("#img").show();
				$("#pdf").show();
				$("#title").show();
			});

		});

		$(document).ready(function() {
			$("#img").hide();
			$("#pdf").hide();
			$("#cvs").hide();
			$("#pie").hide();
			$("#bar").hide();
			$("#line").hide();
			$("#title").hide();

			$(".btnLine").on("click", function() {
				$("#pie").hide();
				$("#line").show();
				$("#bar").hide();
				$("#img").show();
				$("#pdf").show();
				$("#cvs").show();
				$("#title").show();
			});

		});
	</script>
	<!-- footer.jsp -->

	<jsp:include page="footer.jsp">
		<jsp:param
			value="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"
			name="js" />
		<jsp:param value="js/Chart/myChart.js" name="js" />

	</jsp:include>

	<!-- footer.jsp -->