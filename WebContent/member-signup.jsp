<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->



<!-- sample-content.jsp -->
<div id="page-wrapper">
<form id="MSU" class="Member_SignUp" method="post" action="MemberSignUpServlet"> 

		<div class="row">
		<div class="col-lg-5 col-lg-offset-3 ">
			<h2>MEMBER SIGNUP HERE</h2>
			

				<div class="form-group">

					<!--------------------------------------NAME -------------------------------------------->
					<div class="row">
						<label for="Name">Name </label> <input type="text"
							class="form-control" placeholder="Name" name="Name"
							id="Name" required autofocus>
					</div>
					<!--------------------------------------NRIC -------------------------------------------->
					<div class="row">
						<label for="NRIC">NRIC</label> <input type="text"
							class="form-control" placeholder="NRIC" name="NRIC" id="NRIC"
							required autofocus>
					</div>

					<!--------------------------------------GENDER -------------------------------------------->
					<div class="row">
						<label for="Gender">Gender</label> <br>
						<div class="radio-inline">
							<label> <input type="radio" name="Gender" id="Male"
								value="Male"> Male
							</label>
						</div>
						<div class="radio-inline">
							<label> <input type="radio" name="Gender" id="Female"
								value="Female">Female
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<!--------------------------------------Contact Number -------------------------------------------->
					<div class="row">
						<label for="Contact_No">Contact No</label> <input type="text"
							class="form-control" placeholder="Contact Number" name="Tel"
							id="Tel" required autofocus>
					</div>
					<!--------------------------------------EMAIL  -------------------------------------------->
					<div class="row">
						<label for="Email">Email</label> <input type="text"
							class="form-control" placeholder="Email" name="Email" id="Email"
							required autofocus>
					</div>
					<!--------------------------------------Address  -------------------------------------------->
					<div class="row">

						<label for="Address">Address </label> <input type="text"
							class="form-control" placeholder="Mailing Address" name="Address"
							id="Address" required autofocus>

					</div>
					<div class="row">
						<label for="PostalCode">Postal Code </label> <input type="text"
							class="form-control" placeholder="Postal Code" name="PostalCode"
							id="PostalCode" required autofocus>
					</div>
					<br>
				</div>
				<div class="form-group">
					<!--------------------------------------UserName -------------------------------------------->
					<div class="row">
						<label for="Username">Username</label> <input type="text"
							class="form-control" placeholder="Username" name="Username"
							id="Username" required autofocus>
					</div>

				<br> <br> <br>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">
			SIGN UP</button>
		<small>*Password for staff will be their NRIC</small> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> </div>


		</div>
	</form>
		</div>

	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	
	<script type="text/javascript">
$('#MSU').validate({
	rules: {
			Tel : {
				number : true,
				maxlength : 8,
				minlength : 8,

			},

			NRIC : {
				maxlength : 9,
				minlength : 9,
			},

			PostalCode : {
				maxlength : 6,
				minlength : 6,
			},
		}

	
	});

</script>