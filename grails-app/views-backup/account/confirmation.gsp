


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Confirmation Email Sent  -> Franklins 13+ App</title>
</head>
<body>
	
	<div class="content resetContainer">
	
		<h1>Email Confirmation Sent</h1>
		<p></p>
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="header"></span>
				<span class="messageDetails">
			    	${flash.message}
				</span>
				<!--<a href="#" class="closeButton closeMessage"></a>-->
	
			</div>		
	    </g:if>

	
		<div class="resetWrapper notes">
	
			<div class="resetForm">
				<p class="large inactive">
					<em class="highight">Step One : Enter Email</em><br/>
				</p>
				<p class="large">
					<em>Step Two : Verify Email</em><br/>
					<span class="small">
					Successfully sent email confirmation. Please check the email address used on franklins13+ for instructions on how to continue the password reset process.</span>
				</p>
				<p class="large inactive">
					<em>Step Three : Reset Password</em><br/>
				</p>
	
			</div>

	
		</div>
		
		<br class="clear"/>
	</div>
	
</body>
</html>
