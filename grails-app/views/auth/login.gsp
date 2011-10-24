<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

	<div class="wrapper centeralign">
 		<div class="loginForm">
  			<g:form action="signIn">
    		<input type="hidden" name="targetUri" value="${targetUri}" />
    		<table>
    	  		<tbody>
    	    		<tr>
    	      			<td>Username:</td>
    	      			<td><input type="text" name="username" value="${username}" /></td>
    	    		</tr>
    	    		<tr>
    	      			<td>Password:</td>
    	      			<td><input type="password" name="password" value="" /></td>
    	    		</tr>
    	    		<tr>
    	      			<td>Remember me?:</td>
    	      			<td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>
    	    		</tr>
    	    		<tr>
    	      			<td />
    	      			<td><input type="submit" value="Sign in" /></td>
    	    		</tr>
    	  		</tbody>
    		</table>
  			</g:form>
		</div>
	</div>
	
	<p class="note fourhundred">
		<em>Forgot Password ? </em> Sorry, but you will need to send a request for a new password.  Send an email with subject line "RESET MY PASSWORD" to <a href="mailto:franklins13app@gmail.com">franklins13app@gmail.com</a>
	</p>
			
</body>
</html>
