<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard.jsp" style="width:200px;background-color:#222222;"><img src="img/logo-150x50.jpg"/></a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<strong>
			<small>
				<ul class="nav navbar-nav navbar-user side-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> kfwong <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="MemberViewProfileServlet">View Profile</a></li>
							<li><a href="MemberSignOutServlet">Sign Out</a></li>
						</ul>
					</li>
					<li class="active"><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-briefcase"></i> Product Management <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="ProductSearchServlet?">Product Database</a></li>
							<li><a href="ProductRegistrationServlet">New Product</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-truck"></i> Delivery <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="inbound-delivery.jsp">Inbound Delivery</a></li>
							<li><a href="outbound-delivery.jsp">Outbound Delivery</a></li>
							<li><a href="GetInboundDeliveryListServlet">Inbound Delivery Record</a></li>
							<li><a href="GetOutboundDeliveryServlet">Outbound Delivery Record</a></li>
							<li><a href="GetStockServlet?page=1">Inventory</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-paste"></i> Audit <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="transaction-overview.jsp">Overview</a></li>
							<li><a href="AuditProductLog">Product Log</a></li>
							<li><a href="transaction-log.jsp">Delivery Log</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-group"></i> Contacts <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="ContactServlet?type=individual">Donors - Individual</a></li>
							<li><a href="ContactServlet?type=corporate">Donors - Corporate</a></li>
							<li><a href="ContactServlet?type=school">Beneficiaries - School</a></li>
							<li><a href="ContactServlet?type=scc">Beneficiaries - S.C.C.</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> Schedules <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Self Collection Centers</a></li>
							<li><a href="schedule-fooddrive.jsp">Food Drive Schedule</a></li>
							<li><a href="#">Event Planner</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-tasks"></i> Analysis Report</a></li>
				</ul>
			</small>
		</strong>
	</div>
	<!-- /.navbar-collapse -->
</nav>
<script>
$(document).ready(function(){	
	$('.nav > li > a').each(function(index){
		if($(this).text().trim() == "<%=request.getParameter("active")%>"){
			$(this).parent().on('hide.bs.dropdown', function () {
			    return false;
			});
			$(this).parent().addClass("active open");
			
			$(this).parent().find('ul > li > a').each(function(index){
				if($(this).text().trim() == "<%=request.getParameter("sub-active")%>"){
					$(this).parent().addClass("sub-active");
				}else{
					$(this).parent().removeClass("sub-active");
				}
			});
		}else{
			$(this).parent().removeClass("active open");
		}
	});
});
</script>