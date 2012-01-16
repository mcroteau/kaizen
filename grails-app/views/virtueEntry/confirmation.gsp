<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>Franklins 13 : Successfully Logged Virtues</title>
</head>

<body>

	<div class="content confirmation notes" style="">	
			
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="messageHeader">Message : </span>
				<span class="messageDetails">${flash.message}</span>
				<a href="#" class="closeButton closeMessage"></a>
			</div>
	    </g:if>
		
		<g:hasErrors bean="${virtueEntryInstance}">
			<div class="errors">
		    	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
			</div>
		</g:hasErrors> 
			
		<h1><span><g:if test="${virtueEntryInstance.totalPoints > 0}">+</g:if> ${virtueEntryInstance.totalPoints}</span> Points Earned</h1>
		<h2>${virtueEntryInstance.performanceDescription}</h2>
		
		<p class="confirmationStat"><span class=" highlight">${virtueEntryInstance.totalCompleted}</span> out of <span>13</span> completed.</p>	
		
		<p class="confirmationStat">You were <span class=" highlight">${virtueEntryInstance.happinessScale}</span> out of <span>10</span> on a Satisfaction/Happiness Scale</p>
		
		<div class="buttons">
			<g:link controller="virtueEntry" action="show" id="${virtueEntryInstance.id}" class="button small blue">View Entry</g:link>				
		</div>
	</div>

<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script>

<script type="text/javascript">

	$(document).ready(function(){

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


	});	
</script>
			
</body>
</html>

