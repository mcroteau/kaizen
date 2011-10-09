package franklins13

class UtilitiesService {

    static transactional = true
	
	def womanSlangWords = ["princess", "darling", "sugar", "miss thang", "love", "hot momma", "beautiful", "angel-face", "gorgeous", ]
	def manSlangWords = ["buddy", "brah", "mate", "ace", "amigo", "compadre", "friend"]
	
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
}
