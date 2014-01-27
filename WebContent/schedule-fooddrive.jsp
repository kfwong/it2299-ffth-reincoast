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
			defaultDate: '2014-01-12',
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: '2014-01-01'
				},
				{
					title: 'Long Event',
					start: '2014-01-07',
					end: '2014-01-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-01-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-01-16T16:00:00'
				},
				{
					title: 'Meeting',
					start: '2014-01-12T10:30:00',
					end: '2014-01-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2014-01-12T12:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2014-01-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2014-01-28'
				}
			],
		
			dayClick: function(date, jsEvent, view) {
		        $(".delete-modal").modal();
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