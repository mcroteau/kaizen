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
				
				<h1>Todays Entry : <g:formatDate format="dd MMM yyyy" date="${new Date()}"/></h1>

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
	            </g:if> -->
	            <g:hasErrors bean="${virtueEntryInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${virtueEntryInstance}" as="list" />
	            </div>
	            </g:hasErrors>
		
				<p>Check all virtues you successfully upheld today.  Unsure what each Virtue means, click <a href="#definitions" data-transition="flip">here</a></p>

				<g:form action="save" name="virtueEntryForm" id="virtueEntryForm" method="post" data-ajax="false">
				
					<div data-role="fieldcontain">
                	
					<h3 style="margin:0px">Personal Virtues</h3>
						<fieldset data-role="controlgroup" >
                	
							<input type="checkbox" name="temperance" id="chk-temperance">
							<label for="chk-temperance" class="custom">Temperance</label>
                	
							<input type="checkbox" name="orderVirtue" id="chk-order" class="custom">
							<label for="chk-order">Order</label>
                	
							<input type="checkbox" name="resolution" id="chk-resolution" class="custom">
							<label for="chk-resolution">Resolution</label>
                	
							<input type="checkbox" name="frugality" id="chk-frugality" class="custom">
							<label for="chk-frugality">Frugality</label>
                	
							<input type="checkbox" name="moderation" id="chk-moderation" class="custom">
							<label for="chk-moderation">Moderation</label>
                	
							<input type="checkbox" name="industry" id="chk-industry" class="custom">
							<label for="chk-industry">Industry</label>
                	
							<input type="checkbox" name="cleanliness" id="chk-cleanliness" class="custom">
							<label for="chk-cleanliness">Cleanliness</label>
                	
							<input type="checkbox" name="tranquility" id="chk-tranquility" class="custom">
							<label for="chk-tranquility">Tranquility</label>
                	
			  			</fieldset>
					</div>
                	
                	
                	
                	
			  		<div  data-role="fieldcontain">
			  		<h3>Social Virtues</h3>
                	
						<fieldset data-role="controlgroup" >
                	
			  				<input type="checkbox" name="silence" id="chk-silence" class="custom">
			  				<label for="chk-silence">Silence</label>
                	
			  				<input type="checkbox" name="sincerity" id="chk-sincerity" class="custom">
			  				<label for="chk-sincerity">Sincerity</label>
                	
			  				<input type="checkbox" name="justice" id="chk-justice" class="custom">
			  				<label for="chk-justice">Justice</label>
			
			  				<input type="checkbox" name="chastity" id="chk-chastity" class="custom">
			  				<label for="chk-chastity">Chastity</label>
                	
			  				<input type="checkbox" name="humility" id="chk-humility" class="custom">
			  				<label for="chk-humility">Humility</label>
                	
						</fieldset>
					</div>
                	

					<h3>How happy are you now the day is done?</h3>
					<div data-role="fieldcontain">
						<label for="happinessScale">Slide from 1 to 10, 10 being extemely happy/satisfied with your day</label>
					 	<input type="range" name="happinessScale" id="happinessScale" value="0" min="0" max="10"  />
					</div>
                	
					<div data-inline="true" style="text-align:center">
						<g:link controller="static" rel="external" data-role="button" data-inline="true" action="dashboard">Cancel</g:link>
						<!-- <a href="dashboard.html" data-role="button" rel="external" data-inline="true" style="margin:10px auto">Cancel</a> -->
						<button type="submit" data-theme="b" data-inline="true" name="submit" value="submit-value" class="ui-btn-hidden" aria-disabled="false" rel="external">Save</button>
					</div>
				
				</g:form>

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

			</div><!-- end of page-->

		
		<g:render template="/help/help"/>
		
		<g:render template="/help/definitions"/>
		
		<script type="text/javascript">
			$(document).ready(function(){
			
				// $('#submit').click(function(event){ ajaxItUp();});
			});
		
			
			function failure(){
				console.log('failure');
			}
			
			function success(){
				
			}
		
		</script>
		
    </body>
</html>
