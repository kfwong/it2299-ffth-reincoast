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
				New Item <small>Registration</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html"><i class="icon-dashboard"></i> Dashboard</a></li>
				<li class="active"><i class="icon-edit"></i> Forms</li>
			</ol>
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				Visit <a class="alert-link" target="_blank" href="http://getbootstrap.com/css/#forms">Bootstrap's Form Documentation</a> for more information.
			</div>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-6">

			<form role="form">

				<div class="form-group">
					<label>Text Input</label> <input class="form-control">
					<p class="help-block">Example block-level help text here.</p>
				</div>

				<div class="form-group">
					<label>Text Input with Placeholder</label> <input class="form-control" placeholder="Enter text">
				</div>

				<div class="form-group">
					<label>Static Control</label>
					<p class="form-control-static">email@example.com</p>
				</div>

				<div class="form-group">
					<label>File input</label> <input type="file">
				</div>

				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3"></textarea>
				</div>

				<div class="form-group">
					<label>Checkboxes</label>
					<div class="checkbox">
						<label> <input type="checkbox" value=""> Checkbox 1
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" value=""> Checkbox 2
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" value=""> Checkbox 3
						</label>
					</div>
				</div>

				<div class="form-group">
					<label>Inline Checkboxes</label> <label class="checkbox-inline"> <input type="checkbox"> 1
					</label> <label class="checkbox-inline"> <input type="checkbox"> 2
					</label> <label class="checkbox-inline"> <input type="checkbox"> 3
					</label>
				</div>

				<div class="form-group">
					<label>Radio Buttons</label>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> Radio 1
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"> Radio 2
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3"> Radio 3
						</label>
					</div>
				</div>

				<div class="form-group">
					<label>Inline Radio Buttons</label> <label class="radio-inline"> <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked> 1
					</label> <label class="radio-inline"> <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2"> 2
					</label> <label class="radio-inline"> <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3"> 3
					</label>
				</div>

				<div class="form-group">
					<label>Selects</label> <select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>

				<div class="form-group">
					<label>Multiple Selects</label> <select multiple class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>

				<button type="submit" class="btn btn-default">Submit Button</button>
				<button type="reset" class="btn btn-default">Reset Button</button>

			</form>

		</div>
	</div>
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->