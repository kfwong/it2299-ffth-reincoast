	/**************************************************/
		/* 				 myChart.js				*/
	/**************************************************/
	
	/***********************pie***************************/
	

	var pie = $("#pie").get(0).getContext("2d");
	var pieData = [
		           	{
		           		value: 20,
		           		color:"#878BB6"
		           	},
		           	{
		           		value : 40,
		           		color : "#4ACAB4"
		           	},
		           	{
		           		value : 10,
		           		color : "#FF8153"
		           	},
		           	{
		           		value : 30,
		           		color : "#FFEA88"
		           	}
		           ];


       var pieOptions = {
       	segmentShowStroke : false,
       	animateScale : true
       };
	var theChart = new Chart(pie).Pie(pieData, pieOptions);
	

	/***************************Bar**********************/
	var bar = $("#bar").get(0).getContext("2d");
	var bardata = {
			labels : ["January","February","March","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					data : [65,59,90,81,56,55,40]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					data : [28,48,40,19,96,27,100]
				}
			]
	};
	var barOptions ={};
	 new Chart(bar).Bar(bardata,barOptions);
	
		/***************************Bar**********************/
	
	var line = $("#line").get(0).getContext("2d");
	var linedata = {
			labels : ["January","February","March","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : [65,59,90,81,56,55,40]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : [28,48,40,19,96,27,100]
				}
			]
		};
	var lineOptions={};
	new Chart(line).Line(linedata, lineOptions);

	
	