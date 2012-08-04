
<div data-role="footer" data-position="bottom">

	<div class="ui-bar ui-bar-a">
		<div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
			
			
			<!--
			<a href="#definitions" data-inline="true" data-role="button" data-icon="info" class="ui-btn ui-btn-up-a ui-btn-inline ui-corner-left">
				<span class="ui-btn-inner ui-corner-left">
					<span class="ui-btn-text">Virtues Defined</span>
					<span class=""></span>
				</span>
			</a>
			<a href="#help" data-inline="true" data-role="button" data-theme="a" class="ui-btn ui-btn-up-a ui-btn-inline ui-corner-right ui-controlgroup-last">
				<span class="ui-btn-inner ui-corner-right ui-controlgroup-last">
					<span class="ui-btn-text">Help</span>
				</span>
			</a>
			-->
			
			<a href="#definitions" data-inline="true" data-role="button" data-icon="info" class="ui-btn ui-btn-up-a ui-btn-inline ui-corner-left ui-corner-right">
				<span class="ui-btn-inner ui-corner-left ui-corner-right">
					<span class="ui-btn-text">Virtues Defined</span>
					<span class=""></span>
				</span>
			</a>
						
			
			<shiro:authenticated>
			
				<g:link controller="auth" action="signOut" data-inline="true" data-ajax="false" data-role="button" data-theme="b" class="ui-btn ui-btn-up-a ui-corner-right ui-corner-left">
					<span class="ui-btn-inner ui-corner-right ui-corner-left" data-th>
						<span class="ui-btn-text">Logout</span>
					</span>
				</g:link>
			
			</shiro:authenticated>
			
			
		</div><!-- /controlgroup -->
		
	</div>

</div><!-- /footer -->