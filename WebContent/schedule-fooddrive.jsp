<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="js/fullcalendar/fullcalendar/fullcalendar.css" name="css" />
	<jsp:param value="js/bootstrap-datetimepicker/jquery.datetimepicker.css" name="css" />
	<jsp:param value="js/chosen/chosen.css" name="css" />
	<jsp:param value="js/chosen/chosen-bootstrap.css" name="css" />
	<jsp:param value="css/schedules.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Schedules" name="active" />
	<jsp:param value="Food Drive Schedule" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Schedule <small>Food Drive</small></h1>
	<!-- Modal -->
	<div class="modal view-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
			<form role="form" method="post" action="CalendarFoodDriveServlet">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Event details</h4>
		      </div>
		      <div class="modal-body">
				<div class="form-group">
				  <label for="title">Title</label>
				  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
				</div>
				<div class="form-group">
				  <label for="contact">Contact</label>
				  	<select class="form-control contact" id="contact" name="contact">

					</select>
				</div>
				<div class="checkbox">
				    <label>
				      <input class="allDay" type="checkbox" name="allDay" value="true" checked> All day event
				    </label>
				</div>
				<div class="date">
					<div class="form-group">
						<label for="start-date">Start date</label>
					  	<input type="text" class="form-control start-date" id="start-date" required>
					</div>
				</div>
				<div class="date-time hide">
					<div class="form-group">
						<label for="start">Start time</label>
					  	<input type="text" class="form-control start" id="start" name = "start" required>
					  	<span class="add-on">
						  <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
						</span>
					</div>
					<div class="form-group">
						<label for="end">End time</label>
					  	<input type="text" class="form-control end" id="end" name = "end" required>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		     	<button type="button" class="btn btn-default pull-left delete-button">Delete</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button type="submit" class="btn btn-primary confirm-edit-button">Save</button>
		      </div>
		      <input type="hidden" name="action" value="edit"/>
		      <input type="hidden" class="id" name="id" value=""/>
			</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
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
				  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
				</div>
				<div class="form-group">
				  <label for="contact">Contact</label>
				  	<select class="form-control contact" id="contact" name="contact">

					</select>
				</div>
				<div class="checkbox">
				    <label>
				      <input class="allDay" type="checkbox" name="allDay" value="true" checked> All day event
				    </label>
				</div>
				<div class="date">
					<div class="form-group">
						<label for="start-date">Start date</label>
					  	<input type="text" class="form-control start-date" id="start-date" required>
					</div>
				</div>
				<div class="date-time hide">
					<div class="form-group">
						<label for="start">Start time</label>
					  	<input type="text" class="form-control start" id="start" name = "start" required>
					  	<span class="add-on">
						  <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
						</span>
					</div>
					<div class="form-group">
						<label for="end">End time</label>
					  	<input type="text" class="form-control end" id="end" name = "end" required>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button type="submit" class="btn btn-primary confirm-create-button">Save</button>
		      </div>
		      <input type="hidden" name="action" value="create"/>
			</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- Modal -->
	<div class="modal delete-modal bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	    	<form role="form" method="post" action="CalendarFoodDriveServlet">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Delete events</h4>
		      </div>
		      <div class="modal-body">
		         <p>Are you sure you want to delete the event?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button type="submit" class="btn btn-primary confirm-delete-button">Confirm</button>
		      </div>
		      <input type="hidden" name="action" value="delete"/>
		      <input class="id" type="hidden" name="id" value=""/>
	    	</form>
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
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			events: "CalendarFoodDriveServlet?action=getCalendar",
		
			dayClick: function(date, jsEvent, view) {
				
		        $(".create-modal").modal();
		        $(".start-date").val(date.format("YYYY-MM-DD"));
		        $(".start").val(date.format("YYYY-MM-DD HH:mm:ss"));
		        $(".end").val(date.add('days', 1).format("YYYY-MM-DD HH:mm:ss"));
		        
		        

		    },
		    
		    eventClick: function(calEvent, jsEvent, view) {
		    	$.ajax({
		    		type: "GET",
		    		url: "CalendarFoodDriveServlet?action=view&id=" + calEvent.id,
		    		success: function(json){
						$(".view-modal").modal();
						$(".id").val(json.id);
						$(".title").val(json.title);
						$(".start-date").val(moment(json.start).format("YYYY-MM-DD"));
						$(".start").val(json.start);
						$(".end").val(json.end);
						
						$('.contact option[value="' + json.contact.id + '"]').attr("selected", true);
						$('.contact').trigger("chosen:updated");
						
						if(json.allDay == true){
							$(".allDay").prop("checked", true);
							$(".date").removeClass("hide");
							$(".date-time").addClass("hide");
						}
						else{
							$(".allDay").prop("checked", false);
							$(".date-time").removeClass("hide");
							$(".date").addClass("hide");
						}	
		    		}
		    	});
		    },
		    
		    eventDrop: function(event, revertFunc) {
		    	$.ajax({
		    		type: "POST",
		    		url: "CalendarFoodDriveServlet",
		    		data: {
		    			action:"edit",
		    	        id: event.id,
		    	        title: event.title,
		    	        start: event.start.format("YYYY-MM-DD HH:mm:ss"),
		    	        end: event.end.format("YYYY-MM-DD HH:mm:ss"),
		    	        allDay:event.allDay,
		    	        contact:event.contact.id
		    	    }
		    	});

		    }
		});   
		
		$(".allDay").on("click", function(){
		  	$(".date, .date-time").toggleClass("hide");
		});
		
		$(".confirm-create-button, .confirm-edit-button").on("click", function(event){
		  	var button = event.target;
		  	var form = $(button).parents("form");
		  	var allDay = $(form).find(".allDay");
		  	var startDate = $(form).find(".start-date");
		  	var start = $(form).find(".start");
		  	var end  = $(form).find(".end");
		  	
		  	if(allDay.prop("checked")){
		  		var date = moment($(startDate).val());
		  		start.val(date.format("YYYY-MM-DD HH:mm:ss"));
		  		end.val(date.add('days', 1).format("YYYY-MM-DD HH:mm:ss"));
		  	}
		  	
		 	$(this).trigger("click");
		});
		
        $(".delete-button").on("click", function(){
        	$(".delete-modal").modal();
 
        });
        
        $('.delete-modal').on('show.bs.modal', function() {
        	$('.view-modal').css('filter', 'brightness(50%)');
            $('.view-modal').css('-webkit-filter', 'brightness(50%)');
            $('.view-modal').css('-moz-transition', 'brightness(50%)');
            $('.view-modal').css('-ms-transition', 'brightness(50%)');
            $('.view-modal').css('-o-transition', 'brightness(50%)');
        });
        
        $('.delete-modal').on('hide.bs.modal', function() {
        	$('.view-modal').css('filter', 'brightness(100%)');
        	$('.view-modal').css('-webkit-filter', 'brightness(100%)');
        	$('.view-modal').css('-moz-transition', 'brightness(100%)');
        	$('.view-modal').css('-ms-transition', 'brightness(100%)');
        	$('.view-modal').css('-o-transition', 'brightness(100%)');
        });
        
		$('.start-date').datetimepicker({
        	
            format:'Y-m-d',
            timepicker: false,
        }); 
        
        $('.start, .end').datetimepicker({
        	
            format:'Y-m-d H:i:s'
        });   
        
        $.ajax({
    		type: "GET",
    		url: "CalendarFoodDriveServlet?action=getContacts",
    		success: function(json){
		        
    			$.each(json, function(index, value){
    				 $(".contact").append('<option value="' +  value.id + '">' + value.name + ' (' + value.organization + ')' + '</option');
    			});
		       
				$('.contact').trigger("chosen:updated");
    		}
    	});
        
        $('.contact').chosen({
        	width: "100%"
        });
	});
</script>

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="js/fullcalendar/lib/moment.min.js" name="js" />
	<jsp:param value="js/fullcalendar/lib/jquery-ui.custom.min.js" name="js" />
	<jsp:param value="js/fullcalendar/fullcalendar/fullcalendar.js" name="js" />
	<jsp:param value="js/bootstrap-datetimepicker/jquery.datetimepicker.js" name="js" />
	<jsp:param value="js/chosen/chosen.jquery.js" name="js" />
</jsp:include>
<!-- footer.jsp -->