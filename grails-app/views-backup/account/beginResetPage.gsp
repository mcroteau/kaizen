<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
    <title>Begin Reset Password Process -> Franklins 13 App</title>
</head>

<body>

<div class="content resetContainer">

	<h1>Begin Password Reset Process</h1>
    
	<g:if test="${flash.message}">
		<div class="message warn" id="">
			<span class="header">Something Went wrong</span>
			<span class="messageDetails">
		    	${flash.message}
			</span>
			<!--<a href="#" class="closeButton closeMessage"></a>-->
			
		</div>		
    </g:if>

    <g:hasErrors bean="${accountInstance}">
    	<div class="errors">
        	<g:renderErrors bean="${accountInstance}" as="list" />
    	</div>
    </g:hasErrors>

	<g:hasErrors bean="${accountInstance}">
		<div class="message error" id="">
			<span class="header">Something Went wrong</span>
			<span class="messageDetails">
		    	<g:renderErrors bean="${accountInstance}" as="list" />
			</span>
		</div>
	</g:hasErrors>
	
	<div class="resetWrapper notes">

		<form id="sendResetEmail" name="sendResetEmail" action="sendResetEmail" method="post" >

		<div class="resetForm">
			<p class="large">
				<em class="highight">Step One : Enter Email</em><br/>
				<span class="small">An email will be sent to this address with instructions on how to continue reset process</span>
				<input type="email" value="" class="largeInput" id="email" name="email"/>
			</p>
			<p class="large inactive">
				<em>Step Two : Verify Email</em><br/>
				<span class="small">An email will be sent to this address with instructions on how to continue reset process</span>
			</p>
			<p class="large inactive">
				<em>Step Three : Reset Password</em><br/>
			</p>

		</div>
		</form>

		<div class="buttons large">
			<a href="#" class="button blue small" id="beginReset">Start Reset Process</a>
		</div>

	</div>

	<br class="clear"/>

</div>


<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-validation.min.js')}"></script>

<script type="text/javascript">

	var processing = false;
	$(document).ready(function(){
		
		$("#sendResetEmail").validate({
			debug: true,
			errorElement: "em",
			errorContainer: $("#validationSummary"),
			errorPlacement: function(error, element) {
				error.appendTo( element.parent() );
			},
			success: function(label) {
				label.text("ok!").addClass("valid");
			},
			rules: {
				email : {
					email : true,
					required : true
				}
			},
			messages : {
				email : 'please enter the email that is associated to your account...'
			}

		});


		$('#beginReset').click(function(e){
			e.preventDefault();
			if($('#sendResetEmail').valid()){						
				document.sendResetEmail.submit();					
			}
		});


	});

</script>


	
</body>
</html>
