


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title>Reset Password -> Franklins 13 App</title>
    </head>
    <body>

            <h1>Reset Password</h1>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            	<div class="errors">
                	<g:renderErrors bean="${accountInstance}" as="list" />
            	</div>
            </g:hasErrors>

			
			<style type="text/css">
			
				input[type="text"]{
					clear:both;
					display:block
				}
				
			</style>
			
            <form id="sendResetEmail" name="sendResetEmail" action="sendResetEmail" method="post" >
	
				<h2>Step One : Enter Email</h2>
				<input type="text" name="email" value="" >
				<input type="submit" value="Send Reset Email"/>
				
				<h2>Step Two : Click on confirmation to reset password in email</h2>
				
				<h2>Step 3 : Reset Password</h2>
				
            </form>


	
    </body>
</html>
