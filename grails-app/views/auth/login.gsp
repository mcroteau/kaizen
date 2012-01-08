<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>

	<div class="content loginContainer">
		<g:if test="${flash.message}">
	    	<div class="message info">${flash.message}</div>
	  	</g:if>
	
  		<g:form action="signIn">
		
		<h1>Account Login</h1>
		
		<div class="icon"></div>
		
		<div class="loginWrapper notes">
			<!--<div class="message error" id="errorMessage">
				<span class="header">Error performing action</span>
				<span class="messageDetails">Sed ut perspiciatis unde omnis iste natus error sit 
					voluptatem accusantium doloremque laudantium</span>
				<a href="#">Link</a>
				<a href="#" class="closeButton closeMessage"></a>
			</div>-->
			
			<div class="loginForm">
				<p class="">
					<label for="username">Username</label>
					<input type="text" name="username" value="${username}" class=""/>
				</p>
				<p class="">
					<label for="password">Password</label>
					<input type="password" name="password" value=""/>
				</p>
			</div>
			
			<div class="buttons">
				<span>Forgot <g:link controller="account" action="beginResetPage">Password</g:link>?</span>
				<a href="#" class="button blue small">Login</a>
			</div>
			
  			</g:form>

		</div>
		
		<br class="clear"/>
		
	</div>		
</body>
</html>
