import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash


import org.apache.shiro.SecurityUtils

class AccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def utilitiesService

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
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [accountInstance: accountInstance]
        }
    }

    def update = {

		if(SecurityUtils.subject.isPermitted("account:update")){
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
}
