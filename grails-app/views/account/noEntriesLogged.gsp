<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>Franklins 13+ : No Entries Logged Yet</title>
</head>

<body>

	<div class="content confirmation notes" style="">	
			
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="messageHeader">Message : </span>
				<span class="messageDetails">${flash.message}</span>
				<a href="#" class="closeButton closeMessage"></a>
			</div>
	    </g:if>
		
		<g:hasErrors bean="${virtueEntryInstance}">
			<div class="errors">
		    	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
			</div>
		</g:hasErrors> 
			
		<h1>No Entries Logged Yet!</h1>
		
		<p class="large">In order for you to access the dashboard you will need to log your first entry.  Click "Log Entry"</p>	
	
		
		<div class="buttons">
			<g:link controller="virtueEntry" action="logEntry" id="" class="button small blue"  params="[activeLink: 'logentry']">Log Entry</g:link>				
		</div>
	</div>

<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script>

<script type="text/javascript">

	$(document).ready(function(){

		var Messages = function(){
			var self = this;


			self.init = function(){
				bindClickEvent();
			}

			function bindClickEvent(){
				$('.message .closeButton').click(function(event){
					event.preventDefault();
					$(event.target).parent().remove();
				});
			}

			return {
				init : self.init
			}
		}


		var messages = new Messages();
		messages.init();


	});	
</script>
			
</body>
</html>

