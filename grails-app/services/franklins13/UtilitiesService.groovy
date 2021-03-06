package franklins13

import java.text.SimpleDateFormat
import org.apache.shiro.SecurityUtils
import java.text.DecimalFormat


class UtilitiesService {

    static transactional = true
	
    def serviceMethod() {

    }

	def getRandomNumber(high, low){
		def random = new Random()
		return random.nextInt(high-low+1)+low
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
		DecimalFormat percent = new DecimalFormat("00");	
		return percent.format(number);
	}

	def getSupportLink(){
		return '<a href="mailto:franklins13app@gmail.com" title="Email Support at franklins13app@gmail.com">franklins13app@gmail.com</a>'
	}
	
	def Map reverseSortMap(Map unsortedMap) {

	    // 3. Reverse Sort by a particular field of Value(Date Of Birth):
	    Comparator comparator = [compare: {a , b -> unsortedMap.get(b).value.compareTo(unsortedMap.get(a).value)  }] as Comparator

	    Map sortedMap = new TreeMap(comparator)
	    sortedMap.putAll(unsortedMap)

	    return sortedMap
	}
	
}
