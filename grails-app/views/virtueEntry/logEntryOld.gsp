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
