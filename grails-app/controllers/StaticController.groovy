import org.apache.shiro.SecurityUtils
import java.text.DecimalFormat


class StaticController {

	def utilitiesService
	
    def index = { }
	
	//more info about experiment -> some stats
	def experiment = {request.experimentActive = "active"}
	def definitions = {request.definitionsActive = "active"}
	
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
		
		
		def leaderBoard = Account.list([max:10]);
		request.leaderBoard = leaderBoard
		
		request.welcomeActive = "active"
		
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
		def scores = []
		def	virtuesSummaryMap = [:]
			
		def virtuesArray = ["temperance", "orderVirtue", "resolution", "frugality", "moderation", "industry", "cleanliness", "tranquility", "silence", "sincerity", "justice", "chastity", "humility", "wellBeing"]	

		virtuesArray.each(){
			virtuesSummaryMap[it] = [:]
			virtuesSummaryMap[it]["value"] = 0
			virtuesSummaryMap[it]["percent"] = 0
			virtuesSummaryMap[it]["name"] = it.capitalize() 
		}
		
		
		if(account){
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, [sort:"entryDate", order:"desc"])
    		
			def totalEntries = VirtueEntry.countByAccount(account)

			if(totalEntries && totalEntries >= 1){
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
					
					
					def scoresObj = []
					scoresObj.add(dateInMillis)
					scoresObj.add(it.totalPoints)
					scores.add(scoresObj)
					
					setMappedVirtueValues(it, virtuesSummaryMap)
            	
				 	i++
				}
				//println "virtues -> ${virtues}"
				
				//println "happiness -> ${happiness}"
			
				// println "map -> ${virtuesSummaryMap}    totalEntries -> ${totalEntries}"
				
				setPercents(virtuesSummaryMap, totalEntries);
			
			}else{
			
				redirect(controller:'account', action:'noEntriesLogged')
			
			}
			
			
		}else{
			
		
			happiness = null
			virtues = null
			flash.message = "You must be logged in to view your dashboard"
			redirect(controller:"auth", action:"login")
		
		}
		

		request.happiness = happiness
		request.virtues = virtues
		request.scores = scores
	
		
		def sortedVirtuesMapWorst = virtuesSummaryMap.sort{it.value.value}
		request.sortedVirtuesMapWorst = sortedVirtuesMapWorst


		def sortedVirtuesMapBest = reverseSortMap(virtuesSummaryMap)
		request.sortedVirtuesMapBest = sortedVirtuesMapBest

				
		request.virtuesSummaryMap = virtuesSummaryMap
			
		request.dashboardActive = "active"	
	}
	
	
	def setPercents(virtuesSummaryMap, totalEntries){
		virtuesSummaryMap.temperance.percent = round(virtuesSummaryMap.temperance.value/totalEntries)
		virtuesSummaryMap.orderVirtue.percent = round(virtuesSummaryMap.orderVirtue.value/totalEntries)
		virtuesSummaryMap.resolution.percent = round(virtuesSummaryMap.resolution.value/totalEntries)
		virtuesSummaryMap.frugality.percent = round(virtuesSummaryMap.frugality.value/totalEntries)
		virtuesSummaryMap.moderation.percent = round(virtuesSummaryMap.moderation.value/totalEntries)
		virtuesSummaryMap.industry.percent = round(virtuesSummaryMap.industry.value/totalEntries)
		virtuesSummaryMap.cleanliness.percent = round(virtuesSummaryMap.cleanliness.value/totalEntries)
		virtuesSummaryMap.tranquility.percent = round(virtuesSummaryMap.tranquility.value/totalEntries)
		virtuesSummaryMap.silence.percent = round(virtuesSummaryMap.silence.value/totalEntries)
		virtuesSummaryMap.sincerity.percent = round(virtuesSummaryMap.sincerity.value/totalEntries)
		virtuesSummaryMap.justice.percent = round(virtuesSummaryMap.justice.value/totalEntries)
		virtuesSummaryMap.chastity.percent = round(virtuesSummaryMap.chastity.value/totalEntries)
		virtuesSummaryMap.humility.percent = round(virtuesSummaryMap.humility.value/totalEntries)
		virtuesSummaryMap.wellBeing.percent = round(virtuesSummaryMap.wellBeing.value/totalEntries)	
	}
	
	def Map reverseSortMap(Map unsortedMap) {

	    // 3. Reverse Sort by a particular field of Value(Date Of Birth):
	    Comparator comparator = [compare: {a , b -> unsortedMap.get(b).value.compareTo(unsortedMap.get(a).value)  }] as Comparator

	    Map sortedMap = new TreeMap(comparator)
	    sortedMap.putAll(unsortedMap)

	    return sortedMap
	}
	
	def round(num){
		DecimalFormat twoDForm = new DecimalFormat("#.##");
		def formattedDecimal = Double.valueOf(twoDForm.format(num))*100;
	    return (int)formattedDecimal
		
	}


	def setMappedVirtueValues(entry, virtuesSummaryMap){
	
		if(entry.temperance){
			virtuesSummaryMap.temperance.value = virtuesSummaryMap.temperance.value + 1	
		}
		
		
		if(entry.orderVirtue){
			virtuesSummaryMap.orderVirtue.value = virtuesSummaryMap.orderVirtue.value + 1	
		}
		
		
		if(entry.resolution){
			virtuesSummaryMap.resolution.value = virtuesSummaryMap.resolution.value + 1	
		}
		
		
		if(entry.frugality){
			virtuesSummaryMap.frugality.value = virtuesSummaryMap.frugality.value + 1	
		}
		
		
		if(entry.moderation){
			virtuesSummaryMap.moderation.value = virtuesSummaryMap.moderation.value + 1	
		}
		
		
		if(entry.industry){
			virtuesSummaryMap.industry.value = virtuesSummaryMap.industry.value + 1	
		}
		
		
		if(entry.cleanliness){
			virtuesSummaryMap.cleanliness.value = virtuesSummaryMap.cleanliness.value + 1	
		}
		
		
		if(entry.tranquility){
			virtuesSummaryMap.tranquility.value = virtuesSummaryMap.tranquility.value + 1	
		}
		

		if(entry.silence){
			virtuesSummaryMap.silence.value = virtuesSummaryMap.silence.value + 1	
		}	
		
		
		if(entry.justice){
			virtuesSummaryMap.justice.value = virtuesSummaryMap.justice.value + 1	
		}
		
		
		if(entry.chastity){
			virtuesSummaryMap.chastity.value = virtuesSummaryMap.chastity.value + 1	
		}
		
		
		if(entry.humility){
			virtuesSummaryMap.humility.value = virtuesSummaryMap.humility.value + 1	
		}
		
		
		if(entry.sincerity){
			virtuesSummaryMap.sincerity.value = virtuesSummaryMap.sincerity.value + 1	
		}
		
		
		if(entry.wellBeing){
			virtuesSummaryMap.wellBeing.value = virtuesSummaryMap.wellBeing.value + 1	
		}
		

		
		// println 'set mapped virtues -> '
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
		if(entry.wellBeing)totalCompleted++
		
		return totalCompleted
	}
	
	
	
	def refreshSessionStats = {
		println 'target uri -> ' + params.targetUrl
		
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
			
		redirect(url:params.targetUrl)
		
	}
	
	def getUserRank(username){
		def accounts = Account.findAll()
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
