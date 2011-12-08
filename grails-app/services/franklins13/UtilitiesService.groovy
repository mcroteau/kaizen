package franklins13

import java.text.SimpleDateFormat
import org.apache.shiro.SecurityUtils
import java.text.DecimalFormat


class UtilitiesService {

    static transactional = true
	
	def womanSlangWords = ["princess", "beautiful", "angel", "gorgeous" ]
	def manSlangWords = ["buddy", "mate", "ace", "amigo", "compadre", "friend" ]
	
    def serviceMethod() {

    }

	def getRandomNumber(high, low){
		def random = new Random()
		return random.nextInt(high-low+1)+low
	}
	
	def getRandomSlangTerm(isMale){
		if(isMale){
			return manSlangWords[getRandomNumber(manSlangWords.size - 1, 0)]
		}
		return womanSlangWords[getRandomNumber(womanSlangWords.size - 1, 0)]
	}
	
	def getTodaysDate(){
		def date = new Date()
		println 'date : ' + date
		
		date.clearTime()
		println 'new date : ' + date
		return date
	}
	
	def getFormattedDateNoTimeOption1(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
		return formatter.format(date)
	}
	
	def getFormattedDateNoTimeOption2(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		return formatter.format(date)
	}
	
	def roundTwoDecimals(number){
		DecimalFormat percent = new DecimalFormat("0%");	
		return percent.format(number);
	}

	
}
