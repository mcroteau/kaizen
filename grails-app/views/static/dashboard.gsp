<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Log Todays Entry</title>
    </head>
    
	<body>
	
	<div data-role="page">
	
		<div data-role="header" data-theme="a">
			<h1>Dashboard</h1>
		</div><!-- /header -->

		<div data-role="content">	
			
			<div class="ui-bar ui-bar-f">
				
				<div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
					
					<g:link controller="static" action="dashboard" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-corner-left ui-btn-up-c ui-btn-active">
						<span class="ui-btn-inner ui-corner-left">
							<span class="ui-btn-text">Dashboard</span>
							<span class="ui-icon ui-icon-grid ui-icon-shadow"></span>
						</span>
					</g:link>
					<g:link controller="virtueEntry" action="newEntry" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c">
						<span class="ui-btn-inner ui-corner-left">
							<span class="ui-btn-text">Todays Entry</span>
							<span class="ui-icon ui-icon-star ui-icon-shadow"></span>
						</span>
					</g:link>
					<g:link controller="virtueEntry" action="list" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c">
						<span class="ui-btn-inner ui-corner-left">
							<span class="ui-btn-text">History</span>
							<span class="ui-icon ui-icon-search ui-icon-shadow"></span>
						</span>
					</g:link>

				</div><!-- /controlgroup -->
			</div>
				
				<g:if test="${flash.message}">
					<p class="message error">${flash.message}</p>
				</g:if>
												
			<div id="progress" style="width:100%; height:200px;"></div>
										
										
										

										
			<!-- <div data-role="fieldcontain">
				
				<fieldset data-role="controlgroup" data-type="horizontal" data-role="fieldcontain">
					
					<input type="radio" name="radio-choice-1" id="radio-choice-1" value="choice-1" checked="checked" />
					<label for="radio-choice-1">Week</label>

					<input type="radio" name="radio-choice-1" id="radio-choice-2" value="choice-2"  />
					<label for="radio-choice-2">Month</label>

					<input type="radio" name="radio-choice-1" id="radio-choice-3" value="choice-3"  />
					<label for="radio-choice-3">All Time</label>

				</fieldset>
			
			</div> -->
					
					
		</div><!-- /content -->

		<g:render template="/common/mobile/footer"/>
			
	</div>


	
	<g:render template="/help/help"/>
	<g:render template="/help/definitions"/>
	
	


	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/flot/', 'flot.js')}"></script>

	<script type="text/javascript">

	$(function () {

		// var virtue = ${virtues}
		// var d5 = ${happiness}
		var virtues = ${virtues};
		var happiness = ${happiness};

		if(happiness && virtues){
		var virtueSeries = {
	    	color: '#11eb53',
	    	data: virtues,
	    	label: "Virtues Followed = 0",
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
	    	label: "Happiness/Satisfaction = 0",
	    	// clickable: true,
			points: {
				show : true,
			    radius: 2,
			    symbol: "circle"
			},
	    	hoverable: true,
	    	shadowSize: 3
	  	};

	    var stack = 0, bars = false, lines = true, steps = false;

	    //function plotWithOptions() {
	    var plot = $.plot($("#progress"), 
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
				    tickColor: "#e3e3e3",


				    tickSize: 1,
				    minTickSize: 1
				},
				xaxis: { mode: "time" },
				yaxis: { max:14, min: 0}

	        });
	    // }

		}

	  

	});
</script>

		
	</body>
	
</html>