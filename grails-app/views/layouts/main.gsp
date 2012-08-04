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

	
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap.css')}" />
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-mods.css')}" />
    <link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-responsive-mods.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'franklins13.css')}" />



	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/1.7.2/', 'jquery.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/qtip/2.0.0pre/', 'jquery.qtip.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'bootstrap/js/', 'bootstrap.js')}"></script>


    <g:layoutHead />

</head>
<body>

	
<g:set var="count" value="${Account.count()}" />
<g:set var="remaining" value="${20 - count}"/>


<div class="container">

	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span5 show-border">&nbsp;</div>
		<div class="span5 align-right  show-border">
			<g:if test="${shiro.principal()}">
				<span class="welcome-message">Welcome back <shiro:principal/>
					<g:link controller="static" action="dashboard" class="label label-info">My Dashboard</g:link>
				</span>
				<g:link controller="auth" action="signOut" class="label">Logout</g:link>
			</g:if>
			<g:else>
				<g:if test="${remaining > 0}">
					<g:link controller="account" action="registrationPage" class="label">${remaining} Openings Left,  + Join</g:link>
				</g:if>
				<g:else>
					<span class="label">Sorry, no openings Left!</span>
				</g:else>
				<g:link controller="auth" action="login" class="label label-info">Login</g:link>
			</g:else>
			
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>


	<div class="row">
		<div class="span1 show-borde visible-desktopr">&nbsp;</div>
		<div class="span10 show-border">
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>

	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span10 align-center show-border">
			<nav class="main-nav">
				<a href="welcome.html" class="" title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</a>
				<a href="experiment.html" class="" title="Franklins 13+ : The Experiment Explained">The Experiment</a>
				<a href="virtues.html" class="" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Virtues</a>
			</nav>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>
	
		
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
				<g:link controller="static" action="welcome"  title="Franklins 13+ : Welcome to Franklin's 13+ App">Welcome</g:link>| 
				<g:link controller="static" action="experiment" title="Franklins 13+ : The Experiment Explained">The Experiment</g:link>|
				<g:link controller="static" action="definitions" title="Franklins 13+ : Ben Franklin's 13 Virtues/Principals Defined">The Principles</g:link>|
				<g:link controller="static" action="privacy" title="Franklins 13+ : Privacy Policy">Privacy Policy</g:link>
			</p>
			<p>&copy;2012  - powered by grails</p>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>

</div>
	
	
				
<shiro:hasRole name="ROLE_ADMIN">
<div class="row">
	<div class="span1 visible-desktop"></div>
	<div class="span10 well">
	    <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
	</div>
	<div class="span1 visible-desktop"></div>
</div>
</shiro:hasRole>		




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