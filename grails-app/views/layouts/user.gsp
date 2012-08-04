<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <meta name="author" content=""/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>	 
	<meta content="Franklins 13 App, Ben Franklins App, Ben Franklins 13 Virtues App, Happiness vs Virtues, Virtues, Satisfaction" name="Keywords"/>
    <meta content="Franklins13+ App : A self-improvement application based on Benjamin Franklin's 13 Principles." name="Description"/>


    <title>Welcome back <shiro:principal/>  : Franklin's 13 App</title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
    <link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar-mods.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css/jquery-ui/ui-lightness/',file:'jquery-ui-1.8.16.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap.css')}" />
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-responsive-mods.css')}" />
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-mods.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'franklins13.css')}" />


	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/1.7.2/', 'jquery.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/qtip/2.0.0pre/', 'jquery.qtip.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'bootstrap/js/', 'bootstrap.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/flot/1.1/', 'flot.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/fullcalendar/1.5.2/', 'fullcalendar.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery-ui/1.8.16/', 'jquery-ui.js')}"></script>
			
</head>
<body>


<div class="container">

	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span5 show-border">&nbsp;</div>
		<div class="span5 align-right">
			<span class="welcome-message">Welcome back <shiro:principal/>
			</span>
			<g:link controller="auth" action="signOut" class="label  label-warning">Logout</g:link>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>


	<div class="row">


		<div class="span1 visible-desktop">&nbsp;</div>		
		<div class="span4">
			<div class="userstats">
				
				
				<p class="lead">
					Total Score <g:if test="${session.totalScore < 0}">-</g:if><em class="scoreWrapper"><code class="score">${session.totalScore}</code></em> 

					Rank <em class="rankWrapper"><code class="rank">${session.rank}</code></em> of ${Account.count()}
				</p>		
			</div>
		</div>

		<div class="span6">
			<div class="usernav pull-right">
				<ul class="nav nav-pills">
					<li class="${accountActive}"><g:link controller="account" action="edit">Account</g:link></li>
					<li class="${logentryActive}"><g:link controller="virtueEntry" action="logEntry" title="Franklins 13+ : Log Entry" params="[activeLink: 'logentry']">Log Entry</g:link></li>
					<li class="${historyActive}"><g:link controller="virtueEntry" action="history" title="Franklins 13+ : Entry History" params="[activeLink: 'history']">History</g:link></li>
					<li class="${dashboardActive}"><g:link controller="static" action="dashboard" title="Franklins 13+ Dashboard" params="[activeLink: 'dashboard']">Dashboard</g:link></li>
				</ul>
			</div>
		</div>

		<div class="span1 visible-desktop">&nbsp;</div>
	</div>
	

	<g:if test="${flash.message}">
		<div class="row">
			<div class="span1 visible-desktop"></div>
			<div class="span10">
				<div class="alert alert-block">
				  <a class="close" data-dismiss="alert" href="#">×</a>
				  ${flash.message}
				</div>
			</div>
			<div class="span1 visible-desktop"></div>
		</div>
    </g:if>	


	<g:layoutBody />
			

	<div class="row">
	 	<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span10 page-header">
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>


	<div class="row">
	 	<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span10 footer">
			<p class="pull-right">
				<g:link controller="static" action="welcome"  title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</g:link>
				<g:link controller="static" action="experiment" title="Franklins 13+ : The Experiment Explained">The Experiment</g:link>
				<g:link controller="static" action="definitions" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Principles</g:link>
				<g:link controller="static" action="privacy" title="Franklins 13+ : Privacy Policy">Privacy Policy</g:link>
			</p>
			<p>&copy;2012  - powered by grails</p>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>
	


	<shiro:hasRole name="ROLE_ADMIN">
		<div class="row">
			<div class="span1 visible-desktop">&nbsp;</div>
			<div class="span9 well">
			    <ul>
		            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
		                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
		            </g:each>
		        </ul>
			</div>
			<div class="span1 visible-desktop">&nbsp;</div>
		</div>
	</shiro:hasRole>		


</div>



<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23684175-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>	


</body>
</html>
	