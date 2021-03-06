import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils

import franklins13.UtilitiesService

class AuthController {

    def shiroSecurityManager
	def utilitiesService

    def index = { redirect(action: "login", params: params) }

    def login = {
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }

    def signIn = {
        def authToken = new UsernamePasswordToken(params.username, params.password as String)

        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
        def targetUri = params.targetUri ?: "/"
        
        // Handle requests saved by Shiro filters.
        def savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            SecurityUtils.subject.login(authToken)

			println "Redirecting to '${targetUri}'."
			
			def params = [activeLink : "dashboard"]
			
			if(targetUri == '/'){
				//add in hook to send to users welcome screen
				targetUri = '/static/dashboard'
			}

			if(params.newRegistration){
				params = ""
				targetUri = '/account/newMember'
			}
			
			if(params.reset){
				flash.message = "successfully changed password"
				targetUri = '/static/dashboard'
			}


            log.info "Redirecting to '${targetUri}'."

			//recently added to hold stats in session
			setSessionStats()
			
            redirect(uri: targetUri)
        
		}catch (AuthenticationException ex){
		
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m["rememberMe"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: "login", params: m)
        }
    }

    def signOut = {
        // Log the user out of the application.
        SecurityUtils.subject?.logout()

        // For now, redirect back to the home page.
        redirect(controller: "static", action:"welcome")
    }

    def unauthorized = {
        render "You do not have permission to access this page."
    }

	def setSessionStats(){
		def account
    	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			session.totalScore = account.totalScore
			session.totalEntries = account.totalEntries
			session.rank = getUserRank(subject?.getPrincipal())
			
			println "sessions stats -> rank: ${session.rank}   /   score : ${session.totalScore}  /  entries : ${session.totalEntries} "
		
		}
		
	}
	
	def getUserRank(username){
		def accounts = Account.findAll()
		// def sortedAccounts = utilitiesService.reverseSortMap(accounts)
		def sorted = accounts.sort()
		def rank = 0;
		sorted.eachWithIndex(){obj, i -> 
			if(obj.username == username){
				println " ${i}: ${obj.username}"
				rank = i
			}
		}
		return rank
	}
	
}
