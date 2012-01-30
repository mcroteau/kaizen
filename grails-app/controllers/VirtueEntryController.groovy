
import org.apache.shiro.SecurityUtils
import grails.converters.*


class VirtueEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def utilitiesService
	
    def index = {
        redirect(action: "history", params: params)
    }

    def list = {

		def account
    	params.max = Math.min(params.max ? params.int('max') : 10, 100)
    	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, params)
			def virtueEntryInstanceTotal = VirtueEntry.countByAccount(account)
    		
			[virtueEntryInstanceList: virtueEntryInstanceList, virtueEntryInstanceTotal: virtueEntryInstanceTotal]
			
		}else{
		
			flash.message = "No entries logged yet"
			redirect action:"logEntry"
		
		}
	
	}
	
	
	def history = {
	
		def account
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, params)
			def virtueEntryInstanceTotal = VirtueEntry.countByAccount(account)
			
			[virtueEntryInstanceList: virtueEntryInstanceList, virtueEntryInstanceTotal: virtueEntryInstanceTotal, historyActive:"active"]
			
		}else{
		
			flash.message = "No entries logged yet"
			redirect action:"logEntry"
		
		}	
	
	
	}
	
	
	
	def listmobile = {
		def account

		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account)
			def virtueEntryInstanceTotal = VirtueEntry.countByAccount(account)
    		
			[virtueEntryInstanceList: virtueEntryInstanceList, virtueEntryInstanceTotal: virtueEntryInstanceTotal]
			
		}else{
		
			flash.message = "No entries logged yet"
			redirect action:"newEntry"
		
		}
	
	}
	
    def listview = {

		def account
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, params)
			def virtueEntryInstanceTotal = VirtueEntry.countByAccount(account)
        	
			if(virtueEntryInstanceList){
			
				[virtueEntryInstanceList: virtueEntryInstanceList, virtueEntryInstanceTotal: virtueEntryInstanceTotal]
			
			}else{
				redirect(controller : "account", action : "noEntriesLogged")
			}
			
		}else{
		
			flash.message = "You must have an account to log your days virtues"
			redirect controller: "auth", action:"login"
		
		}
		
	
	}
		
	def logEntry = {
		def account
    	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
		
			def date
			if(params.date){
				date = Date.parse("yyyy-MM-dd", params.date)
				date.clearTime()
			}else{
				date = utilitiesService.getTodaysDate()
			}
			//def today = utilitiesService.getTodaysDate()
			println "date -> ${date}"
			def entry = VirtueEntry.findByEntryDateAndAccount(date, account)

			
			if(!entry){
			
    			def virtueEntryInstance = new VirtueEntry()
    			virtueEntryInstance.properties = params
				virtueEntryInstance.entryDate = date
				
				request.logentryActive = "active"
				
    			return [virtueEntryInstance: virtueEntryInstance]
    		
			}else{
				
				flash.message = "You've already logged a entry for ${utilitiesService.getFormattedDateNoTimeOption1(date)}"
				redirect action:"show", params:[id: entry.id]
			
			}
		}else{
			
			flash.message = "You must have an account to log your days virtues"
			redirect controller: "auth", action:"login"
		}
		
		
	}


	def newEntry = {
		def today = utilitiesService.getTodaysDate()
		def todaysEntry = VirtueEntry.findByEntryDate(today)
		
		println 'todaysEntry -> ' + todaysEntry
		
		if(!todaysEntry){
    		def virtueEntryInstance = new VirtueEntry()
    		virtueEntryInstance.properties = params
    		return [virtueEntryInstance: virtueEntryInstance]
    	
		}else{
			
			flash.message = "You've already logged a entry today..."
			redirect action:"showmobile", params:[id: todaysEntry.id]
		
		}
	}


    def save = {
		
		def account
    	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
		
			//def today = utilitiesService.getTodaysDate()
			def date = params.entryDate
			
			def todaysEntry = VirtueEntry.findByEntryDateAndAccount(date, account)
			
			def fullDateTime = new Date()
			
			println "today -> ${date}"
			println 'todaysEntry -> ' + todaysEntry
			
			if(!todaysEntry){
			
				println "happiness scale -> ${params.happinessScale}"
				
				def totalCompleted = getTotalVirtuesFollowed(params)
				def performanceDescription = getPerformanceDescription(totalCompleted, Integer.parseInt(params.happinessScale), account)
				
				def virtueEntryInstance = new VirtueEntry(params)
				virtueEntryInstance.account = account
				
				virtueEntryInstance.entryDate = date
				virtueEntryInstance.fullEntryDateTime = fullDateTime
				virtueEntryInstance.totalCompleted = totalCompleted
				virtueEntryInstance.performanceDescription = performanceDescription
				virtueEntryInstance.totalPoints = getTotalPoints(totalCompleted)
        	
				
        		if (virtueEntryInstance.save(flush: true)) {
					
					println "virtueEntry:" + virtueEntryInstance.id
					account.addToPermissions("virtueEntry:show,edit,delete,update:" + virtueEntryInstance.id)
					//account.save(flush:true)
					updateAccountStats(account, virtueEntryInstance.totalPoints, 0)
					
					println 'updated account -> -> '
					
					
					println "session -> ${session}"
					
					//recently added to hold stats in session
					setSessionStats()
					
					flash.message = "Successfully logged your virtues for  ${utilitiesService.getFormattedDateNoTimeOption1(date)}"
        		    
        		    render view: "confirmation", model: [virtueEntryInstance: virtueEntryInstance]
					return
        		
				} else {
					render(view: "logEntry", model: [virtueEntryInstance: virtueEntryInstance])
        		}
			
			}else{
			
				flash.message = "You've already logged a entry for ${utilitiesService.getFormattedDateNoTimeOption1(date)}"
				redirect controller:"static", action:"dashboard"
			}
			
		}else{
			
			flash.message = "You must have an account to log your days virtues"
			redirect controller: "auth", action:"login"
		}	
		
    }


	def getTotalPoints(int totalCompleted){
	
	    def points = 0
	    switch (totalCompleted) {
	        case 0:
	            points = points - 4
	            break
	        case 1:
	            points = points - 3
	            break
	        case 2:
	            points = points - 2
	            break
	        case 3:
	            points = points - 1
	            break
	        case 4:
	            points = points
	            break
	        case 5:
	            points = points + 1
	            break
	        case 6:
	            points = points + 2
	            break
	        case 7:
	            points = points + 3
	            break
	        case 8:
	            points = points + 4
	            break
	        case 9:
	            points = points + 5
	            break
	        case 10:
	            points = points + 6
	            break
	        case 11:
	            points = points + 7
	            break
	        case 12:
	            points = points + 8
	            break
	        case 13:
	            points = points + 9
	            break
	        case 14:
	            points = points + 10
	            break
	    }    
	
	    points
	
	}


	def confirmation = {
		println 'confirmation'
	}

	def mockConfirmation = {
		println "mockConfirmation ->"
	}

	def getTotalVirtuesFollowed(params){
		def totalCompleted = 0
		params.each{
			println it.value
			if(it.value == 'on'){totalCompleted++}
		}
		return totalCompleted
	}
		
	
	def getPerformanceDescription(totalCompleted, happiness, account){
	
		def description = ''
		//def slangTerm = utilitiesService.getRandomSlangTerm(account.isMale)
		def slangTerm = '';
		
		if(totalCompleted == 0 && happiness > 5){
			description = 'Not judging but maybe you should review your effort today ' + slangTerm
		}else if(totalCompleted <=2 ){
			description = "you kidding me? what's going on ${slangTerm}? "
		}else if(totalCompleted == 0){
			description = 'Tomorrow is a new day ' + slangTerm
		}else if(totalCompleted <= 5){
			if(happiness > 7){
				description = 'Tomorrow is a new day ' + slangTerm
			}
			if(happiness < 7 && happiness > 4){
				description = 'No Saint... but at least you are putting in work.  '
			}
			if(happiness < 4){
				description = "Don't beat yourself up.. think 'kaizen'"
			}
		}else if(totalCompleted <= 13){
			description = 'Franklin would approve ' + slangTerm
			if(happiness < 9 && happiness > 7){
				description = 'Well done.. ' + slangTerm
			}
			
		}else if(totalCompleted == 14){
			//if()
			description = 'Good stuff, good times... '
		}
		
		return description

	}

    def showmobile = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (!virtueEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "history")
        }
        else {
            [virtueEntryInstance: virtueEntryInstance]
        }
    }

    def show = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (!virtueEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "history")
        }
        else {
            [virtueEntryInstance: virtueEntryInstance]
        }
    }

    def edit = {

		println 'edit -> ' + params.id 
		
		if(params.id && SecurityUtils.subject.isPermitted("virtueEntry:update:"+params.id)){
		
        	def virtueEntryInstance = VirtueEntry.get(params.id)
        	if (!virtueEntryInstance) {
        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	    redirect(action: "history")
        	}
        	else {
        	    return [virtueEntryInstance: virtueEntryInstance]
        	}
		
		}else{
         
			flash.message = "You are not authorized to Edit this Virtue Entry"
		 	redirect action:"show", id:params.id
         
		}
    }



    def update = {

		def account
		
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		
		if(account){
		
			println 'update ' + params.id
			
			if(params.id && SecurityUtils.subject.isPermitted("virtueEntry:update:"+params.id)){
    	
				println 'is permitted to virtueEntry:update:' + params.id


				
    	   		def virtueEntryInstance = VirtueEntry.get(params.id)
    	   		if (virtueEntryInstance) {
    	   		    if (params.version) {
    	   		        def version = params.version.toLong()
    	   		        if (virtueEntryInstance.version > version) {
    	   		            
    	   		            virtueEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'virtueEntry.label', default: 'VirtueEntry')] as Object[], "Another user has updated this VirtueEntry while you were editing")
    	   		            render(view: "edit", model: [virtueEntryInstance: virtueEntryInstance])
    	   		            return
    	   		        }
    	   		    }
    	
					def previousPoints = virtueEntryInstance.totalPoints
    	   		    virtueEntryInstance.properties = params
					
					def totalCompleted = getTotalVirtuesFollowed(params)
					def performanceDescription = getPerformanceDescription(totalCompleted, Integer.parseInt(params.happinessScale), account)
					
					println "totalCompleted -> ${totalCompleted}    happinessScale -> ${params.happinessScale}     account -> ${account}"
					println "performanceDescription -> ${performanceDescription}"
					
					virtueEntryInstance.totalCompleted = totalCompleted
					virtueEntryInstance.performanceDescription = performanceDescription
					virtueEntryInstance.totalPoints = getTotalPoints(totalCompleted)
					
    	
    	   		    if (!virtueEntryInstance.hasErrors() && virtueEntryInstance.save(flush: true)) {
						
						updateAccountStats(account, virtueEntryInstance.totalPoints, previousPoints)
						
						//recently added to hold stats in session
						setSessionStats()
					
						
    	   		        flash.message = "Successfully updated Virtues Entry for ${utilitiesService.getFormattedDateNoTimeOption1(virtueEntryInstance.entryDate)}"


    	   		        redirect(action: "show", id: virtueEntryInstance.id)
    	   		    }
    	   		    else {
    	   		        render(view: "edit", model: [virtueEntryInstance: virtueEntryInstance])
    	   		    }
    	   		}
    	   		else {
    	   		    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
    	   		    redirect(action: "history")
    	   		}
			
			}else{
				
				flash.message = "You are not authorized to update this Virtue Entry"
				redirect action:"show", id:params.id
				
			}
			
			
			
		}else{
			
			flash.message = "You must have an account to log your days virtues"
			redirect controller: "auth", action:"login"
		}
			
    }


	def updateAccountStats(Account account, int totalPoints, int previousTotalPoints){
		
		println "${account.totalScore + totalPoints - previousTotalPoints} = ${account.totalScore} + ${totalPoints} - ${previousTotalPoints}"
		account.totalScore = account.totalScore + totalPoints - previousTotalPoints
		account.totalEntries = VirtueEntry.countByAccount(account)
		account.save(flush:true)
		setSessionStats()
		
	}


    def delete = {
	
		println 'here...'
		if(params.id && SecurityUtils.subject.isPermitted("virtueEntry:update:"+params.id)){
		
        	def virtueEntryInstance = VirtueEntry.get(params.id)
        	if (virtueEntryInstance) {
        	    try {
					
					def date = virtueEntryInstance.entryDate
					def totalPointsToRemove = virtueEntryInstance.totalPoints
					
					println "totalPointsToRemove -> ${totalPointsToRemove}"
        	        virtueEntryInstance.delete(flush: true)
					
					def account = Account.findByUsername(SecurityUtils.subject?.getPrincipal())
					updateAccountStats(account, 0, totalPointsToRemove)
					
					
        	        flash.message = "Successfully deleted entry for ${utilitiesService.getFormattedDateNoTimeOption1(date)}"
        	        redirect(action: "history")
        	    }
        	    catch (org.springframework.dao.DataIntegrityViolationException e) {
        	        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	        redirect(action: "show", id: params.id)
        	    }
        	}
        	else {
        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	    redirect(action: "history")
        	}


		}else{
         
			flash.message = "You are not authorized to Delete this Virtue Entry"
		 	redirect action:"show", id:params.id
         
		}
		
		
    }

	def getTodaysDate(){
		def date = new Date()
		date.clearTime()
		return date
	}
	
	
	def getRandomNumber(){
		def random = new Random()
		def randomInt = random.nextInt(200-100+1)+100
	}
	

	def calendar = {
		
		def subject = SecurityUtils.getSubject();
		
		/**
		def account = Account.findByUsername(subject?.getPrincipal())
		def virtueEntries = VirtueEntry.countByAccount(account)
		
		if(virtueEntries){
		
		}else{
			flash.message = "You have yet to log any Virtue Entries... start now by cli"
		}
		**/
		
		
		if(!subject.authenticated){		
			flash.message = "You must be logged in to view your Calendar"
			redirect(controller:"auth", action:"login")			
		}
		
	}
	
	def entries = {
		
		//println 'retrieving events ->'
		def entries = []
				
		def subject = SecurityUtils.getSubject();
		
		if(subject.authenticated){	
		
			def account = Account.findByUsername(subject?.getPrincipal())
	
			if(account){
				def allEntries = VirtueEntry.findAllByAccount(account)

        		//println 'allEntries -> ' + allEntries

				allEntries.each{ 
				
				
					
					def day = it.entryDate.getAt(Calendar.DAY_OF_MONTH)
					def month = it.entryDate.getAt(Calendar.MONTH) +1
					def year = it.entryDate.getAt(Calendar.YEAR)
					

					def entry = [
						id:  year + '-' + month + '-' + day,
						title : it.totalCompleted.toString() + " completed, \n" + it.happinessScale + " happiness \n" + it.totalPoints + " points" ,
						url : 'show/' + it.id,
						start : year + '-' + String.format("%02d", month) + '-' + String.format("%02d", day)
					]
        		
					entries.add(entry)
				}
			
			}
		
		}
		
		println entries
		
		render entries as JSON 
		
	}	




	def entriesPoints = {
		
		//println 'retrieving events ->'
		def entries = []
				
		def subject = SecurityUtils.getSubject();
		
		if(subject.authenticated){	
		
			def account = Account.findByUsername(subject?.getPrincipal())
	
			if(account){
				def allEntries = VirtueEntry.findAllByAccount(account)

        		//println 'allEntries -> ' + allEntries

				allEntries.each{ 
				
				
					
					def day = it.entryDate.getAt(Calendar.DAY_OF_MONTH)
					def month = it.entryDate.getAt(Calendar.MONTH) +1
					def year = it.entryDate.getAt(Calendar.YEAR)
					
					
					def entry = [
						id:  year + '-' + month + '-' + day,
						title : addPlusMinusSign(it.totalPoints),
						url : 'show/' + it.id,
						start : year + '-' + String.format("%02d", month) + '-' + String.format("%02d", day)
					]
        		
					entries.add(entry)
				}
			
			}
		
		}
		
		println entries
		
		render entries as JSON 
		
	}
	
		
	def addPlusMinusSign(num){
		if(num < 0){
			return "${num}"
		}
		return "+${num}"	
	}	
	
	def setSessionStats(){
		def account
	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
		account = Account.findByUsername(subject?.getPrincipal())
		}
	
		if(account){
			session["totalScore"] = account.totalScore
			session["totalEntries"] = account.totalEntries
			
			println "sessions stats ->  score : ${session["totalScore"]}  /  entries : ${session["totalEntries"]}"
			
			println 'problem in here?'
			
		}
	}
	
	
}
