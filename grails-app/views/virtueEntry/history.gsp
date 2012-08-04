<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div class="row">
	<div class="span1 visible-desktop">&nbsp;</div>
	<div class="span10">
		<span class="small-note">A historical look at all your entries sorted by entry date, displaying most recent entries first</span>
	</div>
	<div class="span1 visible-desktop">&nbsp;</div>
</div>


<div class="row">
	
	<div class="span1 visible-desktop">&nbsp;</div>
	
	<div class="span7">
		
		<h3>List View <span class="small-note">All entries listed</span></h3>
		
		<g:if test="${virtueEntryInstanceList}">
			<table class="table table-bordered table-collapsed table-striped">
				<thead>
					<tr>
						<th nowrap>Entry Date</th>
						<th>Completed</th>
						<th>Satisfaction</th>
						<th>Points<th>
						<th><th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="entryDate" style="vertical-align:middle"><g:formatDate format="dd MMM yyyy" date="${virtueEntryInstance.entryDate}"/></td>
						<td><em class="highlight">${virtueEntryInstance.totalCompleted}</em> out of 14</td>
						<td><em class="highlight">${virtueEntryInstance.happinessScale}</em></td>
						<td><em class="highlight">${virtueEntryInstance.totalPoints}</em> Points</td>
						<td><g:link controller="virtueEntry" action="show" id="${virtueEntryInstance.id}" class="btn btn-small grey">Edit</g:link></td>
					</tr>						
				</tbody>	
			</table>
			<div class="pagination">				
				<ul>		
					<li><a href="javascript:">&#171;</a></li>
					<li><a href="javascript:">1</a></li>
					<li class="active"><a href="javascript:">2</a></li>
					<li><a href="javascript:">3</a></li>	
					<li><a href="javascript:">&#187;</a></li>		
				</ul>
			</div>
		</g:if>
		<g:else>
			<p class="lead">No entries logged yet  <g:link controller="virtueEntry" action="logEntry" id="" class="btn"  params="[activeLink: 'logentry']">Log Entry</g:link></p>
		</g:else>
		
	</div>
	
	
	<div class="span3">		
		<div id="calendarWrapper" >
			<div id="calendar" style="height:330px;" class="small-calendar"></div>
			<a href="calendar.html" class="btn">View Large Calendar</a>
		</div>
	</div>

	<div class="span1 visible-desktop">&nbsp;</div>

</div>		


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
