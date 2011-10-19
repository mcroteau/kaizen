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
