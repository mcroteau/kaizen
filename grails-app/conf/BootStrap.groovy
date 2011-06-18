import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash

class BootStrap {

	def adminPass
	def simpleUserPass
	
	def adminRole
	def simpleRole

    def init = { servletContext ->
		createRoles()
    	createUsers()
	}
	
    def destroy = {
    }

	def createRoles = {
		
		if(Role.count() == 0){
			adminRole = new Role(name : "ROLE_ADMIN").save(flush:true)
			simpleRole = new Role(name : "ROLE_SIMPLE_USER").save(flush:true)
		}
		
		println 'Roles : ' + Role.count()
	}
	
	def createUsers = {
		
		if(Account.count() == 0){
		
			setPasswords()
			
			def adminAccount = new Account(fullName : "Admin User", username : 'admin', passwordHash : adminPass, email : 'admin@franklins13app.com', active : true)
			adminAccount.addToRoles(adminRole)
			adminAccount.save(flush:true)
			
			def simpleAccount = new Account(fullName : "Simple User", username : 'simple', passwordHash : simpleUserPass, email : 'simple@franklins13app.com', active : true)
			simpleAccount.addToRoles(simpleRole)
			simpleAccount.save(flush:true)

		
		}
		
		println 'Accounts : ' + Account.count()
		
	}
	
	def setPasswords = {
		adminPass = new Sha256Hash('admin').toHex()
		simpleUserPass = new Sha256Hash('simple').toHex()
	}
}
