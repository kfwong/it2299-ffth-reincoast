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
		<ul class="nav navbar-nav side-nav">
			<li class="active"><a href="dashboard.jsp"><i class="icon-dashboard"></i> Dashboard</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Item Management <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="item-database.jsp">Item Database</a></li>
					<li><a href="register-new-item.jsp">Register New Item</a></li>
					<li><a href="#">Category</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Shipments <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="inbound-delivery.jsp">Inbound Delivery</a></li>
					<li><a href="#">Outbound Delivery</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Stocktake <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Print Count Sheet</a></li>
					<li><a href="#">Enter Count</a></li>
					<li><a href="#">Display Inventory Differences</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Transaction <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="transaction-log.jsp">Transaction Log</a></li>
					<li><a href="#">Cancellation</a></li>
					<li><a href="transaction-overview.jsp">Transaction Overview</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Manpower Management <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Volunteer</a></li>
					<li><a href="#">Staff</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Contacts <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Volunteers</a></li>
					<li><a href="#">Sponsors</a></li>
					<li><a href="#">Partners</a></li>
					<li><a href="#">Beneficiaries</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> Planner <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Self Collection Centers</a></li>
					<li><a href="#">Food Drive Schedule</a></li>
					<li><a href="#">Event Planner</a></li>
				</ul>
			</li>
			<li><a href="#"><i class="icon-dashboard"></i> Analysis Report</a></li>
			<li><a href="#"><i class="icon-dashboard"></i> Damage & Disposal</a></li>
			<li><a href="#"><i class="icon-dashboard"></i> Feedbacks</a></li>
			<li><a href="#"><i class="icon-dashboard"></i> Settings</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-collapse"></i> SAMPLES <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="charts.html"><i class="icon-bar-chart"></i> Charts</a></li>
					<li><a href="tables.html"><i class="icon-table"></i> Tables</a></li>
					<li><a href="forms.html"><i class="icon-edit"></i> Forms</a></li>
					<li><a href="typography.html"><i class="icon-font"></i> Typography</a></li>
					<li><a href="bootstrap-elements.html"><i class="icon-desktop"></i> Bootstrap Elements</a></li>
					<li><a href="bootstrap-grid.html"><i class="icon-wrench"></i> Bootstrap Grid</a></li>
					<li><a href="blank-page.html"><i class="icon-file-alt"></i> Blank Page</a></li>
				</ul>
			</li>
		</ul>

		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown messages-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-envelope"></i> Messages <span class="badge">7</span> <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">7 New Messages</li>
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
			<li class="dropdown alerts-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-bell-alt"></i> Alerts <span class="badge">3</span> <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Default <span class="label label-default">Default</span></a></li>
					<li><a href="#">Primary <span class="label label-primary">Primary</span></a></li>
					<li><a href="#">Success <span class="label label-success">Success</span></a></li>
					<li><a href="#">Info <span class="label label-info">Info</span></a></li>
					<li><a href="#">Warning <span class="label label-warning">Warning</span></a></li>
					<li><a href="#">Danger <span class="label label-danger">Danger</span></a></li>
					<li class="divider"></li>
					<li><a href="#">View All</a></li>
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