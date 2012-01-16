


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Reset Password -> Franklins 13 App</title>
</head>
<body>

	
	<div class="content resetContainer">
	
		<h1>Reset Password</h1>
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="header"></span>
				<span class="messageDetails">
			    	${flash.message}
				</span>
				<!--<a href="#" class="closeButton closeMessage"></a>-->
	
			</div>		
	    </g:if>

	
		<div class="resetWrapper notes">
		
			<div class="resetForm">
				<p class="large inactive">
					<em class="highight">Step One : Enter Email</em><br/>
				</p>
				<p class="large inactive">
					<em>Step Two : Verify Email</em><br/>
				</p>
				<p class="large ">
					<em>Step Three : Reset Password</em><br/>
				</p>
				
	            <form id="resetPasswordForm" name="resetPasswordForm" action="resetPassword" method="post" >
					<p>
	            		<label for="password">New Password</label>
	            		<input type="password" name="password" id="password" value="" >
	            	</p>
					<p>
		        		<label for="username">Confirm Password</label>
		        		<input type="password" name="confirmPassword" id="confirmPassword" value="" >
		        	</p>
					<input type="hidden" value="${username}" name="username"/>
					<div class="buttons">
						<a href="#" id="reset" class="button small blue">Reset Password</a>
					</div>
				</form>
				
			</div>

	
		</div>
		
		<br class="clear"/>
		
	</div>


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
				password : 'password must be at least 5 characters',
				confirmPassword : 'your passwords must match'
			}

		});


		$('#reset').click(function(){
			if($('#resetPasswordForm').valid() && !processing){
			    processing = true;
				document.resetPasswordForm.submit();					
			}
		});


	});

</script>

</body>
</html>
