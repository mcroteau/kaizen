<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${virtueEntryInstance}">
            <div class="errors">
                <g:renderErrors bean="${virtueEntryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes"><g:message code="virtueEntry.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'notes', 'errors')}">
                                    <g:textField name="notes" value="${virtueEntryInstance?.notes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="chastity"><g:message code="virtueEntry.chastity.label" default="Chastity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'chastity', 'errors')}">
                                    <g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cleanliness"><g:message code="virtueEntry.cleanliness.label" default="Cleanliness" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'cleanliness', 'errors')}">
                                    <g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="entryDate"><g:message code="virtueEntry.entryDate.label" default="Entry Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'entryDate', 'errors')}">
                                    <g:datePicker name="entryDate" precision="day" value="${virtueEntryInstance?.entryDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="frugality"><g:message code="virtueEntry.frugality.label" default="Frugality" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'frugality', 'errors')}">
                                    <g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="happinessScale"><g:message code="virtueEntry.happinessScale.label" default="Happiness Scale" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'happinessScale', 'errors')}">
                                    <g:textField name="happinessScale" value="${fieldValue(bean: virtueEntryInstance, field: 'happinessScale')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="humility"><g:message code="virtueEntry.humility.label" default="Humility" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'humility', 'errors')}">
                                    <g:checkBox name="humility" value="${virtueEntryInstance?.humility}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry"><g:message code="virtueEntry.industry.label" default="Industry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'industry', 'errors')}">
                                    <g:checkBox name="industry" value="${virtueEntryInstance?.industry}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="justice"><g:message code="virtueEntry.justice.label" default="Justice" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'justice', 'errors')}">
                                    <g:checkBox name="justice" value="${virtueEntryInstance?.justice}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moderation"><g:message code="virtueEntry.moderation.label" default="Moderation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'moderation', 'errors')}">
                                    <g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderVirtue"><g:message code="virtueEntry.orderVirtue.label" default="Order Virtue" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'orderVirtue', 'errors')}">
                                    <g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="resolution"><g:message code="virtueEntry.resolution.label" default="Resolution" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'resolution', 'errors')}">
                                    <g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="silence"><g:message code="virtueEntry.silence.label" default="Silence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'silence', 'errors')}">
                                    <g:checkBox name="silence" value="${virtueEntryInstance?.silence}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sincerity"><g:message code="virtueEntry.sincerity.label" default="Sincerity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'sincerity', 'errors')}">
                                    <g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="temperance"><g:message code="virtueEntry.temperance.label" default="Temperance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'temperance', 'errors')}">
                                    <g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tranquility"><g:message code="virtueEntry.tranquility.label" default="Tranquility" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'tranquility', 'errors')}">
                                    <g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
