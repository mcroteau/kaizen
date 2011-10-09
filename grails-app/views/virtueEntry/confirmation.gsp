<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Log Todays Entry</title>
    </head>
    
	<body>
	
		<div data-role="page">

			<div data-role="header" data-theme="a">

				<h1>Todays Entry <g:formatDate format="dd MMM yyyy" date="${virtueEntryInstance.entryDate}"/></h1>

			</div><!-- /header -->

			<div data-role="content">	


				<div class="ui-bar ui-bar-c">
					
					<div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
						
						<g:link controller="static" action="dashboard" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-corner-left ui-btn-up-c">
							<span class="ui-btn-inner ui-corner-left">
								<span class="ui-btn-text">Dashboard</span>
								<span class="ui-icon ui-icon-grid ui-icon-shadow"></span>
							</span>
						</g:link>
						<g:link controller="virtueEntry" action="newEntry" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c ui-btn-active">
							<span class="ui-btn-inner ui-corner-left">
								<span class="ui-btn-text">Todays Entry</span>
								<span class="ui-icon ui-icon-star ui-icon-shadow"></span>
							</span>
						</g:link>
						<g:link controller="virtueEntry" action="list" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c">
							<span class="ui-btn-inner ui-corner-left">
								<span class="ui-btn-text">History</span>
								<span class="ui-icon ui-icon-search ui-icon-shadow"></span>
							</span>
						</g:link>

					</div><!-- /controlgroup -->
				</div>
				
				
	            <!-- <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
	            </g:if>-->
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
				
				<h1>${virtueEntryInstance.performanceDescription}</h1>
				
				<p><span class="confirmationStat green">${virtueEntryInstance.totalCompleted}</span> out of 13 completed.</p>
				
				
				<p>You were <span class="confirmationStat green">${virtueEntryInstance.happinessScale}</span> out of 10 on a Satisfaction/Happiness Scale</p>
					
				
			</div><!-- /content -->

			<div data-role="footer">

				<div class="ui-bar ui-bar-a">
					<div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
						<a href="#definitions" data-inline="true" data-role="button" data-icon="info" data-theme="a" class="ui-btn ui-btn-up-a ui-btn-inline ui-corner-left">
							<span class="ui-btn-inner ui-corner-left">
								<span class="ui-btn-text">Virtues Defined</span>
								<span class=""></span>
							</span>
						</a>
						<a href="#help" data-inline="true" data-role="button" data-theme="a" data-icon="alert" class="ui-btn ui-btn-up-a ui-btn-inline ui-corner-right ui-controlgroup-last">
							<span class="ui-btn-inner ui-corner-right ui-controlgroup-last">
								<span class="ui-btn-text">Help</span>
							</span>
						</a>
					</div><!-- /controlgroup -->
				</div>

			</div><!-- /footer -->

		</div>

	    <g:render template="/help/help"/>
       
	    <g:render template="/help/definitions"/>
		
		<script type="text/javascript">
		
			$(document).ready(function(){
				// console.log(temperance)
			});
		
			
		
		
		</script>
		
    </body>
</html>
