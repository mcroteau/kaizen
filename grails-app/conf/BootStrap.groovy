import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash

class BootStrap {

	def adminPass
	def simpleUserPass
	
	def adminRole
	def simpleRole

	def utilitiesService
	
    def init = { servletContext ->
		createRoles()
    	createUsers()
		createMockData()
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
		
		//if(VirtueEntry.count() == 0){
			
			println 'create mock virtue entry data -> '
			
			def account = Account.findByUsername("man")
			def totalMockEntries = 50
			
			def minusDays = 0;
			for(def i = 0; i < totalMockEntries; i++){
			
				println 'start creating a new virtue entry ' + i
				minusDays = minusDays + (utilitiesService.getRandomNumber(5, 0))
				
				def ve = new VirtueEntry()
					
				ve.entryDate = new Date() - minusDays
				
     
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
            	ve.wellBeing = true


				ve.happinessScale = utilitiesService.getRandomNumber(10,0)
				ve.performanceDescription = "bootstrapped data"
				ve.totalCompleted = utilitiesService.getRandomNumber(14, 0)
				
				ve.totalPoints = utilitiesService.getRandomNumber(15,-3)
				
				ve.account = account
				
				println ve.entryDate
				
				ve.save(flush:true)
				
				
			}

			
		//}
		
		println 'VirtueEntries : ' + VirtueEntry.count()
		
	}
	
	def setPasswords = {
		println 'setting passwords'
		adminPass = new Sha256Hash('admin').toHex()
		simpleUserPass = new Sha256Hash('simple').toHex()
	}
}
