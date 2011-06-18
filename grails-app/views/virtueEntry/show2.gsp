

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: virtueEntryInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: virtueEntryInstance, field: "notes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.chastity.label" default="Chastity" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.chastity}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.cleanliness.label" default="Cleanliness" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.cleanliness}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.entryDate.label" default="Entry Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${virtueEntryInstance?.entryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.frugality.label" default="Frugality" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.frugality}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.happinessScale.label" default="Happiness Scale" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: virtueEntryInstance, field: "happinessScale")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.humility.label" default="Humility" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.humility}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.industry.label" default="Industry" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.industry}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.justice.label" default="Justice" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.justice}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.moderation.label" default="Moderation" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.moderation}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.orderVirtue.label" default="Order Virtue" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.orderVirtue}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.resolution.label" default="Resolution" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.resolution}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.silence.label" default="Silence" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.silence}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.sincerity.label" default="Sincerity" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.sincerity}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.temperance.label" default="Temperance" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.temperance}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="virtueEntry.tranquility.label" default="Tranquility" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${virtueEntryInstance?.tranquility}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${virtueEntryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
