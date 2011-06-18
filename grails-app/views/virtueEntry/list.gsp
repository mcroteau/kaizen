

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="newEntry"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'virtueEntry.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="notes" title="${message(code: 'virtueEntry.notes.label', default: 'Notes')}" />
                        
                            <g:sortableColumn property="chastity" title="${message(code: 'virtueEntry.chastity.label', default: 'Chastity')}" />
                        
                            <g:sortableColumn property="cleanliness" title="${message(code: 'virtueEntry.cleanliness.label', default: 'Cleanliness')}" />
                        
                            <g:sortableColumn property="entryDate" title="${message(code: 'virtueEntry.entryDate.label', default: 'Entry Date')}" />
                        
                            <g:sortableColumn property="frugality" title="${message(code: 'virtueEntry.frugality.label', default: 'Frugality')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${virtueEntryInstanceList}" status="i" var="virtueEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${virtueEntryInstance.id}">${fieldValue(bean: virtueEntryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: virtueEntryInstance, field: "notes")}</td>
                        
                            <td><g:formatBoolean boolean="${virtueEntryInstance.chastity}" /></td>
                        
                            <td><g:formatBoolean boolean="${virtueEntryInstance.cleanliness}" /></td>
                        
                            <td><g:formatDate date="${virtueEntryInstance.entryDate}" /></td>
                        
                            <td><g:formatBoolean boolean="${virtueEntryInstance.frugality}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${virtueEntryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
