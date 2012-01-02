<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />

	    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
		
        <title>Franklins 13 : Log Todays Entry</title>
    </head>
    
	<body>
		<style type="text/css">

		.virtueDefinitions{
			float:left;
			width:300px;
			margin:10px 30px;
			padding:15px;
			background:#f8f8f8;
			border:solid 1px #efefef;
		}
		
		h3{
			font-weight:bold;
			font-size:12px;
		}

		</style>
    
	 	<g:if test="${flash.message}">
	 		<p class="message error">${flash.message}</p>
	 	</g:if>
	 	
		<h2>Dashboard</h2>
		
		<p class="large">How does your progress look?  Do you see a trend?</p>
	 	<div id="progress" style="width:100%; height:270px;"></div>

		<h2>Stats</h2>
		<h3 style="text-align:center">Total Score : ${session.totalScore}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Entries : ${session.totalEntries}</h3>
		<div class="virtueDefinitions personVirtues">
			<h3>Personal Virtues</h3>
			<p>Temperance : <em>${virtuesSummaryMap.temperance}</em> - <em>${temperancePercent}</em></p>
			<p>Order : <em>${virtuesSummaryMap.orderVirtue}</em> - <em>${orderVirtuePercent}</em></p>
			<p>Resolution : <em>${virtuesSummaryMap.resolution}</em> - <em>${resolutionPercent}</em></p>
			<p>Frugality : <em>${virtuesSummaryMap.frugality}</em> - <em>${frugalityPercent}</em></p>
			<p>Moderation : <em>${virtuesSummaryMap.moderation}</em> - <em>${moderationPercent}</em></p>
			<p>Industry : <em>${virtuesSummaryMap.industry}</em> - <em>${industryPercent}</em></p>
			<p>Cleanliness : <em>${virtuesSummaryMap.cleanliness}</em> - <em>${cleanlinessPercent}</em></p>
			<p>Tranquility : <em>${virtuesSummaryMap.tranquility}</em> - <em>${tranquilityPercent}</em></p>
			<br />
		</div>
		
		<div class="virtueDefinitions socialVirtues">			
			<h3>Social Virtues</h3>
			<p>Silence : <em>${virtuesSummaryMap.silence}</em> - <em>${silencePercent}</em></p>
			<p>Sincerity : <em>${virtuesSummaryMap.sincerity}</em> - <em>${sincerityPercent}</em></p>
			<p>Justice : <em>${virtuesSummaryMap.justice}</em> - <em>${justicePercent}</em></p>
			<p>Chastity : <em>${virtuesSummaryMap.chastity}</em> - <em>${chastityPercent}</em></p>
			<p>Humility : <em>${virtuesSummaryMap.humility}</em> - <em>${humilityPercent}</em></p>
			
		</div>
		
		<div class="virtueDefinitions socialVirtues">
			<h3>+ Modern Day Personal Virtue</h3>
			<p>Well Being : <em>${virtuesSummaryMap.wellBeing}</em> - <em>${wellBeingPercent}</em></p>
		</div>
	
		
		<br class="clear"/>
	 	
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/flot/', 'flot.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/util/', 'utilities.js')}"></script>

	<script type="text/javascript">

	function roundNumber(num, dec) {
		var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
		return result;
	}
	
	$(function () {

		var virtues = ${virtues};
		var happiness = ${happiness};
		var scores = ${scores};

		console.log(virtues);
		
		if(happiness && virtues){
		var virtueSeries = {
	    	color: '#11eb53',
	    	data: virtues,
	    	label: "Virtues Followed",
	    	// clickable: true,
			points: {
				show: true,
			    radius: 2,
			    symbol: "circle"
			},
	    	hoverable: true,
	    	shadowSize: 3
	  	};


		var happinessSeries = {
	    	color: '#0F5D7E',
	    	data: happiness,
	    	label: "Happiness/Satisfaction",
	    	// clickable: true,
			points: {
				show : true,
			    radius: 2,
			    symbol: "circle"
			},
	    	hoverable: true,
	    	shadowSize: 3
	  	};

		var scoresSeries = {
	    	color: '#C8330F',
	    	data: scores,
	    	label: "Score",
	    	// clickable: true,
			points: {
				show : true,
			    radius: 2,
			    symbol: "circle"
			},
			clickable : true,
	    	hoverable: true,
	    	shadowSize: 3
	  	};
	
	    var stack = 0, bars = false, lines = true, steps = false;

	    //function plotWithOptions() {
	    var plot = $.plot($("#progress"), 
				[ 
					virtueSeries, 
					happinessSeries,
					scoresSeries 
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
				      radius: 1,
				      symbol: "circle"
				    },
					shadowSize: 3
	            },
				//colors: [ '#11eb53','#0F5D7E' ],
				grid: {
			    	show: true,
			    	aboveData: false,
			    	color: "#ddd",
			    	backgroundColor: "#fff",
			    	labelMargin: 10,
			    	axisMargin: 10,
			    	//markings: array of markings or (fn: axes -> array of markings)
			    	borderWidth: 1,
			    	borderColor: "#efefef",
			    	minBorderMargin: 10,
			    	clickable: true,
			    	hoverable: true,
			    	autoHighlight: true,
			    	mouseActiveRadius: 10
			  	},

				legend: {
			    	show: false,
			    	labelBoxBorderColor: "#f8f8f8",
			    	//noColumns: number
			    	position: "ne",
			    	margin: [10, 10],
			    	backgroundColor: "#f8f8f8",
			    	backgroundOpacity: 1.0
			  	},

				xaxis : {
				    show: true,
				    position: "bottom",

					color: "#f8f8f8",
				    tickColor: "#f8f8f8",


				    tickSize: 1,
				    minTickSize: 1
				},
				xaxis: { mode: "time" },
				yaxis: {},
				plotclick : function(){
					console.log('plot clicked')
				}

	        });
	    // }

		}

	    $("#progress").bind("plotclick", function (event, pos, item) {

	        if (item) {
				var value = item.datapoint[1];
				var label = item.series.label
				var date = new Date(item.datapoint[0]);
				var dateString = date.getFullYear() + '-' + util.zeroPad((date.getMonth() + 1),2) + '-' + util.zeroPad(date.getDate(), 2);
				
				var htmlString = '<em style="color:#fff">' + label + '</em><br/>Date : <em style="color:#fff">' + dateString + '</em><br/>Value : <em style="color:#fff">' + value + '</em>';  

				$('#progress').qtip({
					content: {
						text: htmlString
					},
				   	position: {
				    	my: 'bottom center',  // Position my top left...
				      	at: 'top center', // at the bottom right of...
				    },
					style: {
						classes: 'ui-tooltip-youtube'
					}
				});
				$('#progress').qtip().show();
				
	        }
	    });


	});
</script>

		
	</body>
	
</html>