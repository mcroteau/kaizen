class Account {

    String username
    String passwordHash
  
	String email
	
	boolean active
	//boolean isMale
	
	int totalEntries
	int totalScore
	 
	//boolean publicProfile
	//String fullName
	//String location
	
	String recoveryUUID
	int recoveries
	
    static hasMany = [ roles: Role, permissions: String, virtueEntries: VirtueEntry]

    static constraints = {
        username(unique:true, nullable: false, blank: false)
		email(unique:true, nullable:false, blank:false, email:true)
		totalEntries(nullable:true, blank: true)
		totalScore(nullable:true, blank: true)
		recoveryUUID(nullable:true, blank: true)
		recoveries(nullable:true, blank: true)
    }
	
	
	static mapping = {
		sort totalScore:"desc"
    	id generator: 'sequence', params:[sequence:'ID_ACCOUNT_PK_SEQ']
  	}

	def String toString(){
		return this.username + " - " + this.totalScore		
	}

}

