<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />

	
        <title>Franklins 13 : Progress</title>
    </head>
    
	<body>
		
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

					// header: {
					// 	right: 'prev,next today',
					// 	center: 'title'
					// 	//right: 'month'
					// },

					editable: true,

					events: "entries",
					//events :[{"id":"1","title":"12","url":"show/1","start":"2011-11-20"},{"id":"2","title":"12","url":"show/2","start":"2011-11-19"},{"id":"3","title":"12","url":"show/3","start":"2011-11-18"}],


					loading: function(bool) {
						if (bool) $('#loading').show();
						else $('#loading').hide();
					}

				});

			});

		</script>
		
		
    </body>

</html>


