import org.apache.shiro.SecurityUtils
import java.text.DecimalFormat


class StaticController {

	def utilitiesService
	
    def index = { }

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
			
		if(account){
			
			println 'account -> ' + account
			def virtueEntryInstanceList = VirtueEntry.findAllByAccount(account, [sort:"entryDate", order:"desc"])
    		
			def totalEntries = VirtueEntry.countByAccount(account)

			if(totalEntries && totalEntries > 1){
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
				println "virtues -> ${virtues}"
				
				println "happiness -> ${happiness}"
			
				setPercents(virtuesSummaryMap, totalEntries);
			
			}//else{
				
			//	redirect(controller : "account", action : "noEntriesLogged")
			
			//}
			
			
		}else{
			
		
			happiness = null
			virtues = null
			flash.message = "You must be logged in to view your dashboard"
			redirect(controller:"auth", action:"login")
		
		}
		

		request.happiness = happiness
		request.virtues = virtues
		request.scores = scores
		
		request.virtuesSummaryMap = virtuesSummaryMap
			
	}
	
	
	def setPercents(virtuesSummaryMap, totalEntries){
		virtuesSummaryMap.temperancePercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.temperance/totalEntries)
		virtuesSummaryMap.orderVirtuePercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.orderVirtue/totalEntries)
		virtuesSummaryMap.resolutionPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.resolution/totalEntries)
		virtuesSummaryMap.frugalityPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.frugality/totalEntries)
		virtuesSummaryMap.moderationPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.moderation/totalEntries)
		virtuesSummaryMap.industryPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.industry/totalEntries)
		virtuesSummaryMap.cleanlinessPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.cleanliness/totalEntries)
		virtuesSummaryMap.tranquilityPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.tranquility/totalEntries)
		virtuesSummaryMap.silencePercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.silence/totalEntries)
		virtuesSummaryMap.sincerityPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.sincerity/totalEntries)
		virtuesSummaryMap.justicePercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.justice/totalEntries)
		virtuesSummaryMap.chastityPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.chastity/totalEntries)
		virtuesSummaryMap.humilityPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.humility/totalEntries)
		virtuesSummaryMap.wellBeingPercent = utilitiesService.roundTwoDecimals(virtuesSummaryMap.wellBeing/totalEntries)
	}


	def setMappedVirtueValues(entry, virtuesSummaryMap){
	
		if(entry.temperance){
			if(virtuesSummaryMap.temperance){
				println 'temperance set -> ' + virtuesSummaryMap.temperance
				virtuesSummaryMap.temperance = virtuesSummaryMap.temperance + 1	
			}else{
				println 'first time setting temperance'
				virtuesSummaryMap.temperance = 1
			}
			
		}
		
		if(entry.orderVirtue){
			if(virtuesSummaryMap.orderVirtue){
				println 'orderVirtue set -> ' + virtuesSummaryMap.orderVirtue
				virtuesSummaryMap.orderVirtue = virtuesSummaryMap.orderVirtue + 1	
			}else{
				println 'first time setting orderVirtue'
				virtuesSummaryMap.orderVirtue = 1
			}
			
		}
		
		


		if(entry.resolution){
			if(virtuesSummaryMap.resolution){
				println 'resolution set -> ' + virtuesSummaryMap.resolution
				virtuesSummaryMap.resolution = virtuesSummaryMap.resolution + 1	
			}else{
				println 'first time setting resolution'
				virtuesSummaryMap.resolution = 1
			}
			
		}
		
		
		if(entry.frugality){
			if(virtuesSummaryMap.frugality){
				println 'frugality set -> ' + virtuesSummaryMap.frugality
				virtuesSummaryMap.frugality = virtuesSummaryMap.frugality + 1	
			}else{
				println 'first time setting frugality'
				virtuesSummaryMap.frugality = 1
			}
			
		}
		
		
		if(entry.moderation){
			if(virtuesSummaryMap.moderation){
				println 'moderation set -> ' + virtuesSummaryMap.moderation
				virtuesSummaryMap.moderation = virtuesSummaryMap.moderation + 1	
			}else{
				println 'first time setting moderation'
				virtuesSummaryMap.moderation = 1
			}
			
		}
		
		

		
		
		if(entry.industry){
			if(virtuesSummaryMap.industry){
				println 'industry set -> ' + virtuesSummaryMap.industry
				virtuesSummaryMap.industry = virtuesSummaryMap.industry + 1	
			}else{
				println 'first time setting industry'
				virtuesSummaryMap.industry = 1
			}
			
		}
		
		
		if(entry.cleanliness){
			if(virtuesSummaryMap.cleanliness){
				println 'cleanliness set -> ' + virtuesSummaryMap.cleanliness
				virtuesSummaryMap.cleanliness = virtuesSummaryMap.cleanliness + 1	
			}else{
				println 'first time setting cleanliness'
				virtuesSummaryMap.cleanliness = 1
			}
			
		}
		
		
		if(entry.tranquility){
			if(virtuesSummaryMap.tranquility){
				println 'tranquility set -> ' + virtuesSummaryMap.tranquility
				virtuesSummaryMap.tranquility = virtuesSummaryMap.tranquility + 1	
			}else{
				println 'first time setting tranquility'
				virtuesSummaryMap.tranquility = 1
			}
			
		}
		

		if(entry.silence){
			if(virtuesSummaryMap.silence){
				println 'silence set -> ' + virtuesSummaryMap.silence
				virtuesSummaryMap.silence = virtuesSummaryMap.silence + 1	
			}else{
				println 'first time setting silence'
				virtuesSummaryMap.silence = 1
			}
			
		}
		
		
		if(entry.justice){
			if(virtuesSummaryMap.justice){
				println 'justice set -> ' + virtuesSummaryMap.justice
				virtuesSummaryMap.justice = virtuesSummaryMap.justice + 1	
			}else{
				println 'first time setting justice'
				virtuesSummaryMap.justice = 1
			}
			
		}
		
		
		if(entry.chastity){
			if(virtuesSummaryMap.chastity){
				println 'chastity set -> ' + virtuesSummaryMap.chastity
				virtuesSummaryMap.chastity = virtuesSummaryMap.chastity + 1	
			}else{
				println 'first time setting chastity'
				virtuesSummaryMap.chastity = 1
			}
			
		}
		
		
		if(entry.humility){
			if(virtuesSummaryMap.humility){
				println 'humility set -> ' + virtuesSummaryMap.humility
				virtuesSummaryMap.humility = virtuesSummaryMap.humility + 1	
			}else{
				println 'first time setting humility'
				virtuesSummaryMap.humility = 1
			}
			
		}
		

		if(entry.sincerity){
			if(virtuesSummaryMap.sincerity){
				println 'sincerity set -> ' + virtuesSummaryMap.sincerity
				virtuesSummaryMap.sincerity = virtuesSummaryMap.sincerity + 1	
			}else{
				println 'first time setting sincerity'
				virtuesSummaryMap.sincerity = 1
			}
			
		}
		
		
		if(entry.wellBeing){
			if(virtuesSummaryMap.wellBeing){
				println 'wellBeing set -> ' + virtuesSummaryMap.wellBeing
				virtuesSummaryMap.wellBeing = virtuesSummaryMap.wellBeing + 1	
			}else{
				println 'first time setting wellBeing'
				virtuesSummaryMap.wellBeing = 1
			}
			
		}

		
		println 'set mapped virtues -> '
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
	
	
	//more info about experiment -> some stats
	def experiment = {}
	def definitions = {}
	
	

	
}
