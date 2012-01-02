class VirtueEntry {

	Date entryDate
	Date fullEntryDateTime
	
	boolean temperance
	boolean orderVirtue
	boolean resolution
	boolean frugality
	boolean moderation
	boolean industry
	boolean cleanliness
	boolean tranquility
	boolean silence
	boolean justice
	boolean chastity
	boolean humility
	boolean sincerity
	
	//added wellbeing to encompass healthy lifestyles
	boolean wellBeing
	
	//boolean exercise
	//boolean healthyDiet
	
	
	//happinessScale = satisfaction
	int happinessScale
	String notes
	
	int totalCompleted
	String performanceDescription
	
	int totalPoints
	
	
	Account account
	static belongsTo = Account
	
	
    static constraints = {
		entryDate(unique:true)
		notes(nullable:true)
    }
 	
	static mapping = {
		sort entryDate:"desc"
    	id generator: 'sequence', params:[sequence:'ID_VIRTUE_ENTRY_PK_SEQ']
  	}
	
}
