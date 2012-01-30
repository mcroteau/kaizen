

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div class="content history">

            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

 			<div id="entriesListWrapper" class="entrieslistWrapper" style="">

           		<table class="entries">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'account.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'account.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'account.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="active" title="${message(code: 'account.active.label', default: 'Active')}" />
                        
           
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${accountInstanceList}" status="i" var="accountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${accountInstance.id}">${fieldValue(bean: accountInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "email")}</td>
                        
                            <td><g:formatBoolean boolean="${accountInstance.active}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${accountInstanceTotal}" />
            </div>

	</div>

</body>
</html>
