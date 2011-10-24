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
		print "making small change"		
		println 'Roles : ' + Role.count()
	}
	
	def createUsers = {
		
		if(Account.count() == 0){
		
			setPasswords()
			
			def adminAccount = new Account(fullName : "Admin User", username : 'admin', passwordHash : adminPass, email : 'admin@franklins13app.com', active : true, isMale : true)
			adminAccount.addToRoles(adminRole)
			adminAccount.addToPermissions("account:create")
			adminAccount.addToPermissions("account:edit")
			adminAccount.addToPermissions("account:save")
			adminAccount.addToPermissions("account:delete")
			adminAccount.addToPermissions("account:update")
			
			adminAccount.save(flush:true)
			
			def simpleAccountFemale = new Account(fullName : "Simple Woman", username : 'woman', passwordHash : simpleUserPass, email : 'woman@franklins13app.com', active : true, isMale : false)
			simpleAccountFemale.addToRoles(simpleRole)
			simpleAccountFemale.save(flush:true)
			
			def simpleAccountMale = new Account(fullName : "Simple Man", username : 'man', passwordHash : simpleUserPass, email : 'man@franklins13app.com', active : true, isMale : true)
			simpleAccountMale.addToRoles(simpleRole)
			simpleAccountMale.save(flush:true)

		
		}
		
		println 'Accounts : ' + Account.count()
		
	}
	
	
	def createMockData = {
		
		if(VirtueEntry.count() == 0){
			
			println 'create mock virtue entry data -> '
			
			def account = Account.findByUsername("man")
			def totalMockEntries = 3
			
			for(i = 0; i < totalMockEntries; i++){
			
				def ve = new VirtueEntry()
				ve.entryDate = new Date() - i
     
				ve.temperance = false
				ve.orderVirtue = true
				ve.resolution = false
				ve.frugality = true
				ve.moderation = true
				ve.industry = true
				ve.cleanliness = true
				ve.tranquility = true
				ve.silence = true
				ve.justice = true
				ve.chastity = true
				ve.humility = true
				ve.sincerity = true
            	

				def random = new Random()
				def randomInt = random.nextInt(10-0+1)+10
				ve.happinessScale = randomInt
				
				//int totalCompleted = 
				//String performanceDescription 
            	
				//Account account
				//static belongsTo = Account
			
				/** TODO : NEED TO IMPLEMENT MOCK DATA FOR TESTING **/
				
			}

			
		}
		
		println 'VirtueEntries : ' + VirtueEntry.count()
		
	}
	
	def setPasswords = {
		adminPass = new Sha256Hash('admin').toHex()
		simpleUserPass = new Sha256Hash('simple').toHex()
	}
}
