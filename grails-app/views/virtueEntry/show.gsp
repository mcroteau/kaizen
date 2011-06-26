<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Log Todays Entry</title>
    </head>
    
	<body>
	
		<div data-role="page">

			<div data-role="header" data-theme="b">
				<a href="#" data-icon="arrow-l" rel="external" data-rel="back">Back</a>
				<h1>Todays Entry ${new Date()}</h1>
				<a href="#help" data-icon="alert" class="ui-btn-right" data-transition="pop">Help</a>

			</div><!-- /header -->

			<div data-role="content" id="showEntry">	

		
				<p>Check all virtues you successfully upheld today.  Unsure what each Virtue means, click <a href="#definitions" data-transition="flip">here</a></p>

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
				<!-- <h1>${virtueEntryInstance?.happinessScale}</h1> -->
				<div data-role="fieldcontain">
					<label for="happinessScale">Slide from 1 to 10, 10 being extemely happy/satisfied with your day</label>
				 	<input type="range" name="happinessScale" id="happinessScale" value="${virtueEntryInstance?.happinessScale}" min="0" max="10"  />
				</div>
                	

			</div><!-- /content -->

			<div data-role="footer">
				<div data-role="navbar">
					<ul>
						<li><a href="todaysEntry.html" class="ui-btn-active" data-icon="star" data-iconpos="top">Todays Entry</a>
						<li><a href="dashboard.html" rel="external" class="" data-role="button" data-icon="grid" data-iconpos="top">Dashboard</a>
						<li><a href="#definitions" class="" data-role="button" data-icon="info" data-iconpos="top" data-transition="slide" >Virtues Defined</a>
					</ul>
				</div>
			</div><!-- /footer -->

		</div><!-- end of page-->


		<div data-role="dialog" id="help">

			<div data-role="header">
				<h1>How to use</h1>
			</div>

			<div data-role="content">

			</div>

		</div>
		
		<g:render template="/help/definitions"/>
		<script type="">
		 $('#showEntry input').attr('disabled', 'disabled');
		 $('#happinessScale').attr('disabled', 'disabled');
		</script>
    </body>
</html>
