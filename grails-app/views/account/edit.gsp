


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
            <h1>Update Account Info</h1>

            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            	<div class="errors">
                	<g:renderErrors bean="${accountInstance}" as="list" />
            	</div>
            </g:hasErrors>


			<form id="editAccountForm" name="editAccountForm" action="update" method="post" >
				<div id="validationSummary"></div>
            	
		    	<g:hiddenField name="id" value="${accountInstance?.id}" />
		    	<g:hiddenField name="version" value="${accountInstance?.version}" />
            	
				<p>
	        		<label for="username">Username</label> : ${accountInstance?.username}
	        	</p>
            	
				<p>
	        		<label for="email">Email</label>
	        		<g:textField name="email" id="email" value="${accountInstance.email}"/>
				</p>
            	
				<p>
	        		<label for="passwordHash">New Password</label>             	
	        		<input type="password" name="passwordHash" value="${accountInstance.passwordHash}" id="passwordHash"/>
	        	</p>
            	
				<p>
	     			<label for="confirmPassword">Confirm Password</label>
	        		<input type="password" name="confirmPassword" value="${accountInstance.passwordHash}" id="confirmPassword"/>
	        	</p>          
            	
				<p>
					<label for="isMale">Gender</label>
					<g:select name="isMale"
					          from="${['Gentleman', 'Lovely Lady']}"
							  keys="${['true', 'false']}"
					          value="${accountInstance.isMale}" />
					
				</p>
            	
				<shiro:hasRole name="ROLE_ADMIN">
            		<p>
            			<label for="active"><g:message code="account.active.label" default="Active" /></label>
            		    <g:checkBox name="active" value="${accountInstance?.active}" />
					</p>
					
					<p>
						<label for="roles"><g:message code="account.roles.label" default="Roles" /></label>
            		    <g:select name="roles" from="${Role.list()}" multiple="yes" optionKey="id" size="5" value="${accountInstance?.roles*.id}" />
					</p>
            	</shiro:hasRole>
            	
				<input type="button" id="edit" name="edit" value="Edit"/>
				<input type="button" id="cancel" name="cancel" value="Cancel"/>
				
				<input type="submit" name="update" class="update" id="update" value="Update"/>
					
				<shiro:hasRole name="ROLE_ADMIN">
					<g:actionSubmit class="delete" action="delete" value="Delete" id="${accountInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</shiro:hasRole>
					
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
					
					var password = "${accountInstance.passwordHash}";
					
					function disableForm(){
						$('input[type="text"]').attr('disabled', 'true');
						$('select').attr('disabled', 'true');
						$('#passwordHash').val(password);	
						$('#confirmPassword').val(password);
					};
					
					function enableForm(){
						$('input[type="text"]').removeAttr('disabled');
						$('select').removeAttr('disabled');		
						$('#passwordHash').val('');	
						$('#confirmPassword').val('');		
					};

					$('#edit').click(function(){
						$('#update').show();
						$('#cancel').show();
						$('#edit').hide();
						enableForm();
					});
					$('#cancel').click(function(){
						$('#cancel').hide();
						$('#update').hide();
						$('#edit').show();
						disableForm();
					});
					
					$('#cancel').click()
					
					$("#editAccountForm").validate({
						debug: false,
						errorElement: "em",
						errorContainer: $("#validationSummary"),
						errorPlacement: function(error, element) {
							error.appendTo( element.parent() );
						},
						success: function(label) {
							label.text("ok!").addClass("valid");
						},
						rules: {
							email: {
								required : true,
								email : true
							},
							passwordHash : {
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
							email : 'enter a valid email address',
							confirmPassword : 'your passwords must match',
						}

					});


					$('#update').click(function(){
						if($('#editAccountForm').valid()){
							document.editAccountForm.submit();					
						}
					});


				});

			</script>
				
    </body>
</html>
