<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />

	
        <title>Franklins 13 : Progress</title>
    </head>
    
	<body>
		
		<style type="text/css">
			.clickable{cursor:pointer !important;}
		</style>
		
        <h1>My Progress</h1>

		<g:link action="listview">List View</g:link>
		
		<div id="calendarWrapper" style="margin:auto;"></div>

		<br class="clear"/>
		
	    <link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar.css')}" />

		<style type="text/css">
			#calendarWrapper a, #calendarWrapper a span{color:#ffffff !important;font-weight:bold !important;}
		</style>
		
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/fullcalendar/', 'fullcalendar.min.js')}"></script>
	
		<script type='text/javascript'>

			$(document).ready(function() {

				$('#calendarWrapper').fullCalendar({

					editable : true,

					events : "entries",

					disableDragging : true,

					loading : function(bool) {
						if (bool) $('#loading').show();
						else $('#loading').hide();
					},
					
					dayClick : function(date, allDay, jsEvent, view){
						
						console.log(date)
						console.log(allDay)
						console.log(jsEvent)
						console.log(view)
						
						if($(this).hasClass('fc-today')){
							
							var todaysEntry = $(this).find('.fc-content div');
							
							var allEvents = $('#calendarWrapper').fullCalendar('clientEvents');
							
							console.log(allEvents);
							var idString =  date.getFullYear() + '-' + (date.getMonth() + 1) + '-' +  zeroPad(date.getDate(), 2)
							console.info(idString);
							
							$(allEvents).each(function(index, event){
								
								if(event.id === idString){
									console.log(event)
									alert('bingo');
								}
								
							});							
						}						
					}

				});
				
				
				//function setTodayClickable(){
					
					console.info('set today clickable -> ')
					
					var date = $('#calendarWrapper').fullCalendar( 'getDate');

					var allEvents = $('#calendarWrapper').fullCalendar('clientEvents');
					
					console.info(allEvents);
					
					var idString =  date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + zeroPad(date.getDate(), 2)
					console.info(idString);

					var hasEvent = false;
					$(allEvents).each(function(index, event){
						console.log(event)

						if(event.id === idString){
							console.info(' ====== ')
							hasEvent = true;
						}

					});

					if(!hasEvent){
						console.info(' ! has event... ')
						$('.fc-today').addClass('clickable').addClass('logEntry');
					}


					$('.logEntry').click(function(){
						window.location = '/franklins13/virtueEntry/logEntry';
					});
				//}


				
				function zeroPad(num, count){
					var numZeropad = num + '';
					while(numZeropad.length < count) {
						numZeropad = "0" + numZeropad;
					}
					return numZeropad;
				}

				//setTodayClickable();
				

			});

		</script>
		
		
    </body>

</html>


