<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List, com.it2299.ffth.reincoast.dao.*, com.it2299.ffth.reincoast.dto.*"%>
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
				<div class="page-header">
					<h1>
						Product <small>Edit</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Member Database</li>
					
				</ol>
			</div>
		<div class="col-lg-12">
			<%
				VolunteerDao volunteerdao = new VolunteerDao();
				MemberDao dao = new MemberDao();
				List<Volunteer> volunteerlist;
				volunteerlist = volunteerdao.getAll();
			%>
			
			
					<table class="table table-striped">
					 <thead>  
          <tr>
						<th>Name</th>
						<th>NRIC</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Address</th>
						<th>Contact number</th>

					</tr>  
        </thead>
    
			<% 
			for(int i =0;i<volunteerlist.size();i++){
			%>
			<tr>	
				<td><%=volunteerlist.get(i).getName() %> </td>
				<td><%=volunteerlist.get(i).getNric()%> </td>
				<td><%=volunteerlist.get(i).getGender() %> </td>
				<td><%=volunteerlist.get(i).getEmail()%> </td>
				<td><%=volunteerlist.get(i).getAddress() %>  <%=volunteerlist.get(i).getPostalCode()%></td>
				<td><%=volunteerlist.get(i).getTel()%> </td>
				
			</tr>
			<tr></tr>
			<%
			}
			
			
			%>
		</table>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->