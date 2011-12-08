<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
	    <link rel="stylesheet" href="${resource(dir:'css/jquery-ui/ui-lightness',file:'jquery-ui-1.8.16.custom.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
	
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${virtueEntryInstance}">
        	<div class="errors">
            	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
        		</div>
        </g:hasErrors>

			<h1>Logged Virtues Entry for <g:formatDate date="${virtueEntryInstance?.entryDate}" format="dd MMM yyyy"/></h1>
    
        	<h2>${virtueEntryInstance.performanceDescription}</h2>

			<h2>+ ${virtueEntryInstance.totalPoints} points earned</h2>
			
			
			<h3 style="margin:0px">Entry Date</h3>
			

            <g:form action="update" >
				
				<g:datePicker name="entryDate" value="${virtueEntryInstance?.entryDate}" precision="day" years="[2011,2012, 2013]"/>
				
				<br/>
				
                    <table>
                        <tbody>
                        

                            <tr>
                                <td>
                                    <label for="chastity">Chastity</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'chastity', 'errors')}">
                                    <g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="cleanliness">Cleanliness</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'cleanliness', 'errors')}">
                                    <g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="frugality">Frugality</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'frugality', 'errors')}">
                                    <g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}" />
                                </td>
                            </tr>

                        
                            <tr>
                                <td>
                                    <label for="humility">Humility</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'humility', 'errors')}">
                                    <g:checkBox name="humility" value="${virtueEntryInstance?.humility}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="industry">Industry</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'industry', 'errors')}">
                                    <g:checkBox name="industry" value="${virtueEntryInstance?.industry}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="justice">Justice</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'justice', 'errors')}">
                                    <g:checkBox name="justice" value="${virtueEntryInstance?.justice}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="moderation">Moderation</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'moderation', 'errors')}">
                                    <g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="orderVirtue">Order</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'orderVirtue', 'errors')}">
                                    <g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="resolution">Resolution</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'resolution', 'errors')}">
                                    <g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="silence">Silence</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'silence', 'errors')}">
                                    <g:checkBox name="silence" value="${virtueEntryInstance?.silence}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="sincerity">Sincerity</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'sincerity', 'errors')}">
                                    <g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="temperance">Temperance</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'temperance', 'errors')}">
                                    <g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <label for="tranquility">Tranquility</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'tranquility', 'errors')}">
                                    <g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}" />
                                </td>
                            </tr>



	                        <tr>
	                            <td><g:message code="virtueEntry.wellBeing.label" default="Well Being" /></td>


	                            <td><g:checkBox name="wellBeing" value="${virtueEntryInstance?.wellBeing}"  /></td>

	                        </tr>
	
                        
                        	<tr>
                        	    <td>
                        	        <label for="happinessScale">Rate the Day - Satisfaction/Happiness</label>
                        	    </td>
                        	    <td valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'happinessScale', 'errors')}">
                        	        <!--<g:textField name="happinessScale" value="${fieldValue(bean: virtueEntryInstance, field: 'happinessScale')}" />-->

                        	    </td>
                        	</tr>

							<tr>
								<td colspan="2" class="slider">
									<span>1</span>
									<span id="happinessScaleSlider" style="width:100px; display:inline-block"></span>
									<span>10</span>
									<span id="happinessScaleValue">0</span>
									<input type="hidden" name="happinessScale" id="happinessScale"  value="0" />
								</td>
							</tr>

                            <tr>
                                <td colspan="2">
                                    <label for="notes">Notes</label>
                                </td>
							</tr>
							<tr>
                                <td colspan="2" valign="top" class="value ${hasErrors(bean: virtueEntryInstance, field: 'notes', 'errors')}">
                                    <g:textArea name="notes" value="${virtueEntryInstance?.notes}" />
                                </td>
                            </tr>


							<tr>
								<td><br/></td>
							</tr>

                        </tbody>
                    </table>


				<input type="hidden" name="id" value="${virtueEntryInstance.id}"/>
				
                <div class="buttons">
                    <span class="button"><g:submitButton name="update" class="update" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>

                </div>
            </g:form>


			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script>
			
			<script type="text/javascript">
				
				$(document).ready(function(){
					
					$("#happinessScaleSlider").slider({
						min : 0, 
						max : 10,
						value : ${virtueEntryInstance.happinessScale},
						slide : function(event, ui){
							var value = ui.value;
							$('#happinessScale').val(value);
							$('#happinessScaleValue').html(value);
						},
						create : function(event, ui){
							console.log(ui)
							var value = $('#happinessScaleSlider').slider('value');
							$('#happinessScale').val(value);
							$('#happinessScaleValue').html(value);
						} 
					});
					
					console.log($('#happinessScaleSlider').slider('value'));
					
				});

			
			</script>



    </body>
</html>
