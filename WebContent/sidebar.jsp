<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard.jsp">REINCOAST</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav navbar-left navbar-user">
			<li class="active"><a href="dashboard.jsp"><i class="icon-dashboard"></i> Dashboard</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Item Management <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="item-database.jsp">Item Database</a></li>
					<li><a href="register-new-item.jsp">Register New Item</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Shipments <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="inbound-delivery.jsp">Inbound Delivery</a></li>
					<li><a href="#">Outbound Delivery</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Transaction <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="transaction-log.jsp">Transaction Log</a></li>
					<li><a href="#">Cancellation</a></li>
					<li><a href="transaction-overview.jsp">Transaction Overview</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Contacts <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Sponsors</a></li>
					<li><a href="#">Partners</a></li>
					<li><a href="#">Beneficiaries</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Schedules <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Self Collection Centers</a></li>
					<li><a href="#">Food Drive Schedule</a></li>
					<li><a href="#">Event Planner</a></li>
				</ul>
			</li>
			<li><a href="#"><i class="icon-dashboard"></i> Analysis Report</a></li>
			<li><a href="#"><i class="icon-dashboard"></i> Settings</a></li>
			
			<li class="dropdown messages-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-bell-alt"></i> Alerts <span class="badge">7</span> <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">Alerts</li>
					<li class="message-preview"><a href="#"> <span class="avatar"><img src="http://placehold.it/50x50"></span> <span class="name">John Smith:</span> <span class="message">Hey there, I wanted to ask you something...</span> <span class="time"><i class="icon-time"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li class="message-preview"><a href="#"> <span class="avatar"><img src="http://placehold.it/50x50"></span> <span class="name">John Smith:</span> <span class="message">Hey there, I wanted to ask you something...</span> <span class="time"><i class="icon-time"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li class="message-preview"><a href="#"> <span class="avatar"><img src="http://placehold.it/50x50"></span> <span class="name">John Smith:</span> <span class="message">Hey there, I wanted to ask you something...</span> <span class="time"><i class="icon-time"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">View Inbox <span class="badge">7</span></a></li>
				</ul></li>
			<li class="dropdown user-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> John Smith <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="icon-user"></i> Profile</a></li>
					<li><a href="#"><i class="icon-envelope"></i> Inbox <span class="badge">7</span></a></li>
					<li><a href="#"><i class="icon-gear"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-power-off"></i> Log Out</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>