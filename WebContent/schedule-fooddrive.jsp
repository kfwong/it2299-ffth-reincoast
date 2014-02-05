<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="js/fullcalendar/fullcalendar/fullcalendar.css" name="css" />
	<jsp:param value="css/schedules.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Schedule <small>Food Drive</small></h1>
	
	<!-- Modal -->
	<div class="modal create-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
			<form role="form" method="post" action="CalendarFoodDriveServlet">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Create event</h4>
		      </div>
		      <div class="modal-body">
				<div class="form-group">
				  <label for="title">Title</label>
				  <input type="text" class="form-control" id="title" name = "title" placeholder="Example: Serangoon S.C.C.">
				</div>
				<div class="form-group">

				  <input type="hidden" class="form-control" id="start" name = "start">
				</div>
				<div class="form-group">

				  <input type="hidden" class="form-control" id="end" name = "end">
				</div>
				<div class="checkbox">
				  <label>
				    <input type="checkbox" class="allDay" name ="allDay" value="allDay" checked="checked"> All day event
				  </label>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button type="submit" class="btn btn-primary confirm-create-button">Save</button>
		      </div>
			</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- Modal -->
	<div class="modal delete-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Delete events</h4>
	      </div>
	      <div class="modal-body">
	         <p>Are you sure you want to delete the records?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-primary confirm-delete-button">Confirm</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
	<div id='calendar'></div>
	<div class="clearfix"></div>
</div>
<!-- /content -->

<script>
	$(document).ready(function(){
		$('#calendar').fullCalendar({
			editable: true,
			allDayDefault: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			events: "CalendarFoodDriveServlet",
		
			dayClick: function(date, jsEvent, view) {
		        $(".create-modal").modal();
		        $("#start").val(date.format("YYYY-MM-DD"));
		        alert('Clicked on: ' + date.format("YYYY-MM-DD"));
		    },
		    
		    eventClick: function(calEvent, jsEvent, view) {
		        alert('Event: ' + calEvent.title);
		    }
		});
	});
</script>

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="js/fullcalendar/lib/moment.min.js" name="js" />
	<jsp:param value="js/fullcalendar/lib/jquery-ui.custom.min.js" name="js" />
	<jsp:param value="js/fullcalendar/fullcalendar/fullcalendar.js" name="js" />
</jsp:include>
<!-- footer.jsp -->