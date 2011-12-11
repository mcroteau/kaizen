

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
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
	        		<g:textField name="email" value="${accountInstance?.email}" id="email" value="croteau.mike+test@gmail.com"/>
				</p>
            	
				<p>
	        		<label for="passwordHash">New Password</label>             	
	        		<input type="password" name="passwordHash" value="" id="passwordHash"/>
	        	</p>
            	
				<p>
	     			<label for="confirmPassword">Confirm Password</label>
	        		<input type="password" name="confirmPassword" value="" id="confirmPassword"/>
	        	</p>          
            	
				<p>
					<label for="isMale">Gender</label>
					<g:select name="isMale"
					          from="${['Gentleman', 'Lovely Lady']}"
							  keys="${['true', 'false']}"
					          value="${accountInstance.isMale}" />
					
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
			
			
			
			
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.active.label" default="Active" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${accountInstance?.active}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.fullName.label" default="Full Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "fullName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.passwordHash.label" default="Password Hash" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "passwordHash")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.permissions.label" default="Permissions" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "permissions")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${accountInstance.roles}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${accountInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
