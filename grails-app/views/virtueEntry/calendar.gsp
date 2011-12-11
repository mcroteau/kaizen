<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />

	    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
	
        <title>Franklins 13 : Progress</title>
    </head>
    
	<body>
		
		<style type="text/css">
			.clickable{cursor:pointer !important;}
		</style>
		
        <h1>My Progress</h1>

		<g:link action="listview">List View</g:link>
		
		<div id="loading">loading....</div>
		<div id="calendarWrapper" style="margin:auto;"></div>

		<br class="clear"/>
		
	    <link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar.css')}" />

		<style type="text/css">
			#calendarWrapper a, #calendarWrapper a span{color:#ffffff !important;font-weight:bold !important;}
		</style>
		
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/fullcalendar/', 'fullcalendar.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/util/', 'utilities.js')}"></script>
			
		<script type='text/javascript'>

			$(document).ready(function() {
				
				$('#calendarWrapper').fullCalendar({
					
					events : "entries",
					disableDragging : true,
					selectable : true,
					select : function(start, end, allDay, jsEvent, view, onevent){
						
						var dateString = start.getFullYear() + '-' + (start.getMonth() + 1) + '-' + start.getDate();
						var today = new Date();
						var result = util.dates.compare(start, today);
						
						if(result === 1){
							var message = 'Cannot log entry for the future... what are you trying to pull here...';
							
							$('.fc-cell-overlay').qtip({
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
							$('.fc-cell-overlay').qtip().show();
							
						}else{
							window.location = '/franklins13/virtueEntry/logEntry?date=' + dateString;
						}
						
					},
					loading : function(bool) {
						if (bool){
							$('#loading').show();	
						} else {
							$('#loading').hide();
						}
					},
					eventRender: function(event, element) {}

				});
				
				$('.fc-widget-content').addClass('clickable');


				function zeroPad(num, count){
					var numZeropad = num + '';
					while(numZeropad.length < count) {
						numZeropad = "0" + numZeropad;
					}
					return numZeropad;
				}

			});

		</script>
		
		
    </body>

</html>


