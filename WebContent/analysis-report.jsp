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

	<div class="col-lg-12">

		
			<div class="col-lg-6">
		     <div class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Dropdown <b class="caret"></b></a>
		              <ul class="dropdown-menu">
		                <li><a href="#">Benificial list</a></li>
		                <li><a href="#">Donor List </a></li>
		                <li><a href="#"> In-Kind Donation </a></li>
		                <li><a href="#">Last Item</a></li>
		               <%---<li class="divider"></li> ---%> 
		              </ul>
		            </div>
			 </div>
			<div class="col-lg-6">
					<ul class="nav nav-pills">
		           
		                <li><a href="#"> <img src="<%=request.getContextPath()%>/img/report-bar-graph.png" title="Bar graph" alt="Bar Graph" width="60" height="60" /> </a></li>
		                <li><a href="#"> <img src="<%=request.getContextPath()%>/img/report-curve-graph.png" alt="Curve Graph" width="60" height="60" /></a></li>
		                <li><a href="#"> <img src="<%=request.getContextPath()%>/img/report-pie-graph.png" alt="Pie Graph" width="60" height="60" /></a></li>
		     
		               
		              </ul>
		           
			</div>
		</div>
		
		
		<div class ="col-lg-12">
			<canvas id="countries" width="600" height="400"></canvas>
			
         </div>

              
  
		


	</div>		

<!--  Wrapper  --> 
<!-- sample-content.jsp -->

<!-- footer.jsp -->

<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.js" name="js" />
	<jsp:param value="js/Chart/myChart.js" name="js" />

</jsp:include>
<!-- footer.jsp -->