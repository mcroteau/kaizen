<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <meta name="author" content=""/>
	 
    <title><shiro:principal/>'s Dashboard : Franklin's 13 App</title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style-userloggedin.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css/jquery-ui/ui-lightness/',file:'jquery-ui-1.8.16.custom.css')}" />
		
</head>
<body>

	
	<div class="topbar">
		<div class="topcontent">
			<a href="" class="logo micro"></a>
			<g:link controller="auth" action="signOut" class="logout">Logout</g:link>
			<br class="clear"/>
		</div>
		
	</div>	
	
	<div class="header">
		
		<span class="welcome">Welcome back <shiro:principal/> <g:link controller="account" action="edit">edit</g:link></span>
		<nav class="usernav">
			
			<g:link controller="static" class="${dashboardActive}" action="dashboard" title="Franklins 13+ Dashboard" params="[activeLink: 'dashboard']">Dashboard</g:link>
			<g:link controller="virtueEntry" class="${logentryActive}" action="logEntry" title="Franklins 13+ : Log Entry" params="[activeLink: 'logentry']">Log Entry</g:link>
			<g:link controller="virtueEntry" class="${historyActive}" action="history" title="Franklins 13+ : Entry History" params="[activeLink: 'history']">History</g:link>
		
		</nav>
		
		<br class="clear"/>
	</div>
	
	
	
	<g:layoutBody />
			
	<br class="clear"/>
	

	<div class="notes" style="width:500px; margin:20px auto;">

		<g:link controller="static" action="welcome">Welcome</g:link>|	
		<g:link controller="static" action="experiment">The Experiment</g:link>|
		<g:link controller="static" action="definitions">The Virtues</g:link>|
			
		<g:link controller="virtueEntry" action="logEntry">Todays Entry</g:link>| 
		<g:link controller="static" action="dashboard">Dashboard</g:link>|
		<g:link controller="virtueEntry" action="calendar">Calendar</g:link>|
		<g:link controller="virtueEntry" action="listview">All Progress</g:link>|
		<g:link controller="account" action="info">Account</g:link>
		<shiro:hasRole name="ROLE_ADMIN">
			<div id="adminpanel">
	
			    <ul>
	                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
	                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
	                </g:each>
	            </ul>
	
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
	