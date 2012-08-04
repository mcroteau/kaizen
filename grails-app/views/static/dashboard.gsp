<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <title>Franklins 13 : Dashboard</title>
</head>

<body>
		
	
	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		
		<div class="span10" id="progressContainer">
			<div id="progress" style="width:800px; height:350px;"></div>
		</div>
		
		<div class="span1 visible-desktop">&nbsp;</div>
		
	</div>
	
	
	
	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		
		<div class="span5">
			<div class="stats best stats-wrapper" style="display:none">
				<h2>Best 5</h2>
				<p>The Top 5 Virtues you have the most success in following</p>
				<table class="table table-bordered table-condensed">
					<tbody>
						<g:each  in="${sortedVirtuesMapBest}" status="i" var="virtue">
							<g:if test="${i < 5}">
								<tr>
								 	<td class="">${virtue.value.name}</td>
								 	<td class="">${virtue.value.value}</td>
								 	<td class="">${virtue.value.percent}<em>%</em></td>
								 </tr>
							</g:if>							
						</g:each>								
					</tbody>
				</table>
			</div>			
		</div>
		
		<div class="span5">
			
			<div class="stats worst stats-wrapper" style="display:none">
				<h2>Worst 5</h2>
				<p>The 5 Virtues you have the hardest time following</p>
				<table class="table table-bordered table-condensed worst">
					<tbody>
						<g:each  in="${sortedVirtuesMapWorst}" status="i" var="virtue">
							<g:if test="${i < 5}">
								<tr>
								 	<td class="align-left">${virtue.value.name}</td>
								 	<td class="">${virtue.value.value}</td>
								 	<td class="">${virtue.value.percent}<em>%</em></td>
								 </tr>
							</g:if>							
						</g:each>																	
					</tbody>				
				</table>
			</div>			
			
		</div>
		
		<div class="span1 visible-desktop">&nbsp;</div>	
		
	</div>




<!-- MOCK DATA -->
<!--<script type="text/javascript" src="js/mockdata.js"></script>-->


<script type="text/javascript">

function roundNumber(num, dec) {
	var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
	return result;
}


	$(document).ready(function(){

		console.log('here...');

		if($(window).width() < 600){
			$('#progress').css({
				"width" : "430px !important"
			});
			$('#progress').width(430);
		}


		
		var Dashboard = function(){

			var self = this;
			var score = Math.abs(${session.totalScore});
			var startScore = 0;

			var startRank = 0;
			var rank = ${session.rank};
			
			var startEntries = 0;
			var entries = ${session.totalEntries};

			var scoreTimerId;
			var rankTimerId;
			var entriesTimerId;
			var startRankTimerId;

			var $scoreEm = $('.score');
			var $rankEm = $('.rank');
			var $entriesEm = $('.entries');
			var $progress = $('#progress');

			self.init = function(){
				self.hideStats();
				//self.animatescore();
				self.animateRanking();
				self.startRankTimer();
				
				self.animateEntries();

				var dashGraph = new DashboardGraph($progress);
				dashGraph.init();

				/**
				var dashCal = new DashboardCalendar($('#calendar'));
				dashCal.init();
				**/

				var dashStats = new DashboardStats($('.stats-wrapper'));
				dashStats.animate();

			};

			self.hideStats = function(){
				// $scoreEm.css({"height":"0px", "opacity" : "0"});		
				// $rankEm.css({"height":"0px", "opacity" : "0"});		
			};

			self.startRankTimer = function(){
				startRankTimerId = window.setInterval(function(){
					//self.animateRanking();			
					self.animateScore();
					self.stopTimer(startRankTimerId)
				}, 400);			
			}

			self.animateRanking = function(){
				// $rankEm.animate({ height: '28', opacity: '1.0' }, 700);
				rankTimerId = window.setInterval(function(){
					self.incrementRank();	
				}, 40);
			}	

			self.animateScore = function(){
				// $scoreEm.animate({ height: '29', opacity: '1.0' }, 200);
				scoreTimerId = window.setInterval(function(){
					self.incrementScore();	
				}, 10);
			};

			self.incrementScore = function(){
				if(startScore != score && startScore < score){
					startScore++;

					if(score < 51){
						startScore++;
					}
					if(score > 50 && score < 151){
						startScore = startScore+2;
					}

					if(score > 150 && score < 251){
						startScore = startScore+5;
					}

					if(score > 250 && score < 1001){
						startScore = startScore+10;
					}

					if(score > 1000 && score < 2001){
						startScore = startScore+20;
					}

					if(score > 2000 && score < 10001){
						startScore = startScore+100;
					}

					if(score > 10000){
						startScore = startScore+550;
					}

					if(startScore > score){
						$scoreEm.html(score);
					}else{
						$scoreEm.html(startScore);
					}

				}else{
					self.stopTimer(scoreTimerId);
				}
			};

			self.incrementRank = function(){
				if(startRank != rank){
					startRank++;
					$rankEm.html(startRank)
				}else{
					self.stopTimer(rankTimerId);
				}
			};


			self.animateEntries = function(){
				// $scoreEm.animate({ height: '29', opacity: '1.0' }, 200);
				entriesTimerId = window.setInterval(function(){
					self.incrementEntries();	
				}, 10);
			};

			self.incrementEntries = function(){
				if(startEntries != entries && startEntries < entries){
					// startEntries++;

					if(entries < 51){
						startEntries++;
					}
					if(entries > 50 && entries < 151){
						startEntries = startEntries+2;
					}

					if(entries > 150 && entries < 251){
						startEntries = startEntries+5;
					}

					if(entries > 250 && entries < 1001){
						startEntries = startEntries+10;
					}

					if(startEntries > entries){
						$entriesEm.html(entries);
					}else{
						$entriesEm.html(startEntries);
					}

				}else{
					self.stopTimer(entriesTimerId);
				}
			};
			
			self.stopTimer = function(timerId){ 
		        clearInterval(timerId); 
		    };

		} 




		var DashboardGraph = function($graphDiv){

			var self = this;

			self.$graphDiv = $graphDiv;

			var happinessLabel = "Happiness/Satisfaction", 
				scoreLabel     = "Score",
				virtuesLabel   = "Virtues Followed";

			var HAPPINESS = 'happiness', 
				SCORE     = 'score', 
				VIRTUES   = 'virtues';

			var happinessObj = {}, 
				scoreObj     = {},
				virtuesObj   = {};

			self.quickDataObj = {};
			
			self.virtuesData   = ${virtues};
			self.happinessData = ${happiness};
			self.scoresData    = ${scores};


			var virtueSeries    = getVirtueSeriesConfig();
        	var happinessSeries = getHappinessSeriesConfig();
        	var scoresSeries    = getScoreSeriesConfig();


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
						happinessSeries,
						scoresSeries 
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
						case scoreLabel : 
							self.setSeriesObj(scoreObj, series);
							break;
						case virtuesLabel :
							self.setSeriesObj(virtuesObj, series);
							break;
						default :
							break;
					}
				});

				self.quickDataObj[SCORE] = scoreObj;
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


			function getScoreSeriesConfig(){
				return {
		    		color: '#C8330F',
		    		//data: mockScores,
		    		data: self.scoresData,
		    		label: scoreLabel,
		    		// clickable: true,
					points: {
						show : true,
					    radius: 0,
					    symbol: "circle"
					},
					clickable : true,
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
					backgroundColor: "#f8f8f8",
					labelMargin: 10,
					axisMargin: 10,
					borderWidth: 1,
					borderColor: "#efefef",
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

				$('#progress').bind("plothover", function (event, pos, item) {

                	if (item) {					

					    if (previousPoint != item.dataIndex) {
					        previousPoint = item.dataIndex;

							//console.log(event);
							//console.log(pos);
							//console.log(item);

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
				$dashGraph.highlight(2, item.dataIndex);
			};

			self.unhighlightPoints = function(item){

			};

			self.formatGraphHover = function(item){
				var timestamp = item.datapoint[0]
				var date = new Date(timestamp); 
				date = date.getUTCMonth() + 1 + '/' + date.getUTCDate() + '/' + date.getUTCFullYear();

				var title = '<em class="qtiptitle">Results for ' + date + '</em>';

				var virtuesString = '<span class="qtipstat">virtues completed : <em>' + self.quickDataObj.virtues[timestamp] + '</em></span>';
				var happinessString = '<span class="qtipstat">happiness : <em>' + self.quickDataObj.happiness[timestamp] + '</em></span>';
				var scoreString = '<span class="qtipstat">score : <em>' + self.quickDataObj.score[timestamp] + '</em></span>';

				return title + virtuesString + happinessString + scoreString;
			};

			self.showQtip = function(content){
				self.$qtip = $('#progress').qtip({
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





		var DashboardCalendar = function($calendarDiv){
			var self = this;

			self.$calendarDiv = $calendarDiv;


			var $day = $('.fc-widget-content');
			var $loading = $('#loading');
			var $calendarWrapper = $('#calendarWrapper');

			var $calendar;

			self.mockEvents = [{"id":"2012-01-10", "title":"+15", "url":"show/1", "start":"2012-01-10"}, {"id":"2012-01-15", "title":"+4", "url":"show/1", "start":"2012-01-15"}];


			self.init = function(){
				self.render();
				self.bindQtipOnEvents();
			};


			self.render = function(){
				$calendar = self.$calendarDiv.fullCalendar({

					//events : "entries",
					events : self.mockEvents,
					disableDragging : true,
					selectable : true,
					select : function(start, end, allDay, jsEvent, view, onevent){

						var $cellOverlay = 	$('.fc-cell-overlay');

						var dateString = start.getFullYear() + '-' + (start.getMonth() + 1) + '-' + start.getDate();
						var today = new Date();
						var result = util.dates.compare(start, today);

						if(result === 1){

							var message = 'Cannot log entry for the future... what are you trying to pull here...';

							$cellOverlay.qtip({
								content: {
									text: message
								},
							   	position: {
							    	my: 'bottom center',  // Position my top left...
							      	at: 'top center', // at the bottom right of...
							    },
								style: {
									classes: 'ui-tooltip-youtube'
								}
							});
							$cellOverlay.qtip().show();

						}else{
							window.location = '/franklins13/virtueEntry/logEntry?date=' + dateString;
						}

					},
					loading : function(bool) {
						if (bool){
							$loading.show();	
						} else {
							$loading.hide();
						}
					},
					eventRender: function(event, element) {}

				});				
			};

			self.bindQtipOnEvents = function(){
				$('.fc-event').qtip({
					content: {
						text: "View Details"
					},
					position: {
						my: 'bottom center',  // Position my top left...
					  	at: 'top center', // at the bottom right of...
					},
					style: {
						classes: 'ui-tooltip-youtube'
					}

				});
			};

			self.zeroPad = function(num, count){
				var numZeropad = num + '';
				while(numZeropad.length < count) {
					numZeropad = "0" + numZeropad;
				}
				return numZeropad;
			}
		}


		var DashboardStats = function($statsDiv){
			var self = this;
			self.$statsDiv = $statsDiv;

			self.animate = function(){

				self.$statsDiv.fadeIn(800);
				self.$statsDiv.fadeIn(500);
			};

		}

		var dash = new Dashboard();
		dash.init();





		var Messages = function(){
			var self = this;


			self.init = function(){
				bindClickEvent();
			}

			function bindClickEvent(){
				$('.message .closeButton').click(function(event){
					event.preventDefault();
					$(event.target).parent().remove();
				});
			}

			return {
				init : self.init
			}
		}


		var messages = new Messages();
		messages.init();
		
		
		
		
		
		var DashboardPopup = function(){
			var self = this;			
			var $self = $(self);
			
			var $popupDiv;
			
			self.init = function(){
				setPopupDiv();
				showPopup();
				bindClickEvent();
			};
			
			function setPopupDiv(){
				$popupDiv = $('<div id="dashboardPopupMessage"/>').css({
					"z-index" : "100",
					"position" : "absolute",
					"top"      : "100px",
					"left"     : "50%",
					"margin-left" : "-125px",
					"color"    : "#fff",
					"text-shadow" : "0px 1px 1px #5E6B78",
					"opacity"   : "0.9",
					"background" : "#5E6B78",
					"border-radius" : "3px",
					"width" : "250px",
					"-moz-box-shadow" :    "0px 0px 10px 10px #d9d8d8",
				    "-webkit-box-shadow": "0px 0px 10px 10px #d9d8d8",
				    "box-shadow":         "0px 0px 10px 10px #d9d8d8",
					"padding" : "15px"
				}).html('<h1 style="color:#fff; line-height:1.3em; font-size:14px;" >Quick Note</h1><br class="clear"/><p>Your Dashboard will look incomplete in the beginning due to a lack of entries.</p><div class="buttons"><a href="#" class="btn closePopup">close</a></div>');
				
				$('.content').append($popupDiv);
			};
			
			
			function showPopup(){
				console.log($popupDiv);
				$('body').append($popupDiv);
				
				$popupDiv.show();
				$popupDiv.animate({
					opacity : "0.9 !important",
					"z-index" : "10000 !important"
				}, 200);
			};
			
			function bindClickEvent(){
				$popupDiv.click(function(event){
					event.preventDefault();
					delegateClick(event);
				});
			};
			
			function delegateClick(event){
				var $target = $(event.target);
				if($target.hasClass('closePopup')){
					$popupDiv.animate({
						"opacity" : "0"
					}, 100 ,
					function(){
						$popupDiv.remove();
					});
				}
			};
			
			return {
				init : self.init
			};
			
		}
		
		
		var totalEntries = ${session.totalEntries}
		
		if(totalEntries < 2){		
			console.log('show popup ', totalEntries)
			var dashboardPopup = new DashboardPopup();
			dashboardPopup.init();
		}
		
		
		
	});


</script>
	

</body>	
</html>