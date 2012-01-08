<html>
<head>
    <title>Franklins 13 App</title>
    <meta name="layout" content="main" />

</head>

<body>

	
<div class="content welcome">
		
	<g:if test="${flash.message}">
		<p class="message error">${flash.message}</p>
	</g:if>
	
	<h1>Does living the "right" way make a difference?</h1>
	
	<div class="franklin"></div>
	
	
	<p class="large welcome">
		Will we be happier or more satisfied if we follow principles that are simple yet require us to be thoughtful, disciplined & hard working?
	</p>
	
	<p class="large welcome">
		Based on Ben Franklin's 13 Virtues, Franklin's 13+ might help us answer that question...
	</p>
	
	<h1>Leaderboard</h1>
	
	<ul>
	<g:each in="${leaderBoard}" status="i" var="user">
		<g:if test="${user.totalScore != 0}">
			<li>${user.username} -> ${user.totalScore}</li>		
		</g:if>	
	</g:each>
	</ul>
	
	<div class="welcomelinks">
		<a href="#" class="button blue large" title="Franklins 13+ : About the Experiment">About the Experiment</a>
		<a href="#" class="button green large" title="Franklins 13+ : Join the Experiment">Join the Experiment</a>			
	</div>	
	
	<div id="basechart" style="width:100%; height:300px; position:relative"></div>
	
	
	
	
</div>

	
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/flot/', 'flot.js')}"></script>

	<script type="text/javascript">

	$(function () {

		// var virtue = ${virtues}
		// var d5 = ${happiness}
		
		var virtueSeries = {
	    	color: '#11eb53',
	    	data: ${virtues},
	    	label: "Virtues Followed = 0",
	    	// clickable: true,
			points: {
				show: false,
			    radius: 2,
			    symbol: "circle"
			},
	    	hoverable: true,
	    	shadowSize: 3
	  	};
		
		
		var happinessSeries = {
	    	color: '#0F5D7E',
	    	data: ${happiness},
	    	label: "Happiness/Satisfaction = 0",
	    	// clickable: true,
			points: {
				show : false,
			    radius: 2,
			    symbol: "circle"
			},
	    	hoverable: true,
	    	shadowSize: 3
	  	};
	
	    var stack = 0, bars = false, lines = true, steps = false;

	    //function plotWithOptions() {
	    var plot = $.plot($("#basechart"), 
				[ 
					virtueSeries, 
					happinessSeries 
				], 
				{
	            series: {
	               // stack: stack,
	                lines: { 
						show: lines, 
						fill: false,
						lineWidth: 2
					},
					points: {
				      radius: 3,
				      symbol: "circle"
				    },
					shadowSize: 3
	            },
				//colors: [ '#11eb53','#0F5D7E' ],
				grid: {
			    	show: true,
			    	aboveData: false,
			    	color: "#777",
			    	backgroundColor: "#fff",
			    	labelMargin: 10,
			    	axisMargin: 10,
			    	//markings: array of markings or (fn: axes -> array of markings)
			    	borderWidth: 1,
			    	borderColor: "#e3e3e3",
			    	minBorderMargin: 10,
			    	clickable: true,
			    	hoverable: true,
			    	autoHighlight: true,
			    	mouseActiveRadius: 10
			  	},
				
				legend: {
			    	show: true,
			    	labelBoxBorderColor: "#efefef",
			    	//noColumns: number
			    	position: "ne",
			    	margin: [10, 10],
			    	backgroundColor: "#f8f8f8",
			    	backgroundOpacity: 1.0
			  	},
			
				xaxis : {
				    show: true,
				    position: "bottom",
				    
					color: "#ddd",
				    tickColor: "#efefef",
				

				    tickSize: 50,
				    minTickSize: 5
				},
				
				yaxis : {
					show : true,
					position: "left",
					
					color: "#efefef",
					tickColor : "#f8f8f8",
					min:0,
					max:13,
					tickSize :5
				},
				
				crosshair: { mode: "x" }
			
	        });
	    // }
	
	
	    var legends = $("#basechart .legendLabel");
	    legends.each(function () {
	        // fix the widths so they don't jump around
	        $(this).css('width', $(this).width());
	    });
	    // plotWithOptions();

	    var updateLegendTimeout = null;
	    var latestPosition = null;

		function updateLegend() {
	        updateLegendTimeout = null;

	        var pos = latestPosition;

	        var axes = plot.getAxes();
	        if (pos.x < axes.xaxis.min || pos.x > axes.xaxis.max ||
	            pos.y < axes.yaxis.min || pos.y > axes.yaxis.max)
	            return;

	        var i, j, dataset = plot.getData();
	        for (i = 0; i < dataset.length; ++i) {
	            var series = dataset[i];

	            // find the nearest points, x-wise
	            for (j = 0; j < series.data.length; ++j)
	                if (series.data[j][0] > pos.x)
	                    break;

	            // now interpolate
	            var y, p1 = series.data[j - 1], p2 = series.data[j];
	            if (p1 == null)
	                y = p2[1];
	            else if (p2 == null)
	                y = p1[1];
	            else
	                y = p1[1] + (p2[1] - p1[1]) * (pos.x - p1[0]) / (p2[0] - p1[0]);

	            legends.eq(i).text(series.label.replace(/=.*/, "= " + y.toFixed(2)));
	        }
	    }
	
	    $("#basechart").bind("plothover",  function (event, pos, item) {
			//console.log('position -> ' + pos);
	        latestPosition = pos;
	        if (!updateLegendTimeout)
	            updateLegendTimeout = setTimeout(updateLegend, 50);
	    });
	
	
	
	});




		// 
		// 	$(document).ready(function(){
		// 		
		// 		

				// var datalines = '2011/10/17 13:08:31,558.0606399999997,665.3119,-136.46310000000085\n';
				// datalines += '2011/10/17 13:16:04,552.9481400000004,664.5175,-137.0625\n'
				// datalines += '2011/10/17 13:23:40,550.5393800000002,665.4069,-137.12247999999818\n'
				// datalines += '2011/10/17 13:31:10,557.7824999999993,664.14752,-137.61248000000342\n'
				// datalines += '2011/10/17 13:38:40,553.9875200000006,664.7394,-137.5593599999993\n'
				// datalines += '2011/10/17 13:46:19,557.8550200000009,665.53126,-136.73309999999765\n'
				// datalines += '2011/10/17 13:53:51,557.8156199999994,664.48188,-136.48122000000149\n'
				// datalines += '2011/10/17 14:01:30,556.5062799999996,666.99374,-136.09937999999966\n'
				// datalines += '2011/10/17 14:09:02,558.8081399999992,665.94816,-135.97810000000027\n'
				// datalines += '2011/10/17 14:16:34,555.6975000000002,664.9594,-136.58873999999923\n'
				// datalines += '2011/10/17 14:24:13,560.2381399999995,666.2094,-135.68059999999969\n'
				// datalines += '2011/10/17 14:31:48,561.2831399999995,666.78126,-135.18686000000162\n'
				// datalines += '2011/10/17 14:39:20,556.6149999999998,666.2969,-135.40497999999934\n'
				// datalines += '2011/10/17 14:46:57,556.8681400000005,667.57064,-134.94872000000032';

				// 	 	g30 = new Dygraph(
				// 	document.getElementById('basechart'), 
				// 	graphdata,
				// 	{
				// 		//visibility: [hDisplayed, dDisplayed, zDisplayed],
				// 		gridLineColor: '#DDDDDD',
				// 	    highlightCircleSize: 3,
				// 		pointSize: 1,
				// 	    strokeWidth: 2,               
				// 		labelsDivWidth: 130,
				// 		axisLabelFontSize: 8,
				// 		// labels: ["Date", "Satisfaction", "Another", "yet another"],  	  
				// 	        
				// 		labelsDivStyles: {
				// 		 	'background-color': 'efefef',
				// 			'top': '0px',
				// 		 	'left':'60px',
				// 		 	'padding':'3px',
				// 		 	'fontSize':'10px',
				// 		 	'opacity':'0.9',
				// 		 	'lineHeight':'1.4em'
				// 		},
				// 		
				// 		drawPoints: true,
				// 		includeZero: true,
				// 		//pixelsPerXLabel: 200,
				// 		//pixelsPerYLabel: 150,
				// 	    
				// 		//dateWindow: [Date.parse(start_date_time), Date.parse(end_date_time)],	
				// 		// colors: ['#ff3b1c','#11eb53','#0F5D7E'],
				// 		
				// 		colors: ['#11eb53','#0F5D7E'],
				// 		labelsSeparateLines: true
				// 		
				// 	    //valueRange: [ (defined_nano*(-1)),defined_nano]
				// 	
				// 	}
				// 	
				// );

		// 	});
		// 

	</script>





</body>
</html>
