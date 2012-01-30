<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="user" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>


            <h1>Account Info</h1>

            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>


			<form id="editAccountForm" name="editAccountForm" action="update" method="post" >
				<div id="validationSummary"></div>
            	
		    	<g:hiddenField name="id" value="${accountInstance?.id}" />
		    	<g:hiddenField name="version" value="${accountInstance?.version}" />
            	
				<p>
	        		<label for="username">Username</label> : ${accountInstance?.username}
	        	</p>
            	
				<p>
	        		<label for="email">Email</label>
	        		<g:textField name="email" value="${accountInstance?.email}" id="email" value=""/>
				</p>
            	
				<p>
	        		<label for="passwordHash">New Password</label>             	
	        		<input type="password" name="passwordHash" value="" id="passwordHash"/>
	        	</p>
            	
				<p>
	     			<label for="confirmPassword">Confirm Password</label>
	        		<input type="password" name="confirmPassword" value="" id="confirmPassword"/>
	        	</p>          
            	

            	
				<shiro:hasRole name="ROLE_ADMIN">
            		<p>
            			<label for="active"><g:message code="account.active.label" default="Active" /></label>
            		    <g:checkBox name="active" value="${accountInstance?.active}" />
					</p>
					
					<p>
						<label for="roles"><g:message code="account.roles.label" default="Roles" /></label>
            		    <g:select name="roles" from="${Role.list()}" multiple="yes" optionKey="id" size="5" value="${accountInstance?.roles*.id}" />
					</p>
            	</shiro:hasRole>
            	
				<input type="submit" name="update" class="update" id="update" value="Update"/>
					
				<shiro:hasRole name="ROLE_ADMIN">
					<g:actionSubmit class="delete" action="delete" value="Delete" id="${accountInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</shiro:hasRole>
					
			</form>


    </body>
</html>
