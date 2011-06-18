

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'account.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'account.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'account.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="active" title="${message(code: 'account.active.label', default: 'Active')}" />
                        
                            <g:sortableColumn property="fullName" title="${message(code: 'account.fullName.label', default: 'Full Name')}" />
                        
                            <g:sortableColumn property="passwordHash" title="${message(code: 'account.passwordHash.label', default: 'Password Hash')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${accountInstanceList}" status="i" var="accountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${accountInstance.id}">${fieldValue(bean: accountInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "email")}</td>
                        
                            <td><g:formatBoolean boolean="${accountInstance.active}" /></td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "fullName")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "passwordHash")}</td>
                        
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
