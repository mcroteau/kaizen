<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <meta name="author" content=""/>
	 
    <title>Welcome to Franklin's 13+ App : Based on Ben Franklin's 13 Virtues</title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />

    <g:layoutHead />

		
</head>
<body>


	<div class="topbar">
		
		<div class="topcontent">
			<g:link controller="account" action="registrationPage" class="openings">${session.openings} Openings Left,  + Join</g:link>
			<g:link controller="auth" action="login" class="login">Login</g:link>
		</div>
		
	</div>
	
	<div class="header">
		<a href="" class="logo large"></a>
			
		<nav class="menu">
			
			<g:link controller="static" class="" action="welcome" title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</g:link>
			<g:link controller="static" class="" action="experiment" title="Franklins 13+ : The Experiment Explained">The Experiment</g:link>
			<g:link controller="static" class="" action="definitions" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Principles</g:link>
			
		</nav>
	</div>
		
	<div id="stats">
		<span>score : ${session.totalScore} </span>        
		<span>total entries : ${session.totalEntries}</span>
	</div>

	
	<g:layoutBody />
			
	<br class="clear"/>
		
			
	<div class="notes" style="width:500px; margin:20px auto;">
		<a href="logentry.html">log entry</a>&nbsp;|&nbsp;
		<a href="dashboard.html">dashboard</a>&nbsp;|&nbsp;
		<a href="account.html">account</a>&nbsp;|&nbsp;
		<a href="welcome.html" class="" title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</a>&nbsp;|&nbsp;
		<a href="experiment.html" class="" title="Franklins 13+ : The Experiment Explained">The Experiment</a>&nbsp;|&nbsp;
		<a href="virtues.html" class="active" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Virtues</a>
		
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