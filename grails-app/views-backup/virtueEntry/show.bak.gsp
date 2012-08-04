

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 App : Show Entry</title>
    </head>
    <body>


	
            <h1>Logged Virtues Entry for <g:formatDate date="${virtueEntryInstance?.entryDate}" format="dd MMM yyyy"/></h1>
    
        	<h2>${virtueEntryInstance.performanceDescription}</h2>

			<h2>+ ${virtueEntryInstance.totalPoints} points earned</h2>
			
			<g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>

                <table>
                    <tbody>

                        <tr>
                            <td><g:message code="virtueEntry.chastity.label" default="Chastity" /></td>
                            
                            <td><g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.cleanliness.label" default="Cleanliness" /></td>
                            
                            
                            <td><g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}"  /></td>
                            
                        </tr>
                    
 
                        <tr>
                            <td><g:message code="virtueEntry.frugality.label" default="Frugality" /></td>
                            
                            
                            <td><g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}"  /></td>
                            
                        </tr>

                        <tr>
                            <td><g:message code="virtueEntry.humility.label" default="Humility" /></td>
                            
                            
                            <td><g:checkBox name="humility" value="${virtueEntryInstance?.humility}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.industry.label" default="Industry" /></td>
                            
                            
                            <td><g:checkBox name="industry" value="${virtueEntryInstance?.industry}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.justice.label" default="Justice" /></td>
                            
                            
                            <td><g:checkBox name="justice" value="${virtueEntryInstance?.justice}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.moderation.label" default="Moderation" /></td>
                            
                            
                            <td><g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.orderVirtue.label" default="Order Virtue" /></td>
                            
                            
                            <td><g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.resolution.label" default="Resolution" /></td>
                            
                            
                            <td><g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.silence.label" default="Silence" /></td>
                            
                            
                            <td><g:checkBox name="silence" value="${virtueEntryInstance?.silence}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.sincerity.label" default="Sincerity" /></td>
                            
                            
                            <td><g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.temperance.label" default="Temperance" /></td>
                            
                            
                            <td><g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}"  /></td>
                            
                        </tr>
                    
                        <tr>
                            <td><g:message code="virtueEntry.tranquility.label" default="Tranquility" /></td>
                            
                            
                            <td><g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}"  /></td>
                            
                        </tr>
						
                    
                        <tr>
                            <td><g:message code="virtueEntry.wellBeing.label" default="Well Being" /></td>
                            
                            
                            <td><g:checkBox name="wellBeing" value="${virtueEntryInstance?.wellBeing}"  /></td>
                            
                        </tr>                    
                
                    	<tr>
                    	    <td><g:message code="virtueEntry.happinessScale.label" default="Happiness Scale" /></td>
                    	    
                    	    <td>${fieldValue(bean: virtueEntryInstance, field: "happinessScale")}</td>
                    	    
                    	</tr>
                    	

                        <tr>
                            <td><g:message code="virtueEntry.notes.label" default="Notes" /></td>
                            
                            <td>${fieldValue(bean: virtueEntryInstance, field: "notes")}</td>                    
                        </tr>

						<tr>
							<td><br/></td>
						</tr>

                    </tbody>
                </table>


            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${virtueEntryInstance?.id}" />
                    
					<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
					
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                
				</g:form>
            </div>


			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>

			<script type="text/javascript">
				$('input[type="checkbox"]').attr('disabled', 'disabled');
				$('#happinessScale').attr('disabled', 'disabled');
			</script>
			
    </body>
</html>
