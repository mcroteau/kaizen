<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Franklins 13" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:layoutHead />
</head>
<body>
		
	<div id="outer-wrapper">
		
		<div id="container">
			
		
			<div id="top">
				
				<a href="/franklins13" id="logo">Franklin's <span>13</span></a>
				
				<div id="menu">
					
					<g:link controller="static" action="welcome">Welcome</g:link>
					<g:link controller="static" action="experiment">The Experiment</g:link>
					<g:link controller="static" action="definitions">13 Principles Defined</g:link>
					
				</div>
				
			</div>
			
			<div id="maincontent">
				<g:layoutBody />
			</div>
			
			<div id="footer">
				
				
				<shiro:isLoggedIn>
					<div id="">
						welcome back <shiro:principal/>&nbsp;&nbsp;|&nbsp;&nbsp;<g:link controller="auth" action="signOut">logout</g:link>
						
						&nbsp;&nbsp;|&nbsp;&nbsp;<g:link controller="static" action="dashboard">access mobile site, start logging daily virtues followed</g:link>
					</div>
				</shiro:isLoggedIn>
				<shiro:notAuthenticated>
					<g:link controller="auth" action="login">login</g:link>
				</shiro:notAuthenticated>
				
			</div>
			
			
		</div>
		
	</div>
	
	
	
	<shiro:hasRole name="ROLE_ADMIN">
		<div id="adminpanel">
		
		    <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                </g:each>
            </ul>
		
		</div>
	</shiro:hasRole>
	
	<g:link controller="virtueEntry" action="calendar">Calendar Dev</g:link>
	<g:link controller="account" action="registrationPage">Register</g:link>
	
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