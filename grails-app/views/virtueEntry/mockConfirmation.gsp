<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>Franklins 13 : Successfully Logged Virtues</title>
</head>

<body>

	<div class="content confirmation notes" style="">	
			
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="header">Message : </span>
				<span class="messageDetails">${flash.message}</span>
				<a href="#" class="closeButton closeMessage"></a>
			</div>
	    </g:if>
		
		<g:hasErrors bean="${virtueEntryInstance}">
			<div class="errors">
		    	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
			</div>
		</g:hasErrors> 
		
		<style type="text/css">
			.confirmation{
				width:400px;
				height:250px !important;
				min-height:250px !important;
				margin:20px auto;
				padding:20px;
				text-align:center;				
			}
			.confirmation h1{
				text-align:center;
			}
			.confirmation h1 span{
				font-size:30px;
				font-weight:bold;
			}
			.confirmationStat span{
				font-size:18px;
				font-weight:bold;
				color:#333;
			}
			.confirmation span.highlight{
				font-size:22px;
			}
		</style>
		
		
		<div class="message info" id="">
			<span class="messageHeader">Message : </span>
			<span class="messageDetails">Successfully logged Virtue Entry for 12 Dec 2012</span>
			<a href="#" class="closeButton closeMessage"></a>
		</div>
			
		<h1><span>+ 20</span> Points Earned</h1>
		<h2>You did pretty good buddy...</h2>
		
		<p class="confirmationStat"><span class=" highlight">2</span> out of <span>13</span> completed.</p>	
		
		<p class="confirmationStat">You were <span class=" highlight">10</span> out of <span>10</span> on a Satisfaction/Happiness Scale</p>
		
		<div class="buttons">
			<g:link controller="virtueEntry" action="show" id="1" class="button small blue">View Entry</g:link>				
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
