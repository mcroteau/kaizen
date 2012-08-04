

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

            <h1>My Progress</h1>
			
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>

			<g:link action="calendar">Calendar View</g:link>
			
			<style type="text/css">
			
				table{width:100%; border-collapse:collapse; }
				
				table tr{border-bottom:solid 1px #efefef}
				table td{padding:3px; text-align:left}
				table td.center{text-align:center}
				
				table th{border-bottom:solid 1px #ddd; background:#efefef; padding:4px; text-align:center; font-weight:bold}
				
				.paginateButtons{}
				.paginateButtons .currentStep{padding:2px; margin: 5px; background:#efefef; border:solid 1px #ddd }
				
				.paginateButtons a{display:inline-block; padding:2px; margin: 5px; border:dotted 1px #ddd;}
			</style>
			
                <table style="width:100%">
                    <thead>
                        <tr>
         
                            <g:sortableColumn property="entryDate" title="Entry Date" />

                            <th>Notes</th>

                        	<g:sortableColumn property="totalCompleted" title="Completed/All"/>
                        
							<g:sortableColumn property="happinessScale" title="Happiness"/>
                        
							<g:sortableColumn property="totalPoints" title="Points"/>
                        
                        </tr>
                    </thead>
                    <tbody>

                    <g:each in="${virtueEntryInstanceList}" status="i" var="virtueEntryInstance">

                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td class="center">
								<g:link action="show" id="${virtueEntryInstance.id}"><g:formatDate date="${virtueEntryInstance.entryDate}" format="dd MMM yyyy" /></g:link>
							</td>
                        
                            <td style="width:300px;"><span class="notes">${fieldValue(bean: virtueEntryInstance, field: "notes")}</span></td>
                        	
							<td class="center">${virtueEntryInstance.totalCompleted}/14</td>
							
							<td class="center">${virtueEntryInstance.happinessScale}</td>
							
							<td class="center">${virtueEntryInstance.totalPoints}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            <div class="paginateButtons">
                <g:paginate total="${virtueEntryInstanceTotal}" />
            </div>



		
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jtruncate.js')}"></script>

		
		<script type="text/javascript">
		
			$(document).ready(function() {

				
			    $('.notes').jTruncate({
			        length: 50,
			        minTrail: 0,
			        moreText: " + more",
			        lessText: "[-]",
			        ellipsisText: " ...",
			        moreAni: "fast",
			        lessAni: "fast"
			    });
			});
		
		</script>
		
    </body>
</html>
