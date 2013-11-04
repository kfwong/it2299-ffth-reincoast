<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="vendors/morris/morris.css" name="css" />

	<jsp:param value="vendors/raphael-min.js" name="js" />
	<jsp:param value="vendors/morris/morris.min.js" name="js" />
</jsp:include>
<!-- header.jsp -->

<!-- sample-content.jsp -->
<div class="container-fluid">
	<div class="row-fluid">

		<!--/span-->
		<div class="span12" id="content">
			<div class="row-fluid">
				<div class="navbar">
					<div class="navbar-inner">
						<ul class="breadcrumb">
							<i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
							<i class="icon-chevron-right show-sidebar" style="display: none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
							<li><a href="#">Dashboard</a> <span class="divider">/</span></li>
							<li><a href="#">Settings</a> <span class="divider">/</span></li>
							<li class="active">Tools</li>
						</ul>
					</div>
				</div>
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Success</h4>
					The operation completed successfully
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="block" style="height: 200px;">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">To-do List</div>
							<div class="pull-right">
								<span class="badge badge-info">1,234</span>

							</div>
						</div>
						<div class="block-content collapse in">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</div>
					</div>
					<div class="block" style="height: 600px;">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Notice Board</div>
							<div class="pull-right">
								<span class="badge badge-info">1,234</span>

							</div>
						</div>
						<div class="block-content collapse in">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam
							littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</div>
					</div>
					<div class="block" style="height: 170px;">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Feedback</div>
							<div class="pull-right">
								<span class="badge badge-info">1,234</span>

							</div>
						</div>
						<div class="block-content collapse in">Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</div>
					</div>
				</div>
				<div class="span6">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Top Volunteer</div>
							<div class="pull-right">
								<span class="badge badge-info">1,234</span>

							</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Vincent</td>
										<td>Gabriel</td>
										<td>@gabrielva</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="block-content collapse in">
							<div id="hero-area" style="height: 250px;"></div>
						</div>
					</div>
					<!-- /block -->
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Stock Movement</div>
							<div class="pull-right">
								<span class="badge badge-info">17</span>

							</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Vincent</td>
										<td>Gabriel</td>
										<td>@gabrielva</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="block-content collapse in">
							<div id="hero-graph" style="height: 230px;"></div>
						</div>
					</div>
					<!-- /block -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- sample-content.jsp -->
<script>
	$(function() {
		// Easy pie charts
		var calendar = $('#calendar')
				.fullCalendar(
						{
							header : {
								left : 'prev,next',
								center : 'title',
								right : 'month,basicWeek,basicDay'
							},
							selectable : true,
							selectHelper : true,
							select : function(start, end, allDay) {
								var title = prompt('Event Title:');
								if (title) {
									calendar.fullCalendar('renderEvent', {
										title : title,
										start : start,
										end : end,
										allDay : allDay
									}, true // make the event "stick"
									);
								}
								calendar.fullCalendar('unselect');
							},
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}

							},
							editable : true,
							// US Holidays
							events : 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'

						});
	});

	$('#external-events div.external-event').each(function() {

		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title : $.trim($(this).text())
		// use the element's text as the event title
		};

		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex : 999999999,
			revert : true, // will cause the event to go back to its
			revertDuration : 0
		//  original position after the drag
		});

	});
	$(function() {
		// Easy pie charts
		$('.chart').easyPieChart({
			animate : 1000
		});
	});

	Morris.Area({
		element : 'hero-area',
		data : [ {
			period : '2010 Q1',
			iphone : 2666,
			ipad : null,
			itouch : 2647
		}, {
			period : '2010 Q2',
			iphone : 2778,
			ipad : 2294,
			itouch : 2441
		}, {
			period : '2010 Q3',
			iphone : 4912,
			ipad : 1969,
			itouch : 2501
		}, {
			period : '2010 Q4',
			iphone : 3767,
			ipad : 3597,
			itouch : 5689
		}, {
			period : '2011 Q1',
			iphone : 6810,
			ipad : 1914,
			itouch : 2293
		}, {
			period : '2011 Q2',
			iphone : 5670,
			ipad : 4293,
			itouch : 1881
		}, {
			period : '2011 Q3',
			iphone : 4820,
			ipad : 3795,
			itouch : 1588
		}, {
			period : '2011 Q4',
			iphone : 15073,
			ipad : 5967,
			itouch : 5175
		}, {
			period : '2012 Q1',
			iphone : 10687,
			ipad : 4460,
			itouch : 2028
		}, {
			period : '2012 Q2',
			iphone : 8432,
			ipad : 5713,
			itouch : 1791
		} ],
		xkey : 'period',
		ykeys : [ 'iphone', 'ipad', 'itouch' ],
		labels : [ 'iPhone', 'iPad', 'iPod Touch' ],
		lineWidth : 2,
		hideHover : 'auto',
		lineColors : [ "#81d5d9", "#a6e182", "#67bdf8" ]
	});

	var tax_data = [ {
		"period" : "2013-04",
		"visits" : 2407,
		"signups" : 660
	}, {
		"period" : "2013-03",
		"visits" : 3351,
		"signups" : 729
	}, {
		"period" : "2013-02",
		"visits" : 2469,
		"signups" : 1318
	}, {
		"period" : "2013-01",
		"visits" : 2246,
		"signups" : 461
	}, {
		"period" : "2012-12",
		"visits" : 3171,
		"signups" : 1676
	}, {
		"period" : "2012-11",
		"visits" : 2155,
		"signups" : 681
	}, {
		"period" : "2012-10",
		"visits" : 1226,
		"signups" : 620
	}, {
		"period" : "2012-09",
		"visits" : 2245,
		"signups" : 500
	} ];

	Morris.Line({
		element : 'hero-graph',
		data : tax_data,
		xkey : 'period',
		xLabels : "month",
		ykeys : [ 'visits', 'signups' ],
		labels : [ 'Visits', 'User signups' ]
	});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- footer.jsp -->