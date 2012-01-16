<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
    <title>Join the Experiment -> Franklins 13 App</title>
</head>
<body>
	

<div class="content registrationContainer">
	
	<h1>Join the Experiment</h1>
	<g:if test="${flash.message}">
		<div class="message INFO" id="">
			<span class="header">${flash?.header}</span>
			<span class="messageDetails">${flash.message}</span>
		</div>
	</g:if>
	
	<g:hasErrors bean="${accountInstance}">
		<div class="message error" id="">
			<span class="header">Something Went wrong</span>
			<span class="messageDetails">
		    	<g:renderErrors bean="${accountInstance}" as="list" />
			</span>
			
			<!--<a href="#" class="closeButton closeMessage"></a>-->
			
		</div>
	</g:hasErrors>
	
	
	<!--<div class="franklin"></div>-->
	
	<div class="registrationWrapper notes">
	
		<form id="registrationForm" name="registrationForm" action="register" method="post">
			
		<div class="registrationForm">
			<p class="large">
				<em>Step One : Vow to be honest</em><br/>
				I will be honest when using this app
				<input type="checkbox" value="" name="promise" id="promise" class=""/>
			</p>
			<p class="large">
				<em>Step Two : Create your Account</em><br/>
				<label for="username">username</label>
				<input type="text" value="" class="largeInput" id="username" name="username"/>
			</p>
			<p class="">
				<label for="email">email</label>
				<input type="email" value="" class="largeInput" id="email" name="email"/>
			</p>				
			<p class="">
				<label for="password">password</label>
				<input type="password" value="" id="passwordHash" name="passwordHash"/>
			</p>
			<p class="">
				<label for="password">confirm password</label>
				<input type="password" value="" id="confirmPassword" name="confirmPassword"/>
			</p>
			<p class="">
				<label for="isMale">gender</label>
				<select name="isMale" id="isMale" class="valid">
					<option value="true">Gentleman</option>
					<option value="false">Lovely Lady</option>
				</select>
			</p>
				
				
		
			<div class="buttons large">
				<em>Step Three : Make it happen</em>
				<a href="#" class="button blue small" id="register">Register</a>
			</div>

				
		</div>
		</form>

	</div>
	
	<br class="clear"/>
	
</div>
	
	
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-validation.min.js')}"></script>
		
<script type="text/javascript">

	// this one requires the value to be the same as the first parameter
	$.validator.methods.equal = function(value, element, param) {
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
				promise : 'do you have a problem being honest?'
			}
			
		});
    	
	
		$('#register').click(function(event){
			event.preventDefault();
			if($('#registrationForm').valid()){
				document.registrationForm.submit();					
			}
		});
		
	});

</script>

    </body>
</html>
