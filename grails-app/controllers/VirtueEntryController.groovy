
import org.apache.shiro.SecurityUtils

class VirtueEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def utilitiesService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {

		def account
        params.max = Math.min(params.max ? params.int('max') : 5, 100)

		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		if(account){
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, [max:params.max])
			def virtueEntryInstanceTotal = VirtueEntry.countByAccount(account)
        	
			[virtueEntryInstanceList: virtueEntryInstanceList, virtueEntryInstanceTotal: virtueEntryInstanceTotal]
			
		}else{
		
			flash.message = "No entries logged yet"
			redirect action:"newEntry"
		
		}
	
	}
	

    def listOLD = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [virtueEntryInstanceList: VirtueEntry.list(params), virtueEntryInstanceTotal: VirtueEntry.count()]
    }

    def create = {
        def virtueEntryInstance = new VirtueEntry()
        virtueEntryInstance.properties = params
        return [virtueEntryInstance: virtueEntryInstance]
    }

	def newEntry = {
    	def virtueEntryInstance = new VirtueEntry()
    	virtueEntryInstance.properties = params
    	return [virtueEntryInstance: virtueEntryInstance]
	}

    def save = {
		
		println params
		def subject = SecurityUtils.getSubject();
		def account = Account.findByUsername(subject?.getPrincipal())
		println 'isMale:' + account?.isMale
		
		def totalCompleted = getTotalVirtuesFollowed(params)
		def performanceDescription = getPerformanceDescription(totalCompleted, Integer.parseInt(params.happinessScale), account)
		println 'totalCompleted:'+ totalCompleted
		def virtueEntryInstance = new VirtueEntry(params)
		virtueEntryInstance.account = account
		
		def today = getTodaysDate()
		virtueEntryInstance.entryDate = today
		virtueEntryInstance.totalCompleted = totalCompleted
		virtueEntryInstance.performanceDescription = performanceDescription
		
		def todaysEntry = VirtueEntry.findByEntryDate(today)
		if(todaysEntry){ 
			//redirect(action : 'show', id:todaysEntry.id)
			//return
		}
		
        if (virtueEntryInstance.save(flush: true)) {
			
			println "virtueEntry:" + virtueEntryInstance.id
			account.addToPermissions("virtueEntry:show,edit,delete,update:" + virtueEntryInstance.id)
			account.save(flush:true)
			println 'updated account'
			
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), virtueEntryInstance.id])}"
            
            render view: "confirmation", model: [virtueEntryInstance: virtueEntryInstance]
			return
        
		} else {
			render(view: "newEntry", model: [virtueEntryInstance: virtueEntryInstance])
        }
    }


	

	def confirmation = {
		println 'confirmation'
	}


	def getTotalVirtuesFollowed(params){
		println 'here...'
		def totalCompleted = 0
		params.each{
			println it.value
			if(it.value == 'on'){totalCompleted++}
		}
		return totalCompleted
	}
		
	
	def getPerformanceDescription(totalCompleted, happiness, account){
		println 'getting performanceDescription'
		def description = ''
		def slangTerm = utilitiesService.getRandomSlangTerm(account.isMale)
		println 'slangTerm: ' + slangTerm
		if(totalCompleted == 0 && happiness > 5){
			description = 'You are happy with today?  Not judging but maybe you should rethink...' + slangTerm
		}else if(totalCompleted == 0){
			description = 'Tomorrow is a new day ' + slangTerm
		}else if(totalCompleted <= 5){
			if(happiness > 7){
				description = 'You are easily pleased... you must realize that there is no such thing as perfect. Tomorrow is a new day' + slangTerm
			}
			if(happiness < 7 && happiness > 4){
				description = 'No Saint... but at least you are trying.  '
			}
			if(happiness < 4){
				description = 'Dont beat yourself up.. no such thing as perfect ' + slangTerm
			}
		}else if(totalCompleted <= 10){
			description = 'Franklin would approve ' + slangTerm
			if(happiness < 9 && happiness > 7){
				description = 'Franklin would approve!  Well done.. Doing good is Feeling Good ' + slangTerm
			}
			
		}else if(totalCompleted == 13){
			//if()
			description = 'Franklin status! Nice work '  + slangTerm
		}
		
		return description

	}


    def show = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (!virtueEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [virtueEntryInstance: virtueEntryInstance]
        }
    }

    def edit = {
		if(params.id && SecurityUtils.subject.isPermitted("virtueEntry:update:"+params.id)){
		
        	def virtueEntryInstance = VirtueEntry.get(params.id)
        	if (!virtueEntryInstance) {
        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	    redirect(action: "list")
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
       		    virtueEntryInstance.properties = params
       		    if (!virtueEntryInstance.hasErrors() && virtueEntryInstance.save(flush: true)) {
       		        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), virtueEntryInstance.id])}"
       		        redirect(action: "show", id: virtueEntryInstance.id)
       		    }
       		    else {
       		        render(view: "edit", model: [virtueEntryInstance: virtueEntryInstance])
       		    }
       		}
       		else {
       		    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
       		    redirect(action: "list")
       		}
		
		}else{
			
			flash.message = "You are not authorized to update this Virtue Entry"
			redirect action:"show", id:params.id
			
		}
    }

    def delete = {

		if(params.id && SecurityUtils.subject.isPermitted("virtueEntry:update:"+params.id)){
		
        	def virtueEntryInstance = VirtueEntry.get(params.id)
        	if (virtueEntryInstance) {
        	    try {
        	        virtueEntryInstance.delete(flush: true)
        	        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	        redirect(action: "list")
        	    }
        	    catch (org.springframework.dao.DataIntegrityViolationException e) {
        	        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	        redirect(action: "show", id: params.id)
        	    }
        	}
        	else {
        	    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
        	    redirect(action: "list")
        	}


		}else{
         
			flash.message = "You are not authorized to Delete this Virtue Entry"
		 	redirect action:"show", id:params.id
         
		}
		
		
    }

	def getTodaysDate(){
		def date = new Date()
		println 'date : ' + date
		
		date.clearTime()
		println 'new date : ' + date
		return date
	}
	
	
	def getRandomNumber(){
		def random = new Random()
		def randomInt = random.nextInt(200-100+1)+100
	}
}
