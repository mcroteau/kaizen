
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash


import org.apache.shiro.SecurityUtils
import java.util.UUID


class AccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def utilitiesService
	def mailService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [accountInstanceList: Account.list(params), accountInstanceTotal: Account.count()]
    }

    def create = {
		
		if(SecurityUtils.subject.isPermitted("account:create")){
	    	def accountInstance = new Account()
        	accountInstance.properties = params
        	return [accountInstance: accountInstance]	
		}else{
			flash.message = "yo, you dont have permissions to that man... what are you trying to pull here?  bad move!"
			redirect controller:"static", action:"welcome"
		}

    }

    def save = {
        	
		if(SecurityUtils.subject.isPermitted("account:save")){
	
			def accountInstance = new Account(params)
			
			def passwordHash = new Sha256Hash(params.passwordHash).toHex()
			accountInstance.passwordHash = passwordHash
			
			def simpleRole = Role.findByName("ROLE_SIMPLE_USER")
			accountInstance.addToRoles(simpleRole)
			
			println 'pass -> ' + params.passwordHash + '  hash->' + passwordHash 
			
        	if (accountInstance.save(flush: true)) {
        		flash.message = "successfully created new account for -> ${params.username}"  
            	redirect(action: "show", id: accountInstance.id)
        	} else {
            	flash.message = "something went wrong while trying to save the user"
				render(view: "create", model: [accountInstance: accountInstance])
        	}

		}else{
			flash.message = "yo, you dont have permissions to that man... what are you trying to pull here?  bad move!"
			redirect controller:"static", action:"welcome"
		}
    }

    def show = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
        else {
            [accountInstance: accountInstance]
        }
    }

    def edit = {


		if(SecurityUtils.subject.isPermitted("account:edit:"+ params.id) || 
			SecurityUtils.subject.hasRole("ROLE_ADMIN")){
		
        	def accountInstance = Account.get(params.id)
        	if (!accountInstance) {
        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
        	    redirect(action: "list")
        	}
        	else {
        	    return [accountInstance: accountInstance]
        	}
		}else{
			flash.message = "yo, you dont have permissions to that man... what are you trying to pull here?  bad move!"
			redirect controller:"static", action:"welcome"
		}

    }

    def update = {

		
		if(SecurityUtils.subject.isPermitted("account:edit:"+ params.id) || 
			SecurityUtils.subject.hasRole("ROLE_ADMIN")){
			
        	def accountInstance = Account.get(params.id)
        	if (accountInstance) {
        	    if (params.version) {
        	        def version = params.version.toLong()
        	        if (accountInstance.version > version) {
        	            
        	            accountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'account.label', default: 'Account')] as Object[], "Another user has updated this Account while you were editing")
        	            render(view: "edit", model: [accountInstance: accountInstance])
        	            return
        	        }
        	    }
        	    accountInstance.properties = params
        	
				def passwordHash = new Sha256Hash(params.passwordHash).toHex()
				accountInstance.passwordHash = passwordHash
        	    
			 	//def simpleRole = Role.findByName("ROLE_SIMPLE_USER")
				//accountInstance.addToRoles(simpleRole)
        	    
				println 'pass -> ' + params.passwordHash + '  hash->' + passwordHash 
        	   

        	    if (!accountInstance.hasErrors() && accountInstance.save(flush: true)) {
        	        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])}"
        	        redirect(action: "show", id: accountInstance.id)
        	    } else {
		    	    flash.message = "something went wrong while trying to update the user"
        	        render(view: "edit", model: [accountInstance: accountInstance])
        	    }

        	} else {

        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
        	    redirect(action: "list")
        	
			}
        	
		}else{
			flash.message = "yo, you dont have permissions to that man... what are you trying to pull here?  bad move!"
			redirect controller:"static", action:"welcome"
		}
    }



    def delete = {
        def accountInstance = Account.get(params.id)
        if (accountInstance) {
            try {
                accountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
    }


	def userWelcome = {
	
		
		def subject = SecurityUtils.getSubject();
		def account = Account.findByUsername(subject?.getPrincipal())
		
		def entries = VirtueEntry.findByAccount(account)
		
		if(!entries){
			render view : 'noEntriesLogged'
		}
	
	}
	
	
	def noEntriesLogged = {
	
		
	
	}
	
	
	def newMember = {
	
	
	}
	
	def registrationPage = {
	
		def subject = SecurityUtils.getSubject();	
		if(!subject.authenticated){
			
			println "remote address -> ${request.getRemoteAddr()}"
		
		}else{
			redirect(controller : 'static', action : 'welcome' )
		}
	}
	
	def register = {
	
		def subject = SecurityUtils.getSubject();
	
		if(!subject.authenticated){
		
			def accountInstance = new Account(params)
			
			def passwordHash = new Sha256Hash(params.passwordHash).toHex()
			accountInstance.passwordHash = passwordHash
			
			def simpleRole = Role.findByName("ROLE_SIMPLE_USER")
			accountInstance.addToRoles(simpleRole)
			
			println 'pass -> ' + params.passwordHash + '  hash->' + passwordHash 
			println 'params -> ' + params
			
			
    		if (accountInstance.save(flush: true)) {
    			
				println 'params -> ' + params
				println "email -> ${accountInstance.email}"
				
				try{
					mailService.sendMail {
					   to accountInstance.email
					   from "franklins13app@gmail.com"
					   subject "Thank You for Joining"
					   body "Thank you for joining Franklins13app.com"
					}
				}catch (Exception e){
					println e.printStackTrace();
				}
				
				
    			redirect(controller : 'auth', action: 'signIn', params : [accountInstance: accountInstance, username : params.username, password : params.passwordHash, newRegistration : true])
        	
        	
    		} else {
    			flash.message = "something went wrong while trying to save the user"
				render(view: "registrationPage", model: [accountInstance: accountInstance])
    		}
    	
		}else{
			redirect(controller : 'static', action : 'welcome' )
		}		
	}
	
	
	def beginResetPage = {		
	}
	
	
	def sendResetEmail = {
		def email = params.email
		println 'email -> ' + email
		
		
		def account = Account.findByEmail(email)
		def recoveryUUID = UUID.randomUUID();
		
		
		if(account){
			def url = "http://localhost:8080/franklins13/account/resetPage?username=${account?.username}&recoveryUUID=${recoveryUUID}"
			
			account.recoveryUUID = recoveryUUID
			if(account.save(flush:true)){
				try{
					mailService.sendMail {
					   to account.email
					   from "franklins13app@gmail.com"
					   subject "[Franklins 13 App] Reset Password"
					   body "<a href=\"${url}\">Click to confirm reset password</a>"
					}
					flash.message = "Successfully sent recovery email.  Please check email for instructions on how to reset."
					render view: "confirmation"					
				}catch (Exception e){
					println e.printStackTrace();
					flash.message = "there was a problem trying to send reset email, please try again or contact the administrator"
					 view: 'beginResetPage'
				}
				
			}else{				
				flash.message = "Something went wrong when trying to send recovery email.  Please try again"
				render view: 'beginResetPage'
			}
			
		}else{
			flash.message = "We could not find an account associated with ${email}.  Please try again.. or send an email to ${utilitiesService.getSupportLink()}"
			redirect( action: 'beginResetPage' )
		}
		
	}


	def resetPage = {		
		def account = Account.findByUsernameAndRecoveryUUID(params.username, params.recoveryUUID)
		if(account){
			println 'found account -> have them update their password'
			
			request.username = account.username
			
		}else{
			flash.message = "Something went wrong, please try again."
			render view: 'beginResetPage'
		}		
	}
	
	
	def resetPassword = {
		def username = params.username
		def newPassword = params.password
		
		def account = Account.findByUsername(username)
		
		account.passwordHash = new Sha256Hash(newPassword).toHex()
		if(account.save(flush:true)){
		
			def authToken = new UsernamePasswordToken(username, newPassword as String)
			
			redirect(controller : "auth", action : "signIn", params : [username : username, password : newPassword, reset : true])
			
		}else{
			flash.message = ""
			request.username = username
			render view : 'resetPage'
		}
		
	}
	
}
