<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--  V-navigation Bar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard.jsp" style="width:200px;background-color:#222222;"><img src="img/logo-150x50.jpg"/></a>
	</div>

            <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
                <strong><br>
                
                <ul class="nav navbar-nav navbar-right">
                <li class="fa fa-calendar"><a href="v-schedule-eventplanner.jsp">Event Calendar</a>
                    </li>
                    <li class="fa fa-user"><a href="VolunteerViewProfileServlet"> ${current_user.name}</a>
                    </li>
                    
                    <li class="fa fa-power-off"><a href="MemberSignOutServlet">SIGN OUT </a>
                    </li>
				 </ul>
                 </strong>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
       <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/logo-nav.css" rel="stylesheet">