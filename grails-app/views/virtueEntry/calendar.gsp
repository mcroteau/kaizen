<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar.css')}" />

    <title>Franklins 13 : Progress Calendar</title>
</head>

<body>
	
	<div class="content calendar">

		<h1 style="float:left">Calendar <span>A historical look at all your entries in Calendar format</span></h1>
		<div style="text-align:right; margin:15px 0px 5px 0px; float:right">
			<g:link controller="virtueEntry" action="history" class="button small blue">Back to List View</g:link>
		</div>

		<br class="clear"/>
		
		<div id="calendarFullWrapper" style="">
			<div id="calendarFull" style=""></div>
			<div style="text-align:right; margin:15px 0px 5px 0px;">
				<g:link controller="virtueEntry" action="history" class="button small blue">Back to List View</g:link>
			</div>
		</div>

		<br class="clear"/>


	</div>
		
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/fullcalendar/', 'fullcalendar.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/util/', 'utilities.js')}"></script>

<script type="text/javascript">

	$(document).ready(function(){


		var Calendar = function($calendarDiv){
			var self = this;

			self.$calendarDiv = $calendarDiv;


			var $day = $('.fc-widget-content');
			var $loading = $('#loading');
			var $calendarWrapper = $('#calendarFullWrapper');

			var $calendar;

			self.mockEvents = [{"id":"2012-01-10", "title":"+15<br/>+5 points <br/> 8 happiness/satisfaction", "url":"show/1", "start":"2012-01-10"}, {"id":"2012-01-15", "title":"+4<br/>+5 points <br/> 8 happiness/satisfaction", "url":"show/1", "start":"2012-01-15"}];

			self.events = "entries";

			self.init = function(){
				self.render();
				self.bindQtipOnEvents();
			};


			self.render = function(){
				$calendar = self.$calendarDiv.fullCalendar({

					//events : "entries",
					events : self.events,
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


		var calendar = new Calendar($('#calendarFull'));
		calendar.init();


	});
	
	function zeroPad(num, count){
		var numZeropad = num + '';
		while(numZeropad.length < count) {
			numZeropad = "0" + numZeropad;
		}
		return numZeropad;
	}

</script>



</body>
</html>


