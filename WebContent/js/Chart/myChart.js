	/**************************************************/
		/* 				 myChart.js				*/
	/**************************************************/
	
	var countries= document.getElementById("countries").getContext("2d");
	new Chart(countries).Pie(pieData, pieOptions);
	
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