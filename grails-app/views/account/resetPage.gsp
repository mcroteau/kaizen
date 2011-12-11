


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
			
            <form id="resetPasswordForm" name="resetPasswordForm" action="resetPassword" method="post" >
	
				<div id="validationSummary"></div>
				
				<h2>Reset Password</h2>
				<p>
               		<label for="username">New Password</label>
               		<input type="password" name="password" id="password" value="" >
               	</p>
				<p>
	            	<label for="username">Confirm Password</label>
	            	<input type="password" name="confirmPassword" id="confirmPassword" value="" >
	            </p>
				<input type="hidden" value="${username}" name="username"/>
				<input type="submit" id="reset" value="Reset Password"/>
				
            </form>

			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-validation.min.js')}"></script>

			<script type="text/javascript">



		   		// this one requires the value to be the same as the first parameter
		   		$.validator.methods.equal = function(value, element, param) {
					console.info('value ->' + value + '    param ->'  +  param);
		   			return value == param;
		   		};
				$.validator.methods.confirm = function(value, element){
					return ($('#password').val() === value)
				};



				var processing = false;
				$(document).ready(function(){

					console.log('reset page loaded ... ');
					
					$("#resetPasswordForm").validate({
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
							password : {
								minlength : 5,
								required : true,
							},
							confirmPassword : {
								required : true,
								minlength : 5,
								confirm : true
							}
						},
						messages : {
							passwordHash : 'password must be at least 5 characters',
							confirmPassword : 'your passwords must match'
						}

					});


					$('#reset').click(function(){
						console.info('submit form');
						if($('#resetPasswordForm').valid()){						
							document.resetPasswordForm.submit();					
						}
					});


				});

			</script>
	
    </body>
</html>
