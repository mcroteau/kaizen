<html>
<head>
    <title>Franklins 13 App</title>
    <meta name="layout" content="main" />
	
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
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
	
	
	<div class="welcomelinks">
		<g:link controller="static" action="experiment" class="button darkgrey large">About the Experiment</g:link>
		<g:link controller="account" action="registrationPage" class="button large blue">Join the Experiment</g:link>			
	</div>	
	
	
	<div style="">
		<p class="large"><em>A few app stats</em><br/>
				On the left is a list of top 3 scores... the right... the loserboard.  There might be incomplete or funny looking data to start.. that just means there are openings.  <g:link controller="account" action="register">join</g:link>.</p>

		<div class="leaderboardWrapper stats best" style="width:310px; float:left; background:#f8f8f8; padding:10px; border:solid 1px #ebeaea; ">			
			
			<h2>Leaderboard</h2>
			
			<div class="leaderBoard" style="">
				<table class="entries">
					<thead>
						<tr>
							<th nowrap>Username</th>
							<th>Points<th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${leaderBoard}" status="i" var="user">
							<g:if test="${i < 3}">
								<g:if test="${i % 2 == 0}">
									<tr class="even">
								</g:if>
								<g:else>
									<tr class="">
								</g:else>
										<td class="" style="vertical-align:middle">${user.username}</td>
										<td><em class="highlight">${user.totalScore}</em> Points</td>
									</tr>
							</g:if>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>	
			
		<div class="leaderboardWrapper stats worst" style="width:310px; float:right; background:#f8f8f8; padding:10px; border:solid 1px #ebeaea;">			
			
			<h2>Loserboard</h2>
			
			<div class="leaderBoard" style="">
				<table class="entries">
					<thead>
						<tr>
							<th nowrap>Username</th>
							<th>Points<th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${leaderBoard}" status="i" var="user">
							<g:if test="${i < 3}">
								<g:if test="${i % 2 == 0}">
									<tr class="even">
								</g:if>
								<g:else>
									<tr class="">
								</g:else>
										<td class="" style="vertical-align:middle">${user.username}</td>
										<td><em class="highlight">${user.totalScore}</em> Points</td>
									</tr>
							</g:if>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<br class="clear"/>
	
		<p class="large" style="margin-top:30px !important; margin-bottom:0px !important; padding:0px !important; line-height:1.0em;">Below is a simple graph showing daily virtue progress and satisfaction for all users</p>  
		<div id="welcomeChartWrapper">
			<div id="welcomeChart" style="padding:20px !important"></div>
		</div>
	</div>
	
	
	
	
</div>

	
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.min.js')}"></script>
	<!-- <script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script> -->
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/flot/', 'flot.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/util/', 'utilities.js')}"></script>

	<script type="text/javascript">

	$(function () {

		var welcomeGraph = new WelcomeGraph($('#welcomeChart'));
		welcomeGraph.init();

	});









	var WelcomeGraph = function($graphDiv){

		var self = this;

		self.$graphDiv = $graphDiv;

		var happinessLabel = "Happiness/Satisfaction"
			virtuesLabel = "Virtues Followed";

		var HAPPINESS = 'happiness'
			VIRTUES = 'virtues';

		var happinessObj = {}, 
			virtuesObj = {};

		self.quickDataObj = {};
		
		self.virtuesData = ${virtues};
		self.happinessData = ${happiness};


		var virtueSeries = getVirtueSeriesConfig();
    	var happinessSeries = getHappinessSeriesConfig();

	    var stack = 0, bars = false, lines = true, steps = false;

		var $dashGraph;
		var $graphContainerDiv = $('#dashleft');

		self.init = function(){
			self.render();
			self.fadeIn();
			self.bindHoverEvent();
		};

		self.render = function(){

			$dashGraph = $.plot(self.$graphDiv, 
				[ 
					virtueSeries, 
					happinessSeries
				], 
				{
					series: self.getSeriesConfig(),
					grid: self.getGridConfig(),
					legend: self.getLegend(),
					xaxis : self.getXAxis(),
					xaxis: { mode: "time" },
					yaxis: { min : -5, max:16 },
					plotclick : function(){
						
					}

				}
			);

			self.setQuickLookupDataObj();

		};

		self.setQuickLookupDataObj = function(){
			var rawSeriesData = $dashGraph.getData();					
			$(rawSeriesData).each(function(index, series){	
				switch(series.label){
					case happinessLabel :
						self.setSeriesObj(happinessObj, series);
						break;
					case virtuesLabel :
						self.setSeriesObj(virtuesObj, series);
						break;
					default :
						break;
				}
			});

			self.quickDataObj[HAPPINESS] = happinessObj;
			self.quickDataObj[VIRTUES] = virtuesObj;
		}

		self.setSeriesObj = function(obj, series){
			$(series.data).each(function(index, datapoint){
				var timestamp = datapoint[0];
				var dataValue = datapoint[1];	
				obj[timestamp] = dataValue;
			});
		};

    	function getVirtueSeriesConfig(){
			return 	{
	    		color: '#11eb53',
	    		// data: mockVirtues,
	    		data: self.virtuesData,
	    		label: virtuesLabel,
	    		// clickable: true,
				points: {
					show: true,
				    radius: 0,
				    symbol: "circle"
				},
	    		hoverable: true,
	    		shadowSize: 0
	  		};	
		};


		function getHappinessSeriesConfig(){
			return 	{
	    		color: '#0F5D7E',
	    		// data: mockHappiness,
	    		data: self.happinessData,
	    		label: happinessLabel,
	    		// clickable: true,
				points: {
					show : true,
				    radius: 0,
				    symbol: "circle"
				},
	    		hoverable: true,
	    		shadowSize: 0
	  		};	
		};



		self.getSeriesConfig = function(){
			return {
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
			};
		};


		self.getGridConfig = function(){
			return  {
				show: true,
				aboveData: false,
				color: "#ddd",
				backgroundColor: "#fff",
				labelMargin: 10,
				axisMargin: 10,
				borderWidth: 1,
				borderColor: "#ebebeb",
				minBorderMargin: 10,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 10
			};
		};


		self.getXAxis = function(){
			return {
			    show: true,
			    position: "bottom",
				color: "#f8f8f8",
			    tickColor: "#f8f8f8",
			    tickSize: 1,
			    minTickSize: 1
			};
		};


		self.getLegend = function(){
			return {
				show: true,
				labelBoxBorderColor: "#f8f8f8",
				position: "ne",
				margin: [10, 10],
				backgroundColor: "#f8f8f8",
				backgroundOpacity: 1.0
			};
		};

		self.$qtip;

		self.bindHoverEvent = function(){

			self.$graphDiv.bind("plothover", function (event, pos, item) {

            	if (item) {					

				    if (previousPoint != item.dataIndex) {
				        previousPoint = item.dataIndex;

						// console.log(event);
						// console.log(pos);
						// console.log(item);

						self.clearHighlighsAndQtip();

            			self.showQtip(self.formatGraphHover(item));
						self.highlightPoints(item);

				    }
				} else {
				    previousPoint = null;
					self.clearHighlighsAndQtip();
				}

			});

		};

		self.clearHighlighsAndQtip = function(){
			$dashGraph.unhighlight();
			if(self.$qtip)self.$qtip.qtip('hide');
		};

		self.highlightPoints = function(item){
			$dashGraph.highlight(0, item.dataIndex);
			$dashGraph.highlight(1, item.dataIndex);
		};


		self.formatGraphHover = function(item){
			var timestamp = item.datapoint[0]


			var title = '<em class="qtiptitle">Results :';

			var virtuesString = '<span class="qtipstat">virtues completed : <em>' + self.quickDataObj.virtues[timestamp] + '</em></span>';
			var happinessString = '<span class="qtipstat">happiness : <em>' + self.quickDataObj.happiness[timestamp] + '</em></span>';

			return title + virtuesString + happinessString;
		};

		self.showQtip = function(content){
			self.$qtip = self.$graphDiv.qtip({
		   		content: {
		   			text : content
		   		},

		   		position: {
		   		   my: 'top left',
		   		   target: 'mouse',
		   		   //viewport: $(window), // Keep it on-screen at all times if possible
		   		   adjust: {
		   		      x: 10,  y: 10
		   		   }
		   		},
		   		hide: {
		   		   fixed: true // Helps to prevent the tooltip from hiding ocassionally when tracking!
		   		},
		   		style: {
		   			classes: 'ui-tooltip-youtube'
		   		}
			});
			self.$qtip.qtip('show');			

		};





		self.fadeIn = function(){	
			if($graphDiv){
				$graphContainerDiv.fadeIn();
			}			
		};

	}
	
	

	</script>





</body>
</html>
