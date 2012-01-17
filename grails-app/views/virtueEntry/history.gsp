<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


<div class="content history">

	<g:if test="${flash.message}">
		<div class="message info" id="">
			<span class="header">Message : </span>
			<span class="messageDetails">${flash.message}</span>
			<a href="#" class="closeButton closeMessage"></a>
		</div>
		
    </g:if>


	<h1>History <span>A historical look at all your entries sorted by entry date, displaying most recent entries first</span></h1>
	
	<div id="entriesListWrapper" class="entrieslistWrapper" style="">
		
		
		<g:if test="${virtueEntryInstanceList}">
			<h3>List View <span>All entries listed</span></h3>
			<table class="entries">
				<thead>
					<tr>
						<th nowrap>Entry Date</th>
						<th>Completed</th>
						<th>Satisfaction</th>
						<th>Points<th>
					</tr>
				</thead>
				<tbody>
					
        	        <g:each in="${virtueEntryInstanceList}" status="i" var="virtueEntryInstance">
						<g:if test="${i % 2 == 0}">
							<tr class="even">
						</g:if>
						<g:else>
							<tr class="">
						</g:else>
						
								<td class="entryDate" style="vertical-align:middle"><g:formatDate format="dd MMM yyyy" date="${virtueEntryInstance.entryDate}"/></td>
								<td><em class="highlight">${virtueEntryInstance.totalCompleted}</em> out of 14</td>
								<td><em class="highlight">${virtueEntryInstance.happinessScale}</em></td>
								<td><em class="highlight">${virtueEntryInstance.totalPoints}</em> Points</td>
								<td><g:link controller="virtueEntry" action="show" id="${virtueEntryInstance.id}" class="button small grey">Edit</g:link></td>
						</tr>
					</g:each>
																									        											
				</tbody>
			</table>
        	
        	<div class="paginateButtons">
        	    <g:paginate total="${virtueEntryInstanceTotal}"  params="[activeLink: 'history']"/>
        	</div>
		</g:if>
		<g:else>
			<h2>No entries logged yet  <g:link controller="virtueEntry" action="logEntry" id="" class="button small blue"  params="[activeLink: 'logentry']">Log Entry</g:link></h2>
		</g:else>
	</div>
	
	<div id="calendarWrapper" style="">
		<div id="calendar" style="height:330px;"></div>
		<div style="text-align:right; margin:15px 0px 5px 0px;">
			<g:link controller="virtueEntry" action="calendar" class="button small red" params="[activeLink: 'history']">View Large Calendar</g:link>
		</div>
	</div>
				
	<br class="clear"/>
	
	
</div>


<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jtruncate.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/fullcalendar/', 'fullcalendar.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/util/', 'utilities.js')}"></script>


<!-- MOCK DATA -->

<script type="text/javascript">

$(document).ready(function(){

	var History = function(){
		var self = this;
	
		self.init = function(){
			
			var dashCal = new DashboardCalendar($('#calendar'));
			dashCal.init();
			
			var entries = new EntriesList();
			entries.init();
		};
		
		
	}; 
	
	var EntriesList = function(){
	
		var self = this;
		var $notes;
		
		self.init = function(){
			$('.entrieslistWrapper').fadeIn(500);
			self.truncateNotes();
		};
		
		self.truncateNotes = function(){
			$notes = $('.entryNotes').jTruncate({
		        length: 40,
		        minTrail: 0,
		        moreText: " + more",
		        lessText: "[-]",
		        ellipsisText: " ...",
		        moreAni: "fast",
		        lessAni: "fast"
		    });
		};
	};

	
	
	var DashboardCalendar = function($calendarDiv){
		var self = this;
		
		self.$calendarDiv = $calendarDiv;
		
		
		var $day = $('.fc-widget-content');
		var $loading = $('#loading');
		var $calendarWrapper = $('#calendarWrapper');
		
		var $calendar;
		
		self.mockEvents = [{"id":"2012-01-10", "title":"+15", "url":"show/1", "start":"2012-01-10"}, {"id":"2012-01-15", "title":"+4", "url":"show/1", "start":"2012-01-15"}];
		
		self.events = "entriesPoints";		
				
				
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

	var history = new History();
	history.init();

	
});


</script>
	

</body>
</html>
