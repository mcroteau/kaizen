


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title>Email Sent Confirmation -> Franklins 13 App</title>
    </head>
    <body>

            <h1>Recovery Email Sent</h1>
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
			


	
    </body>
</html>
