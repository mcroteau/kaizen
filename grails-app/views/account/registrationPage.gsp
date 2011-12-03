


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title>Join the Experiment -> Franklins 13 App</title>
    </head>
    <body>

            <h1>Join the Experiment</h1>
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
			
            <form id="registrationForm" name="registrationForm" action="http://localhost:8080/franklins13/account/register" method="post" >
				<div id="validationSummary"></div>
				
				<h2>Step One : Vow to be Honest</h2>
				<p>I will be honest when using this app <input type="checkbox" id="promise" name="promise"/></p>
				
				
				<h2>Step Two : Create your account</h2>
				<p>
               		<label for="username">Username</label>
               		<g:textField name="username" value="${accountInstance?.username}" id="username" value="mikec" />
               	</p>
               
			   	<p>
               		<label for="email">Email</label>
               		<g:textField name="email" value="${accountInstance?.email}" id="email" value="croteau.mike+test@gmail.com"/>
			   	</p>
			   
			   
			   	<input type="hidden" name="active" value="true"/>
			
               
			   	<p>
               		<label for="passwordHash">Password</label>             	
               		<input type="password" name="passwordHash" value="${accountInstance?.passwordHash}" id="passwordHash"/>
               	</p>
               
			   	<p>
     		   		<label for="confirmPassword">Confirm Password</label>
               		<input type="password" name="confirmPassword" value="" id="confirmPassword"/>
               	</p>          
               
				
				<p>
					<label for="isMale">Gender</label>
					<select name="isMale" id="isMale">
						<option value="true">Gentleman</option>
						<option value="false">Lovely Lady</option>
					</select>
				</p>
				
				<h2>Step 3 : Make it happen 
                	<input type="submit" name="register" class="register" id="register" value="Register"/>
				</h2>
				
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
				return ($('#passwordHash').val() === value)
			};
	   			

			
			var processing = false;
			$(document).ready(function(){
				
				
				$("#registrationForm").validate({
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
						username : {
							required : true
						},
						email: {
							required : true,
							email : true
						},
						fullName : {
							required : false
						},
						passwordHash : {
							minlength : 5,
							required : true,
						},
						confirmPassword : {
							required : true,
							minlength : 5,
							confirm : true
						},
						promise : {
							required : true,
						}
					},
					messages : {
						passwordHash : 'password must be at least 5 characters',
						username : 'please enter a username',
						email : 'enter a valid email address',
						confirmPassword : 'your passwords must match',
						promise : 'you must promise!'
					}
					
				});
                	
				
				$('#register').click(function(){
					console.info('submit form');
					if($('#registrationForm').valid()){
						document.registrationForm.submit();					
					}
				});

				
			});
			
		</script>

    </body>
</html>
