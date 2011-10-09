class VirtueEntry {

	Date entryDate
	
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
	
	int happinessScale
	String notes
	
	int totalCompleted
	String performanceDescription
	
	Account account
	static belongsTo = Account
	
    static constraints = {
		notes(nullable:true)
    }
 	
	static mapping = {
    	//id generator: 'sequence', params:[sequence:'ID_VIRTUE_ENTRY_PK_SEQ']
  	}
}
