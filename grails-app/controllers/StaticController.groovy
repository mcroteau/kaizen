import org.apache.shiro.SecurityUtils

class StaticController {

    def index = { 


	
	}

	def welcome = {
	
		println 'index -> '
		def virtueEntries = VirtueEntry.list()
		
		println 'virtueEntries -> ' + virtueEntries.size()
		
		
		def happiness = []
		def virtues = []
		def i = 1;
		virtueEntries.each(){
			
			def satisfactionValues = []
			satisfactionValues.add(i)
			satisfactionValues.add(it.happinessScale)			
			happiness.add(satisfactionValues)
			
			
			def virtueValues = []
			virtueValues.add(i)
			virtueValues.add(getTotalPrinciplesFollowed(it))
			virtues.add(virtueValues)
			
		 	i++
		}
		
		println happiness	
		request.happiness = happiness
		println virtues	
		request.virtues = virtues
		
	}
	
	//users stats
	def dashboard = {
	
		println 'dashboard -> '
	
		def account
	
		def subject = SecurityUtils.getSubject();
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		def happiness = []
		def virtues = []
		
		if(account){
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, [sort:"entryDate", order:"desc"])
    		

			def i = 1;
			virtueEntryInstanceList.each(){
				
				def dateInMillis = it.entryDate.getTime()
				
				def satisfactionValues = []
				satisfactionValues.add(dateInMillis)
				satisfactionValues.add(it.happinessScale)			
				happiness.add(satisfactionValues)


				def virtueValues = []
				virtueValues.add(dateInMillis)
				virtueValues.add(getTotalPrinciplesFollowed(it))
				virtues.add(virtueValues)

			 	i++
			}

			println "virtues -> ${virtues}"
			println "happiness -> ${happiness}"
			
		}else{
			
		
			happiness = null
			virtues = null
			flash.message = "No entries logged yet"
		
		}
		
			
		request.happiness = happiness
		request.virtues = virtues
			
	}

	
	def getTotalPrinciplesFollowed(entry){
		
		
		def totalCompleted = 0
		
		if(entry.temperance)totalCompleted++		
		if(entry.orderVirtue)totalCompleted++
		if(entry.resolution)totalCompleted++
		if(entry.frugality)totalCompleted++
		if(entry.moderation)totalCompleted++
		if(entry.industry)totalCompleted++
		if(entry.cleanliness)totalCompleted++
		if(entry.tranquility)totalCompleted++
		if(entry.silence)totalCompleted++
		if(entry.justice)totalCompleted++
		if(entry.chastity)totalCompleted++
		if(entry.humility)totalCompleted++
		if(entry.sincerity)totalCompleted++
		
		return totalCompleted
	}
	
	
	//more info about experiment -> some stats
	def experiment = {}
	def definitions = {}
	
}
