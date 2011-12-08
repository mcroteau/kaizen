<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Successfully Logged Virtues</title>
    </head>
    
	<body>
	
				
	            <g:if test="${flash.message}">
	            	<div class="message">${flash.message}</div>
	            </g:if>
	
	            <g:hasErrors bean="${virtueEntryInstance}">
	            	<div class="errors">
	                	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
	            	</div>
	            </g:hasErrors> 
	
				<style type="text/css">
				
					.confirmationStat{
						display:inline-block;
						font-weight:bold;
						padding:5px;
						background : #00ff00;
					}
				
				</style>
				
				<h1>+ ${virtueEntryInstance.totalPoints} Points Earned</h1>
				<h2>${virtueEntryInstance.performanceDescription}</h2>
				
				<p><span class="confirmationStat green">${virtueEntryInstance.totalCompleted}</span> out of 13 completed.</p>
				
				
				<p>You were <span class="confirmationStat green">${virtueEntryInstance.happinessScale}</span> out of 10 on a Satisfaction/Happiness Scale</p>
					
				
    </body>
</html>
