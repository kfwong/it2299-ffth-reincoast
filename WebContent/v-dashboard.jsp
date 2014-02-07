<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>
@media (max-width:768px) {
	body {
  		margin-top: 20px;
  		
	}
	
	#page-wrapper {
		width: 100%;
 		padding: 60px 15px 150px 15px;
	}
	#footer{

	padding:20px 0px 15px 20px;
	background-color: #FFFFFF;
	color:black;
	font-size:11px;
	position:absolute;
	width:100%;
	bottom: 0px;
	height:120px;
}
	
}
</style>
</head>
<body>

	<!-- sidebar.jsp -->
	<jsp:include page="v-sidebar.jsp"></jsp:include>
	<!-- sidebar.jsp -->

	<!-- sample-content.jsp -->
	<div id="page-wrapper">
=
	 <!-- sample-content.jsp -->
	<div id="footer">
		<p>
			An NYP semetral project for the awesome <a
				href="http://www.foodheart.org/">Food from the Heart</a>. Designed
			and built with all the love in the world by <a
				href="mailto:124465r@mymail.nyp.edu.sg">Kang Fei</a>, Fuh Chang, Zi
			Min & Xin Shen.
		</p>
		<p>
			Code licensed under <a href="http://opensource.org/licenses/MIT">MIT
				License</a>.
		
	</div>
	</div>
	

	<script src="js/bootstrap.js"></script>
	<script src="js/tablesorter/jquery.tablesorter.js"></script>
	<script src="js/tablesorter/tables.js"></script>

</body>
</html>