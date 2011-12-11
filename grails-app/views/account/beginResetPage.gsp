


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title>Reset Password -> Franklins 13 App</title>
    </head>
    <body>

            <h1>Reset Password</h1>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            	<div class="errors">
                	<g:renderErrors bean="${accountInstance}" as="list" />
            	</div>
            </g:hasErrors>

			
			<style type="text/css">
			
				input[type="text"]{
					clear:both;
					display:block
				}
				
			</style>
			
            <form id="sendResetEmail" name="sendResetEmail" action="sendResetEmail" method="post" >
	
				<div id="validationSummary"></div>
				
				<h2>Step One : Enter Email</h2>
				<input type="text" name="email" value="" >
				<input type="submit" id="beginReset" value="Send Reset Email"/>
				
				<h2>Step Two : Click on confirmation to reset password in email</h2>
				
				<h2>Step 3 : Reset Password</h2>
				
            </form>
			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-validation.min.js')}"></script>

			<script type="text/javascript">

				var processing = false;
				$(document).ready(function(){

					console.log('reset page loaded ... ');
					
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


					$('#beginReset').click(function(){
						console.info('submit form');
						if($('#sendResetEmail').valid()){						
							document.sendResetEmail.submit();					
						}
					});


				});

			</script>


	
    </body>
</html>
