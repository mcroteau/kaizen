<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="mobile" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>Franklins 13 : Log Todays Entry</title>
</head>

<body>

	<div data-role="page" class="type-interior">
		<div data-role="header" data-theme="a">
			<h1>All Virtue Entries</h1>
		</div><!-- /header -->
	
	<div data-role="content">
					
		<div class="ui-bar ui-bar-f">
			
			<div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
				
				<g:link controller="static" action="dashboard" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-corner-left ui-btn-up-c">
					<span class="ui-btn-inner ui-corner-left">
						<span class="ui-btn-text">Dashboard</span>
						<span class="ui-icon ui-icon-grid ui-icon-shadow"></span>
					</span>
				</g:link>
				<g:link controller="virtueEntry" action="newEntry" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c">
					<span class="ui-btn-inner ui-corner-left">
						<span class="ui-btn-text">Todays Entry</span>
						<span class="ui-icon ui-icon-star ui-icon-shadow"></span>
					</span>
				</g:link>
				<g:link controller="virtueEntry" action="list" id="" data-ajax="false" data-icon="plus" data-role="button" data-inline="true" data-theme="c" class="ui-btn ui-btn-inline ui-btn-icon-left ui-btn-up-c ui-btn-active">
					<span class="ui-btn-inner ui-corner-left">
						<span class="ui-btn-text">History</span>
						<span class="ui-icon ui-icon-search ui-icon-shadow"></span>
					</span>
				</g:link>

			</div><!-- /controlgroup -->
		</div>			
					
					
					
					
		<br class="clear"/>			
		
		
		<g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
		
<br class="clear"/>			
		
					
		<div class="content-primary">
			
			<ul data-role="listview">
				
				<!--<li data-role="list-divider" role="heading" class="ui-li ui-li-divider ui-btn ui-bar-b ui-li-has-count ui-btn-down-undefined ui-btn-up-undefined"></li>-->
				
		    	<g:each in="${virtueEntryInstanceList}" status="i" var="virtueEntryInstance">
            		<li>
						<g:link action="show" id="${virtueEntryInstance.id}" class="ui-link-inherit" data-ajax="false">
							<h3><g:formatDate format="dd MMM yyyy" date="${virtueEntryInstance.entryDate}"/></h3>
							<p><strong>${virtueEntryInstance.performanceDescription}</strong></p>
							<span class="ui-li-count ui-btn-up-c ui-btn-corner-all">
								Virtues: ${virtueEntryInstance.totalCompleted}/14&nbsp;&nbsp;&nbsp;Happiness: ${virtueEntryInstance.happinessScale}	
							</span>
						</g:link>
					</li>
				</g:each>
			</ul>
	
	
	
		</div><!--/content-primary -->		
		
		</div><!-- /content -->

		<style type="text/css">
			span.currentStep{margin:0px 5px;}
			a.step{margin:0px 5px; border:solid 1px #ddd;}
			a.ui-link{margin:0px 5px; border:solid 1px #ddd;}
			a.nextLink{margin:0px 5px; border:solid 1px #ddd;}
		</style>
		
		<g:render template="/common/mobile/footer"/>

	</div><!-- end of page-->

	
	<g:render template="/help/help"/>
	
	<g:render template="/help/definitions"/>
	
	<script type="text/javascript">
		$(document).bind("mobileinit", function(){
		  	//Disable ajax link
			console.log('here..');
		  	$('.disable-ajax').click(function(event){
				console.log('disable')
		    	$.mobile.ajaxFormsEnabled = false;
		  	});
		});
	</script>	
</body>
</html>