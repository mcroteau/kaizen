<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <meta name="author" content=""/>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
	
	<meta content="Franklins 13 App, Ben Franklins App, Ben Franklins 13 Virtues App, Happiness vs Virtues, Virtues, Satisfaction" name="Keywords"/>
    <meta content="Franklins13+ App : A self-improvement application based on Benjamin Franklin's 13 Principles. " name="Description"/>

    <title>Welcome to Franklin's 13+ App : Franklins 13+ is based on Benjamin Franklin's 13 Principles. </title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'mediaqueries.css')}" />

    <g:layoutHead />

		
</head>
<body>


	<div class="topbar">
		
		<div class="topcontent">
			<g:set var="count" value="${Account.count()}" />
			<g:set var="remaining" value="${20 - count}"/>
			

			<g:if test="${shiro.principal()}">
				<g:link controller="auth" action="signOut" class="logout">Logout</g:link>
			</g:if>
			<g:else>
				<g:if test="${remaining > 0}">
					<g:link controller="account" action="registrationPage" class="openings">${remaining} Openings Left,  + Join</g:link>
				</g:if>
				<g:else>
					<span class="openings">Sorry, no openings Left!</span>
				</g:else>
				<g:link controller="auth" action="login" class="login">Login</g:link>
			</g:else>
		</div>
		
	</div>
	
	<div class="header">
		<a href="" class="logo large"></a>
			
		<nav class="menu">
			
			<g:link controller="static" class="${welcomeActive}" action="welcome" title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</g:link>
			<g:link controller="static" class="${experimentActive}" action="experiment" title="Franklins 13+ : The Experiment Explained">The Experiment</g:link>
			<g:link controller="static" class="${definitionsActive}" action="definitions" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Principles</g:link>
			
		</nav>
	</div>
	

	
	<g:layoutBody />
			
	<br class="clear"/>
		
			
	<div class="notes footernav" style="width:500px; margin:20px auto;">
		
		
		<g:link controller="static" action="welcome">Welcome</g:link>| 
		<g:link controller="static" action="experiment">The Experiment</g:link>|
		<g:link controller="static" action="definitions">The Principles</g:link>|
		<g:link controller="static" action="privacy">Privacy Policy</g:link>
		
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