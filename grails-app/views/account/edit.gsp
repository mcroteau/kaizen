


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
            <h1>Edit Account</h1>

            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            	<div class="errors">
                	<g:renderErrors bean="${accountInstance}" as="list" />
            		</div>
            </g:hasErrors>

            <g:form method="post" >
                <g:hiddenField name="id" value="${accountInstance?.id}" />
                <g:hiddenField name="version" value="${accountInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="account.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${accountInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="account.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${accountInstance?.email}" />
                                </td>
                            </tr>
                        
							<shiro:hasRole name="ROLE_ADMIN">
                            	<tr class="prop">
                            	    <td valign="top" class="name">
                            	      <label for="active"><g:message code="account.active.label" default="Active" /></label>
                            	    </td>
                            	    <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'active', 'errors')}">
                            	        <g:checkBox name="active" value="${accountInstance?.active}" />
                            	    </td>
                            	</tr>
							</shiro:hasRole>
							
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passwordHash"><g:message code="account.passwordHash.label" default="Password Hash" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'passwordHash', 'errors')}">
                                    <g:textField name="passwordHash" value="${accountInstance?.passwordHash}" />
                                </td>
                            </tr>
                        

							<shiro:hasRole name="ROLE_ADMIN">
                            	<tr class="prop">
                            	    <td valign="top" class="name">
                            	      <label for="permissions"><g:message code="account.permissions.label" default="Permissions" /></label>
                            	    </td>
                            	    <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'permissions', 'errors')}">
                            	    </td>
                            	</tr>

                            	<tr class="prop">
                            	    <td valign="top" class="name">
                            	      <label for="roles"><g:message code="account.roles.label" default="Roles" /></label>
                            	    </td>
                            	    <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'roles', 'errors')}">
                            	        <g:select name="roles" from="${Role.list()}" multiple="yes" optionKey="id" size="5" value="${accountInstance?.roles*.id}" />
                            	    </td>
                            	</tr>
                    
                    		</shiro:hasRole>
                    
    					</tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
