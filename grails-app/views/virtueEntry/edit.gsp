
AK Student Loans
Federal Loans
Cell Phone
Car Payment



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Edit Entry</title>
    </head>
    
	<body>
	
		<div data-role="page">

			<div data-role="header" data-theme="a">
				
				<h1>Entry Date : <g:formatDate format="dd MMM yyyy" date="${virtueEntryInstance?.entryDate}"/></h1>
								
			</div><!-- /header -->

			<div data-role="content" id="showEntry">	

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



				<g:if test="${flash.message}">
		        	<div class="message">${flash.message}</div>
		        </g:if>

						
				<g:form  method="post" data-ajax="false" id="${virtueEntryInstance.id}">
				<g:hiddenField name="id" value="${virtueEntryInstance?.id}" />
                <g:hiddenField name="version" value="${virtueEntryInstance?.version}" />		
						
										
				
				<div data-role="fieldcontain">
										
					<h3 style="margin:0px">Entry Date</h3>
					<mobile:datePicker name="entryDate" value="${virtueEntryInstance?.entryDate}" precision="day" years="[2011,2012, 2013]"/>
				
				</div>

				
				
					<div data-role="fieldcontain">
                	
						<h3 style="margin:0px">Personal Virtues</h3>
					
						<fieldset data-role="controlgroup" >
            	
							<g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}" id="chk-temperance" />
							<!-- <input type="checkbox" name="temperance" id="chk-temperance"> -->
							<label for="chk-temperance" class="custom">Temperance</label>
                	
							<g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}" id="chk-orderVirtue" />
							<!-- <input type="checkbox" name="orderVirtue" id="chk-orderVirtue" class="custom"> -->
							<label for="chk-orderVirtue">Order</label>
                	
							<g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}" id="chk-resolution" />
							<!-- <input type="checkbox" name="resolution" id="chk-resolution" class="custom"> -->
							<label for="chk-resolution">Resolution</label>
                	
							<g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}" id="chk-frugality" />
							<!-- <input type="checkbox" name="frugality" id="chk-frugality" class="custom"> -->
							<label for="chk-frugality">Frugality</label>
                	
							<g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}" id="chk-moderation" />
							<!-- <input type="checkbox" name="moderation" id="chk-moderation" class="custom"> -->
							<label for="chk-moderation">Moderation</label>
                	
							<g:checkBox name="industry" value="${virtueEntryInstance?.industry}" id="chk-industry" />         	
							<!-- <input type="checkbox" name="industry" id="chk-industry" class="custom"> -->
							<label for="chk-industry">Industry</label>
                	
							<g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}" id="chk-cleanliness" />
							<!-- <input type="checkbox" name="cleanliness" id="chk-cleanliness" class="custom"> -->
							<label for="chk-cleanliness">Cleanliness</label>
                	

							<g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}" id="chk-tranquility" />
							<!-- <input type="checkbox" name="tranquility" id="chk-tranquility" class="custom"> -->
							<label for="chk-tranquility">Tranquility</label>
                	
			  			</fieldset>
					</div>
                	
                	
                	
                	
			  		<div  data-role="fieldcontain">
				
			  			<h3>Social Virtues</h3>
                	
						<fieldset data-role="controlgroup" >
                	
							<g:checkBox name="silence" value="${virtueEntryInstance?.silence}" id="chk-silence" />
			  				<!-- <input type="checkbox" name="silence" id="chk-silence" class="custom"> -->
			  				<label for="chk-silence">Silence</label>
                	
							<g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}" id="chk-sincerity" />
			  				<!-- <input type="checkbox" name="sincerity" id="chk-sincerity" class="custom"> -->
			  				<label for="chk-sincerity">Sincerity</label>
                	
							<g:checkBox name="justice" value="${virtueEntryInstance?.justice}" id="chk-justice" />
			  				<!-- <input type="checkbox" name="justice" id="chk-justice" class="custom"> -->
			  				<label for="chk-justice">Justice</label>
                	
							<g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}" id="chk-chastity" />
			  				<!-- <input type="checkbox" name="chastity" id="chk-chastity" class="custom"> -->
			  				<label for="chk-chastity">Chastity</label>
                	
							<g:checkBox name="humility" value="${virtueEntryInstance?.humility}" id="chk-humility" />
			  				<!-- <input type="checkbox" name="humility" id="chk-humility" class="custom"> -->
			  				<label for="chk-humility">Humility</label>
                	
						</fieldset>
					</div>
                	
					<h3>How happy are you now the day is done?</h3>
					<div data-role="fieldcontain">
						<label for="happinessScale">Slide from 1 to 10, 10 being extemely happy/satisfied with your day</label>
					 	<input type="range" name="happinessScale" id="happinessScale" value="${virtueEntryInstance.happinessScale}" min="0" max="10"  />
					</div>

					
				<div data-inline="true" style="text-align:center">
					
					<g:link controller="static" rel="external" data-role="button" data-inline="true" action="dashboard">Cancel</g:link>
					
					
				     <g:actionSubmit action="delete"  value="Delete" rel="external" data-inline="true"  data-role="button" data-inline="true" data-theme="e"/>
				
					<g:actionSubmit action="update" value="Update Entry"  rel="external" data-inline="true"  data-role="button" data-inline="true" data-theme="b"/>
					
				</div>
				
			</g:form>		
					

			</div><!-- /content -->


			<g:render template="/common/mobile/footer"/>


		</div><!-- end of page-->


		<div data-role="dialog" id="help">

			<div data-role="header">
				<h1>How to use</h1>
			</div>

			<div data-role="content">

			</div>

		</div>
		
		<g:render template="/help/definitions"/>

    </body>
</html>
